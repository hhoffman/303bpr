terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
    }
    aws = {
      source = "hashicorp/aws"
    }
    vsphere = {
      source = "hashicorp/vsphere"
    }
  }
}

provider "libvirt" {
  # Configuration options
  alias = "kvm-00"
  uri   = "qemu+tls://kvm-00/system"
}

provider "aws" {
  region = var.aws_region
}


#provider "libvirt" {
# Configuration options
# uri = "qemu:///system"
# uri   = "qemu+ssh://root:password@kvm_host/system?sshauth=ssh-password"
##}
