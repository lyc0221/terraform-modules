data "huaweicloud_vpc_v1" "default" {
  name = "vpc-default"
}

data "huaweicloud_vpc_subnet_ids_v1" "all" {
  vpc_id = data.huaweicloud_vpc_v1.default.id
}

data "huaweicloud_images_image_v2" "ubuntu" {
  # name        = "Ubuntu 18.04" # 2020.5.19, Ubuntu 20.04 is not existed.
  visibility  = "public"
  most_recent = true
}


