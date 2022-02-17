variable "enabled" {
  description = "Status of connector; Default is true"
  type        = bool
  default     = true
}

variable "name" {
  description = "Name of cloud network and Alkira connector"
  type        = string
}

variable "description" {
  description = "Description of the connector"
  type        = string
  default     = ""
}

variable "billing_tags" {
  description = "List of billing tag names to apply to connector"
  type        = list(string)
  default     = []
}

variable "segment" {
  description = "Alkira - segment to add connector to"
  type        = string
}

variable "group" {
  description = "Alkira - group to add connector to"
  type        = string
}

variable "cxp" {
  description = "Alkira - CXP to add connector to"
  type        = string
}

variable "size" {
  description = "Alkira - connector size"
  type        = string
  default     = "SMALL"
}

variable "public_ip_number" {
  description = "Number of public IPs for connector; Default is 2"
  type        = number
  default     = 2
}

variable "traffic_dist_algorithm" {
  description = "Algorithm used for traffic distribution"
  type        = string
  default     = "HASHING"
}

variable "traffic_dist_attribute" {
  description = "Attribute of algorithm used for traffic distribution"
  type        = string
  default     = "DEFAULT"
}
