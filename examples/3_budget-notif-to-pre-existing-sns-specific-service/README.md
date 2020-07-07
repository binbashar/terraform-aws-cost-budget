# AWS Budget Forecast Notification
## 3_budget-notif-to-pre-existing-sns-specific-service

Configuration in this directory creates set of AWS resources which may be sufficient for a fully working stage or prod
Terraform module - creates an AWS Budget with notification via SNS enabled with optional sns topic
creation (or use a pre-existing one) to alert when a U$S (currency actually configurable) budget forecasted threshold % is reached
(currently 100% of the `limit_amount`).

Provides an AWS budget resource (`aws_budgets_budget`). Budgets use the cost visualisation provided by **Cost Explorer** to show
you the status of your budgets, to provide forecasts of your estimated costs, and to track your AWS usage, including your free tier usage.

Please check the **input parameters** for a better understanding of it.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Or if using the `Makefile` in this repo you need to execute:

```bash
$ make init
$ make plan
$ make apply
```

Note that this example may create resources which can cost money (AWS EC2, for example). Run `terraform destroy` or `make destroy`
when you don't need these resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Outputs

| Name | Description |
|------|-------------|
| sns\_topic\_arn | SNS Topic ARN to be subscribed to in order to delivery the budget billing notifications |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## 3_budget-notif-to-pre-existing-sns-specific-service
```terraform
module "cost_mgmt_notif" {
  source = "../../../terraform-aws-cost-budget"

  aws_env              = var.aws_profile
  currency             = "USD"
  limit_amount         = 500
  time_unit            = "MONTHLY"
  time_period_start    = "2019-01-01_00:00"
  cost_filters_service = "Amazon Elastic Compute Cloud - Compute"
  aws_sns_topic_arn    = "arn:aws:lambda:us-east-1:111111111111:function:bb-root-org-notify_slack"
}

output "sns_topic" {
  value = module.cost_mgmt_notif.sns_topic_arn
}
```
