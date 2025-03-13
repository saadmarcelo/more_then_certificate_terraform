variable "repo_count" {
  default     = 1
  description = "Number of repositories."
  type        = number
}

variable "varsource" {
  type        = string
  description = "Source used to difine variables"
  default     = "variables.tf"
}
