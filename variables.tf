variable "rackspace_cloudspace_config" {
  description = "Configuración general de un cluster de Rackspace Cloudspace"
  type = object({
    name          = string
    region        = string
    wait_to_ready = bool

    nodepools = list(object({
      instance_type = string
      autoscaling = object({
        min_nodes = number
        max_nodes = number
      })
    }))
  })

  # Validación de la región
  validation {
    condition = contains([
      "us-central-dfw-1",
      "us-east-iad-1",
      "us-central-ord-1",
      "hkg-hkg-1",
      "aus-syd-1",
      "uk-lon-1",
      "us-west-sjc-1"
    ], var.rackspace_cloudspace_config.region)
    error_message = "La 'region' debe ser una de las siguientes: us-central-dfw-1, us-east-iad-1, us-central-ord-1, hkg-hkg-1, aus-syd-1, uk-lon-1, us-west-sjc-1."
  }

  # Validación de instance_type en los nodepools
  validation {
    condition = alltrue([for np in var.rackspace_cloudspace_config.nodepools : contains([
      "ch.vs1.medium-syd",
      "ch.vs1.large-ord",
      "gp.vs1.small-iad",
      "gp.vs1.small-dfw",
      "ch.vs1.large-hkg",
      "gpu.vs2.megaxlarge-sjc",
      "gp.vs1.medium-ord",
      "mh.vs1.medium-ord",
      "gp.bm2.small-lon",
      "ch.vs1.medium-dfw",
      "mh.vs1.large-lon",
      "gp.bm2.small-iad",
      "ch.vs1.large-syd",
      "mh.vs1.large-syd",
      "mh.vs1.large-hkg",
      "mh.vs1.2xlarge-hkg",
      "mh.vs1.xlarge-ord",
      "ch.vs1.xlarge-hkg",
      "gp.vs1.xlarge-ord",
      "mh.vs1.2xlarge-lon",
      "gp.vs1.xlarge-syd",
      "ch.vs1.xlarge-syd",
      "gp.vs1.2xlarge-syd",
      "mh.vs1.medium-syd",
      "mh.vs1.2xlarge-dfw",
      "gp.bm2.large-dfw",
      "mh.vs1.large-ord",
      "ch.vs1.2xlarge-hkg",
      "ch.vs1.large-lon",
      "gp.vs1.medium-iad",
      "ch.vs1.xlarge-iad",
      "gp.vs1.large-syd",
      "mh.vs1.2xlarge-ord",
      "ch.vs1.xlarge-ord",
      "gp.bm2.large-lon",
      "io.bm2-iad",
      "gp.bm2.medium-lon",
      "gp.bm2.medium-dfw",
      "ch.vs1.2xlarge-lon",
      "io.bm2-lon",
      "mh.vs1.medium-iad",
      "gp.vs1.large-hkg",
      "gpu.vs2.xlargeplusplus-sjc",
      "ch.vs1.2xlarge-iad",
      "ch.vs1.2xlarge-syd",
      "ch.vs1.xlarge-dfw",
      "mh.vs1.xlarge-syd",
      "ch.vs1.medium-iad",
      "ch.vs1.medium-ord",
      "mh.vs1.2xlarge-syd",
      "mh.vs1.xlarge-dfw",
      "gp.vs1.medium-syd",
      "mh.vs1.xlarge-hkg",
      "gp.vs1.2xlarge-ord",
      "gp.vs1.xlarge-iad",
      "gp.vs1.medium-dfw",
      "ch.vs1.2xlarge-dfw",
      "gp.vs1.large-ord",
      "gp.vs1.2xlarge-lon",
      "ch.vs1.large-dfw",
      "ch.vs1.xlarge-lon",
      "gp.vs1.large-dfw",
      "gp.vs1.large-lon",
      "gp.vs1.2xlarge-iad",
      "ch.vs1.2xlarge-ord",
      "gp.vs1.2xlarge-hkg",
      "gp.vs1.2xlarge-dfw",
      "gp.vs1.xlarge-dfw",
      "mh.vs1.2xlarge-iad",
      "gp.vs1.large-iad",
      "ch.vs1.large-iad",
      "mh.vs1.large-iad",
      "gp.vs1.xlarge-lon",
      "mh.vs1.xlarge-lon",
      "mh.vs1.xlarge-iad",
      "gp.vs1.medium-lon",
      "ch.vs1.medium-lon",
      "mh.vs1.medium-lon",
      "gp.vs1.medium-hkg",
      "mh.vs1.medium-hkg",
      "gp.vs1.xlarge-hkg",
      "ch.vs1.medium-hkg",
      "mh.vs1.large-dfw",
      "mh.vs1.medium-dfw"
    ], np.instance_type)])
    error_message = "El valor 'instance_type' debe ser uno de los valores permitidos."
  }
}
