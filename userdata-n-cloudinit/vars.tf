variable "AWS_ACCESS_KEY" {
}

variable "AWS_SECRET_KEY" {
}

variable "AWS_REGION" {
  default = "us-west-2"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-2 = "ami-0fc20dd1da406780b"
    us-west-1 = "ami-03ba3948f6c37a4b0"
    us-west-2 = "ami-0d1cd67c26f5fca19"
  }
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable "INSTANCE_DEVICE_NAME" {
  default = "/dev/xvdh"
}

