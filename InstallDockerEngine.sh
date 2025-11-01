## 解除安裝舊版本
#sudo dnf remove docker \
#                  docker-client \
#                  docker-client-latest \
#                  docker-common \
#                  docker-latest \
#                  docker-latest-logrotate \
#                  docker-logrotate \
#                  docker-engine \
#                  podman \
#                  runc

# 使用 rpm 倉庫進行安裝
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo

# 安裝 Docker Engine
# 1.安裝 Docker 軟體包。
sudo dnf -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
# 2.啟動 Docker 引擎。
sudo systemctl enable --now docker
# 3.運行hello-world鏡像驗證安裝是否成功：
sudo docker run hello-world

# 搜尋Docker Hub上的ubuntu版本
docker seach --no-trunc ubuntu
# 下載ubuntu映像
docker pull ubuntu

# 安裝git
sudo dnf -y install git
git --version

# 建置容器映像
# 使用 Git 複製範例應用程式的存放庫：
git clone https://github.com/SarahMon-Hub/sudobank.git
# 使用 docker build 命令建立容器映像，並將其標記為 aci-tutorial-app：
#sudo docker build ./sudobank -t sudobank
## 使用 docker images 命令查看已建置的映像：
#sudo docker images
## 顯示所有狀態的容區
#sudo docker ps -a
### 手動刪除正在執行的容區
##sudo docker rm -f intelligent_merkle
### 手動強制刪除映像
##sudo docker rmi -f aci-tutorial-app
#
## 停止一個或多個正在運行的容器
## sudo docker container stop [OPTIONS] CONTAINER [CONTAINER...]
## 終止一個或多個正在運行的容器
## sudo docker container kill [OPTIONS] CONTAINER [CONTAINER...]
#
## 在本機執行容器
#sudo docker run -d -p 80:80 aci-tutorial-app

## 解除安裝 Docker Engine
## 1.卸載 Docker Engine、CLI、containerd 和 Docker Compose 軟體包：
#sudo dnf remove docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras
## 2.主機上的鏡像、容器、磁碟區或自訂設定檔不會自動刪除。若要刪除所有鏡像、容器和磁碟區：
#sudo rm -rf /var/lib/docker
#sudo rm -rf /var/lib/containerd
