data "vault_generic_secret" "aws_creds" {
    path = "my-secret/aws_cred"
    
}

data "vault_generic_secret" "tag-name" {
    path = "my-secret/tag-name"
    
}

resource "aws_instance" "cicd-ec2" {
  ami           = "ami-0230bd60aa48260c6"
  instance_type = "t2.micro"
  key_name      = "my-keypair"
  
  

  tags = {
    Name = data.vault_generic_secret.tag-name.data["ec2-tag"]
  }
}

output "ec2_instance_public_ip" {
  value = aws_instance.cicd-ec2.public_ip
}
