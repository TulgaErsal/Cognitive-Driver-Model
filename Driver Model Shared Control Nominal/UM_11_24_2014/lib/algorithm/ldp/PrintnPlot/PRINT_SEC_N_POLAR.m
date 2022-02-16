function PRINT_SEC_N_POLAR(SECINFO, EP_POLAR, SIM)

if SIM.LOGS == YES
    NSEC = size(SECINFO, 1);
    
    fprintf(SIM.fid, '\t * Basic sector information\n');
    formatSpec = '%8.0f%9.0f%9.0f%8.0f%9.0f\n';
    for i = 1:NSEC
        fprintf(SIM.fid, formatSpec, SECINFO(i,:));
    end
    fprintf(SIM.fid, '\n');
    
    fprintf(SIM.fid, '\t * End points in local polar coordinate\n');
    formatSpec = '%10.1f%10.1f%10.1f%10.1f\n';
    for i = 1:NSEC
        fprintf(SIM.fid, formatSpec, EP_POLAR(i,1:2)*180/pi, EP_POLAR(i,3:4));
    end
    fprintf(SIM.fid, '\n');
end