variable "quicksight_data_sources" {
  description = <<EOT
Map of quicksight_data_sources, attributes below
Required:
    - data_source_id
    - name
    - type
    - parameters (block):
        - amazon_elasticsearch (optional, block):
            - domain (required)
        - athena (optional, block):
            - role_arn (optional)
            - work_group (optional)
        - aurora (optional, block):
            - database (required)
            - host (required)
            - port (required)
        - aurora_postgresql (optional, block):
            - database (required)
            - host (required)
            - port (required)
        - aws_iot_analytics (optional, block):
            - data_set_name (required)
        - databricks (optional, block):
            - host (required)
            - port (required)
            - sql_endpoint_path (required)
        - jira (optional, block):
            - site_base_url (required)
        - maria_db (optional, block):
            - database (required)
            - host (required)
            - port (required)
        - mysql (optional, block):
            - database (required)
            - host (required)
            - port (required)
        - oracle (optional, block):
            - database (required)
            - host (required)
            - port (required)
        - postgresql (optional, block):
            - database (required)
            - host (required)
            - port (required)
        - presto (optional, block):
            - catalog (required)
            - host (required)
            - port (required)
        - rds (optional, block):
            - database (required)
            - instance_id (required)
        - redshift (optional, block):
            - cluster_id (optional)
            - database (required)
            - host (optional)
            - port (optional)
        - s3 (optional, block):
            - manifest_file_location (required, block):
                - bucket (required)
                - key (required)
            - role_arn (optional)
        - service_now (optional, block):
            - site_base_url (required)
        - snowflake (optional, block):
            - database (required)
            - host (required)
            - warehouse (required)
        - spark (optional, block):
            - host (required)
            - port (required)
        - sql_server (optional, block):
            - database (required)
            - host (required)
            - port (required)
        - teradata (optional, block):
            - database (required)
            - host (required)
            - port (required)
        - twitter (optional, block):
            - max_rows (required)
            - query (required)
Optional:
    - aws_account_id
    - region
    - tags
    - tags_all
    - credentials (block):
        - copy_source_arn (optional)
        - credential_pair (optional, block):
            - password (required)
            - username (required)
        - secret_arn (optional)
    - permission (block):
        - actions (required)
        - principal (required)
    - ssl_properties (block):
        - disable_ssl (required)
    - vpc_connection_properties (block):
        - vpc_connection_arn (required)
EOT

  type = map(object({
    data_source_id = string
    name           = string
    type           = string
    aws_account_id = optional(string)
    region         = optional(string)
    tags           = optional(map(string))
    tags_all       = optional(map(string))
    parameters = object({
      amazon_elasticsearch = optional(object({
        domain = string
      }))
      athena = optional(object({
        role_arn   = optional(string)
        work_group = optional(string)
      }))
      aurora = optional(object({
        database = string
        host     = string
        port     = number
      }))
      aurora_postgresql = optional(object({
        database = string
        host     = string
        port     = number
      }))
      aws_iot_analytics = optional(object({
        data_set_name = string
      }))
      databricks = optional(object({
        host              = string
        port              = number
        sql_endpoint_path = string
      }))
      jira = optional(object({
        site_base_url = string
      }))
      maria_db = optional(object({
        database = string
        host     = string
        port     = number
      }))
      mysql = optional(object({
        database = string
        host     = string
        port     = number
      }))
      oracle = optional(object({
        database = string
        host     = string
        port     = number
      }))
      postgresql = optional(object({
        database = string
        host     = string
        port     = number
      }))
      presto = optional(object({
        catalog = string
        host    = string
        port    = number
      }))
      rds = optional(object({
        database    = string
        instance_id = string
      }))
      redshift = optional(object({
        cluster_id = optional(string)
        database   = string
        host       = optional(string)
        port       = optional(number)
      }))
      s3 = optional(object({
        manifest_file_location = object({
          bucket = string
          key    = string
        })
        role_arn = optional(string)
      }))
      service_now = optional(object({
        site_base_url = string
      }))
      snowflake = optional(object({
        database  = string
        host      = string
        warehouse = string
      }))
      spark = optional(object({
        host = string
        port = number
      }))
      sql_server = optional(object({
        database = string
        host     = string
        port     = number
      }))
      teradata = optional(object({
        database = string
        host     = string
        port     = number
      }))
      twitter = optional(object({
        max_rows = number
        query    = string
      }))
    })
    credentials = optional(object({
      copy_source_arn = optional(string)
      credential_pair = optional(object({
        password = string
        username = string
      }))
      secret_arn = optional(string)
    }))
    permission = optional(list(object({
      actions   = set(string)
      principal = string
    })))
    ssl_properties = optional(object({
      disable_ssl = bool
    }))
    vpc_connection_properties = optional(object({
      vpc_connection_arn = string
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.quicksight_data_sources : (
        v.permission == null || (length(v.permission) <= 64)
      )
    ])
    error_message = "Each permission list must contain at most 64 items"
  }
  # Note: 54 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

