#
# case 5 & 6 & 7 & 8
# if(var.aws_sns_topic_arn == "")
#
resource "aws_sns_topic" "sns_alert_topic" {
  count = var.create_sns_topic ? 1 : 0
  name  = "budget-billing-alarm-notification-${lower(var.currency)}-${var.aws_env}"
  tags  = var.tags
}

#
# Amazon SNS Topic for Budget Notifications strictly necessary policy
# https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/budgets-sns-policy.html
#
resource "aws_sns_topic_policy" "default" {
  count  = var.create_sns_topic ? 1 : 0
  arn    = aws_sns_topic.sns_alert_topic[0].arn
  policy = data.aws_iam_policy_document.sns-topic-policy[0].json
}

data "aws_iam_policy_document" "sns-topic-policy" {
  count     = var.create_sns_topic ? 1 : 0
  policy_id = "__default_policy_ID"

  statement {
    actions = [
      "SNS:Publish",
    ]

    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["budgets.amazonaws.com"]
    }

    resources = [
      aws_sns_topic.sns_alert_topic[0].arn,
    ]

    sid = "_budgets_service_access_ID"
  }

  statement {
    actions = [
      "SNS:Subscribe",
      "SNS:SetTopicAttributes",
      "SNS:RemovePermission",
      "SNS:Receive",
      "SNS:Publish",
      "SNS:ListSubscriptionsByTopic",
      "SNS:GetTopicAttributes",
      "SNS:DeleteTopic",
      "SNS:AddPermission",
    ]

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceOwner"

      values = [
        var.aws_sns_account_id,
      ]
    }

    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    resources = [
      aws_sns_topic.sns_alert_topic[0].arn,
    ]

    sid = "__default_statement_ID"
  }
}
