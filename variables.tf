variable "project_clusters" {
  description = <<EOT
Map of project_clusters, attributes below
Required:
    - kubernetes_api_url
    - kubernetes_token
    - name
    - project
Optional:
    - domain
    - enabled
    - environment_scope
    - kubernetes_authorization_type
    - kubernetes_ca_cert
    - kubernetes_namespace
    - managed
    - management_project_id
EOT

  type = map(object({
    kubernetes_api_url            = string
    kubernetes_token              = string
    name                          = string
    project                       = string
    domain                        = optional(string)
    enabled                       = optional(bool)
    environment_scope             = optional(string)
    kubernetes_authorization_type = optional(string)
    kubernetes_ca_cert            = optional(string)
    kubernetes_namespace          = optional(string)
    managed                       = optional(bool)
    management_project_id         = optional(string)
  }))
  validation {
    condition = alltrue([
      for k, v in var.project_clusters : (
        v.kubernetes_authorization_type == null || (contains(["rbac", "abac", "unknown_authorization"], v.kubernetes_authorization_type))
      )
    ])
    error_message = "must be one of: \"rbac\", \"abac\", \"unknown_authorization\""
  }
}

