# terraform_templates
My personal Terraform plans repository. I keep track of all the general use plans to quickly spin up LXCs or VMs in my proxmox instance

## Use
To track all my proxmox templates written in terraform.


## Structure
`shared_variables` - single source of all variables used across various plans

`basic/` - a simple low resource LXC

`large/` - a 'large' LXC

## Considerations
the repeated `variable.tf` are actually symlinks to the `variable.tf` pointed at in `shared_variables/`. Furthermore, you will need to define your values for the various variables, for security reasons, mine were not uploaded :smile:

My declarations of the various sizes is strictly arbirtrary. 