@ECHO OFF

chcp 65001

rsa_xdd_v2.0   -e  File_Machine_Code_2025.lic  File_License_2025.lic  private_key.txt

echo 请把公钥文件 public_key.txt 和证书文件 File_License_2025.lic 发给使用者!

echo=  
pause