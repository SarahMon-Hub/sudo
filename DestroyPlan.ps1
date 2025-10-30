'執行 terraform 計劃 並指定 destroy 旗標'
terraform plan -destroy -out main.destroy.tfplan
'執行 terraform apply 來應用執行計劃'
terraform apply main.destroy.tfplan
