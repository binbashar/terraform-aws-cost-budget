locals {

  budget = {

    name              = var.cost_filters_service == null ? "budget-${var.time_unit}-${var.aws_env}" : "budget-${var.cost_filters_service}-${var.time_unit}-${var.aws_env}"
    budget_type       = "COST"
    limit_amount      = var.limit_amount
    limit_unit        = var.currency
    time_period_start = var.time_period_start
    time_period_end   = var.time_period_end
    time_unit         = var.time_unit
  }

  notification = {
    comparison_operator = "GREATER_THAN"
    threshold           = var.notification_threshold
    threshold_type      = "PERCENTAGE"
    notification_type   = "FORECASTED"
    subscriber_sns_topic_arns = concat(
      compact(
        [try(aws_sns_topic.sns_alert_topic[0].arn, null)]
      ),
      var.sns_topic_arns
    )
  }
}

# Budget
resource "aws_budgets_budget" "budget_notifification" {

  name              = lookup(local.budget, "name")
  budget_type       = lookup(local.budget, "budget_type")
  limit_amount      = lookup(local.budget, "limit_amount")
  limit_unit        = lookup(local.budget, "limit_unit")
  time_period_start = lookup(local.budget, "time_period_start")
  time_period_end   = lookup(local.budget, "time_period_end")
  time_unit         = lookup(local.budget, "time_unit")

  dynamic "cost_filter" {
    for_each = var.cost_filters_service != null ? [1] : []
    content {
      name   = "Service"
      values = [var.cost_filters_service]
    }
  }

  notification {
    comparison_operator       = lookup(local.notification, "comparison_operator")
    threshold                 = lookup(local.notification, "threshold")
    threshold_type            = lookup(local.notification, "threshold_type")
    notification_type         = lookup(local.notification, "notification_type")
    subscriber_sns_topic_arns = lookup(local.notification, "subscriber_sns_topic_arns")
  }

  cost_types {
    include_credit             = var.cost_type_include_credit
    include_discount           = var.cost_type_include_discount
    include_other_subscription = var.cost_type_include_other_subscription
    include_recurring          = var.cost_type_include_recurring
    include_refund             = var.cost_type_include_refund
    include_subscription       = var.cost_type_include_subscription
    include_support            = var.cost_type_include_support
    include_tax                = var.cost_type_include_tax
    include_upfront            = var.cost_type_include_upfront
    use_amortized              = var.cost_type_use_amortized
    use_blended                = var.cost_type_use_blended
  }
}

