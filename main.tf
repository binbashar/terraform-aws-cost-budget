#
# case 1
# if(var.aws_sns_topic_arn != "" && var.aws_sns_account_id != "" && var.cost_filters_service != "" && var.time_period_end != "")
#
resource "aws_budgets_budget" "budget_notif_to_pre_existing_sns_specific_servs_with_time_end" {
  count             = "${var.aws_sns_topic_arn != "" && var.aws_sns_account_id != "" && var.cost_filters_service != "" && var.time_period_end != "" ? 1 : 0}"
  name              = "budget-${var.cost_filters_service}-${var.time_unit}-${var.aws_env}"
  budget_type       = "COST"
  limit_amount      = "${var.limit_amount}"
  limit_unit        = "${var.currency}"
  time_period_start = "${var.time_period_start}"
  time_period_end   = "${var.time_period_end}"
  time_unit         = "${var.time_unit}"

  cost_filters = {
    Service = "${var.cost_filters_service}"
  }

  notification {
    comparison_operator       = "GREATER_THAN"
    threshold                 = "${var.notification_threshold}"
    threshold_type            = "PERCENTAGE"
    notification_type         = "FORECASTED"
    subscriber_sns_topic_arns = ["${var.aws_sns_topic_arn}"]
  }

  cost_types {
    # A boolean value whether to include credits in the cost budget.
    include_credit = true

    # Specifies whether a budget includes discounts. Defaults to
    include_discount = true

    # A boolean value whether to include other subscription costs in the cost budget.
    include_other_subscription = true

    # A boolean value whether to include recurring costs in the cost budget.
    include_recurring = true

    # A boolean value whether to include refunds in the cost budget.
    include_refund = true

    # A boolean value whether to include subscriptions in the cost budget.
    include_subscription = true

    # A boolean value whether to include support costs in the cost budget.
    include_support = true

    # A boolean value whether to include support costs in the cost budget.
    include_tax = true

    # A boolean value whether to include support costs in the cost budget.
    include_upfront = true

    # Specifies whether a budget uses the amortized rate.
    use_amortized = false

    # A boolean value whether to use blended costs in the cost budget.
    use_blended = false
  }
}

#
# case 2
# if(var.aws_sns_topic_arn != "" && var.aws_sns_account_id != "" && var.cost_filters_service == "" && var.time_period_end != "")
#
resource "aws_budgets_budget" "budget_notif_to_pre_existing_sns_all_servs_with_time_end" {
  count             = "${var.aws_sns_topic_arn != "" && var.aws_sns_account_id != "" && var.cost_filters_service == "" && var.time_period_end != "" ? 1 : 0}"
  name              = "budget-${var.time_unit}-${var.aws_env}"
  budget_type       = "COST"
  limit_amount      = "${var.limit_amount}"
  limit_unit        = "${var.currency}"
  time_period_start = "${var.time_period_start}"
  time_period_end   = "${var.time_period_end}"
  time_unit         = "${var.time_unit}"

  notification {
    comparison_operator       = "GREATER_THAN"
    threshold                 = "${var.notification_threshold}"
    threshold_type            = "PERCENTAGE"
    notification_type         = "FORECASTED"
    subscriber_sns_topic_arns = ["${var.aws_sns_topic_arn}"]
  }

  cost_types {
    # A boolean value whether to include credits in the cost budget.
    include_credit = true

    # Specifies whether a budget includes discounts. Defaults to
    include_discount = true

    # A boolean value whether to include other subscription costs in the cost budget.
    include_other_subscription = true

    # A boolean value whether to include recurring costs in the cost budget.
    include_recurring = true

    # A boolean value whether to include refunds in the cost budget.
    include_refund = true

    # A boolean value whether to include subscriptions in the cost budget.
    include_subscription = true

    # A boolean value whether to include support costs in the cost budget.
    include_support = true

    # A boolean value whether to include support costs in the cost budget.
    include_tax = true

    # A boolean value whether to include support costs in the cost budget.
    include_upfront = true

    # Specifies whether a budget uses the amortized rate.
    use_amortized = false

    # A boolean value whether to use blended costs in the cost budget.
    use_blended = false
  }
}

