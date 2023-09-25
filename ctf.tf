terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.52.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "ctfd" {
  source                            = "1nval1dctf/ctfd/aws"
  ctf_domain                        = "wctf.hamer.cloud"
  create_cdn                        = true
  ctf_domain_zone_id                = "Z01871282UNAOFQSTNCVD"
  https_certificate_arn             = "arn:aws:acm:us-east-1:490638925706:certificate/7bba1b38-d28c-4665-aa2d-456785dc1b76"
  force_destroy_challenge_bucket    = true
  db_cluster_instance_type          = "db.t2.small"
  db_deletion_protection            = false
  elasticache_cluster_instance_type = "cache.t2.micro"
  elasticache_cluster_instances     = 2
  force_destroy_log_bucket          = true
  db_serverless                     = true
}
