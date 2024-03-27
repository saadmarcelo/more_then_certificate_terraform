variable "ext_port" {
  type = number
  #  sensitive = true

  validation {
    condition     = var.ext_port <= 65535 && var.ext_port > 0
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

variable "count_container" {
  type    = number
  default = 1
}
