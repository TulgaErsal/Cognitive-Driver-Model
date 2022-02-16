function LUT_MAXSA_FZTHLD(FZ_THLD)

% lookup table
% longitudinal speed vs. maximum steering angle

load LUT_FZ_MIN.mat

SA_MAX = zeros(size(VX_SEQ));
for i = 1:length(VX_SEQ)
    FZ_SEQ = FZ_MIN(i, :); %#ok<NODEF>
    IDX = find(diff(FZ_SEQ) == 0);
    FZ_SEQ_2 = FZ_SEQ;
    SA_SEQ_2 = SA_SEQ;
    FZ_SEQ_2(IDX) = [];
    SA_SEQ_2(IDX) = [];
    SA_MAX(i) = interp1(FZ_SEQ_2, SA_SEQ_2, FZ_THLD);
end

figure('units','inches','position',[2 1 3 2])
hold on;
xlabel('Longitudinal Speed (m/s)')
ylabel('Maximum Steering Angle (degree)')
plot(VX_SEQ(2:22), SA_MAX(2:22)*180/pi, 'ko-', 'LineWidth', 2)
hold off;

LUT.FZ_THLD = FZ_THLD;
LUT.VX_SEQ = VX_SEQ;
LUT.SA_MAX_SEQ = SA_MAX;

save(['LUT_MAXSA_', num2str(FZ_THLD), '.mat'], 'LUT')