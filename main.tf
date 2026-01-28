module "bastion_host" {
  source     = "terraform-google-modules/bastion-host/google"
  version    = "9.0.0"
  network    = module.address.addresses
  depends_on = [module.address]
}

module "bootstrap" {
  source  = "terraform-google-modules/bootstrap/google"
  version = "11.0.1"
  org_id  = module.bastion_host.service_account
}

module "address" {
  source  = "terraform-google-modules/address/google"
  version = "4.4.0"
}
