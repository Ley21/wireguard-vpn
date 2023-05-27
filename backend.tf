terraform {
  backend "s3" {
    bucket         = "410267323233-terraform-states"
    key            = "wireguard-vpn-state.tfstate"
    region         = "eu-central-1"
    encrypt        = true
  }
}
