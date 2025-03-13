output "clone-url" {
  value       = { for i in github_repository.mtc_repo[*] : i.name => i.http_clone_url }
  description = "Repository names and URL"

}
output "varsource" {
  value       = var.varsource
  description = "source being used to source variables definition"
}
