resource "yandex_compute_instance" "database" {
  for_each		= local.vms_map
  name			= each.key
  platform_id	= "standard-v3"
  zone			= var.default_zone
  
  resources {
				cores         = each.value.cpu
				memory        = each.value.memory
				core_fraction = each.value.core_fraction
  }
  
  boot_disk {
    initialize_params {
      image_id	= data.yandex_compute_image.ubuntu.image_id
	  size		= each.value.disk_volume
	  }
  }
  scheduling_policy {
	preemptible = true
	}
  network_interface {
	subnet_id			= yandex_vpc_subnet.develop.id
	nat					= false
	security_group_ids  = [yandex_vpc_security_group.example.id]
	}
metadata = {
    "serial-port-enable" = var.metadata_serial_port_enable
    "ssh-keys"          = var.metadata_ssh_public_key
  }
}