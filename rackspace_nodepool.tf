resource "spot_spotnodepool" "rackspaces_spot_nodepool" {

  for_each = { for idx, nodepool in var.rackspace_cloudspace_config.nodepools : "${nodepool.instance_type}-${idx}" => nodepool }


  cloudspace_name      = resource.spot_cloudspace.rackspaces_cluster.name
  server_class         = each.value.instance_type
  bid_price            = 0.007
  autoscaling = {
    min_nodes = each.value.autoscaling.min_nodes
    max_nodes = each.value.autoscaling.max_nodes
  }
}