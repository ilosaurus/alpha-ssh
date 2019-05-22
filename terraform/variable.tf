variable "image" {
  default = "CHANGE ME WITH YOUR OPENSTACK IMAGE NAME"
}

variable "flavor" {
  default = "CHANGE ME WITH YOUR OPENSTACK FLAVOR NAME"
}

variable "network" {
  default = "CHANGE ME WITH YOUR INTERNAL NETWORK ID"
}

variable "public_key_path" {
  description = "The path of the ssh pub key"
  default     = "/home/ubuntu/.ssh/id_rsa.pub"
}