function DATA_O = modify_denominator(DATA_I)

% modify denominator: avoid division by zero

DATA_O = DATA_I;

EPSILON = 0.001;

% version 1
% for i = 1:length(DATA_I)
%     if abs(DATA_I) <EPSILON
%         DATA_O(i) = DATA_O(i) + sign(DATA_O(i))*EPSILON;
%     end
% end

% version 2
% IDX = find(abs(DATA_I) <EPSILON);
% if ~isempty(IDX)
%     DATA_O(IDX) = DATA_O(IDX) + sign(DATA_O(IDX))*EPSILON;
% end

% version 3
DATA_O = DATA_O + sign(DATA_O)*EPSILON;

