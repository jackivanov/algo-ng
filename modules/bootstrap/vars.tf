variable "server_address" {}
variable "ssh_private_key" {}
variable "ssh_user" {}
variable "triggers" {}
variable "config" {}
variable "wg_port_actual" {
  default = 51820
}
variable "wg_ports_avoid" {
  default = [53]
}