#
# case 3
# if(var.aws_sns_topic_arn != "" && var.aws_sns_account_id != "" && var.cost_filters_service != "" && var.time_period_end == "")
#
resource "aws_budgets_budget" "budget_notif_to_pre_existing_sns_specific_service" {
  count             = "${var.aws_sns_topic_arn != "" && var.aws_sns_account_id != "" && var.cost_filters_service != "" && var.time_period_end == "" ? 1 : 0}"
  name              = "budget-${var.cost_filters_service}-${var.time_unit}-${var.aws_env}"
  budget_type       = "COST"
  limit_amount      = "${var.limit_amount}"
  limit_unit        = "${var.currency}"
  time_period_start = "${var.time_period_start}"
  time_unit         = "${var.time_unit}"

  cost_filters = {
    Service = "${var.cost_filters_service}"
  }

  notification {
    comparison_operator       = "GREATER_THAN"
    threshold                 = "${var.notification_threshold}"
    threshold_type            = "PERCENTAGE"
    notification_type         = "FORECASTED"
    subscriber_sns_topic_arns = ["${var.aws_sns_topic_arn}"]
  }

  cost_types {
    # A boolean value whether to include credits in the cost budget.
    include_credit = true

    # Specifies whether a budget includes discounts. Defaults to
    include_discount = true

    # A boolean value whether to include other subscription costs in the cost budget.
    include_other_subscription = true

    # A boolean value whether to include recurring costs in the cost budget.
    include_recurring = true

    # A boolean value whether to include refunds in the cost budget.
    include_refund = true

    # A boolean value whether to include subscriptions in the cost budget.
    include_subscription = true

    # A boolean value whether to include support costs in the cost budget.
    include_support = true

    # A boolean value whether to include support costs in the cost budget.
    include_tax = true

    # A boolean value whether to include support costs in the cost budget.
    include_upfront = true

    # Specifies whether a budget uses the amortized rate.
    use_amortized = false

    # A boolean value whether to use blended costs in the cost budget.
    use_blended = false
  }
}

#
# case 4
# if(var.aws_sns_topic_arn != "" && var.aws_sns_account_id != "" && var.cost_filters_service == "" && var.time_period_end == "")
#
resource "aws_budgets_budget" "budget_notif_to_pre_existing_sns_all_servs" {
  count             = "${var.aws_sns_topic_arn != "" && var.aws_sns_account_id != "" && var.cost_filters_service == "" && var.time_period_end == "" ? 1 : 0}"
  name              = "budget-${var.time_unit}-${var.aws_env}"
  budget_type       = "COST"
  limit_amount      = "${var.limit_amount}"
  limit_unit        = "${var.currency}"
  time_period_start = "${var.time_period_start}"
  time_unit         = "${var.time_unit}"

  notification {
    comparison_operator       = "GREATER_THAN"
    threshold                 = "${var.notification_threshold}"
    threshold_type            = "PERCENTAGE"
    notification_type         = "FORECASTED"
    subscriber_sns_topic_arns = ["${var.aws_sns_topic_arn}"]
  }

  cost_types {
    # A boolean value whether to include credits in the cost budget.
    include_credit = true

    # Specifies whether a budget includes discounts. Defaults to
    include_discount = true

    # A boolean value whether to include other subscription costs in the cost budget.
    include_other_subscription = true

    # A boolean value whether to include recurring costs in the cost budget.
    include_recurring = true

    # A boolean value whether to include refunds in the cost budget.
    include_refund = true

    # A boolean value whether to include subscriptions in the cost budget.
    include_subscription = true

    # A boolean value whether to include support costs in the cost budget.
    include_support = true

    # A boolean value whether to include support costs in the cost budget.
    include_tax = true

    # A boolean value whether to include support costs in the cost budget.
    include_upfront = true

    # Specifies whether a budget uses the amortized rate.
    use_amortized = false

    # A boolean value whether to use blended costs in the cost budget.
    use_blended = false
  }
}

