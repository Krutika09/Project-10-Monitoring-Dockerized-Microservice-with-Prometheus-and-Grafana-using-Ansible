resource "aws_instance" "this" {
  ami                     = "ami-05f991c49d264708f"
  instance_type           = "t2.micro"
  key_name                = "monitor-project" # do not add .pem extension
  vpc_security_group_ids  =  [aws_security_group.allow-traffic.id]

  tags = {
    Name = "Java-App-Instance"
  }
}

resource "aws_security_group" "allow-traffic" {
  name        = "Monitor-App-SG"
  description = "Allow SSH, HTTP, Custom TCP:8000 (Microservice), 9090 (Prometheus), 3000 (Grafana)"
  vpc_id      = "vpc-0f3e5fa23a4aa9856"

  tags = {
    Name = "Monitor-App-Security-Group"
  }

  ingress{
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
  }

   ingress{
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
  }

   ingress{
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 8000
    protocol    = "tcp"
    to_port     = 8000
  }

   ingress{
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 9090
    protocol    = "tcp"
    to_port     = 9090
  }

   ingress{
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 3000
    protocol    = "tcp"
    to_port     = 3000
  }

  
}