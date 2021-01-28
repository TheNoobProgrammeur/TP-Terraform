variable "key-name" {
  type        = string
  description = "key ssh"
}

variable "owner" {
  type        = string
  description = "Name for Owner tag"
}


variable "ami-ID" {
  type        = string
  description = "ID ami"
}

variable "instance-type" {
  type        = string
  description = "instance_type"
}


variable "nb-instance-by-subnet" {
  type        = number
  description = "Nombre d'instance par subnet"
  default     = 2
}
