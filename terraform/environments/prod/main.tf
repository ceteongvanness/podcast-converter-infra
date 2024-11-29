# terraform/environments/prod/main.tf
module "podcast_converter" {
  source = "../../modules/podcast-converter"

  environment = "prod"
  aws_region = var.aws_region
  cluster_name = "podcast-converter-prod"
  
  vpc_cidr = "10.2.0.0/16"  # Different CIDR for prod
  public_subnets = ["10.2.1.0/24", "10.2.2.0/24", "10.2.3.0/24"]  # Extra subnet for prod
  private_subnets = ["10.2.4.0/24", "10.2.5.0/24", "10.2.6.0/24"] # Extra subnet for prod
  
  node_group_min_size = 3
  node_group_max_size = 10
  node_group_desired_size = 3
}