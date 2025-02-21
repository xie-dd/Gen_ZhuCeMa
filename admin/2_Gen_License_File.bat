@echo off

chcp 65001


rsa_xdd_v2.0   -e  File_Machine_Code_2025.lic  File_License_2025.lic  private_key.txt
echo.


echo 如果下面一行为 Match Success, 则表明注册文件验证成功，可交付
rsa_xdd_v2.0   -v  File_License_2025.lic       File_Machine_Code_2025.lic  public_key.txt

echo.
echo 请把公钥文件 public_key.txt 和证书文件 File_License_2025.lic 发给使用者!
echo.
echo.

pause