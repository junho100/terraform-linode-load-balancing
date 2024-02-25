resource "linode_instance" "nginx" {
  label     = "nginx"
  image     = "linode/ubuntu22.04"
  region    = "jp-osa"
  type      = "g6-standard-1"
  root_pass = var.instance_password

  private_ip = true

  stackscript_id = linode_stackscript.install_docker_nginx.id
}

resource "linode_instance" "apache" {
  label     = "apache"
  image     = "linode/ubuntu22.04"
  region    = "jp-osa"
  type      = "g6-standard-1"
  root_pass = var.instance_password

  private_ip = true

  stackscript_id = linode_stackscript.install_docker_apache.id
}
