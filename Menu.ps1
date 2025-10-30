function Show-Menu
{
    param
    (
        [string]$Title = 'Cloud Shell Menu'
    )
    #cls
    Write-Host ""
    Write-Host "================ $Title ================"
    Write-Host "11: 確認預設的 Azure 訂用帳戶"
    Write-Host "21: 設定連接到 github 的帳戶名稱和郵件位址"
    Write-Host "22: 從 github 下載專案"
    Write-Host "31: 安裝和設定 Terraform"
    Write-Host "32: Terraform 部署"
    Write-Host "33: 清理資源"
    Write-Host "41: 部署容器執行個體"
    Write-Host "42: 提取容器日誌"
    Write-Host "43: 清理資源"
    Write-Host "Q: 離開"
}

do
{
    Show-Menu
    $input = Read-Host "請選擇執行項目"
    switch ($input)
    {
        '11'
        {
           #cls
           ''
           az account show
           ''
        }
        '21'
        {
           #cls
           ''
           git config --global user.name SarahMon-Hub
           git config --global user.email sarahmon@ymail.com
           git config --global --list
           ''
        }
        '22'
        {
           #cls
           ''
           git clone https://github.com/SarahMon-Hub/sudo.git
           ''
        }
        '31'
        {
           #cls
           ''
           .\sudo\InstallTerraform.ps1
           ''
        }
        '32'
        {
           #cls
           ''
           .\sudo\DeploymentPlan.ps1
           ''
        }
        '33'
        {
           #cls
           ''
           .\sudo\DestroyPlan.ps1
           ''
        }
        '41'
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
        '42'
        {
           #cls
           ''
           #'提取容器日誌'
           az container logs --resource-group SudoGroup --name sudocntr
           #'附加輸出串流'
           #az container attach --resource-group SudoGroup --name sudocntr
           ''
        }
        '43'
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