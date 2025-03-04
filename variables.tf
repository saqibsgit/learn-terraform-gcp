variable "project_id" {
  type        = string
  description = "GCP project ID"
}

variable "env" {
  type        = string
  description = "The deployment environment (e.g., dev, prod)"

  validation {
    condition     = contains(["dev", "prod"], var.env)
    error_message = "The environment must be either 'dev' or 'prod'."
  }
}

variable "region" {
  type        = string
  description = "GCP region for deployment"
}

variable "public_subnet_cidr" {
  type        = string
  description = "CIDR block for the public subnet"

  validation {
    condition     = can(cidrhost(var.public_subnet_cidr, 0))
    error_message = "The public_subnet_cidr must be a valid CIDR range."
  }
}

variable "private_subnet_cidr" {
  type        = string
  description = "CIDR block for the private subnet"

  validation {
    condition     = can(cidrhost(var.private_subnet_cidr, 0))
    error_message = "The private_subnet_cidr must be a valid CIDR range."
  }
}