resource "aws_security_group" "my_sec" {
  name        = "my_sec"
  description = "Allow inbound traffic and all outbound traffic"
 
   tags = {
    Name = "allow_connection"
      }
    egress{
      from_port=0
      to_port=0
      protocol="-1"
      cidr_blocks=["0.0.0.0/0"]
    }
    ingress{
      from_port=80
      to_port=80
      protocol="tcp"
      cidr_blocks=["0.0.0.0/0"]
    }
    ingress{
      from_port=22
      to_port=22
      protocol="tcp"
      cidr_blocks=["0.0.0.0/0"]
    }
    ingress{
      from_port=443
      to_port=443
      protocol="tcp"
      cidr_blocks=["0.0.0.0/0"]
    }
  ingress{
      from_port=8080
      to_port=8080
      protocol="tcp"
      cidr_blocks=["0.0.0.0/0"]
    }
}
      
