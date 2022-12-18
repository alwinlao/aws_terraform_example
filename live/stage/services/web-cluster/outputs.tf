output "alb_dns_name" {
    description = "the domain name of the load balancer"
    value = module.web_cluster.alb_dns_name
}