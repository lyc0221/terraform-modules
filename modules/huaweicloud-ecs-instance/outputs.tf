locals {
  this_id                           = {for key in var.namenumber : key => huaweicloud_ecs_instance_v1.this[tostring(key)].id}
  this_availability_zone            = {for key in var.namenumber : key => huaweicloud_ecs_instance_v1.this[tostring(key)].availability_zone}
  this_key_name                     = {for key in var.namenumber : key => huaweicloud_ecs_instance_v1.this[tostring(key)].key_name}
  this_nics                         = {for key in var.namenumber : key => huaweicloud_ecs_instance_v1.this[tostring(key)].nics}
  this_security_groups              = {for key in var.namenumber : key => huaweicloud_ecs_instance_v1.this[tostring(key)].security_groups}
  this_tags                         = {for key in var.namenumber : key => huaweicloud_ecs_instance_v1.this[tostring(key)].tags.Name}
}

output "id" {
  description = "List of IDs of instances"
  value       = local.this_id
}

output "availability_zone" {
  description = "List of availability zones of instances"
  value       = local.this_availability_zone
}

output "key_name" {
  description = "List of key names of instances"
  value       = local.this_key_name
}

output "nics" {
  description = "An array of one or more networks to attach to the instance."
  value       = local.this_nics
}


output "security_groups" {
  description = "List of associated security groups of instances"
  value       = local.this_security_groups
}

output "tags" {
  description = "List of tags of instances"
  value       = local.this_tags
}
