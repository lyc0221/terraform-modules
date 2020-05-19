// Security Group module for ECS Module
module "security_group" {
  source = "../../modules/huaweicloud-security-group"

  service     = var.service
  environment = var.environment

  region  = var.region
  description = "Security group for example usage with ECS instance"

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "all-icmp", "ssh-tcp"]
  egress_rules        = ["all-all"]
}

module "ecs" {
  source = "../../modules/huaweicloud-ecs-instance"
  
  namenumber                  = var.namenumber

  service                     = var.service
  environment                 = var.environment
  region                      = var.region

  flavor                      = "s6.small.1"
  availability_zone           = var.availability_zone
  image_id                    = data.huaweicloud_images_image_v2.ubuntu.id
  nics                        = element(tolist(data.huaweicloud_vpc_subnet_ids_v1.all.ids), 0)

  security_group_ids          = [module.security_group.this_security_group_id]
}

