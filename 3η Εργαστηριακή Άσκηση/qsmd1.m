function [U R Q X p0] = qsmd1( lambda, mu )
  if ( nargin != 2 )
    print_usage();
  endif
  ( isvector(lambda) && isvector(mu) ) || ...
      error( "lambda and mu must be vectors" );
  [ err lambda mu ] = common_size( lambda, mu );
  if ( err ) 
    error( "parameters are of incompatible size" );
  endif
  lambda = lambda(:)';
  mu = mu(:)';
  all( lambda >= 0 ) || ...
      error( "lambda must be >= 0" );
  all( mu > lambda ) || ...
      error( "The system is not ergodic" );
  U = rho = lambda ./ mu; # utilization
  Q = rho + 0.5 * rho.^2./(1-rho); # average number of customers
  R = Q ./ lambda;  # average waiting time
  X = lambda; # througphut
endfunction
