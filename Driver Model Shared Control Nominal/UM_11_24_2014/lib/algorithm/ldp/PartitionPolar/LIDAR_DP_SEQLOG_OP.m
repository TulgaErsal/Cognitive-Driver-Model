function LIDAR_DP_SEQLOG_OP(INFO, SEQ, SIM)

SECINFO_T2  = INFO.SECINFO_T2;

fprintf(SIM.fid, '\t --------------------\n');
formatSpec = '\t * Number of sequences: %d\n';
fprintf(SIM.fid, formatSpec, length(SEQ));

for i = 1:length(SEQ)
    fprintf(SIM.fid, '\t ______________________________________________________________________\n');

    % ------------------------------------------------------------
    % sector sequence: the indexes are the original indexes
    formatSpec = '\t * Seq #%d (TYPE%d): ';
    fprintf(SIM.fid, formatSpec, i, SEQ{i}.TYPE);
    
    formatSpec = ' -%d- ';
    for j = 1:length(SEQ{i}.SEQ)
        fprintf(SIM.fid, formatSpec, SECINFO_T2(SEQ{i}.SEQ(j), 2));
    end
    
    fprintf(SIM.fid, '\n');

    % ------------------------------------------------------------
    % end points
    fprintf(SIM.fid, '\t - End points in local coordinates:\n');
    formatSpec = ' \t %8.1f%8.1f%8.1f%8.1f%8.1f%8.1f\n';
    for j = 1:length(SEQ{i}.SEQ)
        fprintf(SIM.fid, formatSpec, SEQ{i}.EP_LOCAL(j,:));
    end
    fprintf(SIM.fid, '\n');
    
    fprintf(SIM.fid, '\t - End points in polar coordinates:\n');
    formatSpec = ' \t %8.1f%8.1f%8.1f%8.1f\n';
    for j = 1:length(SEQ{i}.SEQ)
        fprintf(SIM.fid, formatSpec, SEQ{i}.EP_POLAR(j,1:2)*180/pi, SEQ{i}.EP_POLAR(j,3:4));
    end
    fprintf(SIM.fid, '\n');

    % ------------------------------------------------------------
    % addition sector on the upper left corner
    if ~isnan(SEQ{i}.OP_SIDE(1))
        formatSpec = '\t - Upper left sector: \n \t \t * area: %7.1f m^2, range: %4.1f degree\n';
        fprintf(SIM.fid, formatSpec, SEQ{i}.OP_SIDE(2), SEQ{i}.OP_SIDE(3)*180/pi);
        
        if SEQ{i}.ADDL.CHECK == true
            fprintf(SIM.fid, '\t \t * To be added if needed\n');
            fprintf(SIM.fid, '\t \t * End points in local coordinates:\n');
            formatSpec = ' \t \t %8.1f%8.1f%8.1f%8.1f%8.1f%8.1f\n';
            fprintf(SIM.fid, formatSpec, SEQ{i}.ADDL.EP_LOCAL);
            fprintf(SIM.fid, '\t \t * End points in polar coordinates:\n');
            formatSpec = ' \t \t %8.1f%8.1f%8.1f%8.1f\n';
            fprintf(SIM.fid, formatSpec, SEQ{i}.ADDL.EP_POLAR(1:2)*180/pi, SEQ{i}.ADDL.EP_POLAR(3:4));
        else
            fprintf(SIM.fid, '\t \t * Ignored\n');
        end
        
        fprintf(SIM.fid, '\n');
    end
    
    % ------------------------------------------------------------
    % addition sector on the upper right corner
    if ~isnan(SEQ{i}.OP_SIDE(4))
        formatSpec = '\t - Upper right sector: \n \t \t * area: %7.1f m^2, range: %4.1f degree\n';
        fprintf(SIM.fid, formatSpec, SEQ{i}.OP_SIDE(5), SEQ{i}.OP_SIDE(6)*180/pi);
        
        if SEQ{i}.ADDR.CHECK == true
            fprintf(SIM.fid, '\t \t * To be added if needed\n');
            fprintf(SIM.fid, '\t \t * End points in local coordinates:\n');
            formatSpec = ' \t \t %8.1f%8.1f%8.1f%8.1f%8.1f%8.1f\n';
            fprintf(SIM.fid, formatSpec, SEQ{i}.ADDR.EP_LOCAL);
            fprintf(SIM.fid, '\t \t * End points in polar coordinates:\n');
            formatSpec = ' \t \t %8.1f%8.1f%8.1f%8.1f\n';
            fprintf(SIM.fid, formatSpec, SEQ{i}.ADDR.EP_POLAR(1:2)*180/pi, SEQ{i}.ADDR.EP_POLAR(3:4));
        else
            fprintf(SIM.fid, '\t \t * Ignored\n');
        end
        
        fprintf(SIM.fid, '\n');
    end
    
    % ------------------------------------------------------------
    % the start or end boundary of the frontal sector is close to 90 degree
    if ~isempty(SEQ{i}.PHASE1)
        fprintf(SIM.fid, '\t - Phase 1 Sector:\n');
        
        formatSpec = '\t \t * Angle range: (%3.1f, %3.1f) degree\n';
        fprintf(SIM.fid, formatSpec, SEQ{i}.PHASE1.ANGLE_S*180/pi, SEQ{i}.PHASE1.ANGLE_E*180/pi);
        formatSpec = '\t \t * Radius: %3.1f m\n';
        fprintf(SIM.fid, formatSpec, SEQ{i}.PHASE1.RADIUS);
        
        if ~isempty(SEQ{i}.PHASE1.SEC)
            fprintf(SIM.fid, '\t \t * Additional sector may be added\n');
            fprintf(SIM.fid, '\t \t * End points in local coordinates:\n');
            formatSpec = ' \t \t %8.1f%8.1f%8.1f%8.1f%8.1f%8.1f\n';
            fprintf(SIM.fid, formatSpec, SEQ{i}.PHASE1.SEC.EP_LOCAL);
            fprintf(SIM.fid, '\t \t * End points in polar coordinates:\n');
            formatSpec = ' \t \t %8.1f%8.1f%8.1f%8.1f\n';
            fprintf(SIM.fid, formatSpec, SEQ{i}.PHASE1.SEC.EP_POLAR(1:2)*180/pi, SEQ{i}.PHASE1.SEC.EP_POLAR(3:4));
        end
    end

    fprintf(SIM.fid, '\t ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯\n');
    if i ~= i
        fprintf(SIM.fid, '\n');
    end
end

fprintf(SIM.fid, '\t --------------------\n');
fprintf(SIM.fid, '\n');