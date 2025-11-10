variable "vpc_id" {
  description = "ID de la VPC donde se desplegarán los recursos"
  type        = string
}

variable "subnets" {
  description = "Lista de subnets para el ALB y ASG"
  type        = list(string)
}

variable "ami_id" {
  description = "AMI ID para Amazon Linux 2023"
  type        = string
  default     = "ami-1234567890abcdef0"
}

variable "key_pair" {
  description = "Nombre del key pair para las instancias EC2"
  type        = string
}
