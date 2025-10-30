'判斷 Cloud Shell 中使用的 Terraform 版本'
terraform version
# https://developer.hashicorp.com/terraform/install
'下載目前的 Terraform 版本'
curl -O https://releases.hashicorp.com/terraform/1.13.4/terraform_1.13.4_linux_amd64.zip
'將檔案解壓縮'
unzip terraform_1.13.4_linux_amd64.zip
'建立bin目錄'
mkdir bin
'將 terraform 檔案移至 bin 目錄'
mv terraform bin/ 
'確認下載的 Terraform 版本在系統搜尋路徑中位於第一順序'
terraform version
'刪除下載壓縮檔'
rm terraform_1.13.4_linux_amd64.zip
# az account show