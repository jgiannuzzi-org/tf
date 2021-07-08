provider "tls" {
  version = "~> 2.1"
}
provider "null" {
  version = "~> 2.1"
}

resource "tls_private_key" "key" {
  algorithm = "RSA"
}

resource "null_resource" "algo" {
  triggers = {
    algorithm = tls_private_key.key.algorithm
  }
}
