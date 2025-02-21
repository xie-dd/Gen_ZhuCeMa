%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% fun1
function Falg = Verify_License_File()
    MachineFile = "File_Machine_Code_2025.lic";
    Gen_Machine_Code(MachineFile)

    LicenseFile = "File_License_2025.lic";
    Falg = false;


    if ~exist(LicenseFile,'file') 
        fprintf("设备文件生成完成: %s\n",MachineFile);
        fprintf("请交付管理员获得注册文件。\n");
        return
    end
    

    if ~exist('public_key.txt','file') 
        fprintf("%s not exist.\n",'public_key.txt');
        return
    end

    
    cmd = sprintf("rsa_xdd_v2.0 -v %s %s public_key.txt",LicenseFile,MachineFile);
    status = system(cmd);
    
    if status==1
        Falg = true;
    else
        fprintf("设备文件生成完成: %s\n",MachineFile);
        fprintf("请交付管理员获得注册文件。\n");
    end

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% fun1




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% fun2
function Gen_Machine_Code(MachineFile)
    
    cmd = 'wmic baseboard get serialnumber';% 主板序列号
    [~, result] = system(cmd);
    fields = textscan(result, '%s', 'Delimiter', '\n');
    BaseBoardKEY = strip(fields{1}{2}); 
    
    cmd = 'wmic cpu get processorid';% CPU序列号
    [~, result] = system(cmd);
    fields = textscan(result, '%s', 'Delimiter', '\n');
    CPUKEY = strip(fields{1}{2});
    
    STR_ORG = sprintf("%s2GHLMCL%s",BaseBoardKEY,CPUKEY);
       
    fid = fopen(MachineFile,"w");
    fprintf(fid,"%s",STR_ORG);
    fclose(fid);
    
    % fprintf("设备文件生成完成: %s\n",MachineFile);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% fun2