###cloud vars
#variable "token" {
#  type        = string
#  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
#}

variable "cloud_id" {
  type        = string
  default	  = "b1grdv4ugue7f7kuoekd"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default	  = "b1g9p822q7vrvfh73q3e"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "default_resources" {
	type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
  }))

  default = {
	web={
		cores			=2
		memory			=1
		core_fraction	=20
		},
	}
}

variable "default_image" {
  type		= string
  default	= "ubuntu-2004-lts"
}

variable "metadata_ssh_public_key" {
  type    = string
}         
		  
variable "metadata_serial_port_enable" {
  type        = number
  default     = 1
}

variable "each_vm" {
  type = list(object({  
	vm_name = string, 
    cpu = number, 
    memory = number, 
    disk_volume = number, 
    core_fraction = number }))
}