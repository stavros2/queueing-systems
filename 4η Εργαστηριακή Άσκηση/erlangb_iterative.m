## -*- texinfo -*-
##
## @deftypefn {Function File} {@var{B} =} erlangb (@var{rho}, @var{c})
##
## @cindex Erlang-B formula
##
## A function computing the probability of a client finding the system full

function pblock = erlangb_iterative(rho, c)
  if ( nargin != 2 )
    print_usage();
  endif
  results = zeros(1, c + 1);
  results(1) = 1;
  for i = 2:1:c+1
    results(i) = rho*results(i-1) / (rho*results(i-1) + i-1);
  endfor
  pblock = results(c + 1);
endfunction
