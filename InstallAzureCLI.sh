# 1.匯入 Microsoft 存放庫金鑰。 針對 RHEL 10 和 CentOS Stream 10
# sudo rpm --import https://packages.microsoft.com/keys/microsoft-2025.asc
# 針對較低版本，請使用下列命令：
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

# 2.針對 RHEL 10，新增存放 packages-microsoft-com-prod 庫：
# sudo dnf install -y https://packages.microsoft.com/config/rhel/10/packages-microsoft-prod.rpm
# 新增 CentOS Stream 10 的 packages-microsoft-com-prod 倉庫：
# sudo dnf install -y https://packages.microsoft.com/config/centos/10/packages-microsoft-prod.rpm
# 針對 RHEL 9 或 CentOS Stream 9，新增存放 packages-microsoft-com-prod 庫：
# sudo dnf install -y https://packages.microsoft.com/config/rhel/9.0/packages-microsoft-prod.rpm
# 針對 RHEL 8，新增 packages-microsoft-com-prod 存放庫：
sudo dnf install -y https://packages.microsoft.com/config/rhel/8/packages-microsoft-prod.rpm
# 針對 RHEL 7，新增 azure-cli 存放庫：
# echo -e "[azure-cli]
# name=Azure CLI
# baseurl=https://packages.microsoft.com/yumrepos/azure-cli
# enabled=1
# gpgcheck=1
# gpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/azure-cli.repo

# 3.使用 dnf install 命令進行安裝。
sudo dnf install azure-cli

# 安裝特定版本
# 1.若要使用 命令檢視可用的版本：
dnf list --showduplicates azure-cli
# 2.若要安裝特定版本
# sudo dnf install azure-cli-<version>-1.el7

# 更新 Azure CLI
# 從 2.11.0 版開始，Azure CLI 會提供工具內命令來更新至最新版本。
az upgrade
# 也可以使用 dnf update 命令來更新 Azure CLI
# sudo dnf update azure-cli

## 卸載 Azure CLI
## 1.從系統移除套件。
#sudo dnf remove azure-cli
## 2.如果您不打算重新安裝 CLI，請移除存放庫資訊。
#sudo rm /etc/yum.repos.d/azure-cli.repo
## 3.如果您未使用任何其他Microsoft套件，請移除簽署密鑰。
#MSFT_KEY=`rpm -qa gpg-pubkey /* --qf "%{version}-%{release} %{summary}\n" | grep Microsoft | awk '{print $1}'`
#sudo rpm -e --allmatches gpg-pubkey-$MSFT_KEY
#
## 刪除資料
## 如果您不打算重新安裝 Azure CLI，請移除其數據。
#rm -rf ~/.azure