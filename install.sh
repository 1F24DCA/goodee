#!/bin/bash


# 현재 sh파일의 위치를 가져옴 ($DIR/sub/*.sh 실행을 위함)
DIR="$( cd "$( dirname "$BASH_SOURCE" )" && pwd -P )"


echo ''
echo '##############'
echo '# APT UPDATE #'
echo '##############'
echo ''


# 프로그램 설치 관리자 업데이트
sudo apt update


echo ''
echo '################'
echo '# JAVA INSTALL #'
echo '################'
echo ''


# sub 폴더의 java.sh를 이용하여 자바 설치
sudo $DIR/sub/java.sh


echo ''
echo '##################'
echo '# TOMCAT INSTALL #'
echo '##################'
echo ''


# sub 폴더의 tomcat.sh를 이용하여 자바 설치
sudo $DIR/sub/tomcat.sh


echo ''
echo '###################'
echo '# MARIADB INSTALL #'
echo '###################'
echo ''


# sub 폴더의 mariadb.sh를 이용하여 자바 설치
sudo $DIR/sub/mariadb.sh


echo ''
echo '############'
echo '# FINISHED #'
echo '############'
echo ''

echo '#### JAVA VERSION ####'
java -version
echo ''

echo '#### TOMCAT VERSION ####'
/home/ubuntu/tomcat9/bin/version.sh
echo ''

echo '#### MARIADB VERSION ####'
mysql -V
echo ''

