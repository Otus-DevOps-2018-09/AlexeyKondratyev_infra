resource "google_compute_instance_group" "group_reddit_app" {
  name        = "group-reddit-app"
  description = "group with instance app"
  instances   = ["${google_compute_instance.app.*.self_link}"]

  named_port {
    name = "http"
    port = "9292"
  }

  zone = "${var.zone}"
}

resource "google_compute_health_check" "health_check_reddit_app" {
  name               = "health-check-reddit-app"
  description        = "health check for reddit app"
  check_interval_sec = 1
  timeout_sec        = 1

  tcp_health_check {
    port = "9292"
  }
}

resource "google_compute_backend_service" "backend_service_reddit_app" {
  name        = "backend-service-reddit-app"
  description = "backend-service-reddit-app"
  protocol    = "HTTP"
  port_name   = "http"
  timeout_sec = 5

  backend {
    group = "${google_compute_instance_group.group_reddit_app.self_link}"
  }

  health_checks = ["${google_compute_health_check.health_check_reddit_app.self_link}"]
}

resource "google_compute_url_map" "url_map_reddit_app" {
  name            = "url-map-reddit-app"
  description     = "URL map reddit app"
  default_service = "${google_compute_backend_service.backend_service_reddit_app.self_link}"
}

resource "google_compute_target_http_proxy" "http_proxy_reddit_app" {
  name        = "http-proxy-reddit-app"
  description = "HTTP proxy reddit app"
  url_map     = "${google_compute_url_map.url_map_reddit_app.self_link}"
}

resource "google_compute_global_forwarding_rule" "global_forwarding_rule_reddit_app" {
  name        = "global-forwarding-rule-reddit-app"
  description = "Reddit app global forwarding rule"
  target      = "${google_compute_target_http_proxy.http_proxy_reddit_app.self_link}"
  port_range  = "80"
}
