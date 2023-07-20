output "secret" {
  value = google_secret_manager_secret.secret.secret_id
}
