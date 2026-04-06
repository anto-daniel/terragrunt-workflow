# Infrastructure root configuration
include "root" {
  path = find_in_parent_folders()
}

# Generate the main.tf file directly in the current directory
generate "main" {
  path = "main.tf"
  if_exists = "overwrite"
  contents = <<EOF
terraform {
  backend "local" {}
}

# Simple local Terraform module for testing
resource "local_file" "example" {
  content  = "Hello from Terragrunt!"
  filename = "$${path.module}/example.txt"
}

output "example_content" {
  value = local_file.example.content
}
EOF
}
