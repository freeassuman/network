output "vpc_id" {
  value = aws_vpc.main.id
}

#output "private_subnet_ids_map" {
#  value = { for az, subnet in aws_subnet.private : az => subnet.id }
#}

output "private_subnet_ids" {
  value = [for subnet in aws_subnet.private : subnet.id]
}

output "route_table_id" {
  value = aws_route_table.private.id
}

output "security_group_ids" {
  value = {
    web = aws_security_group.web.id
    ssh = aws_security_group.ssh.id
    app = aws_security_group.app.id
    db  = aws_security_group.db.id
  }
}

output "vpc_endpoint_ids" {
  value = {
    s3             = aws_vpc_endpoint.s3.id
    ssm            = aws_vpc_endpoint.ssm.id
	ec2            = aws_vpc_endpoint.ec2messages.id
    ec2messages    = aws_vpc_endpoint.ec2messages.id
    ssmmessages    = aws_vpc_endpoint.ssmmessages.id
  }
}
