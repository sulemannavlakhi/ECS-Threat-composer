terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

 # backend "s3" {
   # bucket         = "ECS-S3"           
    #key            = "terraform.tfstate" 
    #region         = "ca-central-1"
    #use_lockfile   = true   
    #encrypt        = true
  #}
#}