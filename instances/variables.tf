variable "region" {
  default = "eu-west-1"
  description = "AWS Region"
}

variable "remote_state_bucket" {
  description = "Bucket name for layer 1 remote state"
}

variable "terraform_state_key" {
  description = "Key name for layer 1 remote state"
}