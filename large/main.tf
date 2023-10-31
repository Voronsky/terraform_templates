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

resource "proxmox_lxc" "large" {
    target_node = "debs"
    hostname = "lxc-large"
    ostemplate = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
    password = "lxcpassword"
    unprivileged = true
    searchdomain = var.dns
    nameserver = var.nameserver
    tags = "personal,terraform"
    memory = var.memory["s"]
    cores = var.cpus["m"]
    onboot = true //proxmox setting
    start = true // Start it after being created

    rootfs {
      storage = "local-lvm"
      size = var.storage["s"]
    }

    network {
        name = "etho0"
        bridge = "vmbr40"
        ip = "dhcp"
    }
}