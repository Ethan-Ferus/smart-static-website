variable "aws_region" {
    type = string
    default = "eu-north-1"
}

variable "aws_region_2" {
    type = string
    default = "us-east-1"
}

variable "log_group_name" {
    type = string
    default = "log_group"
}

variable "retention_period" {
    type = number
    default = 30
}

variable "wafv2_name" {
    type = string
    default = "wafv2_acl"
}