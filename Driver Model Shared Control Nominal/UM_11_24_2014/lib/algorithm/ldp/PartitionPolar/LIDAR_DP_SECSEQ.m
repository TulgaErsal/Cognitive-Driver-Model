function SEQ = LIDAR_DP_SECSEQ(IPT, INFO, PBM, SIM)

SEQ = [];

% ________________________________________________________________________
% there is at least one opening
if PBM.CNT_OP ~= 0
    
    for i = 1:PBM.CNT_OP
        SEQ{i}                  = LIDAR_DP_SEQINFO_OP(INFO, PBM, i); %#ok<AGROW>
        
        if PBM.CHECK_S == true || PBM.CHECK_E == true
            SEQ{i}.PHASE1       = LIDAR_DP_SEQINFO_OPP1(IPT, INFO, PBM, SEQ{i}, i); %#ok<AGROW>
            
            if ~isempty(SEQ{i}.PHASE1) && SEQ{i}.PHASE1.RADIUS < 2
                SEQ{i}.PHASE1   = []; %#ok<AGROW>
            end
        else
            SEQ{i}.PHASE1       = []; %#ok<AGROW>
        end 
    end

    % log
    if SIM.LOGS == YES
        LIDAR_DP_SEQLOG_OP(INFO, SEQ, SIM);
    end
    
    SEQ_CNT                     = length(SEQ);
else
    SEQ_CNT                     = 0;
end % if PBM.CNT_OP ~= 0
% ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯



% ________________________________________________________________________
% hypothetical openings
if PBM.CNT_OP == 0
    disp('CNT_OP == 0, to be handled properly')
    
    if PBM.CNT_HP ~= 0
        for i = 1:PBM.CNT_HP
            SEQ_CNT             = SEQ_CNT + 1;
            SEQ{SEQ_CNT}        = LIDAR_DP_SEQINFO_HP(INFO, PBM, i, SIM); %#ok<AGROW>
        end
    end

    if PBM.CNT_LHP ~= 0
        
        for i = 1:PBM.CNT_LHP
            SEQ_CNT             = SEQ_CNT + 1;
            SEQ{SEQ_CNT}        = LIDAR_DP_SEQINFO_LHP1(INFO, PBM, i, SIM); %#ok<AGROW>

            % SEQ_CNT             = SEQ_CNT + 1;
            % SEQ{SEQ_CNT}        = LIDAR_DP_SEQINFO_LHP2(INFO, PBM, i, SIM); %#ok<AGROW>
        end
    end

    if PBM.CNT_RHP ~= 0
        
        for i = 1:PBM.CNT_RHP
            SEQ_CNT             = SEQ_CNT + 1;
            SEQ{SEQ_CNT}        = LIDAR_DP_SEQINFO_RHP1(INFO, PBM, i, SIM); %#ok<AGROW>

            % SEQ_CNT             = SEQ_CNT + 1;
            % SEQ{SEQ_CNT}        = LIDAR_DP_SEQINFO_RHP2(INFO, PBM, i, SIM); %#ok<AGROW>
        end
    end
end % if PBM.CNT_OP == 0
% ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