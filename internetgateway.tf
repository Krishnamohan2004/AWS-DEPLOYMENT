resource "aws_internet_gateway" "devops_igw" {
 vpc_id = "vpc-0abede81162e228a8"

 tags = {
   Name = "devops-igw"
 }
}
