terraform {
  required_providers {
    archive = {
      source = "hashicorp/archive"
    }
  }
}

data "archive_file" "zipfile" {
  type        = "zip"
  source_dir  = "data_backup"
  output_path = "backup_dir.zip"
}

output "fileZip" {
  value = data.archive_file.zipfile.output_size
}