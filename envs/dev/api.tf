variable "enabled_apis" {
  type = list(string)
  default = [
    "storage.googleapis.com",
    "iam.googleapis.com",
    "compute.googleapis.com"
  ]
}


