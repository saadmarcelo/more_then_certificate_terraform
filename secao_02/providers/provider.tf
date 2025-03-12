terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

# Configure the Github provider
provider "github" {
  owner = "saadmarcelo"
}
