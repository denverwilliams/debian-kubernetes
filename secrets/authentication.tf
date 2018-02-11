# Known Tokens

resource "random_string" "masters" {
  length = 16
  special = false
}

resource "random_string" "kube-controller-manager" {
  length = 16
  special = false
}

resource "random_string" "kube-scheduler" {
  length = 16
  special = false
}

resource "random_string" "nodes" {
  length = 16
  special = false
}

resource "random_string" "kube_proxy" {
  length = 16
  special = false
}

data "template_file" "known_tokens_csv" {
  template = "${ file( "${ path.module }/known_tokens.tpl" )}"

  vars {
    masters = "${ random_string.masters.result }"
    kube_controller_manager = "${ random_string.kube-controller-manager.result }"
    kube_scheduler = "${ random_string.kube-scheduler.result }"
    nodes = "${ random_string.nodes.result }"
    kube_proxy = "${ random_string.kube_proxy.result }"

  }
}

# Basic Auth

resource "random_string" "masters_auth" {
  length = 16
  special = false
}

data "template_file" "basic_auth_csv" {
  template = "${ file( "${ path.module }/basic_auth.tpl" )}"

  vars {
    master = "${ random_string.masters_auth.result }"
  }
}
