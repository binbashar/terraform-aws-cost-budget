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
  default     = "bb-shared-oaar"
}

#=============================#
# Backend Config (partial)    #
#=============================#
terraform {
  required_version = ">= 0.11.14"
}

#=============================#
# Data sources                #
#=============================#
variable "region_backend_data" {
  description = "AWS Region"
  default     = "us-east-1"
}

data "terraform_remote_state" "vpc" {
  backend = "s3"

  config {
    region  = "${var.region_backend_data}"
    profile = "${var.profile_shared}"
    bucket  = "bb-shared-terraform-state-storage-s3"
    key     = "shared/network/terraform.tfstate"
  }
}

data "terraform_remote_state" "security" {
  backend = "s3"

  config {
    region  = "${var.region_backend_data}"
    profile = "${var.profile_shared}"
    bucket  = "bb-shared-terraform-state-storage-s3"
    key     = "shared/security/terraform.tfstate"
  }
}

#=============================#
# Project Variables           #
#=============================#
variable "environment" {
  description = "Environment Name"
  default     = "dev"
}

#=============================#
# External Accounts Data      #
#=============================#
variable "dev_account_id" {
  description = "Dev/Stage Account ID"
  default     = "111111111111"
}

variable "security_account_id" {
  description = "Account: Security & Users Management"
  default     = "222222222222"
}

variable "shared_account_id" {
  description = "Account: Shared Resources"
  default     = "333333333333"
}

#=============================#
# Compute                     #
#=============================#
variable "aws_ami_os_id" {
  description = "AWS AMI Operating System Identificator"
  default     = "ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"
}

variable "aws_ami_os_owner" {
  description = "AWS AMI Operating System Owner"
  default     = "099720109477"
}

variable "instance_type" {
  description = "AWS EC2 Instance Type"
  default     = "t3.small"
}

#=============================#
# Storage                     #
#=============================#
#
# EBS
#
variable "volume_size_root" {
  description = "EBS volume size"
  default     = 20
}

variable "volume_az_extra" {
  description = "EBS volume size"
  default     = "us-east-1a"
}

variable "volume_size_extra_1" {
  description = "EBS volume size"
  default     = 100
}

variable "volume_size_extra_2" {
  description = "EBS volume size"
  default     = 100
}

#
# S3
#
variable "aws_s3_bucket_name_1" {
  description = "AWS S3 bucket name"
  default     = "bb-shared-vault-storage-terratest"
}

variable "aws_s3_bucket_name_2" {
  description = "AWS S3 bucket name"
  default     = "bb-shared-ssl-certificates-terratest"
}

#=============================#
# Security                    #
#=============================#

#
# SG private for aws org CIDR
#
variable "sg_private_name" {
  description = "Security group name"
  default     = "jenkins-vault-private-test"
}

// 22   ssh
// 80   http jenkins
// 443  https jenkins
// 8080 http jenkins default
// 8200 hashicorp vault
// 9100 prometheus node exporter
variable "sg_private_tpc_ports" {
  description = "Security group TCP ports"
  default     = "22,80,443,8080,8200,9100"
}

variable "sg_private_udp_ports" {
  description = "Security group UDP ports"
  default     = ""
}

variable "sg_private_cidrs" {
  description = "Security group CIDR segments"
  default     = "172.17.0.0/20"
}

variable "aws_iam_instance_profile_jenkins_name" {
  description = "AWS IAM EC2 profile name"
  default     = "JenkinsProfileTest"
}

variable "aws_iam_jenkins_assume_role_name" {
  description = "AWS IAM EC2 role for instance profile"
  default     = "JenkinsAssumeRoleTest"
}

variable "aws_iam_policy_jenkins_access_name" {
  description = "AWS IAM policy for the instance profile role"
  default     = "JenkinsAccessPolicyTests"
}

variable "aws_iam_role_name_1" {
  description = "AWS IAM Role to be assumed cross-org, eg: DeployMaster or DevOps"
  default     = "DeployMaster"
}

variable "aws_iam_role_name_2" {
  description = "AWS IAM Role to be assumed cross-org, eg: Auditor"
  default     = "Auditor"
}

#=============================#
# Provisioner: aws userdata   #
#=============================#
variable "aws_userdata_path" {
  description = "AWS EC2 userdata provisioning script path"
  default     = "./provisioner/aws-userdata/userdata.sh"
}

#=============================#
# DNS                         #
#=============================#
variable "instance_dns_record_name_1" {
  description = "AWS EC2 Instance Type"
  default     = "jenkins-test.aws.binbash.com.ar"
}

variable "instance_dns_record_name_2" {
  description = "AWS EC2 Instance Type"
  default     = "vault-test.aws.binbash.com.ar"
}

// https://www.bennadel.com/blog/3420-obtaining-a-wildcard-ssl-certificate-from-letsencrypt-using-the-dns-challenge.htm
//Please deploy a DNS TXT record under the name
//_acme-challenge.aws.binbash.com.ar with the following value
variable "letsencrypt_dns_record_name" {
  description = "AWS EC2 Instance Type"
  default     = "_acme-challenge-test.aws.binbash.com.ar"
}

variable "letsencrypt_dns_record_value" {
  description = "AWS EC2 Instance Type"
  default     = "aT6cBMN_O-XXXXXXXXXXXXXXXXXXXXXXXXX-test"
}
