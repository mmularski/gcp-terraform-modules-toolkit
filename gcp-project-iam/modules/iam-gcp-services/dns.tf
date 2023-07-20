# https://cloud.google.com/iam/docs/understanding-roles#dns.admin
resource "google_project_iam_member" "dns_admin" {
  project = var.project_id
  role    = "roles/dns.admin"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#dns.reader
resource "google_project_iam_member" "dns_reader" {
  project = var.project_id
  role    = "roles/dns.reader"

  for_each = toset(concat(
    var.project_be_team,
    var.project_fe_team,
    var.project_qa_team
  ))

  member = "user:${each.key}"
}
