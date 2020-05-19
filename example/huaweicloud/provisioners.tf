resource "null_resource" "provisioning" {
  for_each = toset(var.namenumber)

  #    triggers {
  #        cluster_instance = "${module.ecs.id[each.key]}"
  #        #cluster_instance = ""
  #    }

  connection {
    host = module.ecs.nics[each.key]

    #host = ""
    type        = "ssh"
    user        = var.user
    private_key = file("~/.ssh/implus/id_ed25519")
  }

  provisioner "remote-exec" {
    inline = [
      "mkdir -p /tmp/provision_conf/docker",
      "mkdir -p /tmp/provision_conf/systemd",
    ]
  }

  provisioner "file" {
    source      = "../../config/provision_common.sh"
    destination = "/tmp/provision_common.sh"
  }

  provisioner "file" {
    source      = "../../config/docker/daemon.json"
    destination = "/tmp/provision_conf/docker/daemon.json"
  }

  provisioner "file" {
    source      = "../../config/systemd/journald.conf"
    destination = "/tmp/provision_conf/systemd/journald.conf"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/provision_common.sh",
      "sudo bash /tmp/provision_common.sh ${format(
        "%s-%s-%s-%s",
        var.service,
        var.environment,
        var.region,
        each.key,
      )}",
    ]
  }

  depends_on = [module.ecs]
}

