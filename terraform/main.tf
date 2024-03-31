resource "aws_instance" "my-banking-server" {
  ami= "ami-080e1f13689e07408"
  instance_type = "t2.micro"
  vpc_security_group_ids=[aws_security_group.my_sec.id]
  key_name="aws"
  tags = {
    Name = "my-banking-server"
  }
  
   connection{
   type=  "ssh"
   user= "ubuntu"
   private_key= file("./aws.pem")
   host= self.public_ip
    }
  provisioner "remote-exec" {
    inline = [ "echo 'wait to start instance' "]
  }
    provisioner "local-exec"{
      command= "echo ${aws_instance.my-banking-server.public_ip} > inventory"
    }
  provisioner "local-exec"{
      command= "ansible-playbook /var/lib/jenkins/workspace/banking-try/terraform/ansible.yml"
    }
 
  metadata_options {
    http_endpoint           = "enabled"
    http_tokens             = "required"
    http_put_response_hop_limit = 1
    instance_metadata_tags="enabled"
  }
}
output "Instance_Id"{
  description="Ip Address"
  value=aws_instance.my-banking-server.public_ip
}
