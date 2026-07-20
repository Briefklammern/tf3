resource "yandex_compute_disk" "disk" {
  count = 3
  name = "disk-${count.index + 1}"
  zone = var.default_zone
  size = 1
  type = "network-hdd"
}
resource "yandex_compute_instance" "storage_vm" {
  name        = "storage_vm"
  platform_id = "standard-v3"
  zone         = var.default_zone
  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = false
    security_group_ids = [yandex_vpc_security_group.example.id]
  }
  metadata = {
    "serial-port-enable" = var.metadata_serial_port_enable
    "ssh-keys"          = var.metadata_ssh_public_key
  }
dynamic "secondary_disk" {
    for_each = yandex_compute_disk.disk[*]
    content {
      disk_id = secondary_disk.value.id
    }
}
}