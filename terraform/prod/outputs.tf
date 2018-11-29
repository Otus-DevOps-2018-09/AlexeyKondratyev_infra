# output "loadbalancer_ip" {
#   value = "${google_compute_global_forwarding_rule.global_forwarding_rule_reddit_app.ip_address}"
# }
# output "app_external_ip" {
#   value = "${google_compute_instance.app.network_interface.0.access_config.0.assigned_nat_ip}"
# }

# output "app_external_ip" {
#  value = "${module.app.app_external_ip}"
# }
# output "app_external_ip" {
#   value = "${google_compute_instance.app.network_interface.0.access_config.0.assigned_nat_ip}"
# }