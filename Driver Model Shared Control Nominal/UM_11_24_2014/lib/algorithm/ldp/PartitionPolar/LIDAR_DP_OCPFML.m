function FML = LIDAR_DP_OCPFML(IPT, SEQ, SIM)

VP_GOAL_LOCAL       = IPT.VP_GOAL_LOCAL;
HA_GOAL_LOCAL       = IPT.HA_GOAL_LOCAL;

NSEQ                = length(SEQ);
FML_CNT             = 0;

if SIM.LOGS == YES
    fprintf(SIM.fid, '# OCP Formulations\n');
end

for i = 1:NSEQ
    if SIM.LOGS == YES
        formatSpec = 'OPENING #%d\n';
        fprintf(SIM.fid, formatSpec, i);
    end
    
    %% openings
    if SEQ{i}.TYPE == 1 || SEQ{i}.TYPE == 2 || SEQ{i}.TYPE == 3
        idx_basic_left                  = 0;
        idx_basic_right                 = 0;
        
        %% basic
        FML_CNT                         = FML_CNT + 1;
        idx_basic                       = FML_CNT;
        
        FML.OCP(FML_CNT).Index          = idx_basic;
        FML.OCP(FML_CNT).Ancestor       = 0;
        FML.OCP(FML_CNT).Peer           = 0;
        FML.OCP(FML_CNT).Priority       = 1;
        
        FML.OCP(FML_CNT).OCPType        = 1;
        FML.OCP(FML_CNT).PhaseNum       = length(SEQ{i}.SEQ);
        
        FML.OCP(FML_CNT).SecType        = SEQ{i}.SEC_TYPE;
        FML.OCP(FML_CNT).Polar          = SEQ{i}.EP_POLAR;
        FML.OCP(FML_CNT).Points         = SEQ{i}.EP_LOCAL;
        
        FML.OCP(FML_CNT).VPTarget       = VP_GOAL_LOCAL;
        FML.OCP(FML_CNT).HATarget       = HA_GOAL_LOCAL;
        
        if SIM.LOGS == YES
            formatSpec = '\t * OCP #%d: basic left-right formulation\n';
            fprintf(SIM.fid, formatSpec, FML_CNT);
        end
        
        %% add sectors on the upper left corner
        if SEQ{i}.ADDL.CHECK == true
            FML_CNT                     = FML_CNT + 1;
            idx_basic_left           	= FML_CNT;
            
            FML.OCP(FML_CNT).Index     	= idx_basic_left;
            FML.OCP(FML_CNT).Ancestor  	= idx_basic;
            FML.OCP(FML_CNT).Peer       = 0;
            FML.OCP(FML_CNT).Priority   = 2;
            
            FML.OCP(FML_CNT).OCPType    = 1;
            FML.OCP(FML_CNT).PhaseNum  	= length(SEQ{i}.SEQ) + 1;
            
            FML.OCP(FML_CNT).SecType    = [SEQ{i}.SEC_TYPE; SEQ{i}.ADDL.SEC_TYPE];
            FML.OCP(FML_CNT).Polar      = [SEQ{i}.EP_POLAR; SEQ{i}.ADDL.EP_POLAR];
            FML.OCP(FML_CNT).Points     = [SEQ{i}.EP_LOCAL; SEQ{i}.ADDL.EP_LOCAL];
            
            FML.OCP(FML_CNT).VPTarget   = VP_GOAL_LOCAL;
            FML.OCP(FML_CNT).HATarget   = HA_GOAL_LOCAL;
            
            if SIM.LOGS == YES
                formatSpec = '\t * OCP #%d: basic left-right formulation + upper left corner\n';
                fprintf(SIM.fid, formatSpec, FML_CNT);
            end
        end

        %% add sectors on the upper right corner
        if SEQ{i}.ADDR.CHECK == true
            FML_CNT                     = FML_CNT + 1;
            idx_basic_right             = FML_CNT;
            
            FML.OCP(FML_CNT).Index     	= idx_basic_right;
            FML.OCP(FML_CNT).Ancestor  	= idx_basic;
            FML.OCP(FML_CNT).Peer       = 0;
            FML.OCP(FML_CNT).Priority   = 2;
            
            FML.OCP(FML_CNT).OCPType    = 1;
            FML.OCP(FML_CNT).PhaseNum  	= length(SEQ{i}.SEQ) + 1;
            
            FML.OCP(FML_CNT).SecType    = [SEQ{i}.SEC_TYPE; SEQ{i}.ADDR.SEC_TYPE];
            FML.OCP(FML_CNT).Polar      = [SEQ{i}.EP_POLAR; SEQ{i}.ADDR.EP_POLAR];
            FML.OCP(FML_CNT).Points     = [SEQ{i}.EP_LOCAL; SEQ{i}.ADDR.EP_LOCAL];
            
            FML.OCP(FML_CNT).VPTarget   = VP_GOAL_LOCAL;
            FML.OCP(FML_CNT).HATarget   = HA_GOAL_LOCAL;
            
            if SIM.LOGS == YES
                formatSpec = '\t * OCP #%d: basic left-right formulation + upper right corner\n';
                fprintf(SIM.fid, formatSpec, FML_CNT);
            end
        end

        %% 
        % Sector O: phase 1 partial disk
        % Sector A: additional sector - the other side of the frontal sector
        
        if ~isempty(SEQ{i}.PHASE1)
            NSEC        = length(SEQ{i}.SEQ);
            EP_POLAR    = SEQ{i}.EP_POLAR;
            DIST_THLD   = 5; %#THLD#
            SEC_CNT     = 0;
            
            P2_SEC      = NSEC; % phase 2 sector
            
            if NSEC >= 2
                for j = NSEC-1:-1:1
                    if SEQ{i}.TYPE == 1
                        if EP_POLAR(j,4) - SEQ{i}.PHASE1.RADIUS >= DIST_THLD
                            SEC_CNT     = SEC_CNT + 1;
                            P2_SEC      = [j, P2_SEC]; %#ok<AGROW>
                        else
                            break;
                        end
                    elseif SEQ{i}.TYPE == 2
                        if EP_POLAR(j,3) - SEQ{i}.PHASE1.RADIUS >= DIST_THLD
                            SEC_CNT     = SEC_CNT + 1;
                            P2_SEC      = [j, P2_SEC]; %#ok<AGROW>
                        else
                            break;
                        end 
                    end
                end
            end % if NSEC >= 2
        end
        
        %% inner-outer(left-right) formulation
        if ~isempty(SEQ{i}.PHASE1)
            idx_phase1_seq                      = [];
            idx_phase1_left_seq                 = [];
            idx_phase1_right_seq              	= [];
            
            for j = length(P2_SEC):-1:1
                %% inner-outer(left-right) formulation
                FML_CNT                         = FML_CNT + 1;
                idx_phase1_seq                  = [idx_phase1_seq, FML_CNT]; %#ok<AGROW>
                
                FML.OCP(FML_CNT).Index          = idx_phase1_seq(end);
                FML.OCP(FML_CNT).Peer           = idx_basic;
                FML.OCP(FML_CNT).Priority       = 1;
                
                if j == length(P2_SEC)
                    FML.OCP(FML_CNT).Ancestor  	= 0;
                else
                    FML.OCP(FML_CNT).Ancestor  	= idx_phase1_seq(1:end-1);
                end

                FML.OCP(FML_CNT).OCPType        = 2;
                FML.OCP(FML_CNT).PhaseNum       = length(P2_SEC(j:end))+1;
                
                FML.OCP(FML_CNT).P1_Angle       = [SEQ{i}.PHASE1.ANGLE_S, SEQ{i}.PHASE1.ANGLE_E];
                FML.OCP(FML_CNT).P1_Radius      = SEQ{i}.PHASE1.RADIUS;
                
                FML.OCP(FML_CNT).SecType        = SEQ{i}.SEC_TYPE(P2_SEC(j:end));
                FML.OCP(FML_CNT).Polar          = SEQ{i}.EP_POLAR(P2_SEC(j:end),:);
                FML.OCP(FML_CNT).Points         = SEQ{i}.EP_LOCAL(P2_SEC(j:end),:);
                
                FML.OCP(FML_CNT).VPTarget       = VP_GOAL_LOCAL;
                FML.OCP(FML_CNT).HATarget       = HA_GOAL_LOCAL;

                if SIM.LOGS == YES
                    formatSpec = '\t * OCP #%d: inner-outer(left-right) formulation\n';
                    fprintf(SIM.fid, formatSpec, FML_CNT);
                    fprintf(SIM.fid, '\t \t * Sector O');
                    formatSpec = ' + Sector %d';
                    P2_SEQ = P2_SEC(j:end);
                    for k = 1:length(P2_SEQ)
                        fprintf(SIM.fid, formatSpec, P2_SEQ(k));
                    end
                    fprintf(SIM.fid, '\n');
                end
                
                %% inner-outer(left-right) formulation + upper left corner
                if SEQ{i}.ADDL.CHECK == true
                    FML_CNT                         = FML_CNT + 1;
                    idx_phase1_left_seq             = [idx_phase1_left_seq, FML_CNT]; %#ok<AGROW>
                    
                    FML.OCP(FML_CNT).Index          = idx_phase1_left_seq(end);
                    FML.OCP(FML_CNT).Peer           = idx_basic_left;
                    FML.OCP(FML_CNT).Priority       = 2;
                    
                    if j == length(P2_SEC)
                        FML.OCP(FML_CNT).Ancestor  	= [idx_basic, idx_phase1_seq(1)];
                    else
                        FML.OCP(FML_CNT).Ancestor  	= [idx_basic, idx_phase1_seq(1), idx_phase1_left_seq(1:end-1)];
                    end
                    
                    FML.OCP(FML_CNT).OCPType        = 2;
                    FML.OCP(FML_CNT).PhaseNum       = length(P2_SEC(j:end))+1+1;
                    
                    FML.OCP(FML_CNT).P1_Angle       = [SEQ{i}.PHASE1.ANGLE_S, SEQ{i}.PHASE1.ANGLE_E];
                    FML.OCP(FML_CNT).P1_Radius      = SEQ{i}.PHASE1.RADIUS;
                    
                    FML.OCP(FML_CNT).SecType        = [SEQ{i}.SEC_TYPE(P2_SEC(j:end)); SEQ{i}.ADDL.SEC_TYPE];
                    FML.OCP(FML_CNT).Polar          = [SEQ{i}.EP_POLAR(P2_SEC(j:end),:); SEQ{i}.ADDL.EP_POLAR];
                    FML.OCP(FML_CNT).Points         = [SEQ{i}.EP_LOCAL(P2_SEC(j:end),:); SEQ{i}.ADDL.EP_LOCAL];
                    
                    FML.OCP(FML_CNT).VPTarget       = VP_GOAL_LOCAL;
                    FML.OCP(FML_CNT).HATarget       = HA_GOAL_LOCAL;
                    
                    if SIM.LOGS == YES
                        formatSpec = '\t * OCP #%d: inner-outer(left-right) formulation + upper left corner\n';
                        fprintf(SIM.fid, formatSpec, FML_CNT);
                        fprintf(SIM.fid, '\t \t * Sector O');
                        formatSpec = ' + Sector %d';
                        for k = 1:length(P2_SEQ)
                            fprintf(SIM.fid, formatSpec, P2_SEQ(k));
                        end
                        fprintf(SIM.fid, ' + Sector (Upper Left)\n');
                    end
                end

                %% inner-outer(left-right) formulation + upper right corner
                if SEQ{i}.ADDR.CHECK == true
                    FML_CNT                         = FML_CNT + 1;
                    idx_phase1_right_seq            = [idx_phase1_right_seq, FML_CNT]; %#ok<AGROW>
                    
                    FML.OCP(FML_CNT).Index          = idx_phase1_right_seq(end);
                    FML.OCP(FML_CNT).Peer           = idx_basic_right;
                    FML.OCP(FML_CNT).Priority       = 2;
                    
                    if j == length(P2_SEC)
                        FML.OCP(FML_CNT).Ancestor  	= [idx_basic, idx_phase1_seq(1)];
                    else
                        FML.OCP(FML_CNT).Ancestor  	= [idx_basic, idx_phase1_seq(1), idx_phase1_right_seq(1:end-1)];
                    end
                    
                    FML.OCP(FML_CNT).OCPType        = 2;
                    FML.OCP(FML_CNT).PhaseNum       = length(P2_SEC(j:end))+1+1;
                    
                    FML.OCP(FML_CNT).P1_Angle       = [SEQ{i}.PHASE1.ANGLE_S, SEQ{i}.PHASE1.ANGLE_E];
                    FML.OCP(FML_CNT).P1_Radius      = SEQ{i}.PHASE1.RADIUS;
                    
                    FML.OCP(FML_CNT).SecType        = [SEQ{i}.SEC_TYPE(P2_SEC(j:end)); SEQ{i}.ADDR.SEC_TYPE];
                    FML.OCP(FML_CNT).Polar          = [SEQ{i}.EP_POLAR(P2_SEC(j:end),:); SEQ{i}.ADDR.EP_POLAR];
                    FML.OCP(FML_CNT).Points         = [SEQ{i}.EP_LOCAL(P2_SEC(j:end),:); SEQ{i}.ADDR.EP_LOCAL];
                    
                    FML.OCP(FML_CNT).VPTarget       = VP_GOAL_LOCAL;
                    FML.OCP(FML_CNT).HATarget       = HA_GOAL_LOCAL;
                    
                    if SIM.LOGS == YES
                        formatSpec = '\t * OCP #%d: inner-outer(left-right) formulation + upper right corner\n';
                        fprintf(SIM.fid, formatSpec, FML_CNT);
                        fprintf(SIM.fid, '\t \t * Sector O');
                        formatSpec = ' + Sector %d';
                        for k = 1:length(P2_SEQ)
                            fprintf(SIM.fid, formatSpec, P2_SEQ(k));
                        end
                        fprintf(SIM.fid, ' + Sector (Upper Right)\n');
                    end
                end
                
            end

            FML.OCP(idx_basic).Peer             = idx_phase1_seq;
            if idx_basic_left ~= 0
                FML.OCP(idx_basic_left).Peer 	= idx_phase1_left_seq;
            end
            if idx_basic_right ~= 0
                FML.OCP(idx_basic_right).Peer	= idx_phase1_right_seq;
            end
        end
    end
    
    %% hypothetical opening basic left-right formulation
    
    if SEQ{i}.TYPE ~= 1 && SEQ{i}.TYPE ~= 2 && SEQ{i}.TYPE ~= 3
        FML_CNT                         = FML_CNT + 1;
        
        FML.OCP(FML_CNT).Index          = FML_CNT;
        FML.OCP(FML_CNT).Ancestor       = 0;
        FML.OCP(FML_CNT).Peer           = 0;
        FML.OCP(FML_CNT).Priority       = 1;
        
        FML.OCP(FML_CNT).OCPType        = 3;
        FML.OCP(FML_CNT).PhaseNum       = length(SEQ{i}.SEC_TYPE);
        
        FML.OCP(FML_CNT).SecType        = SEQ{i}.SEC_TYPE;
        FML.OCP(FML_CNT).Points         = SEQ{i}.EP_LOCAL;

        FML.OCP(FML_CNT).EVLB           = SEQ{i}.EVFSLB;
        FML.OCP(FML_CNT).EVUB           = SEQ{i}.EVFSUB;
        FML.OCP(FML_CNT).REF_PT         = SEQ{i}.FSREFPT;
        
        FML.OCP(FML_CNT).VPTarget       = VP_GOAL_LOCAL;
        FML.OCP(FML_CNT).HATarget       = HA_GOAL_LOCAL;

        if SIM.LOGS == YES
            formatSpec = '\t * OCP #%d: hypothetical opening basic left-right formulation\n';
            fprintf(SIM.fid, formatSpec, FML_CNT);
        end
    end
