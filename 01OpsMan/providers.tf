provider "aws" {
  region = var.region
 # shared_credentials_files = [var.aws_credentials]
 # profile = var.aws_profile
  alias  = "provider"
}