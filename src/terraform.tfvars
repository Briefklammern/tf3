metadata_serial_port_enable	= 1
metadata_ssh_public_key		= "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEMJSpoh2mmo4XdLQJ9JnuhB5vPgJx5zK3eseTSQLDtJ ppk\\pasafronov@MFC-WS7VGL"

each_vm = [
  {
    vm_name       = "main"
    cpu           = 4
    memory        = 4
    disk_volume   = 20
    core_fraction = 20
  },
  {
    vm_name       = "replica"
    cpu           = 2
    memory        = 2
    disk_volume   = 10
    core_fraction = 20
  }
]