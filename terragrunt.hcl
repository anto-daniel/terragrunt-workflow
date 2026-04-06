# Root configuration file
remote_state {
  backend = "local"
  config = {
    path = "${get_terragrunt_dir()}/${path_relative_to_include()}/terraform.tfstate"
  }
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite"
  contents = <<EOF
terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}
EOF
}
