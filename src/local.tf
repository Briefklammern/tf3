locals {
  vms_map = { for vm in var.each_vm : vm.vm_name => vm }
  ssh_key = file("~\\.ssh\\id_ed25519.pub")
}