provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "demo-localexec" {
  ami = "ami-05f991c49d264708f"
  instance_type = "t2.micro"
  key_name = "VPC"

  tags = {
    name = "LocalExecDemo"
  }

  provisioner "local-exec" {
    command = "echo 'EC2 instance ${self.tags.name} with ID ${self.id} has been created' >> terraform-output.log"
  }

}
