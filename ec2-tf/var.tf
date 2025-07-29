variable "region" {
  default = "us-west-2"
}

variable "ami" {
  default = "ami-05f991c49d264708f" #Ubuntu 
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "monitor-project"
}