variable address {
  type = string
  description = "External IP address to assign to this instance."
}

variable zone {
  type = string
  description = "Zone in which to place this instance. Must be the same region as the IP address provided."
}

variable disk_size {
  type = number
  default = 15
  description = "Size of the instance's disk (in GB)."
}

variable disk_type {
  type = string
  default = "pd-standard"
  description = "Type of the instance's disk (one of `pd-standard` or `pd-ssd`). `google` provider `>= 3.37` allows the option of `pd-balanced` to be provided."
}
variable destination_routes {
  type = list(string)
  description = "destination routes"
  default = ["0.0.0.0/0"]
}
variable machine_type {
  type = string
  default = "f1-micro"
  description = "Machine type of the instance."
}

variable "network" {
  type = string
  description = "Network Name"
}

variable "subnetwork" {
  type = string
  description = "subnetwork"
}

variable network_tags {
  type = set(string)
  default = []
  description = "Tags to which this route applies. Defaults to [\"requires-nat-$${local.region}\"]"
}

variable route_priority {
  type = number
  default = 900
  description = "The priority to assign the networking route that routes traffic through this instance."
}

variable socks_proxy {
  type = object({
    enabled = bool
    debug = optional(number)
    port = optional(number)
    allowed_ranges = optional(set(string))
  })
  default = { enabled = false, debug = 0, port = 8888, allowed_ranges = [] }
  description = "Configuration for managing a SOCKS proxy on this instance."
}

variable sysctl_config {
  type = map(string)
  default = {}
  description = "sysctl configuration to apply on startup."
}

variable wait_duration {
  type = number
  default = 10
  description = "The duration (in seconds) to wait for the NAT instance to finish starting up."
}
