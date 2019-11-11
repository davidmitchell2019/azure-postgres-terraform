module "postgres" {
  source  = "./modules/postgres"
  database-login = "${var.database-login}"
  database-password = "${var.database-password}"
  postgres-server-name = "${var.postgres-server-name}"
  resource_group_name = "${var.resource_group_name}"
  office_ip = "${var.office_ip}"
}
module "network" {
  source = "./modules/network"
  postgres-server-name = "${var.postgres-server-name}"
  resource_group_name = "${var.resource_group_name}"
  vnet_ip_cidr = "${var.vnet_ip_cidr}"
  subnet_ip_cidr = "${var.subnet_ip_cidr}"
  office_ip = "${var.office_ip}"
}
