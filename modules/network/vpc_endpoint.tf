data "aws_subnet" "subnet_info" {
  for_each = aws_subnet.private
  id       = each.value.id
}

locals {
  # pick 1 subnet per AZ
  az_subnet_map = {
    for k, subnet in data.aws_subnet.subnet_info :
    subnet.availability_zone => subnet.id
  }

  unique_subnets_per_az = values(local.az_subnet_map)
}

resource "aws_vpc_endpoint" "ssm" {
  vpc_id              = aws_vpc.main.id
  service_name        = "com.amazonaws.${var.region}.ssm"
  vpc_endpoint_type   = "Interface"
  subnet_ids          = local.unique_subnets_per_az
  security_group_ids  = [aws_security_group.web.id]
  private_dns_enabled = true

  tags = merge(var.tags, {
    Name = "${var.environment}-ssm-endpoint"
  })
}

resource "aws_vpc_endpoint" "ssmmessages" {
  vpc_id              = aws_vpc.main.id
  service_name        = "com.amazonaws.${var.region}.ssmmessages"
  vpc_endpoint_type   = "Interface"
  subnet_ids          = local.unique_subnets_per_az
  security_group_ids  = [aws_security_group.web.id]
  private_dns_enabled = true

  tags = merge(var.tags, {
    Name = "${var.environment}-ssmmessages-endpoint"
  })
}

resource "aws_vpc_endpoint" "ec2" {
  vpc_id              = aws_vpc.main.id
  service_name        = "com.amazonaws.${var.region}.ec2"
  vpc_endpoint_type   = "Interface"
  subnet_ids          = local.unique_subnets_per_az
  security_group_ids  = [aws_security_group.web.id]
  private_dns_enabled = true

  tags = merge(var.tags, {
    Name = "${var.environment}-ec2-endpoint"
  })
}

resource "aws_vpc_endpoint" "ec2messages" {
  vpc_id              = aws_vpc.main.id
  service_name        = "com.amazonaws.${var.region}.ec2messages"
  vpc_endpoint_type   = "Interface"
  subnet_ids          = local.unique_subnets_per_az
  security_group_ids  = [aws_security_group.web.id]
  private_dns_enabled = true

  tags = merge(var.tags, {
    Name = "${var.environment}-ec2messages-endpoint"
  })
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id            = aws_vpc.main.id
  service_name      = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = [aws_route_table.private.id] # or however you're handling route tables

  tags = merge(var.tags, {
    Name = "${var.environment}-s3-endpoint"
  })
}