function rsq = linear_regression(pts)

% linear regression
% http://www.mathworks.com/help/matlab/data_analysis/linear-regression.html

x       = pts(:,1);
y       = pts(:,2);
p       = polyfit(x,y,1);
yfit    = polyval(p,x);
yresid  = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq     = 1 - SSresid/SStotal;