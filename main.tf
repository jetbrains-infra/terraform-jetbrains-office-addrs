data "http" "jetbrains_office_addrs" {
  url = var.url
  request_headers = {
    "Authorization" = "Token ${var.access_token}"
    "Accept"        = "application/json"
  }
}

locals {
  response               = jsondecode(data.http.jetbrains_office_addrs.body)
  jetbrains_office_addrs = split("\n", replace(join("\n", local.response.results.*.address), "/\\/\\S+/", ""))
}
