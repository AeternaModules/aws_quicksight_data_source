output "quicksight_data_sources_id" {
  description = "Map of id values across all quicksight_data_sources, keyed the same as var.quicksight_data_sources"
  value       = { for k, v in aws_quicksight_data_source.quicksight_data_sources : k => v.id if v.id != null && length(v.id) > 0 }
}
output "quicksight_data_sources_arn" {
  description = "Map of arn values across all quicksight_data_sources, keyed the same as var.quicksight_data_sources"
  value       = { for k, v in aws_quicksight_data_source.quicksight_data_sources : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "quicksight_data_sources_aws_account_id" {
  description = "Map of aws_account_id values across all quicksight_data_sources, keyed the same as var.quicksight_data_sources"
  value       = { for k, v in aws_quicksight_data_source.quicksight_data_sources : k => v.aws_account_id if v.aws_account_id != null && length(v.aws_account_id) > 0 }
}
output "quicksight_data_sources_credentials" {
  description = "Map of credentials values across all quicksight_data_sources, keyed the same as var.quicksight_data_sources"
  value       = { for k, v in aws_quicksight_data_source.quicksight_data_sources : k => v.credentials if v.credentials != null && length(v.credentials) > 0 }
  sensitive   = true
}
output "quicksight_data_sources_data_source_id" {
  description = "Map of data_source_id values across all quicksight_data_sources, keyed the same as var.quicksight_data_sources"
  value       = { for k, v in aws_quicksight_data_source.quicksight_data_sources : k => v.data_source_id if v.data_source_id != null && length(v.data_source_id) > 0 }
}
output "quicksight_data_sources_name" {
  description = "Map of name values across all quicksight_data_sources, keyed the same as var.quicksight_data_sources"
  value       = { for k, v in aws_quicksight_data_source.quicksight_data_sources : k => v.name if v.name != null && length(v.name) > 0 }
}
output "quicksight_data_sources_parameters" {
  description = "Map of parameters values across all quicksight_data_sources, keyed the same as var.quicksight_data_sources"
  value       = { for k, v in aws_quicksight_data_source.quicksight_data_sources : k => v.parameters if v.parameters != null && length(v.parameters) > 0 }
}
output "quicksight_data_sources_permission" {
  description = "Map of permission values across all quicksight_data_sources, keyed the same as var.quicksight_data_sources"
  value       = { for k, v in aws_quicksight_data_source.quicksight_data_sources : k => v.permission if v.permission != null && length(v.permission) > 0 }
}
output "quicksight_data_sources_region" {
  description = "Map of region values across all quicksight_data_sources, keyed the same as var.quicksight_data_sources"
  value       = { for k, v in aws_quicksight_data_source.quicksight_data_sources : k => v.region if v.region != null && length(v.region) > 0 }
}
output "quicksight_data_sources_ssl_properties" {
  description = "Map of ssl_properties values across all quicksight_data_sources, keyed the same as var.quicksight_data_sources"
  value       = { for k, v in aws_quicksight_data_source.quicksight_data_sources : k => v.ssl_properties if v.ssl_properties != null && length(v.ssl_properties) > 0 }
}
output "quicksight_data_sources_tags" {
  description = "Map of tags values across all quicksight_data_sources, keyed the same as var.quicksight_data_sources"
  value       = { for k, v in aws_quicksight_data_source.quicksight_data_sources : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "quicksight_data_sources_tags_all" {
  description = "Map of tags_all values across all quicksight_data_sources, keyed the same as var.quicksight_data_sources"
  value       = { for k, v in aws_quicksight_data_source.quicksight_data_sources : k => v.tags_all if v.tags_all != null && length(v.tags_all) > 0 }
}
output "quicksight_data_sources_type" {
  description = "Map of type values across all quicksight_data_sources, keyed the same as var.quicksight_data_sources"
  value       = { for k, v in aws_quicksight_data_source.quicksight_data_sources : k => v.type if v.type != null && length(v.type) > 0 }
}
output "quicksight_data_sources_vpc_connection_properties" {
  description = "Map of vpc_connection_properties values across all quicksight_data_sources, keyed the same as var.quicksight_data_sources"
  value       = { for k, v in aws_quicksight_data_source.quicksight_data_sources : k => v.vpc_connection_properties if v.vpc_connection_properties != null && length(v.vpc_connection_properties) > 0 }
}

