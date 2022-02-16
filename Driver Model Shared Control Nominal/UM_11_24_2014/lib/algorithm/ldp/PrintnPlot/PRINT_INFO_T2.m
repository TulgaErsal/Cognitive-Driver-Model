function PRINT_INFO_T2(INFO, SIM)

if SIM.LOGS == YES
    NSEC = size(INFO.SECINFO, 1);
    
    fprintf(SIM.fid, '\t * Basic sector information\n');
    formatSpec = '%8.0f%9.0f\n';
    for i = 1:NSEC
        fprintf(SIM.fid, formatSpec, INFO.SECINFO(i,1), INFO.SECINFO(i,5));
    end
    fprintf(SIM.fid, '\n');

    fprintf(SIM.fid, '\t * End points in local Cartesian coordinate\n');
    formatSpec = '%10.1f%10.1f%10.1f%10.1f%10.1f%10.1f\n';
    for i = 1:NSEC
        fprintf(SIM.fid, formatSpec, INFO.EP_LOCAL(i,1:6));
    end
    fprintf(SIM.fid, '\n');
    
    fprintf(SIM.fid, '\t * End points in local polar coordinate\n');
    formatSpec = '%10.1f%10.1f%10.1f%10.1f\n';
    for i = 1:NSEC
        fprintf(SIM.fid, formatSpec, INFO.EP_POLAR(i,1:2)*180/pi, INFO.EP_POLAR(i,3:4));
    end
    fprintf(SIM.fid, '\n');
    
    NSEC2 = size(INFO.SECINFO_T2, 1);
    
    fprintf(SIM.fid, '\t * Final sector information\n');
    formatSpec = '%4.0f%4.0f%4.0f%4.0f%4.0f%4.0f%4.0f\n';
    for i = 1:NSEC2
        fprintf(SIM.fid, formatSpec, INFO.SECINFO_T2(i,1:7));
    end
    fprintf(SIM.fid, '\n');
end