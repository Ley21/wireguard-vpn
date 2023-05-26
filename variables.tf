variable "region" {
  description = "AWS region"
  type        = string
}

variable "instance_name" {
  description = "Name of the Lightsail instance"
  type        = string
  default     = "sego-vpn"
}

variable "availability_zone" {
  description = "Availability zone for the instance"
  type        = string
  default     = "eu-west-2a"
}
