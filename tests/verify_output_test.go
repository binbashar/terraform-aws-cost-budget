package tests

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestInstanceJenkinsVault(t *testing.T) {
    expectedInstanceType                    := "t3.small"
	expectedInstanceKeyName                 := "bb-infra-deployer"
    expectedInstanceProfile                 := "JenkinsProfileTest"
    expectedInstanceProfileRoleName         := "JenkinsAssumeRoleTest"
    expectedInstanceDnsRecordJenkins        := "jenkins-test.aws.binbash.com.ar"
    expectedInstanceDnsRecordVault          := "vault-test.aws.binbash.com.ar"
    expectedInstanceDnsRecordLetsencrypt    := "_acme-challenge-test.aws.binbash.com.ar"
    expectedInstanceVolumeSizeJenkins       := "100"
    expectedInstanceVolumeSizeDocker        := "100"
    expectedBucketVaultName                 := "bb-shared-vault-storage-terratest.s3.amazonaws.com"
    expectedBucketLetsencryptName           := "bb-shared-ssl-certificates-terratest.s3.amazonaws.com"

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
	actualInstanceType                    := terraform.Output(t, terraformOptions, "aws_instance_type")
	actualInstanceKeyName                 := terraform.Output(t, terraformOptions, "aws_instance_key_name")
    actualInstanceProfile                 := terraform.Output(t, terraformOptions, "aws_instance_iam_profile")
    actualInstanceProfileRoleName         := terraform.Output(t, terraformOptions, "aws_iam_jenkins_assume_role_name")
    actualInstanceDnsRecordJenkins        := terraform.Output(t, terraformOptions, "aws_route53_record_jenkins_name")
    actualInstanceDnsRecordVault          := terraform.Output(t, terraformOptions, "aws_route53_record_vault_name")
    actualInstanceDnsRecordLetsencrypt    := terraform.Output(t, terraformOptions, "aws_route53_record_letsencrypt_name")
    actualInstanceVolumeSizeJenkins       := terraform.Output(t, terraformOptions, "aws_ebs_volume_jenkins_data_size")
    actualInstanceVolumeSizeDocker        := terraform.Output(t, terraformOptions, "aws_ebs_volume_jenkins_docker_data_size")
    actualBucketVaultName                 := terraform.Output(t, terraformOptions, "aws_s3_bucket_vault_bucket_domain_name")
    actualBucketLetsencryptName           := terraform.Output(t, terraformOptions, "aws_s3_bucket_ssl_certificates_bucket_domain_name")

	// Verify we're getting back the outputs we expect
	assert.Equal(t, expectedInstanceType, actualInstanceType)
	assert.Equal(t, expectedInstanceKeyName, actualInstanceKeyName)
    assert.Equal(t, expectedInstanceProfile, actualInstanceProfile)
    assert.Equal(t, expectedInstanceProfileRoleName, actualInstanceProfileRoleName)
    assert.Equal(t, expectedInstanceDnsRecordJenkins, actualInstanceDnsRecordJenkins)
    assert.Equal(t, expectedInstanceDnsRecordVault, actualInstanceDnsRecordVault)
    assert.Equal(t, expectedInstanceDnsRecordLetsencrypt, actualInstanceDnsRecordLetsencrypt)
    assert.Equal(t, expectedInstanceVolumeSizeJenkins, actualInstanceVolumeSizeJenkins)
    assert.Equal(t, expectedInstanceVolumeSizeDocker, actualInstanceVolumeSizeDocker)
    assert.Equal(t, expectedBucketVaultName, actualBucketVaultName)
    assert.Equal(t, expectedBucketLetsencryptName, actualBucketLetsencryptName)
}