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

### # ---------------------------------------------------------------------------------------------------------------------
### # AWS PROVIDER VARIABLES
### # These are used to connect to AWS
### # ---------------------------------------------------------------------------------------------------------------------
### 
variable "aws_region" {
  description = "The AWS region to deploy into"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "The CIDR block for the private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}


### # ---------------------------------------------------------------------------------------------------------------------
### # VMWARE PROVIDER VARIABLES
### # These are used to connect to vCenter.
### # ---------------------------------------------------------------------------------------------------------------------
### 
### variable "vsphere_server" {
###   type = string
### }
### 
### variable "vsphere_user" {
###   type = string
### }
### 
### variable "vsphere_password" {
###   type = string
### }
### 
### # ---------------------------------------------------------------------------------------------------------------------
### # VMWARE DATA SOURCE VARIABLES
### # These are used to discover unmanaged resources used during deployment.
### # ---------------------------------------------------------------------------------------------------------------------
### 
### variable datacenter_name {
###   type        = string
###   description = "The name of the vSphere Datacenter into which resources will be created."
### }
### 
### variable cluster_name {
###   type        = string
###   description = "The vSphere Cluster into which resources will be created."
### }
### 
### variable datastore_name {
###   type        = string
###   description = "The vSphere Datastore into which resources will be created."
### }
### 
### variable datastore_cluster_name {
###   type    = string
###   default = ""
### }
### 
### variable vm_network_name {
###   type = string
### }
### 
### variable template_name {
###   type = string
### }
### 
### # ---------------------------------------------------------------------------------------------------------------------
### # VMWARE RESOURCE VARIABLES
### # Variables used during the creation of resources in vSphere.
### # ---------------------------------------------------------------------------------------------------------------------
### 
### variable machine_count {
###   type    = number
###   default = 3
### }
### 
### variable hostname_prefix {
###   type        = string
###   default     = "ubuntu"
###   description = "A prefix for the virtual machine name."
### }
### 
### # ---------------------------------------------------------------------------------------------------------------------
### # CLOUD INIT VARIABLES
### # Variables used for generation of metadata and userdata.
### # ---------------------------------------------------------------------------------------------------------------------
### 
### 
### variable username {
###   type = string
### }
### 
### variable ssh_public_key {
###   type        = string
###   description = "Location of SSH public key."
### }
### 
### variable packages {
###   type    = list
###   default = []
### }
### 
### variable dhcp {
###   type    = string
###   default = "true"
### }
### 
### variable ip_address {
###   type    = string
###   default = ""
### }
### 
### variable netmask {
###   type    = string
###   default = ""
### }
### 
### variable gateway {
###   type    = string
###   default = ""
### }
### 
### variable nameservers {
###   type    = list
###   default = []
### }