#
# case 5
# if(var.aws_sns_topic_arn == "" && var.cost_filters_service != "" && var.time_period_end != "")
#
resource "aws_budgets_budget" "budget_notif_to_new_sns_specific_servs_with_time_end" {
  count             = "${var.aws_sns_topic_arn == "" && var.cost_filters_service != "" && var.time_period_end != "" ? 1 : 0}"
  name              = "budget-${var.cost_filters_service}-${var.time_unit}-${var.aws_env}"
  budget_type       = "COST"
  limit_amount      = "${var.limit_amount}"
  limit_unit        = "${var.currency}"
  time_period_start = "${var.time_period_start}"
  time_period_end   = "${var.time_period_end}"
  time_unit         = "${var.time_unit}"

  cost_filters = {
    Service = "${var.cost_filters_service}"
  }

  notification {
    comparison_operator       = "GREATER_THAN"
    threshold                 = "${var.notification_threshold}"
    threshold_type            = "PERCENTAGE"
    notification_type         = "FORECASTED"
    subscriber_sns_topic_arns = ["${aws_sns_topic.sns_alert_topic.arn}"]
  }

  cost_types {
    # A boolean value whether to include credits in the cost budget.
    include_credit = true

    # Specifies whether a budget includes discounts. Defaults to
    include_discount = true

    # A boolean value whether to include other subscription costs in the cost budget.
    include_other_subscription = true

    # A boolean value whether to include recurring costs in the cost budget.
    include_recurring = true

    # A boolean value whether to include refunds in the cost budget.
    include_refund = true

    # A boolean value whether to include subscriptions in the cost budget.
    include_subscription = true

    # A boolean value whether to include support costs in the cost budget.
    include_support = true

    # A boolean value whether to include support costs in the cost budget.
    include_tax = true

    # A boolean value whether to include support costs in the cost budget.
    include_upfront = true

    # Specifies whether a budget uses the amortized rate.
    use_amortized = false

    # A boolean value whether to use blended costs in the cost budget.
    use_blended = false
  }
}

#
# case 6
# if(var.aws_sns_topic_arn == "" && var.cost_filters_service == "" && var.time_period_end != "")
#
resource "aws_budgets_budget" "budget_notif_to_new_sns_all_servs_with_time_end" {
  count             = "${var.aws_sns_topic_arn == "" && var.cost_filters_service == "" && var.time_period_end != "" ? 1 : 0}"
  name              = "budget-${var.cost_filters_service}-${var.time_unit}-${var.aws_env}"
  budget_type       = "COST"
  limit_amount      = "${var.limit_amount}"
  limit_unit        = "${var.currency}"
  time_period_start = "${var.time_period_start}"
  time_period_end   = "${var.time_period_end}"
  time_unit         = "${var.time_unit}"

  notification {
    comparison_operator       = "GREATER_THAN"
    threshold                 = "${var.notification_threshold}"
    threshold_type            = "PERCENTAGE"
    notification_type         = "FORECASTED"
    subscriber_sns_topic_arns = ["${aws_sns_topic.sns_alert_topic.arn}"]
  }

  cost_types {
    # A boolean value whether to include credits in the cost budget.
    include_credit = true

    # Specifies whether a budget includes discounts. Defaults to
    include_discount = true

    # A boolean value whether to include other subscription costs in the cost budget.
    include_other_subscription = true

    # A boolean value whether to include recurring costs in the cost budget.
    include_recurring = true

    # A boolean value whether to include refunds in the cost budget.
    include_refund = true

    # A boolean value whether to include subscriptions in the cost budget.
    include_subscription = true

    # A boolean value whether to include support costs in the cost budget.
    include_support = true

    # A boolean value whether to include support costs in the cost budget.
    include_tax = true

    # A boolean value whether to include support costs in the cost budget.
    include_upfront = true

    # Specifies whether a budget uses the amortized rate.
    use_amortized = false

    # A boolean value whether to use blended costs in the cost budget.
    use_blended = false
  }
}

