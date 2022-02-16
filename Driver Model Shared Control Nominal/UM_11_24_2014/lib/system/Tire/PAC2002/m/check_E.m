function check_E(E, STRING)

% check the range of E (E <= 1)

if ~isempty(find(E > 1, 1))
    find(E > 1);
    disp([STRING,' SHOULD BE LESS THAN OR EQUAL TO 1']);
end

% for i = 1:length(E)
%     if E(i) > 1
%         disp([STRING,' SHOULD BE LESS THAN OR EQUAL TO 1']);
%     end
% end
