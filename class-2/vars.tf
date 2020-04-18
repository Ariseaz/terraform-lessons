variable "AWS_ACCESS_KEY" {
}

variable "AWS_SECRET_KEY" {
}

variable "AWS_REGION" {
  default = "us-east-2"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-2 = "ami-0fc20dd1da406780b"
    us-west-2 = "ami-0d1cd67c26f5fca19"
    eu-west-1 = "ami-0d729a60"
  }
}

