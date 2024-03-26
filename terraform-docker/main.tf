terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    version = "3.0.2" }
  }
}

provider "docker" {

}
variable "ext_port" {
  type    = number
  default = 1880

  validation {
    condition = var.ext_port <= 65535 && var.ext_port > 0
    error_message = "The external port must be in the valid port range 0 - 65535."
  }
}

variable "int_port" {
  type    = number
  default = 1880

  validation {
    condition = var.int_port == 1880
    error_message = "The Internal port must be 1880."
  }
}

variable "count_container" {
  type    = number
  default = 1
}
resource "docker_image" "nodered_image" {
  name = "nodered/node-red:latest"
}
resource "random_string" "random" {
  count   = var.count_container
  length  = 4
  special = false
  upper   = false
}

resource "docker_container" "nodered_container" {
  count = var.count_container
  name  = join("-", ["nodered", random_string.random[count.index].result])
  image = docker_image.nodered_image.name
  ports {
    internal = var.int_port
    external = var.ext_port
  }
}

# resource "docker_container" "nodered_container2" {
#   name  = "nodered2"
#   image = docker_image.nodered_image.name
#   ports {
#     internal = 1880
#    #external = 1880
#   }
# }
# output "IP_Address" {
#   value       = join(":", [docker_container.nodered_container[0].network_data[0].ip_address, docker_container.nodered_container[0].ports[0].external])
#   description = "The IP address and external port of the container"
# }

output "container-name" {
  value       = docker_container.nodered_container[*].name
  description = "The name of the container"
}
output "IP_Address" {
  value       = [for i in docker_container.nodered_container[*] : join(":", [i.network_data[0].ip_address, i.ports[0].external])]
  description = "The IP address and external port of the container"
}


# output "container-name2" {
#   value       = docker_container.nodered_container[1].name
#   description = "The name of the container"
#}
