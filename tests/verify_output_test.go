package tests

import (
    "testing"

    "github.com/gruntwork-io/terratest/modules/terraform"
    "github.com/stretchr/testify/assert"
)

func TestAWSBudget(t *testing.T) {
    expectedBudgetName                  := "[\n  \"budget-Amazon Elastic Compute Cloud - Compute-MONTHLY-dev-test-50-percent\",\n]"
    expectedBudgetLimitAmount           := "[\n  \"500.0\",\n]"
    expectedBudgetCurrency              := "[\n  \"USD\",\n]"
    expectedBudgetTimePeriodStart       := "[\n  \"2020-01-01_00:00\",\n]"
    expectedBudgetTimePeriodEnd         := "[\n  \"2020-12-31_23:59\",\n]"
    expectedBudgetTimeUnit              := "[\n  \"MONTHLY\",\n]"
    expectedBudgetCostFilterService     := "[\n  \"Amazon Elastic Compute Cloud - Compute\",\n]"
    expectedBudgetSnsTopicArn           := "arn:aws:sns:us-east-1:523857393444:budget-billing-alarm-notification-usd-dev-test-50-percent"

    terraformOptions := &terraform.Options {
        // The path to where our Terraform code is located
        TerraformDir: "fixture/",

        // Disable colors in Terraform commands so its easier to parse stdout/stderr
        NoColor: true,
    }

    // At the end of the test, run `terraform destroy` to clean up any resources that were created
    defer terraform.Destroy(t, terraformOptions)

    // This will run `terraform init` and `terraform apply` and fail the test if there are any errors
    terraform.InitAndApply(t, terraformOptions)

    // Run `terraform output` to get the values of output variables
    actualBudgetName              := terraform.Output(t, terraformOptions, "budget_name")
    actualBudgetLimitAmount       := terraform.Output(t, terraformOptions, "budget_limit_amount")
    actualBudgetCurrency          := terraform.Output(t, terraformOptions, "budeget_currency")
    actualBudgetTimePeriodStart   := terraform.Output(t, terraformOptions, "budget_time_period_start")
    actualBudgetTimePeriodEnd     := terraform.Output(t, terraformOptions, "budget_time_period_end")
    actualBudgetTimeUnit          := terraform.Output(t, terraformOptions, "budget_time_unit")
    actualBudgetCostFilterService := terraform.Output(t, terraformOptions, "budget_cost_filters_service")
    actualBudgetSnsTopicArn       := terraform.Output(t, terraformOptions, "budget_sns_topic_arn")


    // Verify we're getting back the outputs we expect
    assert.Equal(t, expectedBudgetName, actualBudgetName)
    assert.Equal(t, expectedBudgetLimitAmount, actualBudgetLimitAmount)
    assert.Equal(t, expectedBudgetCurrency, actualBudgetCurrency)
    assert.Equal(t, expectedBudgetTimePeriodStart, actualBudgetTimePeriodStart)
    assert.Equal(t, expectedBudgetTimePeriodEnd, actualBudgetTimePeriodEnd)
    assert.Equal(t, expectedBudgetTimeUnit, actualBudgetTimeUnit)
    assert.Equal(t, expectedBudgetCostFilterService, actualBudgetCostFilterService)
    assert.Equal(t, expectedBudgetSnsTopicArn, actualBudgetSnsTopicArn)
}
