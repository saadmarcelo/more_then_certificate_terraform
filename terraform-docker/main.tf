terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    version = "3.0.2" }
  }
}

provider "docker" {}

resource "null_resource" "dockervol" {
  provisioner "local-exec" {
    command = "mkdir noderedvol/ || true"
  }
}
resource "docker_image" "nodered_image" {
  name = "nodered/node-red:latest"
}
resource "random_string" "random" {
  count   = local.container_count
  length  = 4
  special = false
  upper   = false
}

resource "docker_container" "nodered_container" {
  count = local.container_count
  name  = join("-", ["nodered", random_string.random[count.index].result])
  image = docker_image.nodered_image.name
  ports {
    internal = var.int_port
    external = var.ext_port[count.index]
  }
  volumes {
    container_path = "/data"
    host_path      = "/Users/marcelosaad/Treinamentos/more_then_certificate_terraform/terraform-docker/noderedvol/"
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




# output "container-name2" {
#   value       = docker_container.nodered_container[1].name
#   description = "The name of the container"
#}
