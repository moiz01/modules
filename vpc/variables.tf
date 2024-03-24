##########
## VPC
##########

variable "vpc_name" {
  description = "VPC name to be used on all the resources as identifier"
  type = string
  default     = ""
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type = string
  default     = ""
}



############
## Subnets
############

variable "public_subnets" {
  type    = list(string)
  default = ["192.168.0.0/24", "192.168.1.0/24", "192.168.2.0/24"]

}
variable "azs" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]

}



###############
## Security Group
###############



###########
### TAGS
###########
variable "public_subnet_tags" {
  description = "Additional tags for the public subnets"
  default     = {}
  type        = map(string)
}
variable "public_route_table_tags" {
  description = "Additional tags for the public route tables"
  default     = {}
  type        = map(string)
}

variable "tags" {
  description = "A map of tags to add to all resources"
  default     = {}
  type        = map(string)
}