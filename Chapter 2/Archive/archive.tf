terraform {
    required_providers {
      archive = {
          source = "hashicorp/archive"
      }
    }
}

data "archive_file" "zipfile" {
    type = "zip"
    source_file = "data_backup/data.txt"
    output_path = "backup.zip"
}

output "fileZip" {
    value = data.archive_file.zipfile.output_size
}