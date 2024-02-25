resource "linode_nodebalancer" "backend_nb" {
  label  = "backend-nb"
  region = "jp-osa"
}

resource "linode_nodebalancer_config" "backend_nb_config" {
  nodebalancer_id = linode_nodebalancer.backend_nb.id
  port            = 80
  protocol        = "http"
  check           = "none"
  stickiness      = "none"
  algorithm       = "roundrobin"
}

resource "linode_nodebalancer_node" "nginx_nb_node" {
  nodebalancer_id = linode_nodebalancer.backend_nb.id
  config_id       = linode_nodebalancer_config.backend_nb_config.id
  address         = "${linode_instance.nginx.private_ip_address}:3000"
  label           = "nginx-node"

  lifecycle {
    // Tell Terraform to implicitly recreate the NodeBalancer node when
    // the target instance has been marked for recreation.
    // See: https://github.com/linode/terraform-provider-linode/issues/1224
    replace_triggered_by = [linode_instance.nginx.id]
  }
}

resource "linode_nodebalancer_node" "apache_nb_node" {
  nodebalancer_id = linode_nodebalancer.backend_nb.id
  config_id       = linode_nodebalancer_config.backend_nb_config.id
  address         = "${linode_instance.apache.private_ip_address}:3000"
  label           = "apache-node"

  lifecycle {
    // Tell Terraform to implicitly recreate the NodeBalancer node when
    // the target instance has been marked for recreation.
    // See: https://github.com/linode/terraform-provider-linode/issues/1224
    replace_triggered_by = [linode_instance.apache.id]
  }
}
