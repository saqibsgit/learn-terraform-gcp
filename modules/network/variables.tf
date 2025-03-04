variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
  default     = "vpc-dev"
}

variable "auto_create_subnetworks" {
  type        = bool
  description = "Whether to create subnetworks"
  default     = true
}

variable "region" {
  type        = string
  description = "The region where resources will be created"
  default     = "europe-west3"

}

variable "public_subnet_cidr" {
  type        = string
  description = "The CIDR block of the public subnet"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  type        = string
  description = "The CIDR block of the private subnet"
  default     = "10.0.2.0/24"
}