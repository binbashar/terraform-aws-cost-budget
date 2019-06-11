module "cost_mgmt_notif" {
  source = "../../cost-mgmt-budget-notif-bb"

  aws_env           = "${var.aws_profile}"
  currency          = "USD"
  limit_amount      = 500
  time_unit         = "MONTHLY"
  time_period_start = "2019-01-01_00:00"
  time_period_end   = "2019-12-31_23:59"
  aws_sns_topic_arn = "arn:aws:lambda:us-east-1:111111111111:function:bb-root-org-notify_slack"
}

output "sns_topic" {
  value = "${module.cost_mgmt_notif.sns_topic}"
}

# Will output the following:
# arn:aws:lambda:us-east-1:111111111111:function:bb-root-org-notify_slack

