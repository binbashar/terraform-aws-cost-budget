<div align="center">
    <img src="https://github.com/binbashar/terraform-aws-cost-budget/blob/master/figures/binbash.png" alt="drawing" width="350"/>
</div>
<div align="right">
  <img src="https://github.com/binbashar/terraform-aws-cost-budget/blob/master/figures/binbash-leverage-terraform.png" alt="leverage" width="230"/>
</div>

# AWS Budget Billing module: terraform-aws-cost-mgmt-budget-notif

Terraform module - creates an AWS Budget with notification via SNS enabled with optional sns topic
creation (or use a pre-existing one) to alert when a U$S (currency actually configurable) budget forecasted threshold % is reached
(currently 100% of the `limit_amount`).

Provides an AWS budget resource (`aws_budgets_budget`). Budgets use the cost visualisation provided by **Cost Explorer** to show
you the status of your budgets, to provide forecasts of your estimated costs, and to track your AWS usage, including your free tier usage.

## Releases
- **Versions:** `<= 0.x.y` (Terraform 0.11.x compatible)
    - eg: https://registry.terraform.io/modules/binbashar/cost-budget/aws/0.0.1

- **Versions:** `>= 1.x.y` (Terraform 0.12.x compatible -> **WIP**)
    - eg: https://registry.terraform.io/modules/binbashar/cost-budget/aws/1.0.0

---

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| aws\_env | AWS environment you are deploying to. Will be appended to SNS topic and alarm name. (e.g. dev, stage, prod) | string | n/a | yes |
| aws\_sns\_topic\_arn | If aws_sns_topic_enabled = false, then an existing AWS SNS topic ARN for the billing alert integration will be used | string | `""` | no |
| cost\_filters\_service | Budget service cost filter, eg: Amazon Elastic Compute Cloud - Compute / Amazon Relational Database Service / Amazon Redshift / Amazon ElastiCache/ Amazon Elasticsearch Service | string | `""` | no |
| cost\_type\_include\_credit | A boolean value whether to include credits in the cost budget. | string | `"true"` | no |
| cost\_type\_include\_discount | Specifies whether a budget includes discounts. | string | `"true"` | no |
| cost\_type\_include\_other\_subscription | A boolean value whether to include other subscription costs in the cost budget. | string | `"true"` | no |
| cost\_type\_include\_recurring | A boolean value whether to include recurring costs in the cost budget. | string | `"true"` | no |
| cost\_type\_include\_refund | A boolean value whether to include refunds in the cost budget. | string | `"true"` | no |
| cost\_type\_include\_subscription | A boolean value whether to include subscriptions in the cost budget. | string | `"true"` | no |
| cost\_type\_include\_support | A boolean value whether to include support costs in the cost budget. | string | `"true"` | no |
| cost\_type\_include\_tax | A boolean value whether to include support costs in the cost budget. | string | `"true"` | no |
| cost\_type\_include\_upfront | A boolean value whether to include support costs in the cost budget. | string | `"true"` | no |
| cost\_type\_use\_amortized | Specifies whether a budget uses the amortized rate. | string | `"false"` | no |
| cost\_type\_use\_blended | A boolean value whether to use blended costs in the cost budget. | string | `"false"` | no |
| currency | The unit of measurement used for the budget forecast, actual spend, or budget threshold, such as dollars. Currently COST budget_type is the only supported. | string | `"USD"` | no |
| limit\_amount | The amount of cost or usage being measured for a budget. | string | n/a | yes |
| notification\_threshold | % Threshold when the notification should be sent. | string | `"100"` | no |
| tags | A mapping of tags to assign to all resources | map | `<map>` | no |
| time\_period\_end | Time to end | string | `""` | no |
| time\_period\_start | Time to start | string | n/a | yes |
| time\_unit | The length of time until a budget resets the actual and forecasted spend. Valid values: MONTHLY, QUARTERLY, ANNUALLY. | string | `"MONTHLY"` | no |

## Outputs

| Name | Description |
|------|-------------|
| sns\_topic\_arn | SNS Topic ARN to be subscribed to in order to delivery the budget billing notifications |

## Examples

### Budget including all the services in the account
#### budget-notif-to-new-sns-all-services
```terraform
module "cost_mgmt_notif" {
  source                = "../../cost-mgmt-budget-notif-bb"

  aws_env               = "${var.aws_profile}"
  currency              = "USD"
  limit_amount          = 500
  time_unit             = "MONTHLY"
  time_period_start     = "2019-01-01_00:00"

}

output "sns_topic" {
  value = "${module.cost_mgmt_notif.sns_topic}"
}

# Will output the following:
# arn:aws:sns:us-east-1:111111111111:billing-alarm-notification-usd-dev
```

#### budget-notif-to-new-sns-all-services-with-time-end
``` terraform
module "cost_mgmt_notif" {
  source                = "../../cost-mgmt-budget-notif-bb"

  aws_env               = "${var.aws_profile}"
  currency              = "USD"
  limit_amount          = 500
  time_unit             = "MONTHLY"
  time_period_start     = "2019-01-01_00:00"
  time_period_end       = "2019-12-31_23:59"

}

output "sns_topic" {
  value = "${module.cost_mgmt_notif.sns_topic}"
}

# Will output the following:
# arn:aws:sns:us-east-1:111111111111:cost-mgmt-budget-notification-usd-dev
```

