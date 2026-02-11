locals {
  resource_group_name   = join("", [var.name_prefix, "rg"])
  sql_server_name       = join("", [var.name_prefix, "sql"])
  sql_database_name     = join("", [var.name_prefix, "sql-db"])
  app_service_plan_name = join("", [var.name_prefix, "asp"])
  app_name              = join("", [var.name_prefix, "app"])
}