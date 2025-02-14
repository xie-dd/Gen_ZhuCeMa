第1步(用户)

1. 用户运行 Main_1.m 主程序，得到一个设备文件 File_Machine_Code_2025.lic
2. 用户将设备文件发给管理员



第2步(管理员)

1. 运行 1_Gen_Public_KEY_Private_KEY.bat 生成一对公钥与私钥文件
2. 将从用户处获得的设备文件放到admin目录
3. 运行 2_Gen_License_File.bat，生成注册文件 File_License_2025.lic
4. 运行 3_Varifty.bat 测试一下是否可以使用公钥文件解密注册文件(非必要)
5. 将注册文件【 File_License_2025.lic】与公钥文件【 public_key.txt】一起发给用户即可



第3步(用户)

1. 将从管理员处获得的注册文件【 File_License_2025.lic】与公钥文件【public_key.txt】放在 File_Machine_Code_2025.lic 相同目录下
2. 运行 Main_1.m 主程序即可使用软件

