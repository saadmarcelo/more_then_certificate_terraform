# resource "random_id" "random" {
#   byte_length = 2
#   count       = var.repo_count
#
# }
resource "github_repository" "mtc_repo" {
  # count       = var.repo_count
  for_each = var.repos
  # name        = "mtc-repo-${random_id.random[count.index].dec}"
  name        = "mtc-repo-${each.key}"
  visibility  = var.env == "dev" ? "private" : "public"
  auto_init   = true
  description = "${each.value} for mtc"
  # description = "Code for mtc"
  provisioner "local-exec" {
    command = "gh repo view ${self.name} --web"

  }
}

resource "github_repository_file" "readme" {
  # count               = var.repo_count
  for_each = var.repos
  # repository          = github_repository.mtc_repo[count.index].name
  repository          = github_repository.mtc_repo[each.key].name
  branch              = "main"
  file                = "README.md"
  content             = "# This ${var.env} repository is for infra developers"
  overwrite_on_create = true
}

resource "github_repository_file" "index" {
  # count               = var.repo_count
  for_each            = var.repos
  repository          = github_repository.mtc_repo[each.key].name
  branch              = "main"
  file                = "index.html"
  content             = "Hellow Terraform"
  overwrite_on_create = true
}
