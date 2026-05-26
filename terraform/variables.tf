variable "aws_region" {
  default = "us-east-1"
}

variable "instance_type" {
  default = "t3.small"
}

variable "key_name" {
  description = "AWS EC2 key Pair Name"
}

variable "public_key_path" {
  description = "Path to Public SSH Key"
}