#=============================#
# BUDGET                      #
#=============================#
variable "aws_env" {
  description = "AWS environment you are deploying to. Will be appended to SNS topic and alarm name. (e.g. dev, stage, prod)"
}

variable "limit_amount" {
  description = "The amount of cost or usage being measured for a budget."
  type        = string
}

variable "currency" {
  description = "The unit of measurement used for the budget forecast, actual spend, or budget threshold, such as dollars. Currently COST budget_type is the only supported."
  type        = string
  default     = "USD"
}

variable "time_unit" {
  description = "The length of time until a budget resets the actual and forecasted spend. Valid values: MONTHLY, QUARTERLY, ANNUALLY."
  type        = string
  default     = "MONTHLY"
}

variable "time_period_start" {
  description = "Time to start"
  type        = string
}

variable "time_period_end" {
  description = "Time to end"
  type        = string
  default     = ""
}

variable "cost_filters_service" {
  description = "Budget service cost filter, eg: Amazon Elastic Compute Cloud - Compute / Amazon Relational Database Service / Amazon Redshift / Amazon ElastiCache/ Amazon Elasticsearch Service"
  type        = string
  default     = ""
}

variable "notification_threshold" {
  description = "% Threshold when the notification should be sent."
  type        = string
  default     = 100
}

variable "cost_type_include_credit" {
  description = "A boolean value whether to include credits in the cost budget."
  type        = string
  default     = "true"
}

variable "cost_type_include_discount" {
  description = "Specifies whether a budget includes discounts."
  type        = string
  default     = "true"
}

variable "cost_type_include_other_subscription" {
  description = "A boolean value whether to include other subscription costs in the cost budget."
  type        = string
  default     = "true"
}

variable "cost_type_include_recurring" {
  description = "A boolean value whether to include recurring costs in the cost budget."
  type        = string
  default     = "true"
}

variable "cost_type_include_refund" {
  description = "A boolean value whether to include refunds in the cost budget."
  type        = string
  default     = "true"
}

variable "cost_type_include_subscription" {
  description = "A boolean value whether to include subscriptions in the cost budget."
  type        = string
  default     = "true"
}

variable "cost_type_include_support" {
  description = "A boolean value whether to include support costs in the cost budget."
  type        = string
  default     = "true"
}

variable "cost_type_include_tax" {
  description = "A boolean value whether to include support costs in the cost budget."
  type        = string
  default     = "true"
}

variable "cost_type_include_upfront" {
  description = "A boolean value whether to include support costs in the cost budget."
  type        = string
  default     = "true"
}

variable "cost_type_use_amortized" {
  description = "Specifies whether a budget uses the amortized rate."
  type        = string
  default     = "false"
}

variable "cost_type_use_blended" {
  description = "A boolean value whether to use blended costs in the cost budget."
  type        = string
  default     = "false"
}

#=============================#
# SNS                         #
#=============================#
variable "aws_sns_topic_arn" {
  description = "If aws_sns_topic_enabled = false, then an existing AWS SNS topic ARN for the billing alert integration will be used"
  default     = ""
}

variable "aws_sns_account_id" {
  description = "The AWS Account ID which will host the SNS topic as owner"
  type        = string
  default     = ""
}

#=============================#
# TAGS                        #
#=============================#
variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to all resources"
  default     = {}
}
