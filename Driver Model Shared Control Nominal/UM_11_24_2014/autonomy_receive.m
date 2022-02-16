% This script receive data from autonomy
timeout_count=0;
pause_time=0.1;
timeout_threshold=10;
flag_in=0;

try
    autonomy_in_old=automony_in;
catch
    autonomy_in_old=zeros(68,1);
    autonomy_in_old(32:62)=10*ones(31,1);
end

fopen(udp_autonomy_received);

% pause vehicle model to wait for autonomy commands
set_param('VEHICLE_DYN_TRAIN','SimulationCommand','pause')

while(1)
    %-----------------------------debug------------------------------------
    udp_autonomy_received
    %----------------------------end of debug------------------------------
    
    autonomy_in = fscanf(udp_autonomy_received,'%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f');
    
    %---------------------------- for debugging--------------------------------
    display(autonomy_in)
    %----------------------------end of debugging------------------------------
    
    if ~isempty(autonomy_in)
        flag_in=1;
        fclose(udp_autonomy_received);
        clearvars udp_autonomy_received
        break
    elseif timeout_count<timeout_threshold
        if (~exist('MsgIn'))
            autonomy_in = zeros(68,1);
            autonomy_in(32:62)=10*ones(31,1);
            break
        else
            fclose(udp_autonomy_received);
            fopen(udp_autonomy_received);
            fopen(udp_autonomy_send);
            Msg_length=length(MsgIn(end,:));
            MsgOut=MsgIn(end,:);
            %             MsgOut=zeros(2*Msg_length,1);
            %             for send_bit = 1:Msg_length
            %                 MsgOut(2*send_bit-1)=MsgIn(send_bit);
            %                 MsgOut(2*send_bit)=double(' ');
            %             end
            fprintf(udp_autonomy_send,'%f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f \n',MsgOut);
            
            %--------------------------------------debug-------------------------------
            %             fprintf('%f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f \n',MsgOut);
            %--------------------------------------end of debug------------------------
            
            %             fwrite(udp_autonomy_send,MsgOut,'double');
            fclose(udp_autonomy_send);
        end
        
        %----------------------------for debugging----------------------------
        %         disp('waiting for udp')
        %----------------------------debugging end----------------------------
        
        %         pause(pause_time)
        timeout_count=timeout_count+1;
    else
        warning(strcat('no data was received within'," ",num2str(floor(timeout_threshold))," ",'re-tries'))
        fclose(udp_autonomy_received);
        autonomy_in=autonomy_old;
        clearvars udp_autonomy_received udp_autonomy_send
        break
    end
end
