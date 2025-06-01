##########
## VPC
##########




############
## Subnets
############

# variable "public_subnets" {
#   type    = list(string)
#   default = ["192.168.0.0/24", "192.168.1.0/24", "192.168.2.0/24"]

# }

variable "network_info" {
  description = "Network information for the VPC"
  type = object({
    vpc_name = string
    vpc_cidr = string

    public_subnets = list(object({
      name = string
      cidr = string
      az   = string
    }))
    private_subnets = list(object({
      name = string
      cidr = string
      az   = string
    }))
  })
  default = {
    vpc_name = "ntier-primary"
    vpc_cidr = "192.168.0.0/16"

    public_subnets = [{
      name = "web1"
      cidr = "192.168.0.0/24"
      az = "us-east-2a" },
      {
        name = "web2"
        cidr = "192.168.1.0/24"
      az = "us-east-2b" },
      {
        name = "app1"
        cidr = "192.168.2.0/24"
      az = "us-east-2c" },
      {
        name = "app2"
        cidr = "192.168.3.0/24"
      az = "us-east-2c" }
    ]
    private_subnets = [{
      name = "db1"
      cidr = "192.168.4.0/24"
      az = "us-east-2a" },
      {
        name = "db2"
        cidr = "192.168.5.0/24"
      az = "us-east-2b" }

    ]
  }

}


###############
## Security Group
###############



###########
### TAGS
###########



