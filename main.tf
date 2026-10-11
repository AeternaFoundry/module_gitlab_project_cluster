resource "gitlab_project_cluster" "project_clusters" {
  for_each = var.project_clusters

  kubernetes_api_url            = each.value.kubernetes_api_url
  kubernetes_token              = each.value.kubernetes_token
  name                          = each.value.name
  project                       = each.value.project
  domain                        = each.value.domain
  enabled                       = each.value.enabled
  environment_scope             = each.value.environment_scope
  kubernetes_authorization_type = each.value.kubernetes_authorization_type
  kubernetes_ca_cert            = each.value.kubernetes_ca_cert
  kubernetes_namespace          = each.value.kubernetes_namespace
  managed                       = each.value.managed
  management_project_id         = each.value.management_project_id
}

