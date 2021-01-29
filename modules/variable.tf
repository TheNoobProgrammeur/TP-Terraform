variable "key-name" {
  type        = string
  description = "key ssh"
}

variable "owner" {
  type        = string
  description = "Name for Owner tag"
}


variable "ami-ID" {
  type = object({
    ami-id-subnet-a : string
    ami-id-subnet-b : string
  })
  description = "Objet contenant les ami-id pour les instances des subnet a et b. Vous pouvez choisir des amis diferants pour les subnet"
  validation {
    condition     = (length(var.ami-ID.ami-id-subnet-a) > 4 && substr(var.ami-ID.ami-id-subnet-a, 0, 4) == "ami-") && (length(var.ami-ID.ami-id-subnet-b) > 4 && substr(var.ami-ID.ami-id-subnet-b, 0, 4) == "ami-")
    error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
  }
  default = {
    ami-id-subnet-a = "ami-059db4e559f0ad913"
    ami-id-subnet-b = "ami-059db4e559f0ad913"
  }
}

variable "instance-type" {
  type        = string
  description = "instance_type"
  default     = "t2.micro"
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
