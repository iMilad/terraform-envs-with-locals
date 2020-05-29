terraform {
  required_version = ">= 0.12, < 0.13"

  required_providers {
    aws = "~> 2.7"
  }

}

provider "aws" {
  region = "us-east-1"
}

locals {
  env = terraform.workspace

  counts = {
    "default" = 1
    "dev"     = 3
  }

  instances = {
    "default" = "t2.micro"
    "dev"     = "t2.small"
  }

  instance_type = lookup(local.instances, local.env)
  count         = lookup(local.counts, local.env)
}

resource "aws_instance" "env_service" {
  ami           = "ami-0323c3" # use the correct ami id, this is just an example
  instance_type = local.instance_type
  count         = local.count

  tags = {
    Name = "${local.env}-env-${count.index}"
  }
}
