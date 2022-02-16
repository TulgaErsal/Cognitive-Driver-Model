function YI = interp1f(X, Y, XI, method)

try
    F = griddedInterpolant(X, Y, method);
    YI = F(XI);
catch
    YI = interp1(X, Y, XI, method);
end

