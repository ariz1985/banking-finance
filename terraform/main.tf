resource "aws_instance" "web" {
  ami= "ami-080e1f13689e07408"
  instance_type = "t2.micro"
  vpc_security_groups_id=[aws_security_groups.my_sec.id]
  key_name=aws
  tags = {
    Name = "HelloWorld"
  }
   connection{
   type="ssh"
   user="ubuntu"
   private_key=file(./aws)
   host=self.public_ip
    }
    provisioner "local-exec"{
      command= "echo ${aws_instance.
    }
    }
