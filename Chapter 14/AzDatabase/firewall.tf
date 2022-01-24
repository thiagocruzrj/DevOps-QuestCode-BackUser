data "http" "ip_address" {
  url = "https://api.apify.org"
  request_headers = {
    Accept = "text/plain"
  }
}

resource "azurerm_sql_firewall_rule" "sqlfirewall-myip" {
  name                = "personal-ip"
  resource_group_name = azurerm_resource_group.rg.name
  server_name         = azurerm_sql_server.sqlserver.name
  start_ip_address    = data.http.ip_address.body
  end_ip_address      = data.http.ip_address.body
}