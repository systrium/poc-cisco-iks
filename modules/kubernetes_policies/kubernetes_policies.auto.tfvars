# Intersight Organization
organization = "Wakanda"

# Global Tag Values - Consumed by Policies if no specific Tags are defined.
tags = [
  {
    "key"   = "systrium-poc"
    "value" = "1.5.1"
  },
  {
    "key"   = "deployed-by"
    "value" = "stanwar"
  }
]

# IP Pools
ip_pools = {
  "iks" = {
    assignment_order = "sequential"
    description      = ""
    ipv4_blocks = {
      "0" = {
        from = "192.168.1.21"
        size = 30
        to   = "192.168.1.50"
      }
    }
    ipv4_config = [{
      gateway       = "192.168.1.1"
      netmask       = "255.255.255.0"
      primary_dns   = "192.168.1.5"
      secondary_dns = "192.168.1.1"
    }]
    ipv6_blocks = {}
    ipv6_config = []
    tags        = []
  }
}

#______________________________
#
# Kubernetes Policies
#______________________________

# Addons
addons_policies = {
  "ccp-monitor" = {
    install_strategy = "Always"
    upgrade_strategy = "ReinstallOnFailure"
  }
  "kubernetes-dashboard" = {
    install_strategy = "Always"
    upgrade_strategy = "ReinstallOnFailure"
  }
  "smm1_7" = {
    chart_name       = "smm"
    chart_version    = "1.7.4-cisco4-helm3"
    install_strategy = "Always"
    release_name     = "smm1.7"
    upgrade_strategy = "ReinstallOnFailure"
  }
  "smm1_8" = {
    chart_name       = "smm"
    chart_version    = "1.8.2-cisco2-helm3"
    install_strategy = "Always"
    overrides        = "demoApplication,enabled,true"
    release_name     = "smm1.8"
    upgrade_strategy = "ReinstallOnFailure"
  }
}

# Container Runtime
container_runtime_policies = {}

# Kubernetes Version
kubernetes_version_policies = {
  "v1.20.14" = {
    version = "v1.20.14"
  }
  "v1.21.10" = {
    version = "v1.21.10"
  }
}

# Network CIDR Policies
network_cidr_policies = {
  "Wakanda_CIDR" = {
    cni_type         = "Calico"
    pod_network_cidr = "100.71.0.0/16"
    service_cidr     = "100.72.0.0/16"
  }
}

# NodeOS Configuration
nodeos_configuration_policies = {
  "Systrium" = {
    dns_servers = ["192.168.1.5", "192.168.1.1"]
    dns_suffix  = "homelab"
    ntp_servers = ["192.168.1.5", "192.168.1.1"]
    timezone    = "America/New_York"
  }
}

# Trusted Certificate Authorities
trusted_certificate_authorities = {}

# VM Infra Config
virtual_machine_infra_config = {
  "Panther" = {
    description = ""
    tags        = []
    target      = "homelab"
    virtual_infrastructure = [{
      cluster       = ""
      datastore     = "NVMSTORE"
      interfaces    = ["VM Network"]
      resource_pool = "p700.homelab/Resources"
      type          = "vmware"
    }]
  }
  "Terminus" = {
    description = ""
    tags        = []
    target      = "terminus"
    virtual_infrastructure = [{
      interfaces    = ["iwe-guests"]
      provider_name = "iwe-guests"
      type          = "iwe"
    }]
  }
}

# VM Instance Type
virtual_machine_instance_type = {
  "Small" = {}
  "Medium" = {
    cpu              = 2
    memory           = 4096
    system_disk_size = 40
  }
  "Large" = {
    cpu              = 4
    memory           = 8192
    system_disk_size = 60
  }
}