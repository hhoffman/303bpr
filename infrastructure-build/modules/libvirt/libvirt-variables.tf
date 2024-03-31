# Example sourced from: https://dev.to/ruanbekker/terraform-with-kvm-2d9e
# Example sourced from https://blog.kroy.io/2020/11/03/esxi-to-libvirt-now-with-more-terraform/
variable "vm_hostname" {
  description = "vm hostname"
  default     = ["docker-00", "docker-01", "docker-02"]
  type        = list(string)
}

variable "vm_fqdn" {
  description = "vm fqdn"
  default     = "303bpr.org"
  type        = string
}

variable "vm_network" {
  description = "vm network"
  default     = "kvmbr254"
  type        = string
}

variable "memoryMB" {
  default = 1024 * 8
}

variable "CPU" {
  default = 4
}
