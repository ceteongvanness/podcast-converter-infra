module "podcast_converter" {
  source = "../../modules/podcast-converter"

  environment = "dev"
  aws_region = var.aws_region
  cluster_name = "podcast-converter-dev"
  
  vpc_cidr = "10.0.0.0/16"
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
  
  node_group_min_size = 2
  node_group_max_size = 3
  node_group_desired_size = 2
}