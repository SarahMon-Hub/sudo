'初始化 Terraform'
terraform init -upgrade
'建立 Terraform 執行計劃'
terraform plan -out .\sudo\main.tfplan
'套用 Terraform 執行計畫'
terraform apply .\sudo\main.tfplan
'確認結果'
terraform output -raw container_ipv4_address