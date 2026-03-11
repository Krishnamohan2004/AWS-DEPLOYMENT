resource "aws_route_table" "devops_rt" {
vpc_id = "vpc-0abede81162e228a8"

 route {
   cidr_block = "0.0.0.0/0"
   gateway_id = aws_internet_gateway.devops_igw.id
 }

 tags = {
   Name = "devops-route-table"
 }
}
