packer {
  required_plugins {
    docker = {
      version = ">= 1.2.0"
      source  = "github.com/hashicorp/docker"
    }
  }
}
source "docker" "ubuntu" {
  image  = "ubuntu:latest"
  commit = true
}

build {
  sources = ["source.docker.ubuntu"]

  provisioner "ansible" {
    playbook_file = "playbook.yml"
  }
}

