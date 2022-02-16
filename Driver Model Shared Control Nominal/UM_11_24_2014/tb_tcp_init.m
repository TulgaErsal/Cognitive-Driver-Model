% This is the version of TCP/IP used on the testbed side

data_sent_Lin = 999;
port_sent = 100;                % Sent port
port_remote = 40000;            % Receive Port
ip_remote = '35.3.99.195';   % Remote IP

udp_s = udp(ip_remote, port_remote, 'LocalPort', port_sent);  % Build Connection

fopen(udp_s);
for i = 1:3
    fprintf(udp_s,'%f\n',data_sent_Lin);            % Try send data start indicator
    pause(1);
end
fclose(udp_s);
delete(udp_s);
clear udp_s port_sent ip_remote port_remote data_sent_Lin




%% these are the window's ip address 
ipA_win = '35.3.38.163';
portA_win = 20000; % Modify these values to be those of your first computer.
ipB_win = '141.212.164.55';
portB_win = 20001; % Modify these values to be those of your second computer.

host_win = ipB_win;
port_win = portB_win;
port_sent_win = portA_win;

data_received_win = 0;
data_sent_win = [Xobs, Yobs, VDobs, Robs, vdes, Scenario_Id];

runout_count_win = 0;

tcp_c_win = tcpip(host_win, port_win, 'NetworkRole', 'Client');
set(tcp_c_win, 'InputBufferSize', 3000000); % Set size of receiving buffer, if needed. 
set(tcp_c_win,'Timeout',10);

tcp_s_win = tcpip('0.0.0.0', port_sent_win, 'NetworkRole', 'Server');
set(tcp_s_win, 'OutputBufferSize', 3000000); 
connectionServer_win = tcp_s_win;
set(connectionServer_win,'Timeout',10);              


fopen(tcp_s_win);
fwrite(tcp_s_win,data_sent_win,'double');
fclose(tcp_s_win);                              % Send data

% Check the response after data is sent
%Trying to open a connection to the server.
while(1)
    try 
        fopen(tcp_c_win);      
        data_received_win = fread(tcp_c_win, 1, 'double');
        % Pause for the communication delay, if needed. 
        pause(1) 
        % Receive lines of data from server 
%         while (get(d, 'BytesAvailable') > 0) 
%             tcp_c.BytesAvailable 
%             DataReceived = fscanf(d);
%         end 
        % Disconnect and clean up the server connection. 
        if data_received_win == 1989
            fclose(tcp_c_win);
            delete(tcp_c_win);     
            clear tcp_c_win tcp_s_win data_received_win data_sent_win host_win port_win port_sent_win connectionServer_win runout_count_win
            break;
        else
            fopen(tcp_s_win);
            fwrite(tcp_s_win,data_sent_win,'double');
            fclose(tcp_s_win);
            fprintf('%s \n','Wrong information received! Send data again!')
        end
    catch 
        runout_count_win = runout_count_win + 1;
        if runout_count_win == 100
            fprintf('%s \n','Cant find Server! Please check the visualization system!');
            runout_count_win = 0;
        end
    end
end

