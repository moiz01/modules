
# variable "vpc_id" {
#   description = "VPC name to be used on all the resources as identifier"
#   type=string
#   default     = "vpc-067deeaf7337228f9"
# }
variable "vpc_name" {
  description = "VPC name to be used on all the resources as identifier"
  type=string
  default     = "ntier-primary"
}
# variable "security_group_name" {
#   type = string
#   default = "web"
  
# }
variable "security_group_info" {
  type= object({
    name = string
    description= string
    # vpc_id= string
    rules=list(object({
      type = string
      from_port= number
      to_port=number
      protocol=string
      cidr_block=list(string)
    }))
  })
  
  default = {
    name = "web"
    description= "web security group"
    # vpc_id= data.aws_vpc.vpc.vpc_id  // TODO
    rules= [{
      cidr_block = ["0.0.0.0/0"]
      from_port = 22
      protocol = "tcp"
      to_port = 22
      type = "ingress"
    },
    {
      cidr_block = ["0.0.0.0/0"]
      from_port = 80
      protocol = "tcp"
      to_port = 80
      type = "ingress"
    },
    # {
    #   cidr_block = ["0.0.0.0/0"]
    #   from_port = 433
    #   protocol = "tcp"
    #   to_port = 433
    #   type = "ingress"
    # },
     {
      cidr_block = ["0.0.0.0/0"]
      from_port = 0
      protocol = "-1"
      to_port = 0
      type = "egress"
      name = "web"
    }

    ]
   
    
  }
}
variable "tags" {
  description = "A map of tags to add to all resources"
  default     = {}
  type        = map(string)
}
