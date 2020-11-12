# 현재 sh파일의 위치를 가져옴 ($DIR/sub/*.sh 실행을 위함)
DIR="$( cd "$( dirname "$BASH_SOURCE" )" && pwd -P )"

sudo service tomcat8 stop
sudo rm /etc/systemd/system/tomcat8.service
rm -rf ~/tomcat8

$DIR/../sub/tomcat.sh