
resource "oci_core_instance" "ubuntu_instance" {
    # Required
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
    compartment_id = "ocid1.compartment.oc1..aaaaaaaamiw5552p7eoujv7dwbgfoosmjnym3zjqlbcqbmrpofgaaabuywxa"
    shape = "VM.Standard2.1"
    source_details {
        source_id = "<source-ocid>"
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
# 3. ignore_changes
# 4. replace_triggered_by

    lifecycle{
        ignore_changes = [tags]
    }

}

resource "aws_security_group""dynamicsg" {
    name        = "dynamicsg"
    description = "Ingress rules"

# Dynamic - usage
    dynamic "ingress"{
        for_each = var.ingress_ports
        iterator = port
        content {
            from_port = port.value
            to-port  = port.value
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
}
