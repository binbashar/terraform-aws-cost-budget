output "sns_topic_arn" {
  description = "SNS Topic ARN to be subscribed to in order to delivery the budget billing notifications"
  value       = "${var.aws_sns_topic_arn != "" ? var.aws_sns_topic_arn : join("", aws_sns_topic.sns_alert_topic.*.arn)}"
}
