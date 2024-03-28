variable "env" {
  type        = string
  description = "Env to deploy to"
  default     = "dev"
}

variable "image" {
  type        = map(any)
  description = "Image for container"
  default = {
    dev  = "nodered/node-red:latest"
    prod = "nodered/node-red:latest-minimal"
  }
}

variable "ext_port" {
  type = list(any)
  #  sensitive = true

  validation {
    condition     = max(var.ext_port...) <= 65535 && min(var.ext_port...) > 0
    error_message = "The external port must be in the valid port range 0 - 65535."
  }
}

variable "int_port" {
  type      = number
  default   = 1880
  sensitive = true

  validation {
    condition     = var.int_port == 1880
    error_message = "The Internal port must be 1880."
  }
}
locals {
  container_count = length(var.ext_port)
}
