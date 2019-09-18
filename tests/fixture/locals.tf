locals {
  tags = {
    Name        = "infra-cost-budget-sns-test"
    Terraform   = "true"
    Environment = "${var.environment}"
  }
}
