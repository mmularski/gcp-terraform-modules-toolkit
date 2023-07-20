locals {
  # DEV GCP Project ID
  project_id = ""
  region     = "europe-central2"

  /*
   Specifies if provisioning will be for a development environment.
   If true, engineers will get broader permissions in comparison to a false value(which should be used for stage/prod envs)
  */
  is_dev_env = true

  # Email addresses of the leadership team. E.g. ["email1@domain.com", "email2@domain.com"]
  project_lead_team = []

  # Email addresses of the backend team. E.g. ["email1@domain.com", "email2@domain.com"]
  project_be_team = []

  # Email addresses of the frontend team. E.g. ["email1@domain.com", "email2@domain.com"]
  project_fe_team = []

  # Email addresses of the quality assurance team. E.g. ["email1@domain.com", "email2@domain.com"]
  project_qa_team = []
}

terraform {
  backend "gcs" {
    bucket = "GCP_BUCKET"
  }

  required_version = ">= 0.13"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.11, < 5.0"
    }
  }
}

provider "google" {
  project = local.project_id
  region  = local.region
}

module "gcp-services-iam" {
  source = "../../modules/iam-gcp-services"

  project_id = local.project_id

  is_dev_env = local.is_dev_env

  project_lead_team = local.project_lead_team
  project_be_team   = local.project_be_team
  project_fe_team   = local.project_fe_team
  project_qa_team   = local.project_qa_team
}
