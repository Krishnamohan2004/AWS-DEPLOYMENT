resource "aws_instance" "devops_server" {

  ami           = "ami-02774d409be696d81"
  instance_type = "t3.large"
  key_name      = "Terraform-key"

  security_groups = [aws_security_group.devops_sg.name]

  user_data = file("install.sh")

  tags = {
    Name = "DevOps-Server"
  }
}
