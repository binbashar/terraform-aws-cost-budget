#=============================#
# AWS Provider Settings       #
#=============================#
provider "aws" {
  version                 = "~> 2.69"
  region                  = var.region
  profile                 = var.profile
  shared_credentials_file = "~/.aws/bb/config"
}

variable "region" {
  description = "AWS Region"
  default     = "us-east-1"
}

variable "profile" {
  description = "AWS Profile"
  default     = "bb-dev-deploymaster"
}

# Uncomment for local testing
//variable "profile" {
//  description = "AWS Profile"
//  default     = "bb-apps-devstg-devops"
//}

#=============================#
# Backend Config (partial)    #
#=============================#
terraform {
  required_version = ">= 0.12.28"
}

#=============================#
# Project Variables           #
#=============================#
variable "project" {
  description = "Project id"
  default     = "bb"
}

variable "environment" {
  description = "Environment Name"
  default     = "dev-test"
}

#==============================#
# Cost Mgmt                    #
#==============================#
#
# Budget
#
variable "monthly_billing_threshold" {
  description = "Monthly billing threshold in dollars"
  default     = 500
}

variable "currency" {
  description = "Billing currency eg: dollars"
  default     = "USD"
}

variable "time_unit" {
  description = "The length of time until a budget resets the actual and forecasted spend. Valid values: MONTHLY, QUARTERLY, ANNUALLY."
  type        = string
  default     = "MONTHLY"
}

variable "time_period_start" {
  description = "Time to start."
  type        = string
  default     = "2020-01-01_00:00"
}

variable "time_period_end" {
  description = "Time to start."
  type        = string
  default     = "2020-12-31_23:59"
}

variable "notification_threshold" {
  description = "% Threshold when the notification should be sent."
  type        = string
  default     = 50
}

variable "cost_filters_service" {
  description = "Budget service cost filter, eg: Amazon Elastic Compute Cloud - Compute / Amazon Relational Database Service / Amazon Redshift / Amazon ElastiCache/ Amazon Elasticsearch Service"
  type        = string
  default     = "Amazon Elastic Compute Cloud - Compute"
}

#
# Budget SNS
#
variable "aws_sns_account_id" {
  description = "The AWS Account ID which will host the SNS topic as owner"
  type        = string
  default     = "523857393444"
}
