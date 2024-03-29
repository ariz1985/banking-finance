resource "aws_instance" "my-banking-server" {
  ami= "ami-080e1f13689e07408"
  instance_type = "t2.micro"
  vpc_security_groups_ids=[aws_security_groups.my_sec.id]
  key_name="aws"
  tags = {
    Name = "my-banking-server"
  }
   connection{
   type="ssh"
   user="ubuntu"
   private_key=file("./aws.pem")
   host=self.public_ip
    }
    provisioner "local-exec"{
      command= "echo ${aws_instance.my-banking-server.id} > inventory"
    }
  provisioner "remote-exec"{
  
  }
    }
