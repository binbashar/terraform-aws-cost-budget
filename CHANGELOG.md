# Change Log

All notable changes to this project will be documented in this file.

<a name="unreleased"></a>
## [Unreleased]



<a name="v1.0.5"></a>
## [v1.0.5] - 2020-09-18

- Merge branch 'master' of github.com:binbashar/terraform-aws-cost-budget
- BBL-381 | minor README.md figures udpate


<a name="v1.0.4"></a>
## [v1.0.4] - 2020-09-18

- BBL-381 | readme.md tf parameters updated
- Merge branch 'master' into BBL-381-testing-ci
- BBL-381 | std repo structure + standalone makefile approach in place
- BBL-192 | updating .gitignore + adding .editorconfig + LICENSE.md + updating Makefile docker img ver


<a name="v1.0.3"></a>
## [v1.0.3] - 2020-07-20

- BBL-167 updating changelog config
- propagating project name var


<a name="v1.0.2"></a>
## [v1.0.2] - 2020-07-10

- BBL-167 updating test related files in .gitignore
- BBL-167 std structre realted improvements


<a name="v1.0.1"></a>
## [v1.0.1] - 2020-07-09

- BBL-167 fixing format check
- BBL-167 adding count and indexes to fix error when passing external sns topic


<a name="v1.0.0"></a>
## [v1.0.0] - 2020-07-07

- BBL-122 switching tests to proper role
- BBL-122 module migrated and tested for tf 0.12.x


<a name="v0.0.6"></a>
## [v0.0.6] - 2019-09-20

- BBL-122 adding filters branches ignore master for testing jobs


<a name="v0.0.5"></a>
## [v0.0.5] - 2019-09-20

- BBL-122 adding context to release-workflow-job
- BBL-122 updating role in tf code with deploymaster
- BBL-122 segregating terratets steps
- BBL-122 adding terratest-dep-init pre-step cmd
- BBL-122 echoing aws configs to debug
- BBL-122 correcting aws auth files
- BBL-122 correcting aws auth files
- BBL-122 adding binbashar-org-global-context to circleci job
- BBL-122 adding binbashar-org-global-context to circleci job
- BBL-122 updating aws cmds
- BBL-122 fixing circle test jobs
- BBL-122 fixing circle job to have validated sintaxt
- BBL-122 adding circleci validate file in makefile
- BBL-122 fixing circle job indentation error
- BBL-122 fixing circle job indentation error
- BBL-122 CircleCI static tests and terratests added - to be tested yet
- BBL-122 go test indentation corrected
- BBL-122 updating examples


<a name="v0.0.4"></a>
## [v0.0.4] - 2019-09-19

- BBL-121 updating Makefile for auto-release circle-ci job integration
- BBL-121 updating .gitignore to allow circleci config file
- BBL-121 sns policy readme update
- BBL-121 account id optional parameter for new sns topic configured
- BBL-121 update examples and add details in readme.md
- BBL-121 terratest e2e test for case 5 passed
- BBL-121 adding specific case5 outputs for terratest integration
- BBL-121 small fix to cover the corresponding case
- BBL-121 fixing tflint docker image version for tf0.11
- BBL-121 files updated for terratests
- BBL-121 adding readme related circleci figure
- BBL-121 readme updated with release mgmt info
- BBL-121 adding sns.tf with necessary policy + test folder


<a name="v0.0.3"></a>
## [v0.0.3] - 2019-07-12

- Adding CHANGELOG.md for v0.0.3
- updating figures url by github raw endpoint in order to let README.md images to be publicly accesible by docker-hub and tf-registry among others
- updating public figures url
- Adding examples README.mds to avoid - Submodules without a README or README.md are considered to be internal-only by the Terraform Module Registry.
- updating .gitignore to its std cross-project fmt
- Adding std terratest cmds to Makefile
- fixing example code to be executable + updating example output string with the correrct 'sns' value
- adding CHANGELOG.md with new release semtag v0.0.2


<a name="v0.0.2"></a>
## [v0.0.2] - 2019-07-05

- adding pre-reqs for git-release -> CHANGELOG.md with new semtag v0.0.2
- Readme tf-0.12 related and makefile git-release updates


<a name="v0.0.1"></a>
## v0.0.1 - 2019-06-11

- readme.md minor update
- readme.md minor update
- Set theme jekyll-theme-slate
- Initial commit
- Initial commit


[Unreleased]: https://github.com/binbashar/terraform-aws-cost-budget/compare/v1.0.5...HEAD
[v1.0.5]: https://github.com/binbashar/terraform-aws-cost-budget/compare/v1.0.4...v1.0.5
[v1.0.4]: https://github.com/binbashar/terraform-aws-cost-budget/compare/v1.0.3...v1.0.4
[v1.0.3]: https://github.com/binbashar/terraform-aws-cost-budget/compare/v1.0.2...v1.0.3
[v1.0.2]: https://github.com/binbashar/terraform-aws-cost-budget/compare/v1.0.1...v1.0.2
[v1.0.1]: https://github.com/binbashar/terraform-aws-cost-budget/compare/v1.0.0...v1.0.1
[v1.0.0]: https://github.com/binbashar/terraform-aws-cost-budget/compare/v0.0.6...v1.0.0
[v0.0.6]: https://github.com/binbashar/terraform-aws-cost-budget/compare/v0.0.5...v0.0.6
[v0.0.5]: https://github.com/binbashar/terraform-aws-cost-budget/compare/v0.0.4...v0.0.5
[v0.0.4]: https://github.com/binbashar/terraform-aws-cost-budget/compare/v0.0.3...v0.0.4
[v0.0.3]: https://github.com/binbashar/terraform-aws-cost-budget/compare/v0.0.2...v0.0.3
[v0.0.2]: https://github.com/binbashar/terraform-aws-cost-budget/compare/v0.0.1...v0.0.2
