'執行 terraform 計劃 並指定 destroy 旗標'
terraform plan -destroy -out .\sudo\main.destroy.tfplan
'執行 terraform apply 來應用執行計劃'
terraform apply .\sudo\main.destroy.tfplan
