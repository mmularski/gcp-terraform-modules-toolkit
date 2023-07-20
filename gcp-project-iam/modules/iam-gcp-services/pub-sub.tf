# https://cloud.google.com/iam/docs/understanding-roles#pubsub.admin
resource "google_project_iam_member" "pub_sub_admin" {
  project = var.project_id
  role    = "roles/pubsub.admin"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#pubsub.editor
resource "google_project_iam_member" "pub_sub_editor" {
  project = var.project_id
  role    = "roles/pubsub.editor"

  for_each = toset(var.project_be_team)

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#pubsub.publisher
resource "google_project_iam_member" "pub_sub_publisher" {
  project = var.project_id
  role    = "roles/pubsub.publisher"

  for_each = toset(concat(
    var.project_fe_team,
    var.project_qa_team
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#pubsub.viewer
resource "google_project_iam_member" "pub_sub_viewer" {
  project = var.project_id
  role    = "roles/pubsub.viewer"

  for_each = toset(concat(
    var.project_fe_team,
    var.project_qa_team
  ))

  member = "user:${each.key}"
}
