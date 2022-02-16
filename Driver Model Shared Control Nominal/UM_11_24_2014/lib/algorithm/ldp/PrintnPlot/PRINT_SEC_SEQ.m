function PRINT_SEC_SEQ(INFO, SIM)

if SIM.LOGS == YES
    fprintf(SIM.fid, '___________________________________________________________________________\n');
    fprintf(SIM.fid, '@ Remaing Sectors\n');
    formatSpec = '%4.0f ';
    for i = 1:length(INFO.SECINFO(:,1))
        fprintf(SIM.fid, formatSpec, INFO.SECINFO(i,1));
    end
    fprintf(SIM.fid, '\n');
    fprintf(SIM.fid, '¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯\n');
end