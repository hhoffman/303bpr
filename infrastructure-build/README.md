To begin writing a Terraform configuration while adhering to the best practices, we create the files below in the project’s root directory.

provider.tf – containing the terraform block, s3 backend definition, provider configurations, and aliases.
main.tf – containing the resource blocks which define the resources to be created in the target cloud platform.
variables.tf – containing the variable declarations used in the resource blocks.
output.tf – containing the output that needs to be generated on successful completion of “apply” operation.
*.tfvars – containing the environment-specific default values of variables.

To build a new system, run the following commands:
terraform plan -out tfplan -var vm_hostname="HOSTNAME-INSTANCE_NBR"
terraform apply tfplan
