
variable "region" {
  type = string
}

variable "vpc-name" {
  type = string
}

#variable "aws_credentials" {
#  type = string
#}

#variable "aws_profile" {
#  type = string
#}

variable "naming-prefix" {
  type = string
}

variable "om-instance-type" {
  type = string
}

variable "ansible-instance-type" {
  type = string
}

variable "ami-id" {
  type = string
}

variable "key-pair" {
  type = string
}

variable "private-key-file" {
  type = string
}

variable "dns-domain" {
  type = string
}
variable "subnet-cidrs" {
  type = list(string)
}

variable "sg-ingress-ports" {
  type = list(any)
}

variable "opsman-deb" {
  type = string
}