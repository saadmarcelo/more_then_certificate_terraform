resource "github_repository" "mtc_repo" {
  name        = "mtc-repo"
  visibility  = "private"
  auto_init   = true
  description = "Code for mtc"
}
