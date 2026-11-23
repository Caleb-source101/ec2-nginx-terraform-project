provider "aws" {
  region = var.aws_region
}

module "networking" {
  source = "./modules/networking"
  my_ip  = var.my_ip
}

module "ec2" {
  source            = "./modules/ec2"
  subnet_id         = module.networking.subnet_id
  security_group_id = module.networking.security_group_id
  key_path          = var.key_path
}