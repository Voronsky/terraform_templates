variable "pm_api_url" {
  type = string
}
variable "pm_api_token_id" {
  type = string
}
variable "pm_api_token_secret" {
  type      = string
  sensitive = true
}

variable "memory"{
  type = map(string)
  default = {
    xs = "4096"
    s = "8192"
    m = "16384"
    l = "32768"
  }
}

variable "cpus"{
  type = map(string)
  default = {
    xs = "1"
    s = "2"
    m = "4"
    l = "8"
  }
}

variable "dns" {
  type = string
  default = ""
}

variable "nameserver" {
  type = string
  default = "8.8.8.8"
}

variable "storage" {
  type = map(string)
  default = {
    xs = "8G"
    s = "16G"
    m = "32G"
    l = "64G"
  }
}