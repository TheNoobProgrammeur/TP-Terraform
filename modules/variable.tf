variable "key-name" {
  type        = string
  description = "key ssh"
}

variable "owner" {
  type        = string
  description = "Name for Owner tag"
}


variable "ami" {
  type        = string
  description = "id ami"
  validation {
    condition     = length(var.ami) > 4 && substr(var.ami, 0, 4) == "ami-"
    error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
  }
}

variable "instance-type" {
  type        = string
  description = "Instance Type"

}


variable "nb-instance-by-subnet" {
  type        = number
  description = "Number instance by subnet"
  default     = 2
  validation {
    condition     = var.nb-instance-by-subnet > 0 && var.nb-instance-by-subnet < 21
    error_message = "The number of instances per subnet must be between 0 and 20."
  }
}

