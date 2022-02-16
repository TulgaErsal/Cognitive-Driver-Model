function [TAU, WEIGHT, IMAT] = LGR_Nodes(N)

% The Legendre Vandermonde Matrix
P	= zeros(N,N+1);
% row i: x(i)
% col j: P_{j-1}(x(i))

% initial guess
xn	= - cos(2*pi*(0:(N-1))/(2*(N-1)+1))'; % new x

% any number larger than 1 to initialize the while() loop
xo	= 2; % old x

% Newton-Raphson method
while max(abs(xn - xo)) > eps
    xo = xn;
    
    % initialize the P matrix
    P(1,:)    	= (-1).^(0:N);
    P(2:N,1) 	= 1;
    P(2:N,2)  	= xn(2:N);
    
    % use Bonnet’s recursion formula to complete the P matrix
    for i = 2:N
        P(2:N,i+1) = ((2*i-1)*xn(2:N).*P(2:N, i) - (i-1)*P(2:N, i-1))/ i;
    end

    FCN         =    P(2:N, N+1) + P(2:N, N);
    DER         = N*(P(2:N, N+1) - P(2:N, N))./(xo(2:N) - 1);
    xn(2:N)  	= xo(2:N) - FCN ./ DER;
end

TAU = xn;

% The LGR Weights
WEIGHT(1)    	= 2/N^2;
WEIGHT(2:N)     = (1-TAU(2:N))./(N*P(2:N,N)).^2;

% The Barycentric weights used to calculate the differentiation matrix
M               = length([TAU; 1]);
Y               = repmat([TAU; 1]',M,1);
YDIFF           = Y - Y' + eye(M);
BW              = repmat(1./prod(YDIFF,1),M,1);

% The LGR differentiation matrix N x (N + 1)
DMAT           	= BW./(BW'.*YDIFF');
DMAT(1:M+1:M*M)	= sum(1./YDIFF, 1) - 1;
DMAT           	= DMAT(1:N,:);

% The LGR integration matrix
IMAT         	= inv(DMAT(:,2:N+1));