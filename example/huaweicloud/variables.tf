variable "huaweicloud_access_key" {
}

variable "huaweicloud_secret_key" {
}

variable "service" {
  default = "example"
}

variable "environment" {
  default = "test"
}

variable "user" {
  default = "lyc"
}

variable "namenumber" {
  description = "Number of instances to launch"
  default     = [
    "1"
  ]
}

variable "region" {
  default = "cn-south-1"
}

variable "availability_zone" {
  description = "availability_zone for region"
  default     = "cn-south-1a"
}

