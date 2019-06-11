module "cost_mgmt_notif" {
  source = "../../cost-mgmt-budget-notif-bb"

  aws_env           = "${var.aws_profile}"
  currency          = "USD"
  limit_amount      = 500
  time_unit         = "MONTHLY"
  time_period_start = "2019-01-01_00:00"
}

output "sns_topic" {
  value = "${module.cost_mgmt_notif.sns_topic}"
}

# Will output the following:
# arn:aws:sns:us-east-1:111111111111:cost-mgmt-budget-notification-usd-dev

