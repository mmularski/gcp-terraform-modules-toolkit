# https://cloud.google.com/iam/docs/understanding-roles#appengine.appAdmin
resource "google_project_iam_member" "app_engine_admin" {
  project = var.project_id
  role    = "roles/appengine.appAdmin"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#appengine.appCreator
resource "google_project_iam_member" "app_engine_creator" {
  project = var.project_id
  role    = "roles/appengine.appCreator"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#appengine.appViewer
resource "google_project_iam_member" "app_engine_viewer" {
  project = var.project_id
  role    = "roles/appengine.appViewer"

  for_each = toset(concat(
    var.project_be_team,
    var.project_fe_team,
    var.project_qa_team
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#appengine.codeViewer
resource "google_project_iam_member" "app_engine_code_viewer" {
  project = var.project_id
  role    = "roles/appengine.codeViewer"

  for_each = toset(concat(
    var.project_be_team,
    var.project_fe_team,
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#appengine.debugger
resource "google_project_iam_member" "app_engine_debugger" {
  project = var.project_id
  role    = "roles/appengine.debugger"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : [],
    var.is_dev_env ? var.project_fe_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#appengine.deployer
resource "google_project_iam_member" "app_engine_deployer" {
  project = var.project_id
  role    = "roles/appengine.deployer"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#appengine.memcacheDataAdmin
resource "google_project_iam_member" "app_engine_memcache_admin" {
  project = var.project_id
  role    = "roles/appengine.memcacheDataAdmin"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#appengine.serviceAdmin
resource "google_project_iam_member" "app_engine_service_admin" {
  project = var.project_id
  role    = "roles/appengine.serviceAdmin"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}
