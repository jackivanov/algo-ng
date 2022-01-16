module "digitalocean" {
  count  = var.config.cloud == "digitalocean" ? 1 : 0
  source = "../../modules/cloud-digitalocean/"

  region = var.config.clouds[var.config.cloud].region
  image  = var.config.clouds[var.config.cloud].image
  size   = var.config.clouds[var.config.cloud].size

  algo_name       = "algo-${terraform.workspace}"
  ssh_public_key  = tls_private_key.ssh.public_key_openssh
  ssh_private_key = tls_private_key.ssh.private_key_pem

  config = var.config
}

# module "ec2" {
#   count  = var.config.cloud_provider == "ec2" ? 1 : 0
#   source = "../../modules/cloud-ec2/"

#   region = var.config.clouds[var.config.cloud_provider].region
#   image  = var.config.clouds[var.config.cloud_provider].image
#   size   = var.config.clouds[var.config.cloud_provider].size

#   algo_name       = var.algo_name
#   ssh_public_key  = module.tls.default.ssh.public_key_openssh
#   ssh_private_key = module.tls.default.ssh.private_key_pem
# }

# module "gce" {
#   count  = var.config.cloud_provider == "gce" ? 1 : 0
#   source = "../../modules/cloud-gce/"

#   region  = var.config.clouds[var.config.cloud_provider].region
#   image   = var.config.clouds[var.config.cloud_provider].image
#   size    = var.config.clouds[var.config.cloud_provider].size
#   options = var.config.clouds[var.config.cloud_provider].options

#   algo_name       = var.algo_name
#   ssh_public_key  = module.tls.default.ssh.public_key_openssh
#   ssh_private_key = module.tls.default.ssh.private_key_pem
# }

# module "azure" {
#   count  = var.config.cloud_provider == "azure" ? 1 : 0
#   source = "../../modules/cloud-azure/"

#   region  = var.config.clouds[var.config.cloud_provider].region
#   image   = var.config.clouds[var.config.cloud_provider].image
#   size    = var.config.clouds[var.config.cloud_provider].size
#   options = var.config.clouds[var.config.cloud_provider].options

#   algo_name       = var.algo_name
#   ssh_public_key  = module.tls.default.ssh.public_key_openssh
#   ssh_private_key = module.tls.default.ssh.private_key_pem
# }
