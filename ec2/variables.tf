
variable "region" {
  default = "us-east-1"
}
variable "vpc_name" {
  description = "VPC name to be used on all the resources as identifier"
  default     = ""
}
# variable "az" {
#   description = "availability zone to create subnet"
#   default     = ""
# }
variable "script_path" {
  type    = string
  default = ""

}
variable "public_key_name" {
  type    = string
  default = ""

}
variable "private_key_name" {
  type    = string
  default = ""

}
# variable "public_key_path" {
#   description = "Public key path"
#   default     = ""
# }


# variable "server_private_ip" {
#   description = "Server Private Ip of Server"
#   type        = string
#   default     = ""

# }



# variable "instance_type" {
#   description = "type for aws EC2 instance"
#   default     = ""
# }
# variable "key_name" {
#   description = "type for aws EC2 instance"
#   default     = ""
# }
# variable "security_group_name" {
#   type    = string
#   default = ""

# }
# variable "subnet_name" {
#   type    = string
#   default = ""

# }

variable "vm_info" {
  type = object({
    name = string
    instance_type= string
    subnet_name=string
    security_group_name=string
    server_private_ip=string
    key_name=string
    root_block_device= object({
      volume_size= number
    volume_type           = string
    delete_on_termination = bool
    })
  

    
  })
  default = {
    name= "web server 1"
    instance_type = "m4.large"
    subnet_name = "ntier-primary-Public-us-east-1a"
    security_group_name = "web"
    server_private_ip = "192.168.0.10"
    key_name = "web_server_key"
    root_block_device = {
      volume_size = 15
      volume_type="gp2"
      delete_on_termination=true
    }
  
  }
  
}

variable "tags" {
  description = "A map of tags to add to all resources"
  default = {
  }
  type = map(string)
}