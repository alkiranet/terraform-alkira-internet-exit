# Local vars
locals {

  tag_id_list = [
    for v in data.alkira_billing_tag.tag : v.id
  ]

}

/*
Alkira data sources
https://registry.terraform.io/providers/alkiranet/alkira/latest/docs
*/

data "alkira_segment" "segment" {
  name = var.segment
}

data "alkira_group" "group" {
  name = var.group
}

data "alkira_billing_tag" "tag" {
  for_each = toset(var.billing_tags)
  name     = each.key
}

resource "alkira_connector_internet_exit" "connector" {
  name            = var.name
  enabled         = var.enabled
  description     = var.description
  cxp             = var.cxp
  size            = var.size
  group           = data.alkira_group.group.name
  segment_id      = data.alkira_segment.segment.id
  billing_tag_ids = local.tag_id_list

  /*
  Advanced options
  https://registry.terraform.io/providers/alkiranet/alkira/latest/docs/resources/connector_internet_exit
  */
  public_ip_number                         = var.public_ip_number
  traffic_distribution_algorithm           = var.traffic_dist_algorithm
  traffic_distribution_algorithm_attribute = var.traffic_dist_attribute
}
