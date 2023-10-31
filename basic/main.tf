
terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
    }
  }
}

provider "proxmox" {
    pm_api_url = var.pm_api_url
    pm_api_token_id = var.pm_api_token_id
    pm_api_token_secret = var.pm_api_token_secret
}

resource "proxmox_lxc" "basic" {
  target_node  = "debs"
  hostname     = "lxc-test-delete-after"
  ostemplate   = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
  password     = "lxcpassword"
  unprivileged = true
  searchdomain = var.dns
  nameserver = var.nameserver //nethserver
  tags = "personal"

  // Terraform will crash without rootfs defined
  rootfs {
    storage = "local-lvm"
    size    = "8G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr40"
    ip     = "dhcp"
  }
}