#
# case 7
# if(var.aws_sns_topic_arn == "" && var.cost_filters_service != "" && var.time_period_end == "")
#
resource "aws_budgets_budget" "budget_notif_to_new_sns_specific_servs" {
  count             = "${var.aws_sns_topic_arn == "" && var.cost_filters_service != "" && var.time_period_end == "" ? 1 : 0}"
  name              = "budget-${var.cost_filters_service}-${var.time_unit}-${var.aws_env}"
  budget_type       = "COST"
  limit_amount      = "${var.limit_amount}"
  limit_unit        = "${var.currency}"
  time_period_start = "${var.time_period_start}"
  time_unit         = "${var.time_unit}"

  cost_filters = {
    Service = "${var.cost_filters_service}"
  }

  notification {
    comparison_operator       = "GREATER_THAN"
    threshold                 = "${var.notification_threshold}"
    threshold_type            = "PERCENTAGE"
    notification_type         = "FORECASTED"
    subscriber_sns_topic_arns = ["${aws_sns_topic.sns_alert_topic.arn}"]
  }

  cost_types {
    # A boolean value whether to include credits in the cost budget.
    include_credit = true

    # Specifies whether a budget includes discounts. Defaults to
    include_discount = true

    # A boolean value whether to include other subscription costs in the cost budget.
    include_other_subscription = true

    # A boolean value whether to include recurring costs in the cost budget.
    include_recurring = true

    # A boolean value whether to include refunds in the cost budget.
    include_refund = true

    # A boolean value whether to include subscriptions in the cost budget.
    include_subscription = true

    # A boolean value whether to include support costs in the cost budget.
    include_support = true

    # A boolean value whether to include support costs in the cost budget.
    include_tax = true

    # A boolean value whether to include support costs in the cost budget.
    include_upfront = true

    # Specifies whether a budget uses the amortized rate.
    use_amortized = false

    # A boolean value whether to use blended costs in the cost budget.
    use_blended = false
  }
}

#
# case 8
# if(var.aws_sns_topic_arn == "" && var.cost_filters_service == "" && var.time_period_end == "")
#
resource "aws_budgets_budget" "budget_notif_to_new_sns_all_servs" {
  count             = "${var.aws_sns_topic_arn == "" && var.cost_filters_service == "" && var.time_period_end == "" ? 1 : 0}"
  name              = "budget-${var.cost_filters_service}-${var.time_unit}-${var.aws_env}"
  budget_type       = "COST"
  limit_amount      = "${var.limit_amount}"
  limit_unit        = "${var.currency}"
  time_period_start = "${var.time_period_start}"
  time_unit         = "${var.time_unit}"

  notification {
    comparison_operator       = "GREATER_THAN"
    threshold                 = "${var.notification_threshold}"
    threshold_type            = "PERCENTAGE"
    notification_type         = "FORECASTED"
    subscriber_sns_topic_arns = ["${aws_sns_topic.sns_alert_topic.arn}"]
  }

  cost_types {
    # A boolean value whether to include credits in the cost budget.
    include_credit = "${var.cost_type_include_credit}"

    # Specifies whether a budget includes discounts. Defaults to
    include_discount = "${var.cost_type_include_discount}"

    # A boolean value whether to include other subscription costs in the cost budget.
    include_other_subscription = "${var.cost_type_include_other_subscription}"

    # A boolean value whether to include recurring costs in the cost budget.
    include_recurring = "${var.cost_type_include_recurring}"

    # A boolean value whether to include refunds in the cost budget.
    include_refund = "${var.cost_type_include_refund}"

    # A boolean value whether to include subscriptions in the cost budget.
    include_subscription = "${var.cost_type_include_subscription}"

    # A boolean value whether to include support costs in the cost budget.
    include_support = "${var.cost_type_include_support}"

    # A boolean value whether to include support costs in the cost budget.
    include_tax = "${var.cost_type_include_tax}"

    # A boolean value whether to include support costs in the cost budget.
    include_upfront = "${var.cost_type_include_upfront}"

    # Specifies whether a budget uses the amortized rate.
    use_amortized = "${var.cost_type_use_amortized}"

    # A boolean value whether to use blended costs in the cost budget.
    use_blended = "${var.cost_type_use_blended}"
  }
}
