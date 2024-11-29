resource "spot_cloudspace" "rackspaces_cluster" {
  cloudspace_name    = var.rackspace_cloudspace_config.name
  region             = var.rackspace_cloudspace_config.region
  wait_until_ready   = var.rackspace_cloudspace_config.wait_to_ready
  hacontrol_plane    = false
}