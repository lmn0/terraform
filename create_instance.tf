
# Using DRY principle and referencing module to avoid duplicates
module "ocistd_vm"{
    source = "./modules/ocivms"
}

# First OCI instance
resource "oci_core_instance" "ubuntu_instance" {
    # Required
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
    compartment_id = var.compid
    shape = "VM.Standard2.1"
    source_details {
        source_id = "ocid1.image.oc1.phx.aaaaaaaaboq4isjfm5rayc5ezdfwubc5jrduwsizxwjf3ru4zlgtxz6ld7va"
        source_type = "image"
    }

    # Optional
    display_name = "<your-ubuntu-instance-name>"
    create_vnic_details {
        assign_public_ip = true
        subnet_id = "<subnet-ocid>"
    }
    metadata = {
        ssh_authorized_keys = file("/home/tjs/Documents/repo/terraform/public.pem")
    } 
    preserve_boot_volume = false

    tags ={
        name = "OCI - first instance"
    }


#Lifecycle uses meta arguments to define the resource property
#Lifecycle Meta arguments:
# 1. create_before_destroy
# 2. prevent_destroy
# 3. ignore_changes  (=all)
# 4. replace_triggered_by

    lifecycle{
        ignore_changes = [tags]
    }

}

resource "oci_core_security_list" "dynamicsg" {
    name        = "dynamicsg"
    description = "Ingress rules"

# Dynamic - usage
  dynamic "ingress_security_rules" {
    for_each = var.create_secondary_vcn ? [1] : []
    content {
      protocol = local.all_protocols
      source   = lookup(var.network_cidrs, "LB-VCN-CIDR")
    }
  }
}

resource "oci_core_virtual_network" "mushop_main_vcn" {
  cidr_block     = lookup(var.network_cidrs, "MAIN-VCN-CIDR")
  compartment_id = var.compid
  display_name   = "VCN - Terraform Learn"
  dns_label      = "vcn_trf_lrn"
  freeform_tags  = local.common_tags
}
