variable "repo_count" {
  default     = 1
  description = "Number of repositories."
  type        = number

  validation {
    condition     = var.repo_count < 5
    error_message = "Do not deploy more than 5 repositories"
  }
}

variable "env" {
  type        = string
  description = "Deployment environment"
  validation {
    condition = contains(["dev", "prod"], var.env)
    # condition     = var.env == "dev" || var.env == "prod"
    error_message = "Env must be 'dev' or 'prod'"
  }

}

# variable "visibility" {
#   type        = string
#   description = "visibility of the repo"
#   default     = var.env == "dev" ? "private" : "public"
# }

# variable "varsource" {
#   type        = string
#   description = "Source used to difine variables"
#   default     = "variables.tf"
# }
