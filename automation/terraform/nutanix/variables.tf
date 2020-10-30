#################################################
# AHV Configuration 
#################################################
variable "provider_info" {
    description = "Provider information for AHV service domain creation"
    type = object({
        username = string
        password = string
        endpoint = string
        insecure = bool
        port     = number
    })
    default = {
        "username" = "<username>"
        "password" = "<password>"
        "endpoint" = "<endpoint>"
        "insecure" = true
        "port"     = <port>
    }
}

variable "instance_info" {
    description = "AHV instance information"
    type = object({
        instance_count = number
        instance_name_prefix = string
    })
    default = {
        instance_count = 1
        instance_name_prefix = "kps_instance"
    }
}

variable "nutanix_vm_config" {
    description = "AHV  Virtual Machine configuration"
    type = object({
        subnet_name = string
        subnet_uuid = string
        description = string
        num_vcpus_per_socket = number
        num_sockets          = number
        memory_size_mib      = number
    })
    default = {
        "subnet_name" = "<name>"
        "subnet_uuid" = "<uuid>"
        "description" = ""
        "num_vcpus_per_socket" = 2
        "num_sockets"          = 1
        "memory_size_mib"      = 4096
    }
}

variable "image_config" {
    description = "Nutanix KPS Service Domain Node OS Image configuration"
    type = object({
        name        = string
        description = string
        source_uri  = string
    })
    default = {
        "name"        = "kps_servicedomain_image"
        "description" = "kps_servicedomain_image"
        "source_uri"  = "http://endor.dyn.nutanix.com/builds/sherlock-builds/master/2114/sherlock-k8s-base-image_2114.qcow2"
    }
}
#################################################
# Karbon Platform Services Configuration
#################################################
variable "cloud_info" {
    description = "KPS cloud information"
    type = object({
        cloud_fqdn = string
        cloud_user_name = string
        cloud_user_pwd = string
    })
    default = {
        "cloud_fqdn" = "karbon.nutanix.com"
        "cloud_user_name" = "<cloud_username>"
        "cloud_user_pwd" = "<cloud_password>"
    }
}

variable "service_domain_info" {
    description = "KPS service domain information"
    type = object({
        sd_name: string
        sd_description: string
        sd_virtual_ip: string
    })
    default = {
        "sd_name": "sd1.0"
        "sd_description": "sd created thru tf"
        "sd_virtual_ip": "x.x.x.x"
    }
}

variable "node_info" {
    description = "KPS node information"
    type = object({
        node_gateway: string
        node_subnet: string
    })
    node_info = {
        "node_gateway": "x.x.x.x"
        "node_subnet": "x.x.x.x"
    }
}
#################################################
# Nutanix Storage Profile Configuration
#################################################
variable "create_storage_profile" {
    description = "Number of storage profiles to create, value an be 1 or 0 for yes/no"
    type = number
    default = 1
}

variable "nutanix_volumes_config" {
    description = "AHV Volume configuration"
    type = object({
        dataServicesIP: string
        dataServicesPort: string
        flashMode: string
        prismElementClusterPort: string
        prismElementClusterVIP: string
        storageContainerName: string
        prismElementUserName: string
        prismElementPassword: string
    })
    nutanix_volumes_config = {
        "dataServicesIP": "x.x.x.x"
        "dataServicesPort": "<port>"
        "flashMode": "false"
        "prismElementClusterPort": "<port>"
        "prismElementClusterVIP": "x.x.x.x"
        "storageContainerName": "default-container-xxxxxxxxxxxxxx"
        "prismElementUserName": "admin"
        "prismElementPassword": "PE_PASSWORD_HERE"
    }
}

variable "storage_profile_info" {
    description = "AHV Storage Profile configuration"
    type = object({
        type: string
        name: string
        isDefault: string
    })
    default = {
        "type": "NutanixVolumes"
        "name": "tf_storage_profile"
        "isDefault": "true"
    }
}