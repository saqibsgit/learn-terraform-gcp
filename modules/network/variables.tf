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