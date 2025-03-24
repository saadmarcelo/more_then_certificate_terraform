variable "repos" {
  type        = set(string)
  description = "Repositories"
  validation {
    condition     = length(var.repos) <= var.repo_max
    error_message = "Please do not deploy more repos than the repo_max allows"
  }
}
variable "repo_max" {
  default     = 2
  description = "Number of repositories."
  type        = number

  validation {
    condition     = var.repo_max <= 10
    error_message = "Do not deploy more than 10 repositories"
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
