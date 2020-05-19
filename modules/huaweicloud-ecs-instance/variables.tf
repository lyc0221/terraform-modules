# variable "name" {
#   description = "Name to be used on all resources as prefix"
#   type        = string
# }

variable "service" {
  description = "Service to be used on all resources as prefix"
  default     = ""
}

variable "environment" {
  description = "Environment to be used on all resources as prefix"
  default     = ""
}

variable "region" {
  description = "Region to be used on all resources as prefix"
  default     = ""
}

variable "namenumber" {
  description = "Number of names to launch"
  default     = []
}

variable "availability_zone" {
  description = "The availability zone in which to create the server. Changing this creates a new server."
  default     = ""
}

variable "vpc_id" {
  description = "The ID of the desired VPC for the server. Changing this creates a new server."
  default     = ""
}

variable "security_group_ids" {
  description = "A ids list of security group ids to associate with"
}

variable "system_disk_type" {
  description = "The system disk type of the server. For HANA, HL1, and HL2 ECSs use co-p1 and uh-l1 disks. Changing this creates a new server."
  type        = string
  default     = "SAS"
}

variable "system_disk_size" {
  description = "Size of the system disk, measured in GiB. Value range: [20, 500]. The specified value must be equal to or greater than max{20, Imagesize}. Default value: max{40, ImageSize}. ECS instance's system disk can be reset when replacing system disk. When it is changed, the instance will reboot to make the change take effect."
  type        = number
  default     = 30
}

variable "image_id" {
  description = "The image id used to launch one or more ecs instances."
  type        = string
  default     = ""
}

variable "flavor" {
  description = "The name of the desired flavor for the server. Changing this resizes the existing server."
  type        = string
  default     = ""
}

variable "password" {
  description = "The password of instance."
  type        = string
  default     = "7DqbMUWhbsFfmLmeVWloa0IES6AFeY"
}

variable "data_disks" {
  description = "Additional data disks to attach to the scaled ECS instance."
  type        = list(map(string))
  default     = []
}

variable "charging_mode" {
  description = "The charge type of instance. Choices are 'PostPaid' and 'PrePaid'."
  type        = string
  default     = "PostPaid"
}

variable "key_name" {
  description = "The name of SSH key pair that can login ECS instance successfully without password. If it is specified, the password would be invalid."
  type        = string
  default     = ""
}

variable "subscription" {
  description = "A mapping of fields for Prepaid ECS instances created. "
  type        = map(string)
  default = {
    period             = 1
    period_unit        = "Month"
  }
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "nics" {
  description = "An array of one or more networks to attach to the instance. The nics object structure is documented below. Changing this creates a new server."
  type        = string
  default     = ""
}

variable "delete_disks_on_termination" {
  description = "Delete the data disks upon termination of the instance. Defaults to false. Changing this creates a new server."
  type        = bool
  default     = true
}

variable "auto_recovery" {
  description = "Whether configure automatic recovery of an instance."
  type        = bool
  default     = false
}

variable "enterprise_project_id" {
  description = "The enterprise project id. Changing this creates a new server."
  type        = string
  default     = ""
}

variable "op_svc_userid" {
  description = "User ID, required when using key_name. Changing this creates a new server."
  type        = string
  default     = ""
}