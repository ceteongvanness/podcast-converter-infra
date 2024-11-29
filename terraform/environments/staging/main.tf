# terraform/environments/staging/main.tf
module "podcast_converter" {
  source = "../../modules/podcast-converter"

  environment = "staging"
  aws_region = var.aws_region
  cluster_name = "podcast-converter-staging"
  
  vpc_cidr = "10.1.0.0/16"  # Different CIDR for staging
  public_subnets = ["10.1.1.0/24", "10.1.2.0/24"]
  private_subnets = ["10.1.3.0/24", "10.1.4.0/24"]
  
  node_group_min_size = 2
  node_group_max_size = 4
  node_group_desired_size = 2
}