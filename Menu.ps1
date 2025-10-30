function Show-Menu
{
    param
    (
        [string]$Title = 'Cloud Shell Menu'
    )
    #cls
    Write-Host ""
    Write-Host "================ $Title ================"
    Write-Host "1: 確認預設的 Azure 訂用帳戶"
    Write-Host "2: 安裝和設定 Terraform"
    Write-Host "21: Terraform 部署"
	 Write-Host "22: 清理資源"
    Write-Host "31: 部署容器執行個體"
    Write-Host "32: 提取容器日誌"
    Write-Host "33: 清理資源"
    Write-Host "Q: 離開"
}

do
{
    Show-Menu
    $input = Read-Host "請選擇執行項目"
    switch ($input)
    {
        '1'
        {
           #cls
           ''
           az account show
           ''
        }
        '2'
        {
           #cls
           ''
           #.\InstallTerraform.ps1
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
           ''
        }
        '21'
        {
            #cls
           ''
           '初始化 Terraform'
            terraform init -upgrade
            '建立 Terraform 執行計劃'
            terraform plan -out main.tfplan
            '套用 Terraform 執行計畫'
            terraform apply main.tfplan
            '確認結果'
            terraform output -raw container_ipv4_address
           ''
        }
        '22'
        {
           #cls
           ''
			  '執行 terraform 計劃 並指定 destroy 旗標'
			  terraform plan -destroy -out main.destroy.tfplan
			  '執行 terraform apply 來應用執行計劃'
			  terraform apply main.destroy.tfplan
           ''
        }
        '31'
        {
           #cls
           ''
           '建立資源群組'
           az group create --name SudoGroup --location eastasia
           '建立容器'
           az container create --resource-group SudoGroup --name sudocntr --image mcr.microsoft.com/azuredocs/aci-helloworld --dns-name-label sudo-bank --ports 80 --os-type linux --memory 1.5 --cpu 1
           '顯示容器的完整網域名稱 (FQDN) 及其佈建狀態'
           az container show --resource-group SudoGroup --name sudocntr --query "{FQDN:ipAddress.fqdn,ProvisioningState:provisioningState}" --out table
           ''
        }
        '32'
        {
           #cls
           ''
           #'提取容器日誌'
           az container logs --resource-group SudoGroup --name sudocntr
           #'附加輸出串流'
           #az container attach --resource-group SudoGroup --name sudocntr
           ''
        }
        '33'
        {
           #cls
           ''
           '移除容器'
           az container delete --resource-group SudoGroup --name SudoCNTR -y
           '確認容器已刪除'
           az container list --resource-group SudoGroup --output table
           '刪除資源'
           az group delete --name SudoGroup -y
           ''
        }
        'q'
        {
            return
        }
    }
    pause
}
until ($input -eq 'q')