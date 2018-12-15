variable project {
  description = "Project ID"
}

variable region {
  description = "Region"
  default     = "europe-west1"
}

variable public_key_path {
  description = "Path to the public key used for ssh access"
  default     = "~/.ssh/appuser.pub"
}

variable disk_image {
  description = "Disk image"
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-base"
}

variable db_disk_image {
  description = "Disk image for reddit db"
  default     = "reddit-base"
}

variable private_key_path {
  description = "Path to the private key used for ssh access"
}

variable zone {
  description = "Instance zone"
  default     = "europe-west1-b"
}
