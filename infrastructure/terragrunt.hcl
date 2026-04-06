# Infrastructure root configuration
include "root" {
  path = find_in_parent_folders()
}

# Generate a simple local backend for testing
terraform {
  source = "./local-module"
}

# Create a simple local module directory
generate "local_module" {
  path = "local-module/main.tf"
  if_exists = "overwrite"
  contents = <<EOF
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
