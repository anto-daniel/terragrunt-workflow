# Production environment configuration
include "root" {
  path = find_in_parent_folders()
}

inputs = {
  content = "Hello from Terragrunt Prod Environment!"
  filename = "prod-example.txt"
}
