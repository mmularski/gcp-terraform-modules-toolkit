# https://cloud.google.com/iam/docs/understanding-roles#cloudkms.admin
resource "google_project_iam_member" "cloud_kms_admin" {
  project = var.project_id
  role    = "roles/cloudkms.admin"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#cloudkms.cryptoKeyEncrypterDecrypter
resource "google_project_iam_member" "cloud_kms_encrypter_decrypter" {
  project = var.project_id
  role    = "roles/cloudkms.cryptoKeyEncrypterDecrypter"

  for_each = toset(concat(
    var.project_lead_team,
    var.project_be_team,
    var.project_fe_team,
    var.project_qa_team,
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#cloudkms.cryptoOperator
resource "google_project_iam_member" "cloud_kms_operator" {
  project = var.project_id
  role    = "roles/cloudkms.cryptoOperator"

  for_each = toset(concat(
    var.project_lead_team,
    var.project_be_team
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#cloudkms.ekmConnectionsAdmin
resource "google_project_iam_member" "cloud_kms_ekm_admin" {
  project = var.project_id
  role    = "roles/cloudkms.ekmConnectionsAdmin"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#cloudkms.publicKeyViewer
resource "google_project_iam_member" "cloud_kms_public_key_viewer" {
  project = var.project_id
  role    = "roles/cloudkms.publicKeyViewer"

  for_each = toset(concat(
    var.project_fe_team,
    var.project_qa_team,
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#cloudkms.signer
resource "google_project_iam_member" "cloud_kms_signer" {
  project = var.project_id
  role    = "roles/cloudkms.signer"

  for_each = toset(concat(
    var.project_be_team,
    var.project_fe_team,
    var.project_qa_team,
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#cloudkms.viewer
resource "google_project_iam_member" "cloud_kms_viewer" {
  project = var.project_id
  role    = "roles/cloudkms.viewer"

  for_each = toset(concat(
    var.project_be_team,
    var.project_fe_team,
    var.project_qa_team,
  ))

  member = "user:${each.key}"
}
