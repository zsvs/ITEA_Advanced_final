data "aws_availability_zones" "available" {} # Get current availability zones

data "aws_region" "current" {} # Get info about current region

data "aws_vpc" "default" { # Get info about default vpc
  tags = {
    Name = "Default"
  }
}

data "aws_subnet_ids" "default_subnet_ids" {
  vpc_id = data.aws_vpc.default.id
}
data "aws_subnet" "public_subnets" {
  count = length(data.aws_subnet_ids.default_subnet_ids.ids)
  id    = tolist(data.aws_subnet_ids.default_subnet_ids.ids)[count.index]
}
