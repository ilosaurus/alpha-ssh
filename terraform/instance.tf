variable "count" {
  default = 2
}

resource "openstack_compute_keypair_v2" "instance" {
  name       = "keypair1"
  public_key = "${chomp(file(var.public_key_path))}"
}

resource "openstack_compute_instance_v2" "instance" {
  count = "${var.count}"
  name = "${format("node-%02d", count.index+1)}"
  image_name       = "${var.image}"" 
  flavor_name      = "${var.flavor}" 
  key_pair         = "${openstack_compute_keypair_v2.instance.name}"
  security_groups  = ["default"]
  network {
    uuid = "{var.network}" 
  }
}

resource "openstack_networking_floatingip_v2" "floating_ip" {
  count = "${var.count}"
  pool = "net-ext"
}

resource "openstack_compute_floatingip_associate_v2" "floating_ip" {
  count = "${var.count}"
  floating_ip = "${element(openstack_networking_floatingip_v2.floating_ip.*.address, count.index)}"
  instance_id = "${element(openstack_compute_instance_v2.instance.*.id, count.index)}"
}
