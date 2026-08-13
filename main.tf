resource "aws_quicksight_data_source" "quicksight_data_sources" {
  for_each = var.quicksight_data_sources

  data_source_id = each.value.data_source_id
  name           = each.value.name
  type           = each.value.type
  aws_account_id = each.value.aws_account_id
  region         = each.value.region
  tags           = each.value.tags
  tags_all       = each.value.tags_all

  parameters {
    dynamic "amazon_elasticsearch" {
      for_each = each.value.parameters.amazon_elasticsearch != null ? [each.value.parameters.amazon_elasticsearch] : []
      content {
        domain = amazon_elasticsearch.value.domain
      }
    }
    dynamic "athena" {
      for_each = each.value.parameters.athena != null ? [each.value.parameters.athena] : []
      content {
        role_arn   = athena.value.role_arn
        work_group = athena.value.work_group
      }
    }
    dynamic "aurora" {
      for_each = each.value.parameters.aurora != null ? [each.value.parameters.aurora] : []
      content {
        database = aurora.value.database
        host     = aurora.value.host
        port     = aurora.value.port
      }
    }
    dynamic "aurora_postgresql" {
      for_each = each.value.parameters.aurora_postgresql != null ? [each.value.parameters.aurora_postgresql] : []
      content {
        database = aurora_postgresql.value.database
        host     = aurora_postgresql.value.host
        port     = aurora_postgresql.value.port
      }
    }
    dynamic "aws_iot_analytics" {
      for_each = each.value.parameters.aws_iot_analytics != null ? [each.value.parameters.aws_iot_analytics] : []
      content {
        data_set_name = aws_iot_analytics.value.data_set_name
      }
    }
    dynamic "databricks" {
      for_each = each.value.parameters.databricks != null ? [each.value.parameters.databricks] : []
      content {
        host              = databricks.value.host
        port              = databricks.value.port
        sql_endpoint_path = databricks.value.sql_endpoint_path
      }
    }
    dynamic "jira" {
      for_each = each.value.parameters.jira != null ? [each.value.parameters.jira] : []
      content {
        site_base_url = jira.value.site_base_url
      }
    }
    dynamic "maria_db" {
      for_each = each.value.parameters.maria_db != null ? [each.value.parameters.maria_db] : []
      content {
        database = maria_db.value.database
        host     = maria_db.value.host
        port     = maria_db.value.port
      }
    }
    dynamic "mysql" {
      for_each = each.value.parameters.mysql != null ? [each.value.parameters.mysql] : []
      content {
        database = mysql.value.database
        host     = mysql.value.host
        port     = mysql.value.port
      }
    }
    dynamic "oracle" {
      for_each = each.value.parameters.oracle != null ? [each.value.parameters.oracle] : []
      content {
        database = oracle.value.database
        host     = oracle.value.host
        port     = oracle.value.port
      }
    }
    dynamic "postgresql" {
      for_each = each.value.parameters.postgresql != null ? [each.value.parameters.postgresql] : []
      content {
        database = postgresql.value.database
        host     = postgresql.value.host
        port     = postgresql.value.port
      }
    }
    dynamic "presto" {
      for_each = each.value.parameters.presto != null ? [each.value.parameters.presto] : []
      content {
        catalog = presto.value.catalog
        host    = presto.value.host
        port    = presto.value.port
      }
    }
    dynamic "rds" {
      for_each = each.value.parameters.rds != null ? [each.value.parameters.rds] : []
      content {
        database    = rds.value.database
        instance_id = rds.value.instance_id
      }
    }
    dynamic "redshift" {
      for_each = each.value.parameters.redshift != null ? [each.value.parameters.redshift] : []
      content {
        cluster_id = redshift.value.cluster_id
        database   = redshift.value.database
        host       = redshift.value.host
        port       = redshift.value.port
      }
    }
    dynamic "s3" {
      for_each = each.value.parameters.s3 != null ? [each.value.parameters.s3] : []
      content {
        manifest_file_location {
          bucket = s3.value.manifest_file_location.bucket
          key    = s3.value.manifest_file_location.key
        }
        role_arn = s3.value.role_arn
      }
    }
    dynamic "service_now" {
      for_each = each.value.parameters.service_now != null ? [each.value.parameters.service_now] : []
      content {
        site_base_url = service_now.value.site_base_url
      }
    }
    dynamic "snowflake" {
      for_each = each.value.parameters.snowflake != null ? [each.value.parameters.snowflake] : []
      content {
        database  = snowflake.value.database
        host      = snowflake.value.host
        warehouse = snowflake.value.warehouse
      }
    }
    dynamic "spark" {
      for_each = each.value.parameters.spark != null ? [each.value.parameters.spark] : []
      content {
        host = spark.value.host
        port = spark.value.port
      }
    }
    dynamic "sql_server" {
      for_each = each.value.parameters.sql_server != null ? [each.value.parameters.sql_server] : []
      content {
        database = sql_server.value.database
        host     = sql_server.value.host
        port     = sql_server.value.port
      }
    }
    dynamic "teradata" {
      for_each = each.value.parameters.teradata != null ? [each.value.parameters.teradata] : []
      content {
        database = teradata.value.database
        host     = teradata.value.host
        port     = teradata.value.port
      }
    }
    dynamic "twitter" {
      for_each = each.value.parameters.twitter != null ? [each.value.parameters.twitter] : []
      content {
        max_rows = twitter.value.max_rows
        query    = twitter.value.query
      }
    }
  }

  dynamic "credentials" {
    for_each = each.value.credentials != null ? [each.value.credentials] : []
    content {
      copy_source_arn = credentials.value.copy_source_arn
      dynamic "credential_pair" {
        for_each = credentials.value.credential_pair != null ? [credentials.value.credential_pair] : []
        content {
          password = credential_pair.value.password
          username = credential_pair.value.username
        }
      }
      secret_arn = credentials.value.secret_arn
    }
  }

  dynamic "permission" {
    for_each = each.value.permission != null ? each.value.permission : []
    content {
      actions   = permission.value.actions
      principal = permission.value.principal
    }
  }

  dynamic "ssl_properties" {
    for_each = each.value.ssl_properties != null ? [each.value.ssl_properties] : []
    content {
      disable_ssl = ssl_properties.value.disable_ssl
    }
  }

  dynamic "vpc_connection_properties" {
    for_each = each.value.vpc_connection_properties != null ? [each.value.vpc_connection_properties] : []
    content {
      vpc_connection_arn = vpc_connection_properties.value.vpc_connection_arn
    }
  }
}

