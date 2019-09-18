#
# Compute
#
output "aws_instance_private_ip" {
  description = "Contains the private IP address."
  value       = "${module.terraform-aws-ec2-jenkins-vault.aws_instance_private_ip}"
}

output "aws_instance_type" {
  description = "The type of the Instance."
  value       = "${module.terraform-aws-ec2-jenkins-vault.aws_instance_type}"
}

output "aws_instance_ami" {
  description = "The AMI of the Instance."
  value       = "${module.terraform-aws-ec2-jenkins-vault.aws_instance_ami}"
}

output "aws_instance_key_name" {
  description = "The ssh key pair name of the Instance."
  value       = "${module.terraform-aws-ec2-jenkins-vault.aws_instance_key_name}"
}

output "aws_instance_iam_profile" {
  description = "The IAM instance profile of the EC2."
  value       = "${module.terraform-aws-ec2-jenkins-vault.aws_instance_iam_profile}"
}

output "aws_instance_volume_tags" {
  description = "The root EBS volume tags of the instace."
  value       = "${module.terraform-aws-ec2-jenkins-vault.aws_instance_volume_tags}"
}

#
# Network
#
output "aws_route53_record_jenkins_name" {
  description = "The AWS Route53 record for jenkins."
  value       = "${module.terraform-aws-ec2-jenkins-vault.aws_route53_record_jenkins_name}"
}

output "aws_route53_record_vault_name" {
  description = "The AWS Route53 record for hashicorp vault."
  value       = "${module.terraform-aws-ec2-jenkins-vault.aws_route53_record_vault_name}"
}

output "aws_route53_record_letsencrypt_name" {
  description = "The AWS Route53 record for letsencrypt wildcard domain DNS challenge validation."
  value       = "${module.terraform-aws-ec2-jenkins-vault.aws_route53_record_letsencrypt_name}"
}

#
# Storage
#
output "aws_ebs_volume_jenkins_data_size" {
  description = "The AWS EBS volume size for /var/lib/jenkins on this EC2"
  value       = "${module.terraform-aws-ec2-jenkins-vault.aws_ebs_volume_jenkins_data_size}"
}

output "aws_ebs_volume_jenkins_docker_data_size" {
  description = "The AWS EBS volume size for /var/lib/docker on this EC2"
  value       = "${module.terraform-aws-ec2-jenkins-vault.aws_ebs_volume_jenkins_docker_data_size}"
}

output "aws_s3_bucket_vault_bucket_domain_name" {
  description = "AWS S3 Bucket to work as the hashicorp vault persistent storage backend."
  value       = "${module.terraform-aws-ec2-jenkins-vault.aws_s3_bucket_vault_bucket_domain_name}"
}

output "aws_s3_bucket_ssl_certificates_bucket_domain_name" {
  description = "AWS S3 Bucket to keep the letsencrypt generated certificates ."
  value       = "${module.terraform-aws-ec2-jenkins-vault.aws_s3_bucket_ssl_certificates_bucket_domain_name}"
}

#
# Security
#
output "aws_iam_ec2_profile_role_arn" {
  description = "Contains the aws iam role attached to the EC2 profile. Useful attach (aws_iam_role_policy_attachment) your custom policy"
  value       = "${module.terraform-aws-ec2-jenkins-vault.aws_iam_ec2_profile_role_arn}"
}

output "aws_iam_instance_profile_jenkins_name" {
  description = "The IAM instance profile of the EC2."
  value       = "${module.terraform-aws-ec2-jenkins-vault.aws_iam_instance_profile_jenkins_name}"
}

output "aws_iam_jenkins_assume_role_name" {
  description = "The IAM instance profile of the EC2."
  value       = "${module.terraform-aws-ec2-jenkins-vault.aws_iam_jenkins_assume_role_name}"
}
