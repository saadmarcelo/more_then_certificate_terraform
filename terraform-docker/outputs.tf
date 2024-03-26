output "container-name" {
  value       = docker_container.nodered_container[*].name
  description = "The name of the container"
}
output "IP_Address" {
  value       = [for i in docker_container.nodered_container[*] : join(":", [i.network_data[0].ip_address, i.ports[0].external])]
  description = "The IP address and external port of the container"
}
