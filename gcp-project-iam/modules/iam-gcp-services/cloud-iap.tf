# https://cloud.google.com/iam/docs/understanding-roles#iap.admin
resource "google_project_iam_member" "cloud_iap_policy_admin" {
  project = var.project_id
  role    = "roles/iap.admin"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#iap.httpsResourceAccessor
resource "google_project_iam_member" "cloud_iap_app_user" {
  project = var.project_id
  role    = "roles/iap.httpsResourceAccessor"

  for_each = toset(concat(
    var.project_lead_team,
    var.project_be_team,
    var.project_fe_team,
    var.project_qa_team
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#iap.settingsAdmin
resource "google_project_iam_member" "cloud_iap_settings_admin" {
  project = var.project_id
  role    = "roles/iap.settingsAdmin"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#iap.tunnelDestGroupEditor
resource "google_project_iam_member" "cloud_iap_group_editor" {
  project = var.project_id
  role    = "roles/iap.tunnelDestGroupEditor"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#iap.tunnelDestGroupViewer
resource "google_project_iam_member" "cloud_iap_group_viewer" {
  project = var.project_id
  role    = "roles/iap.tunnelDestGroupViewer"

  for_each = toset(var.project_be_team)

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#iap.tunnelResourceAccessor
resource "google_project_iam_member" "cloud_iap_tunnel_user" {
  project = var.project_id
  role    = "roles/iap.tunnelResourceAccessor"

  for_each = toset(concat(
    var.project_lead_team,
    var.project_be_team,
    var.project_fe_team,
    var.project_qa_team
  ))

  member = "user:${each.key}"
}
