resource "aws_eks_cluster" "good_example" {

  name     = "good_example_cluster"
  role_arn = var.cluster_arn
  vpc_config {
    endpoint_public_access = true
  }
}

resource "aws_eks_cluster" "good_example" {
  // other config 

  name = "good_example_cluster"
  role_arn = var.cluster_arn
  encryption_config {
    resources = ["secrets"]
    provider {
      key_arn = var.kms_arn
    }
  }
}