#### budget-notif-to-pre-existing-sns-all-services
``` terraform
module "cost_mgmt_notif" {
  source                = "../../cost-mgmt-budget-notif-bb"

  aws_env               = "${var.aws_profile}"
  currency              = "USD"
  limit_amount          = 500
  time_unit             = "MONTHLY"
  time_period_start     = "2019-01-01_00:00"
  aws_sns_topic_arn     = "arn:aws:lambda:us-east-1:111111111111:function:bb-root-org-notify_slack"
}

output "sns_topic" {
  value = "${module.cost_mgmt_notif.sns_topic}"
}

# Will output the following:
# arn:aws:lambda:us-east-1:111111111111:function:bb-root-org-notify_slack
```

#### budget-notif-to-new-sns-all-services-with-time-end
``` terraform
module "cost_mgmt_notif" {
  source                = "../../cost-mgmt-budget-notif-bb"

  aws_env               = "${var.aws_profile}"
  currency              = "USD"
  limit_amount          = 500
  time_unit             = "MONTHLY"
  time_period_start     = "2019-01-01_00:00"
  time_period_end       = "2019-12-31_23:59"
  aws_sns_topic_arn     = "arn:aws:lambda:us-east-1:111111111111:function:bb-root-org-notify_slack"
}

output "sns_topic" {
  value = "${module.cost_mgmt_notif.sns_topic}"
}

# Will output the following:
# arn:aws:lambda:us-east-1:111111111111:function:bb-root-org-notify_slack
```

### Budget including only specific services in the account
#### budget-notif-to-new-sns-specific-service
```terraform
module "cost_mgmt_notif" {
  source                = "../../cost-mgmt-budget-notif-bb"

  aws_env               = "${var.aws_profile}"
  currency              = "USD"
  limit_amount          = 500
  time_unit             = "MONTHLY"
  time_period_start     = "2019-01-01_00:00"
  cost_filters_service  = "Amazon Elastic Compute Cloud - Compute"

}

output "sns_topic" {
  value = "${module.cost_mgmt_notif.sns_topic}"
}

# Will output the following:
# arn:aws:sns:us-east-1:111111111111:cost-mgmt-budget-notification-usd-dev
```

#### budget-notif-to-new-sns-specific-service-with-time-end
``` terraform
module "cost_mgmt_notif" {
  source                = "../../cost-mgmt-budget-notif-bb"

  aws_env               = "${var.aws_profile}"
  currency              = "USD"
  limit_amount          = 500
  time_unit             = "MONTHLY"
  time_period_start     = "2019-01-01_00:00"
  time_period_end       = "2019-12-31_23:59"
  cost_filters_service  = "Amazon Elastic Compute Cloud - Compute"

}

output "sns_topic" {
  value = "${module.cost_mgmt_notif.sns_topic}"
}

# Will output the following:
# arn:aws:sns:us-east-1:111111111111:cost-mgmt-budget-notification-usd-dev
```

#### budget-notif-to-pre-existing-sns-specific-service
``` terraform
module "cost_mgmt_notif" {
  source                = "../../cost-mgmt-budget-notif-bb"

  aws_env               = "${var.aws_profile}"
  currency              = "USD"
  limit_amount          = 500
  time_unit             = "MONTHLY"
  time_period_start     = "2019-01-01_00:00"
  cost_filters_service  = "Amazon Elastic Compute Cloud - Compute"
  aws_sns_topic_arn     = "arn:aws:lambda:us-east-1:111111111111:function:bb-root-org-notify_slack"
}

output "sns_topic" {
  value = "${module.cost_mgmt_notif.sns_topic}"
}

# Will output the following:
# arn:aws:lambda:us-east-1:111111111111:function:bb-root-org-notify_slack
```

#### budget-notif-to-pre-existing-sns-specific-service-with-time-end
``` terraform
module "cost_mgmt_notif" {
  source                = "../../cost-mgmt-budget-notif-bb"

  aws_env               = "${var.aws_profile}"
  currency              = "USD"
  limit_amount          = 500
  time_unit             = "MONTHLY"
  time_period_start     = "2019-01-01_00:00"
  time_period_end       = "2019-12-31_23:59"
  cost_filters_service  = "Amazon Elastic Compute Cloud - Compute"
  aws_sns_topic_arn     = "arn:aws:lambda:us-east-1:111111111111:function:bb-root-org-notify_slack"
}

output "sns_topic" {
  value = "${module.cost_mgmt_notif.sns_topic}"
}

# Will output the following:
# arn:aws:lambda:us-east-1:111111111111:function:bb-root-org-notify_slack
```

---

### Important Considerations
* If `aws_sns_topic_arn = ""` the alarm action is automatically set to the created SNS topic, `billing-alarm-notification-${lower(currency)}-${aws_env}`. **YOU MUST MANUALLY SUBSCRIBE TO THIS SNS TOPIC.**

    !! MANUAL STEP :
    !! Subscribe emails to `arn:aws:sns:us-east-1:111111111111:billing-alarm-notification-usd-dev for billing alarms`
