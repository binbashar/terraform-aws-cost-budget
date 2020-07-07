<div align="center">
    <img src="https://raw.githubusercontent.com/binbashar/terraform-aws-cost-budget/master/figures/binbash.png" alt="drawing" width="250"/>
</div>
<div align="right">
  <img src="https://raw.githubusercontent.com/binbashar/terraform-aws-cost-budget/master/figures/binbash-leverage-terraform.png" alt="leverage" width="130"/>
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
| aws\_sns\_account\_id | The AWS Account ID which will host the SNS topic as owner | string | `"your_account_id_here"` | no |
| aws\_sns\_topic\_arn | If aws\_sns\_topic\_enabled = false, then an existing AWS SNS topic ARN for the billing alert integration will be used | string | `""` | no |
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
| currency | The unit of measurement used for the budget forecast, actual spend, or budget threshold, such as dollars. Currently COST budget\_type is the only supported. | string | `"USD"` | no |
| limit\_amount | The amount of cost or usage being measured for a budget. | string | n/a | yes |
| notification\_threshold | % Threshold when the notification should be sent. | string | `"100"` | no |
| tags | A mapping of tags to assign to all resources | map | `<map>` | no |
| time\_period\_end | Time to end | string | `""` | no |
| time\_period\_start | Time to start | string | n/a | yes |
| time\_unit | The length of time until a budget resets the actual and forecasted spend. Valid values: MONTHLY, QUARTERLY, ANNUALLY. | string | `"MONTHLY"` | no |

## Outputs

| Name | Description |
|------|-------------|
| cost\_filters\_service | Budget service cost filter, eg: Amazon Elastic Compute Cloud - Compute / Amazon Relational Database Service / Amazon Redshift / Amazon ElastiCache/ Amazon Elasticsearch Service |
| currency | Billing currency eg: dollars |
| limit\_amount | Monthly billing threshold in dollars |
| name | % Threshold when the notification should be sent. |
| sns\_topic\_arn | SNS Topic ARN to be subscribed to in order to delivery the budget billing notifications |
| time\_period\_end | Time to end. |
| time\_period\_start | Time to start. |
| time\_unit | The length of time until a budget resets the actual and forecasted spend. Valid values: MONTHLY, QUARTERLY, ANNUALLY. |

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
  aws_sns_account_id    = "111111111111"

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
  aws_sns_account_id    = "111111111111"

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
  aws_sns_account_id    = "111111111111"

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
  aws_sns_account_id    = "111111111111"

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

* If using a pre-existing sns topic please consider the code at [sns.tf file](https://github.com/binbashar/terraform-aws-cost-budget/blob/master/sns.tf) as reference.
Which will result in a policy most probably similar too
```
{
  "Version": "2012-10-17",
  "Id": "__default_policy_ID",
  "Statement": [
    {
      "Sid": "_budgets_service_access_ID",
      "Effect": "Allow",
      "Principal": {
        "Service": "budgets.amazonaws.com"
      },
      "Action": "SNS:Publish",
      "Resource": "arn:aws:sns:us-east-1:111111111111:sns-topic-slack-notify"
    },
    {
      "Sid": "__default_statement_ID",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": [
        "SNS:Subscribe",
        "SNS:SetTopicAttributes",
        "SNS:RemovePermission",
        "SNS:Receive",
        "SNS:Publish",
        "SNS:ListSubscriptionsByTopic",
        "SNS:GetTopicAttributes",
        "SNS:DeleteTopic",
        "SNS:AddPermission"
      ],
      "Resource": "arn:aws:sns:us-east-1:111111111111:sns-topic-slack-notify",
      "Condition": {
        "StringEquals": {
          "AWS:SourceOwner": "111111111111"
        }
      }
    }
  ]
}
```

# Release Management

## Docker based makefile commands
- https://cloud.docker.com/u/binbash/repository/docker/binbash/git-release
- https://github.com/binbashar/terraform-aws-cost-budget/blob/master/Makefile

Root directory `Makefile` has the automated steps (to be integrated with **CircleCI jobs** []() )

### CircleCi PR auto-release job
<div align="left">
  <img src="https://raw.githubusercontent.com/binbashar/terraform-aws-cost-budget/master/figures/circleci.png" alt="leverage-circleci" width="230"/>
</div>

- https://circleci.com/gh/binbashar/terraform-aws-cost-budget
- **NOTE:** Will only run after merged PR.

- [**pipeline-job**](https://circleci.com/gh/binbashar/terraform-aws-cost-budget) (**NOTE:** Will only run after merged PR)
- [**releases**](https://github.com/binbashar/terraform-aws-cost-budget/releases)
- [**changelog**](https://github.com/binbashar/terraform-aws-cost-budget/blob/master/CHANGELOG.md)
