if DEBUG == 1
    
    if IDX_HP2 == length(SECINFO_T2(:, 1))
        IDX_HP2
        disp('LIDAR_DP_SEQINFO_HP - size')
    end
    
    if A_S ~= A_E
        A_S
        A_E
        disp('LIDAR_DP_SEQINFO_HP - angle')
    end
    
    if R_S == R_E
        R_S
        R_E
        disp('LIDAR_DP_SEQINFO_HP - radius')
    end
    
    if FRN_SEC < IDX_HP2
        if     R_S > R_E
            if norm(linlinintersect(PTS_cp) - EP_LOCAL(IDX_HP1, 5:6)) ~= R_E
                R_E
                norm(linlinintersect(PTS_cp) - EP_LOCAL(IDX_HP1, 5:6))
                disp('LIDAR_DP_SEQINFO_HP 101')
            end
        elseif R_E > R_S
            if norm(linlinintersect(PTS_cm) - EP_LOCAL(IDX_HP1, 5:6)) ~= R_S
                R_S
                norm(linlinintersect(PTS_cm) - EP_LOCAL(IDX_HP1, 5:6))
                disp('LIDAR_DP_SEQINFO_HP 102 - 1')
            end
        end
    elseif FRN_SEC > IDX_HP2
        if     R_S > R_E
        elseif R_E > R_S
        end
    end
    
    

    
    pause
end