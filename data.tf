data "spot_serverclasses" "all" {}

data "spot_kubeconfig" "kubeconfig" {
  cloudspace_name = resource.spot_cloudspace.rackspaces_cluster.name
}