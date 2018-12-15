output "loadbalancer_ip" {
  value = "${google_compute_global_forwarding_rule.global_forwarding_rule_reddit_app.ip_address}"
}
