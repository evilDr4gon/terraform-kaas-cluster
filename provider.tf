terraform {
  required_providers {
    spot = {
      source = "rackerlabs/spot"
    }
  }
}

provider "spot" {
  token = var.token
}

variable "token" {
  type      = string
  sensitive = true
}