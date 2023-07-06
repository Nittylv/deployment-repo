#####   DEV

terraform init --backend-config=./env/dev.conf -reconfigure
terraform plan -var-file=./env/dev.tfvars
terraform apply -var-file=./env/dev.tfvars
terraform destroy -var-file=./env/dev.tfvars