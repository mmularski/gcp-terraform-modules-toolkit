variable "project_id" {
  type        = string
  description = "GCP Project ID"
}

variable "is_dev_env" {
  type        = bool
  description = "Determines if the configuration will be done for the DEV project. If true, permissions in comparison to the stage/prod projects will be broader"
  default     = false
}

variable "project_lead_team" {
  type        = list(string)
  description = "List of email addresses of a project leader-level team. This team has the most exceeded permissions"
  default     = []
}

variable "project_be_team" {
  type        = list(string)
  description = "List of email addresses of a project backend team."
  default     = []
}

variable "project_fe_team" {
  type        = list(string)
  description = "List of email addresses of a project frontend team."
  default     = []
}

variable "project_qa_team" {
  type        = list(string)
  description = "List of email addresses of a project quality assurance team."
  default     = []
}
