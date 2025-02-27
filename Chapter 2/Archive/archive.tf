terraform {
  required_providers {
    archive = {
      source = "hashicorp/archive"
    }
    random = {
      source = "hashicorp/random"
    }
  }
}

resource "random_string" "random" {
    length = 5
    special = false
}

data "archive_file" "zipfile" {
  type        = "zip"
  source_dir  = "data_backup"
  output_path = "backup_dir.zip"
}

output "fileZip" {
  value = random_string.random.result
}

output "random_string"{
    value = random_string.random.result
}