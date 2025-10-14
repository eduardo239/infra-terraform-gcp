variable "project_id" { type = string }
variable "region" { type = string }
# Cloud Storage
variable "bucket_name" { type = string }
variable "location" { type = string }
variable "force_destroy" { type = bool }
# Compute Engine
variable "compute_sa_account_id" { type = string }
variable "instance_name" { type = string }
variable "machine_type" { type = string }
variable "zone" { type = string }
# VPC Network
variable "network_name" { type = string }
variable "subnet_name" { type = string }
variable "subnet_ip_cidr_range" { type = string }
