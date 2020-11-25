# Tomcat 다운로드 (압축파일)
wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.40/bin/apache-tomcat-9.0.40.tar.gz

# Tomcat 압축을 풀고 압축파일 삭제
tar zxvf apache-tomcat-9.0.40.tar.gz
rm apache-tomcat-9.0.40.tar.gz

# Tomcat 폴더 이름을 보기 편하게 변경함
sudo mv apache-tomcat-9.0.40 /home/ubuntu/tomcat9

# Tomcat 서비스 포트 변경 (<Connector port="8080" ... > 변경)
sudo sed 's/port="8080"/port="80"/g' /home/ubuntu/tomcat9/conf/server.xml > ./server.xml
sudo mv ./server.xml /home/ubuntu/tomcat9/conf/server.xml

# Tomcat 서비스 등록
touch tomcat9.service
echo '[Unit]' >> tomcat9.service
echo 'Description=Apache Tomcat Web Application Container' >> tomcat9.service
echo 'After=syslog.target network.target' >> tomcat9.service
echo '' >> tomcat9.service
echo '[Service]' >> tomcat9.service
echo 'Type=forking' >> tomcat9.service
echo '' >> tomcat9.service
echo 'ExecStart=/home/ubuntu/tomcat9/bin/catalina.sh start' >> tomcat9.service
echo 'ExecStop=/home/ubuntu/tomcat9/bin/catalina.sh stop' >> tomcat9.service
echo '' >> tomcat9.service
echo 'User=root' >> tomcat9.service
echo 'Group=root' >> tomcat9.service
echo 'RestartSec=10' >> tomcat9.service
echo 'Restart=always' >> tomcat9.service
echo '' >> tomcat9.service
echo '[Install]' >> tomcat9.service
echo 'WantedBy=multi-user.target' >> tomcat9.service
sudo mv tomcat9.service /etc/systemd/system/

# 등록한 Tomcat 서비스를 불러옴
sudo systemctl daemon-reload

# 인스턴스 재시작시 톰캣을 자동 실행
sudo systemctl enable tomcat9

# Tomcat 실행
sudo service tomcat9 start