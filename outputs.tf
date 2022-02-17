output "name" {
  description = "Connector name"
  value       = var.name
}

output "connector_id" {
  description = "ID of the connector"
  value       = alkira_connector_internet_exit.connector.id
}

output "cxp" {
  description = "CXP that connector was provisioned in"
  value       = alkira_connector_internet_exit.connector.cxp
}

output "size" {
  description = "Size of the connector"
  value       = alkira_connector_internet_exit.connector.size
}

output "segment_id" {
  description = "Segment that connector was placed in"
  value       = alkira_connector_internet_exit.connector.segment_id
}

output "group" {
  description = "Group that connector was added to"
  value       = alkira_connector_internet_exit.connector.group
}
