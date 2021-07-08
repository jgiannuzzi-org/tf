provider "tls" {
  version = "~> 2.1"
}
provider "null" {
  version = "~> 2.1"
}

resource "tls_private_key" "key" {
  algorithm = "RSA"
}

resource "null_resource" "display3" {
  triggers = {
    pubkey  = tls_private_key.key.public_key_pem
    privkey = tls_private_key.key.private_key_pem
  }
}
