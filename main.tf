locals { 
    service_name     = join("_", [var.module_prefix,var.module_name])
    table_name       = join("-", [var.project_name,local.service_name,var.env])
}

resource "aws_dynamodb_table" "this" {
  name         = local.table_name
  billing_mode = var.billing_mode
  hash_key     = var.attribute_name
  attribute {
    name = var.attribute_name
    type = var.attribute_type
  }
  tags         = var.resource_tags
}
