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

variable "ec2_instance_type" {
  description = "EC2 Instance type to launch"
}

variable "key_par_name" {
  default     = "MyEC2Keypair"
  description = "Keypair to use connect to EC2 Instances"
}