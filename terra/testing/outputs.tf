output "nginx-pip" {
  value = module.nginx.nginx_ip
}
output "DC-pip" {
  value = module.DC.DC_ip
}