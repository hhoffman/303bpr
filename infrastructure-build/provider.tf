terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
    }
  }
}

provider "libvirt" {
  ## Configuration options
  alias = "kvm-00"
  uri   = "qemu+tls://kvm-00/system"
}

##provider "libvirt" {
# Configuration options
# uri = "qemu:///system"
# uri   = "qemu+ssh://root:password@kvm_host/system?sshauth=ssh-password"
##}
