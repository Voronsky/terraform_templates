# terraform_templates
Terraform repository

## Use
To track all my proxmox templates written in terraform


## Structure
shared_variables - single source of all variables used across various plans

## Considerations
the repeated `variable.tf` are actually symlinks to the `variable.tf` pointed at in `shared_variables/`. Furthermore, you will need to define your values for the various variables, for security reasons, mine were not uploaded :smile: