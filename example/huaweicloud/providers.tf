provider "huaweicloud" {
  access_key  = var.huaweicloud_access_key
  secret_key  = var.huaweicloud_secret_key
  domain_name = "implus"
  region      = var.region
  auth_url    = "https://iam.myhwclouds.com:443/v3"
}



