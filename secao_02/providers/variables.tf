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
    condition     = var.env == "dev" || var.env == "prod"
    error_message = "Env must be 'dev' or 'prod'"
  }

}

# variable "varsource" {
#   type        = string
#   description = "Source used to difine variables"
#   default     = "variables.tf"
# }
