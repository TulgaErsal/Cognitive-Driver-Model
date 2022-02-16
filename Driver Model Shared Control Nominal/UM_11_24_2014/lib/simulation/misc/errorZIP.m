function fn = errorZIP(prefix, fp)

% file name
c = clock;
c = fix(c);
x = [];

for n = 1:length(c)
  x = [x, num2str(c(n), '%02d')]; %#ok<AGROW>
end

% zip the files
fn = [prefix, x, '.zip'];
% fn = [prefix, '.zip'];
zip(fn, fp);