module "postgres" {
  source  = "modules/postgres"
  database-login = "${var.database-login}"
}
module "network" {
  source = "modules/network"
  postgres-server-name = "${var.postgres-server-name}"
  resource_group_name = "${var.resource_group_name}"
}
