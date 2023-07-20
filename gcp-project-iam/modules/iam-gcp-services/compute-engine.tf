# https://cloud.google.com/iam/docs/understanding-roles#compute.admin
resource "google_project_iam_member" "compute_engine_admin" {
  project = var.project_id
  role    = "roles/compute.admin"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#compute.instanceAdmin
resource "google_project_iam_member" "compute_engine_instance_admin_beta" {
  project = var.project_id
  role    = "roles/compute.instanceAdmin"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#compute.instanceAdmin.v1
resource "google_project_iam_member" "compute_engine_instance_admin_v1" {
  project = var.project_id
  role    = "roles/compute.instanceAdmin.v1"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#compute.loadBalancerAdmin
resource "google_project_iam_member" "compute_engine_load_balancer_admin" {
  project = var.project_id
  role    = "roles/compute.loadBalancerAdmin"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#compute.loadBalancerServiceUser
resource "google_project_iam_member" "compute_engine_load_balancer_user" {
  project = var.project_id
  role    = "roles/compute.loadBalancerServiceUser"

  for_each = toset(var.project_be_team)

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#compute.networkAdmin
resource "google_project_iam_member" "compute_engine_network_admin" {
  project = var.project_id
  role    = "roles/compute.networkAdmin"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#compute.networkUser
resource "google_project_iam_member" "compute_engine_network_user" {
  project = var.project_id
  role    = "roles/compute.loadBalancerServiceUser"

  for_each = toset(var.project_be_team)

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#compute.orgFirewallPolicyAdmin
resource "google_project_iam_member" "compute_engine_org_firewall_policy_admin" {
  project = var.project_id
  role    = "roles/compute.orgFirewallPolicyAdmin"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#compute.orgFirewallPolicyUser
resource "google_project_iam_member" "compute_engine_org_firewall_policy_user" {
  project = var.project_id
  role    = "roles/compute.orgFirewallPolicyUser"

  for_each = toset(var.project_be_team)

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#compute.orgSecurityPolicyAdmin
resource "google_project_iam_member" "compute_engine_org_security_policy_admin" {
  project = var.project_id
  role    = "roles/compute.orgSecurityPolicyAdmin"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#compute.orgSecurityPolicyUser
resource "google_project_iam_member" "compute_engine_org_security_policy_user" {
  project = var.project_id
  role    = "roles/compute.orgSecurityPolicyUser"

  for_each = toset(var.project_be_team)

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#compute.orgSecurityResourceAdmin
resource "google_project_iam_member" "compute_engine_org_security_resource_admin" {
  project = var.project_id
  role    = "roles/compute.orgSecurityResourceAdmin"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#compute.osAdminLogin
resource "google_project_iam_member" "compute_engine_os_login_admin" {
  project = var.project_id
  role    = "roles/compute.osAdminLogin"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#compute.osLogin
resource "google_project_iam_member" "compute_engine_os_login" {
  project = var.project_id
  role    = "roles/compute.osLogin"

  for_each = toset(var.project_be_team)

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#compute.publicIpAdmin
resource "google_project_iam_member" "compute_engine_public_ip_admin" {
  project = var.project_id
  role    = "roles/compute.publicIpAdmin"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#compute.securityAdmin
resource "google_project_iam_member" "compute_engine_security_admin" {
  project = var.project_id
  role    = "roles/compute.securityAdmin"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#compute.soleTenantViewer
resource "google_project_iam_member" "compute_engine_sole_tenant_viewer" {
  project = var.project_id
  role    = "roles/compute.soleTenantViewer"

  for_each = toset(concat(
    var.project_lead_team,
    var.project_be_team
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#compute.storageAdmin
resource "google_project_iam_member" "compute_engine_storage_admin" {
  project = var.project_id
  role    = "roles/compute.storageAdmin"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#compute.viewer
resource "google_project_iam_member" "compute_engine_viewer" {
  project = var.project_id
  role    = "roles/compute.viewer"

  for_each = toset(concat(
    var.project_be_team,
    var.project_fe_team,
    var.project_qa_team
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#osconfig.inventoryViewer
resource "google_project_iam_member" "compute_engine_od_inventory_viewer" {
  project = var.project_id
  role    = "roles/osconfig.inventoryViewer"

  for_each = toset(var.project_be_team)

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#osconfig.osPolicyAssignmentAdmin
resource "google_project_iam_member" "compute_engine_ospolicy_admin" {
  project = var.project_id
  role    = "roles/osconfig.osPolicyAssignmentAdmin"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#osconfig.osPolicyAssignmentViewer
resource "google_project_iam_member" "compute_engine_ospolicy_viewer" {
  project = var.project_id
  role    = "roles/osconfig.osPolicyAssignmentViewer"

  for_each = toset(var.project_be_team)

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#osconfig.patchDeploymentAdmin
resource "google_project_iam_member" "compute_engine_patch_deployment_admin" {
  project = var.project_id
  role    = "roles/osconfig.patchDeploymentAdmin"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#osconfig.patchDeploymentViewer
resource "google_project_iam_member" "compute_engine_patch_deployment_viewer" {
  project = var.project_id
  role    = "roles/osconfig.patchDeploymentViewer"

  for_each = toset(var.project_be_team)

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#osconfig.patchJobExecutor
resource "google_project_iam_member" "compute_engine_patch_job_executor" {
  project = var.project_id
  role    = "roles/osconfig.patchJobExecutor"

  for_each = toset(concat(
    var.project_lead_team,
    var.is_dev_env ? var.project_be_team : []
  ))

  member = "user:${each.key}"
}

# https://cloud.google.com/iam/docs/understanding-roles#osconfig.patchJobViewer
resource "google_project_iam_member" "compute_engine_patch_job_viewer" {
  project = var.project_id
  role    = "roles/osconfig.patchJobViewer"

  for_each = toset(var.project_be_team)

  member = "user:${each.key}"
}
