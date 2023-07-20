resource "google_secret_manager_secret" "secret" {
  secret_id = var.name

  replication {
    user_managed {
      replicas {
        location = var.region
      }
    }
  }
}

resource "google_secret_manager_secret_version" "secret_version" {
  secret = google_secret_manager_secret.secret.id

  secret_data = var.value
}
