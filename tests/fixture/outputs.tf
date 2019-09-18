#
# Budget
#
output "name" {
  description = "% Threshold when the notification should be sent."
  value       = "${module.terraform-aws-cost-budget-test.name}"
}

output "limit_amount" {
  description = "Monthly billing threshold in dollars"
  value = "${module.terraform-aws-cost-budget-test.limit_amount}"
}

output "currency" {
  description = "Billing currency eg: dollars"
  value = "${module.terraform-aws-cost-budget-test.limit_unit}"
}

output "time_period_start" {
  description = "Time to start."
  value       = "${module.terraform-aws-cost-budget-test.time_period_start}"
}

output "time_period_end" {
  description = "Time to end."
  value       = "${module.terraform-aws-cost-budget-test.time_period_end}"
}

output "time_unit" {
  description = "The length of time until a budget resets the actual and forecasted spend. Valid values: MONTHLY, QUARTERLY, ANNUALLY."
  value       = "${module.terraform-aws-cost-budget-test.time_unit}"
}

output "cost_filters_service" {
  description = "Budget service cost filter, eg: Amazon Elastic Compute Cloud - Compute / Amazon Relational Database Service / Amazon Redshift / Amazon ElastiCache/ Amazon Elasticsearch Service"
  value       = "${module.terraform-aws-cost-budget-test.cost_filters.Service}"
}

#
# Budget SNS
#
output "sns_topic_arn" {
  description = "SNS Topic ARN to be subscribed to in order to delivery the budget billing notifications"
  value       = "${module.terraform-aws-cost-budget-test.sns_topic_arn}"

}