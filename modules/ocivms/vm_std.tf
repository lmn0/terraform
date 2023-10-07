resource "oci_core_instance" "myoci_vm" {
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
    compartment_id = "ocid1.compartment.oc1..aaaaaaaamiw5552p7eoujv7dwbgfoosmjnym3zjqlbcqbmrpofgaaabuywxa"
    shape = "VM.Standard2.1"
    source_details {
        source_id = "ocid1.image.oc1.phx.aaaaaaaabz64fse5u7j3qmselqlpztqjhkfhonvqpql3px7ozooo2eksl6mq"
        source_type = "image"
    }
}