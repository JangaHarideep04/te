variable "aws_instance" {
    default = "t3.large"
}

variable "ami" {
    default = "ami-020cba7c55df1f615"
  
}

variable "region" {
    default = "us-east-1"
}

variable "key_name" {
    default = "Project-3-Key"
  
}


variable "server_name" {
  default = "Project3"
}

variable "volume_size" {
  default = 30
}