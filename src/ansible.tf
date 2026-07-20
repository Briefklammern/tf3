resource "local_file" "ansible_inventory" {
  filename = "${path.module}/hosts.cfg"
  content  = templatefile("${path.module}/hosts_tmp.tpl", {
    webservers = [
      for vm in yandex_compute_instance.web : {
        name = vm.name
        ip   = vm.network_interface[0].nat_ip_address
        fqdn = vm.fqdn
      }
    ]
    databases = [
      for vm in values(yandex_compute_instance.database) : {
        name = vm.name
        ip   = vm.network_interface[0].nat_ip_address
        fqdn = vm.fqdn
      }
    ]
     storage = [
      {
        name = yandex_compute_instance.storage_vm.name
        ip   = yandex_compute_instance.storage_vm.network_interface[0].nat_ip_address
        fqdn = yandex_compute_instance.storage_vm.fqdn
      }
    ]
  })
}