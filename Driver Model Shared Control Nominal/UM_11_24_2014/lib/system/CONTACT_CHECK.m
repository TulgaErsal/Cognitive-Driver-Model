function LIFT = CONTACT_CHECK(OBS, SIM)

LIFT = false;

% check for tire lift off
FZ_MIN = min(OBS.FC(end, 9:12));

if FZ_MIN == 0
    LIFT = true;
end

if LIFT == true
    disp('* Tire lift-off happened.')
    disp('* Simulation terminated.')

    if SIM.LOGS == YES
        fprintf(SIM.fid, '!! Tire lift-off happened.\n');
        fprintf(SIM.fid, '!! Simulation terminated.\n');
    end
end