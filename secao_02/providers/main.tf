resource "random_id" "random" {
  byte_length = 2

}
resource "github_repository" "mtc_repo" {
  name        = "mtc-repo-${random_id.random.dec}"
  visibility  = "private"
  auto_init   = true
  description = "Code for mtc"
}

resource "github_repository_file" "readme" {
  repository          = github_repository.mtc_repo.name
  branch              = "main"
  file                = "README.md"
  content             = "# This repository is for infra developers"
  overwrite_on_create = true
}

resource "github_repository_file" "index" {
  repository          = github_repository.mtc_repo.name
  branch              = "main"
  file                = "index.html"
  content             = "Hellow Terraform"
  overwrite_on_create = true
}
