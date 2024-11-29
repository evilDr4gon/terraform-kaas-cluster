output "output_instance_types" {
  value = data.spot_serverclasses.all.names
}

output "kubeconfig" {
  value = data.spot_kubeconfig.kubeconfig.raw
}