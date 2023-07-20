# https://cloud.google.com/iam/docs/understanding-roles#memcache.admin
resource "google_project_iam_member" "memcache_admin" {
  project = var.project_id
  role    = "roles/memcache.admin"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#memcache.editor
resource "google_project_iam_member" "memcache_editor" {
  project = var.project_id
  role    = "roles/memcache.editor"

  for_each = toset(var.project_be_team)

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#memcache.viewer
resource "google_project_iam_member" "memcache_viewer" {
  project = var.project_id
  role    = "roles/memcache.viewer"

  for_each = toset(concat(
    var.project_qa_team,
    var.project_fe_team
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#redis.admin
resource "google_project_iam_member" "redis_admin" {
  project = var.project_id
  role    = "roles/redis.admin"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#redis.editor
resource "google_project_iam_member" "redis_editor" {
  project = var.project_id
  role    = "roles/redis.editor"

  for_each = toset(var.project_be_team)

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#redis.viewer
resource "google_project_iam_member" "redis_viewer" {
  project = var.project_id
  role    = "roles/redis.viewer"

  for_each = toset(concat(
    var.project_qa_team,
    var.project_fe_team
  ))

  member = "user:${each.key}"
}
