
function [G Gconst] = buzen(N, M, X )

  if ( nargin != 3)
    print_usage();
  endif

  gamma = zeros(N+1, M+1);
  gamma(1, :) = ones(1, M+1);
  gamma(:, 1) = 0:1:N;
  for i = 2:1:N+1
    gamma(i, 2) = X(1) ** (i-1);
  endfor
  
  for i=2:1:N+1
    for j=3:1:M+1
      gamma(i,j) = gamma(i,j-1) + X(j-1) * gamma(i-1, j);
    endfor
  endfor
  Gconst = gamma(N+1, M+1);
  G = gamma(:, M+1);
endfunction
