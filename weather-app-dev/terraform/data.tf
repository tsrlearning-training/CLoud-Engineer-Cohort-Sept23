data "template_file" "docker_install" {
  template = file("../scripts/docker_install.tpl")

  vars = {
    docker_gpg_url     = "https://download.docker.com/linux/ubuntu/gpg"
    docker_repo_url    = "https://download.docker.com/linux/ubuntu"
    docker_compose_url = "https://github.com/docker/compose/releases/download/1.29.2/docker-compose"
  }
}
