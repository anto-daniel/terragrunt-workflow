# Terragrunt Workflow Repository

This repository contains GitHub Actions workflows for deploying infrastructure using Terragrunt and OpenTofu.

## Overview

This repository demonstrates how to set up GitHub Actions workflows for Terragrunt deployments using the [gruntwork-io/terragrunt-action](https://github.com/gruntwork-io/terragrunt-action).

## Features

- **Automated Infrastructure Testing**: HCL formatting validation
- **Plan Stage**: Shows what changes will be made
- **Deploy Stage**: Automatic deployment on main/master branch
- **Environment-based Deployments**: Separate configurations for dev and prod
- **Tool Version Management**: Uses `mise.toml` for consistent tool versions

## Workflows

### 1. terragrunt.yml
Uses explicit tool versions in the workflow file.

### 2. terragrunt-mise.yml (Recommended)
Uses `mise.toml` file for tool version management.

## Directory Structure

```
.
├── .github/
│   └── workflows/
│       ├── terragrunt.yml          # Workflow with explicit versions
│       └── terragrunt-mise.yml    # Workflow using mise.toml
├── infrastructure/
│   ├── terragrunt.hcl              # Root configuration
│   ├── dev/
│   │   └── terragrunt.hcl         # Development environment
│   └── prod/
│       └── terragrunt.hcl         # Production environment
├── mise.toml                       # Tool version configuration
└── README.md
```

## Usage

### Prerequisites

1. AWS credentials configured as GitHub secrets
2. Required secrets:
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`
   - `AWS_SESSION_TOKEN` (if using temporary credentials)

### Workflow Triggers

- **Pull Requests**: Runs checks and plan
- **Push to main/master**: Runs checks, plan, and deploy

### Environment Variables

The workflows use the following environment variables:

- `tg_version`: Terragrunt version
- `tofu_version`: OpenTofu version
- `working_dir`: Directory containing terragrunt configurations

### Customization

1. Update `mise.toml` to change tool versions
2. Modify `infrastructure/` directory structure for your needs
3. Update environment variables in workflows
4. Add additional GitHub secrets as needed

## Tool Versions

Current versions (defined in `mise.toml`):

- Terragrunt: 0.82.3
- OpenTofu: 1.10.1

## Security Notes

- Never commit AWS credentials to the repository
- Use GitHub secrets for sensitive data
- Consider using OIDC for AWS authentication
- Review the deployment permissions and environment protections

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## License

This project is licensed under the MIT License.
# Test trigger
