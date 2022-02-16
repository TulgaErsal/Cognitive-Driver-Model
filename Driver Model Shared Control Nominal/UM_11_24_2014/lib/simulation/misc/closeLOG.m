function closeLOG(SIM)

if SIM.LOGS == YES
    fclose(SIM.fid);
    closePOPUP(SIM.fname);
end