variable "network_cidrs" {
  type = map(string)

  default = {
    MAIN-VCN-CIDR                = "10.1.0.0/16"
    MAIN-SUBNET-REGIONAL-CIDR    = "10.1.21.0/24"
    MAIN-LB-SUBNET-REGIONAL-CIDR = "10.1.22.0/24"
    LB-VCN-CIDR                  = "10.2.0.0/16"
    LB-SUBNET-REGIONAL-CIDR      = "10.2.22.0/24"
    ALL-CIDR                     = "0.0.0.0/0"
  }
}

variable "create_secondary_vcn" {
  default = false
}

variable "compid"{
  default = "ocid1.compartment.oc1..aaaaaaaamiw5552p7eoujv7dwbgfoosmjnym3zjqlbcqbmrpofgaaabuywxa"
}