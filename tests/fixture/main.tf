#
# Define some input just to show how variables can be passed from the test.
#
#variable "countries" {
#    description = "Countries"
#    default     = "AR,BR,CH"
#}

#
# Instantiate the module.
#
#module "backend" {
#    source      = "../../"
#    
#    countries   = "${var.countries}"
#}

#
# Output the module's output for verification.
#
#output "countries" {
#    value = "${module.sample.countries}"
#}

module "terraform-aws-cost-budget-test" {
  source = "../../"

  aws_env                = "${var.environment}-50-percent"
  currency               = var.currency
  limit_amount           = var.monthly_billing_threshold
  time_unit              = var.time_unit
  time_period_start      = var.time_period_start
  time_period_end        = var.time_period_end
  cost_filters_service   = var.cost_filters_service
  notification_threshold = var.notification_threshold
  aws_sns_account_id     = var.aws_sns_account_id
}
