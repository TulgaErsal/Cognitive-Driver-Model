function DISPLAY_MAP(BDY, OBS)

hold on;

X_MIN = min(BDY(:, 1));
X_MAX = max(BDY(:, 1));
Y_MIN = min(BDY(:, 2));
Y_MAX = max(BDY(:, 2));

axis([X_MIN-10, X_MAX+10, Y_MIN-10, Y_MAX+10])

plot(BDY(:, 1), BDY(:, 2), 'k', 'LineWidth', 2)

if ~isempty(OBS(1).PTS)
    for i = 1:length(OBS)
        patch(OBS(i).PTS(:, 1), OBS(i).PTS(:, 2), 'k')
    end
end