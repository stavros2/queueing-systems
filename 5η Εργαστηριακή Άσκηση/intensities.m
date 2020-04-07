function [rho1 rho2 rho3 rho4 rho5 ergodic] = intensities(lambda1, lambda2, mu1, mu2, mu3, mu4, mu5)
  rho1 = lambda1 / mu1;
  rho2 = ((2 / 7) * lambda1 + lambda2) / mu2;
  rho3 = (4 / 7) * lambda1 / mu3;
  rho4 = (3 / 7) * lambda1 / mu4;
  rho5 = ((4 / 7) * lambda1 + lambda2) / mu5;
  if rho1 < 1 && rho2 < 1 && rho3 < 1 && rho4 < 1 && rho5 < 1
    ergodic = true;
  else
    ergoid = false;
  endif
endfunction
