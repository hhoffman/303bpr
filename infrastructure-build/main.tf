# Defining VM Volume
resource "libvirt_volume" "os_image" {
  count = length(var.vm_hostname)
  name  = "os_image-${var.vm_hostname[count.index]}.qcow2"
  pool  = "default" # List storage pools using virsh pool-list
  #source = "https://cloud-images.ubuntu.com/releases/22.04/release/ubuntu-22.04-server-cloudimg-amd64.img"
  source = "/var/lib/libvirt/images/base/ubuntu-22.04-server-cloudimg-amd64.img"
  format = "qcow2"
}

# Use CloudInit to add the instance
resource "libvirt_cloudinit_disk" "commoninit" {
  count     = length(var.vm_hostname)
  name      = "${var.vm_hostname[count.index]}-commoninit.iso"
  pool      = "default" # List storage pools using virsh pool-list
  user_data = data.template_file.user_data[count.index].rendered
}

# get user data info
data "template_file" "user_data" {
  count    = length(var.vm_hostname)
  template = file("${path.module}/cloud_init.cfg")
  vars = {
    vm_hostname = element(var.vm_hostname, count.index)
    vm_fqdn     = var.vm_fqdn
    vm_network  = var.vm_network
    CPU         = var.CPU
  }
}


# Define KVM domain to create
resource "libvirt_domain" "ubuntu-22_04" {
  count  = length(var.vm_hostname)
  name   = var.vm_hostname[count.index]
  memory = var.memoryMB
  vcpu   = var.CPU

  disk {
    #volume_id = "${libvirt_volume-ubuntu-22_04-qcow2.id}"
    volume_id = element(libvirt_volume.os_image.*.id, count.index)
  }

  cloudinit = libvirt_cloudinit_disk.commoninit[count.index].id

  network_interface {
    network_name = var.vm_network # List networks with virsh net-list
  }


  console {
    type        = "pty"
    target_type = "serial"
    target_port = "0"
  }
}
