## -*- texinfo -*-
##
## @deftypefn {Function File} {@var{B} =} erlangb (@var{rho}, @var{c})
##
## @cindex Erlang-B formula
##
## A function computing the probability of a client finding the system full

function pblock = erlangb_factorial(rho, c)
  if ( nargin != 2 )
    print_usage();
  endif
  sum = 0;
  for k = 1:1:c+1
    sum = sum + (rho**(k-1))/(factorial(k-1));
  endfor
   
  pblock = (rho**c)/((factorial(c))*sum);
endfunction