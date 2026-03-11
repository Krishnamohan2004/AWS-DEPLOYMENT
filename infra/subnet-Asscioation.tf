data "aws_subnets" "default" {
 filter {
  name   = "vpc-id"
  values = ["vpc-0abede81162e228a8"]
}
}

resource "aws_route_table_association" "devops_assoc" {
subnet_id      = data.aws_subnets.default.ids[0]
route_table_id = aws_route_table.devops_rt.id
}
