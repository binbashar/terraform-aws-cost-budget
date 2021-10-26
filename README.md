<div align="center">
    <img src="https://raw.githubusercontent.com/binbashar/terraform-aws-cost-budget/master/figures/binbash.png"
    alt="drawing" width="250"/>
</div>
<div align="right">
  <img src="https://raw.githubusercontent.com/binbashar/terraform-aws-cost-budget/master/figures/binbash-leverage-terraform.png"
   alt="leverage" width="130"/>
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

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.28 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.70.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 2.70.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_budgets_budget.budget_notif_to_new_sns_all_servs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/budgets_budget) | resource |
| [aws_budgets_budget.budget_notif_to_new_sns_all_servs_with_time_end](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/budgets_budget) | resource |
| [aws_budgets_budget.budget_notif_to_new_sns_specific_servs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/budgets_budget) | resource |
| [aws_budgets_budget.budget_notif_to_new_sns_specific_servs_with_time_end](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/budgets_budget) | resource |
| [aws_budgets_budget.budget_notif_to_pre_existing_sns_all_servs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/budgets_budget) | resource |
| [aws_budgets_budget.budget_notif_to_pre_existing_sns_all_servs_with_time_end](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/budgets_budget) | resource |
| [aws_budgets_budget.budget_notif_to_pre_existing_sns_specific_service](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/budgets_budget) | resource |
| [aws_budgets_budget.budget_notif_to_pre_existing_sns_specific_servs_with_time_end](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/budgets_budget) | resource |
| [aws_sns_topic.sns_alert_topic](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_policy.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_policy) | resource |
| [aws_iam_policy_document.sns-topic-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_env"></a> [aws\_env](#input\_aws\_env) | AWS environment you are deploying to. Will be appended to SNS topic and alarm name. (e.g. dev, stage, prod) | `any` | n/a | yes |
| <a name="input_aws_sns_account_id"></a> [aws\_sns\_account\_id](#input\_aws\_sns\_account\_id) | The AWS Account ID which will host the SNS topic as owner | `string` | `""` | no |
| <a name="input_cost_filters_service"></a> [cost\_filters\_service](#input\_cost\_filters\_service) | Budget service cost filter, eg: Amazon Elastic Compute Cloud - Compute / Amazon Relational Database Service / Amazon Redshift / Amazon ElastiCache/ Amazon Elasticsearch Service | `string` | `""` | no |
| <a name="input_cost_type_include_credit"></a> [cost\_type\_include\_credit](#input\_cost\_type\_include\_credit) | A boolean value whether to include credits in the cost budget. | `string` | `"true"` | no |
| <a name="input_cost_type_include_discount"></a> [cost\_type\_include\_discount](#input\_cost\_type\_include\_discount) | Specifies whether a budget includes discounts. | `string` | `"true"` | no |
| <a name="input_cost_type_include_other_subscription"></a> [cost\_type\_include\_other\_subscription](#input\_cost\_type\_include\_other\_subscription) | A boolean value whether to include other subscription costs in the cost budget. | `string` | `"true"` | no |
| <a name="input_cost_type_include_recurring"></a> [cost\_type\_include\_recurring](#input\_cost\_type\_include\_recurring) | A boolean value whether to include recurring costs in the cost budget. | `string` | `"true"` | no |
| <a name="input_cost_type_include_refund"></a> [cost\_type\_include\_refund](#input\_cost\_type\_include\_refund) | A boolean value whether to include refunds in the cost budget. | `string` | `"true"` | no |
| <a name="input_cost_type_include_subscription"></a> [cost\_type\_include\_subscription](#input\_cost\_type\_include\_subscription) | A boolean value whether to include subscriptions in the cost budget. | `string` | `"true"` | no |
| <a name="input_cost_type_include_support"></a> [cost\_type\_include\_support](#input\_cost\_type\_include\_support) | A boolean value whether to include support costs in the cost budget. | `string` | `"true"` | no |
| <a name="input_cost_type_include_tax"></a> [cost\_type\_include\_tax](#input\_cost\_type\_include\_tax) | A boolean value whether to include support costs in the cost budget. | `string` | `"true"` | no |
| <a name="input_cost_type_include_upfront"></a> [cost\_type\_include\_upfront](#input\_cost\_type\_include\_upfront) | A boolean value whether to include support costs in the cost budget. | `string` | `"true"` | no |
| <a name="input_cost_type_use_amortized"></a> [cost\_type\_use\_amortized](#input\_cost\_type\_use\_amortized) | Specifies whether a budget uses the amortized rate. | `string` | `"false"` | no |
| <a name="input_cost_type_use_blended"></a> [cost\_type\_use\_blended](#input\_cost\_type\_use\_blended) | A boolean value whether to use blended costs in the cost budget. | `string` | `"false"` | no |
| <a name="input_currency"></a> [currency](#input\_currency) | The unit of measurement used for the budget forecast, actual spend, or budget threshold, such as dollars. Currently COST budget\_type is the only supported. | `string` | `"USD"` | no |
| <a name="input_limit_amount"></a> [limit\_amount](#input\_limit\_amount) | The amount of cost or usage being measured for a budget. | `string` | n/a | yes |
| <a name="input_notification_threshold"></a> [notification\_threshold](#input\_notification\_threshold) | % Threshold when the notification should be sent. | `string` | `100` | no |
| <a name="input_sns_topic_arns"></a> [sns\_topic\_arns](#input\_sns\_topic\_arns) | List of SNS topic ARNs to be used. If `create_sns_topic` is `true`, it merges the created SNS Topic by this module with this list of ARNs | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to all resources | `map(string)` | `{}` | no |
| <a name="input_time_period_end"></a> [time\_period\_end](#input\_time\_period\_end) | Time to end | `string` | `""` | no |
| <a name="input_time_period_start"></a> [time\_period\_start](#input\_time\_period\_start) | Time to start | `string` | n/a | yes |
| <a name="input_time_unit"></a> [time\_unit](#input\_time\_unit) | The length of time until a budget resets the actual and forecasted spend. Valid values: MONTHLY, QUARTERLY, ANNUALLY. | `string` | `"MONTHLY"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cost_filters_service"></a> [cost\_filters\_service](#output\_cost\_filters\_service) | Budget service cost filter, eg: Amazon Elastic Compute Cloud - Compute / Amazon Relational Database Service / Amazon Redshift / Amazon ElastiCache/ Amazon Elasticsearch Service |
| <a name="output_currency"></a> [currency](#output\_currency) | Billing currency eg: dollars |
| <a name="output_limit_amount"></a> [limit\_amount](#output\_limit\_amount) | Monthly billing threshold in dollars |
| <a name="output_name"></a> [name](#output\_name) | % Threshold when the notification should be sent. |
| <a name="output_sns_topic_arn"></a> [sns\_topic\_arn](#output\_sns\_topic\_arn) | SNS Topic ARN to be subscribed to in order to delivery the budget billing notifications |
| <a name="output_time_period_end"></a> [time\_period\_end](#output\_time\_period\_end) | Time to end. |
| <a name="output_time_period_start"></a> [time\_period\_start](#output\_time\_period\_start) | Time to start. |
| <a name="output_time_unit"></a> [time\_unit](#output\_time\_unit) | The length of time until a budget resets the actual and forecasted spend. Valid values: MONTHLY, QUARTERLY, ANNUALLY. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

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

## Binbash Leverage | DevOps Automation Code Library Integration

In order to get the full automated potential of the
[Binbash Leverage DevOps Automation Code Library](https://leverage.binbash.com.ar/how-it-works/code-library/code-library/)  
you should initialize all the necessary helper **Makefiles**.

#### How?
You must execute the `make init-makefiles` command  at the root context


```shell
╭─delivery at delivery-I7567 in ~/terraform/terraform-aws-backup-by-tags on master✔ 20-09-17
╰─⠠⠵ make
Available Commands:
 - init-makefiles     initialize makefiles

```

### Why?
You'll get all the necessary commands to automatically operate this module via a dockerized approach,
example shown below

```shell
╭─delivery at delivery-I7567 in ~/terraform/terraform-aws-backup-by-tags on master✔ 20-09-17
╰─⠠⠵ make
Available Commands:
 - circleci-validate-config  ## Validate A CircleCI Config (https
 - format-check        ## The terraform fmt is used to rewrite tf conf files to a canonical format and style.
 - format              ## The terraform fmt is used to rewrite tf conf files to a canonical format and style.
 - tf-dir-chmod        ## run chown in ./.terraform to gran that the docker mounted dir has the right permissions
 - version             ## Show terraform version
 - init-makefiles      ## initialize makefiles
```

```shell
╭─delivery at delivery-I7567 in ~/terraform/terraform-aws-backup-by-tags on master✔ 20-09-17
╰─⠠⠵ make format-check
docker run --rm -v /home/delivery/Binbash/repos/Leverage/terraform/terraform-aws-backup-by-tags:"/go/src/project/":rw -v :/config -v /common.config:/common-config/common.config -v ~/.ssh:/root/.ssh -v ~/.gitconfig:/etc/gitconfig -v ~/.aws/bb:/root/.aws/bb -e AWS_SHARED_CREDENTIALS_FILE=/root/.aws/bb/credentials -e AWS_CONFIG_FILE=/root/.aws/bb/config --entrypoint=/bin/terraform -w "/go/src/project/" -it binbash/terraform-awscli-slim:0.12.28 fmt -check
```

# Release Management
### CircleCi PR auto-release job

<div align="left">
  <img src="https://raw.githubusercontent.com/binbashar/terraform-aws-cost-budget/master/figures/circleci.png" alt="leverage-circleci" width="230"/>
</div>

- [**pipeline-job**](https://circleci.com/gh/binbashar/terraform-aws-cost-budget) (**NOTE:** Will only run after merged PR)
- [**releases**](https://github.com/binbashar/terraform-aws-cost-budget/releases)
- [**changelog**](https://github.com/binbashar/terraform-aws-cost-budget/blob/master/CHANGELOG.md)
