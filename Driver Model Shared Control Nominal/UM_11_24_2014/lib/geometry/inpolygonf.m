function [in, on] = inpolygonf(x,y,xv,yv)

% if nargout > 1
%     [in, on] = inpolygon(x,y,xv,yv);
% else
%     in = inpolygon(x,y,xv,yv);
% end

Nx  = length(x);
Nxv = length(xv);

X(1, :) = reshape(x, 1, Nx);
X(2, :) = reshape(y, 1, Nx);
node(1, :) = reshape(xv, 1, Nxv);
node(2, :) = reshape(yv, 1, Nxv);

if nargout > 1
    [in, on] = inpoly(X, node);
else
    in = inpoly(X, node);
end