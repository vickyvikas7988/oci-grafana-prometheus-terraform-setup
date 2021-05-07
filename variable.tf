variable "tenancy_ocid" {
  type    = string
  default = "" # Replace with your Tenancy OCID
}

variable "user_ocid" {
  type    = string
  default = "" # Replace with your User OCID
}

variable "fingerprint" {
  type    = string
  default = "" # Replace with your SSH Key fingerprint
}

variable "private_key_path" {
  type    = string
  default = "" # Replace with your private key location
}

variable "region" {
  type    = string
  default = "us-ashburn-1"
}

variable "InstanceShapeonfigOCPU" {
  default = "1"
}

variable "InstanceShapeConfigMemory" {
  default = "1"
}


variable "node_pool_ssh_public_key" {
  type    = string
  default = ""   # Replace with your SSH Public Key
}

variable "icmp" {
  type    = number
  default = 1
}

variable "tcp" {
  type    = number
  default = 6
}

variable "udp" {
  type    = number
  default = 17
}

variable "ssh" {
  type    = number
  default = 22
}

variable "https" {
  type    = number
  default = 443
}

variable "grafana" {
  type    = number
  default = 3000
}

variable "prometheus" {
  type    = number
  default = 9090
}

variable "alertmanager" {
  type    = number
  default = 9093
}


variable "public_internet" {
  type    = string
  default = "0.0.0.0/0"
}

variable "all" {
  type = string
  default = "all"
}

variable "instance_shape" {
  type = string
  default = "VM.Standard2.1"
}