data "template_file" "userdata" {
  template = file("../../user_data.tpl")
}

locals {
  subscription         = var.charging_mode == "PostPaid" ? {} : var.subscription
  instance_name_prefix = var.availability_zone != "" ? format(
    "%s-%s-%s",
    var.service,
    var.environment,
    var.availability_zone,
  ) : format(
    "%s-%s-%s",
    var.service,
    var.environment,
    var.region,
  )
}

resource "huaweicloud_ecs_instance_v1" "this" {
  for_each                        = toset(var.namenumber)

  name                            = format("%s-%s", local.instance_name_prefix, each.key)
  image_id                        = try(var.image_id[each.key], var.image_id)
  flavor                          = var.flavor
  user_data                       = data.template_file.userdata.rendered
  password                        = var.password
  key_name                        = var.key_name
  vpc_id                          = var.vpc_id
  system_disk_type                = var.system_disk_type
  system_disk_size                = var.system_disk_size
  delete_disks_on_termination     = var.delete_disks_on_termination
  dynamic "data_disks" {
    for_each = var.data_disks
    content {
      type                        = lookup(data_disks.value, "type", var.system_disk_size)
      size                        = lookup(data_disks.value, "size", var.system_disk_size)
      snapshot_id                 = lookup(data_disks.value, "snapshot_id", null)
    }
  }
  nics {
    network_id = var.nics
  }
  security_groups                 = try(var.security_group_ids[each.key], var.security_group_ids)
  availability_zone               = try(var.availability_zone[each.key], var.availability_zone)
  charging_mode                   = var.charging_mode
  period_unit                     = lookup(local.subscription, "period_unit", null)
  period                          = lookup(local.subscription, "period", null)
  auto_recovery                   = var.auto_recovery
  enterprise_project_id           = var.enterprise_project_id
  tags = merge(
    {
      Name = format("%s-%s", local.instance_name_prefix, each.key)
    },
    var.tags,
  )
  op_svc_userid                   = var.op_svc_userid

  lifecycle {
    # Due to several known issues in Terraform AWS provider related to arguments of aws_instance:
    # (eg, https://github.com/terraform-providers/terraform-provider-aws/issues/2036)
    # we have to ignore changes in the following arguments
    ignore_changes = [
      user_data,
      system_disk_size,
      image_id,
    ]
  }
}

