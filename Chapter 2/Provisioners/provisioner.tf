resource "null_resource" "powershellprocess" {

  provisioner "local-exec" {
    command = "Get-Process > list.txt"
    interpreter = ["Powershell", "-command"]
  }
} 