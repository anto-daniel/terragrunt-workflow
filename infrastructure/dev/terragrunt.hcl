# Development environment configuration
include "root" {
  path = find_in_parent_folders()
}

inputs = {
  content  = "Hello from Terragrunt Dev Environment!"
  filename = "dev-example.txt"
}
