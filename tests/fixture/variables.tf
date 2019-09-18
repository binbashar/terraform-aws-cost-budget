#=============================#
# AWS Provider Settings       #
#=============================#
provider "aws" {
  region  = "${var.region}"
  profile = "${var.profile_shared}"
}

variable "region" {
  description = "AWS Region"
  default     = "us-east-1"
}

variable "profile_shared" {
  description = "AWS Profile"
  default     = "bb-dev-oaar"
}

#=============================#
# Backend Config (partial)    #
#=============================#
terraform {
  required_version = ">= 0.11.14"
}

#==============================#
# Project Variables            #
#==============================#
variable "environment" {
  description = "Environment Name"
  default     = "dev"}

#==============================#
# Cost Mgmt                    #
#==============================#
#
# Budget
#
variable "monthly_billing_threshold" {
  description = "Monthly billing threshold in dollars"
  default     = 50
}

variable "currency" {
  description = "Billing currency eg: dollars"
  default     = "USD"
}

variable "time_unit" {
  description = "The length of time until a budget resets the actual and forecasted spend. Valid values: MONTHLY, QUARTERLY, ANNUALLY."
  type        = "string"
  default     = "MONTHLY"
}

variable "time_period_start" {
  description = "Time to start."
  type        = "string"
  default     = "2019-01-01_00:00"
}

variable "time_period_end" {
  description = "Time to start."
  type        = "string"
  default     = "2019-12-31_23:59"
}

variable "notification_threshold" {
  description = "% Threshold when the notification should be sent."
  type        = "string"
  default     = 50
}

#
# Budget SNS
#
variable "aws_sns_account_id" {
  description = "The AWS Account ID which will host the SNS topic as owner"
  type        = "string"
  default     = "523857393444"
}