end

FML.FML_CNT = FML_CNT;

%% 

if SIM.SHOWFML == YES
    N_COLORS = 0;
    for i = 1:FML.FML_CNT
        if FML.OCP(i).PhaseNum > N_COLORS
            N_COLORS = FML.OCP(i).PhaseNum;
        end
    end
    
    COLORS = distinguishable_colors(N_COLORS,'w');
    
    for i = 1:FML.FML_CNT
        TITLE = ['FML #', num2str(i)];
        LENGTH = IPT.LASER_RANGE;
        
        FIGURE_FORMULATION(FML.OCP(i), TITLE, LENGTH, COLORS);
        
        % if SIM.SAVEFML == YES
        %     saveas(gcf,[SIM.fmlfolder,'/STEP',num2str(SIM.STEPCNT),'_FML',num2str(i)],'png')
        % end
    end
end

if SIM.LOGS == YES
    fprintf(SIM.fid, '\n');
    formatSpec = '* Number of OCPs: %d \n';
    fprintf(SIM.fid, formatSpec, FML.FML_CNT);
    fprintf(SIM.fid, '___________________________________________________________________________\n');
    fprintf(SIM.fid, '       Index |   OCP Type |  Phase Num |   Priority |\n');
    formatSpec = '  %10.0f | %10.0f | %10.0f | %10.0f |\n';
    for i = 1:FML.FML_CNT
        fprintf(SIM.fid, formatSpec, i, FML.OCP(i).OCPType, FML.OCP(i).PhaseNum, FML.OCP(i).Priority);
    end
    fprintf(SIM.fid, ' ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯\n');
    fprintf(SIM.fid, '\n');
    
    formatSpec = '  %3.0f |';
    for i = 1:FML.FML_CNT
        fprintf(SIM.fid, 'FML %d:\n', i);
        fprintf(SIM.fid, 'Ancestor:');
        fprintf(SIM.fid, formatSpec, FML.OCP(i).Ancestor);
        fprintf(SIM.fid, '\n');
        fprintf(SIM.fid, 'Peer:    ');
        fprintf(SIM.fid, formatSpec, FML.OCP(i).Peer);
        fprintf(SIM.fid, '\n');
    end
    fprintf(SIM.fid, '\n');
end