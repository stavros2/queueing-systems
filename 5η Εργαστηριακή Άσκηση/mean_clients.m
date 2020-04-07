function [clients1 clients2 clients3 clients4 clients5] = mean_clients(lambda1, lambda2, mu1, mu2, mu3, mu4, mu5)
  rho1 = lambda1 / mu1;
  rho2 = ((2 / 7) * lambda1 + lambda2) / mu2;
  rho3 = (4 / 7) * lambda1 / mu3;
  rho4 = (3 / 7) * lambda1 / mu4;
  rho5 = ((4 / 7) * lambda1 + lambda2) / mu5;
  clients1 = rho1 / (1 - rho1);
  clients2 = rho2 / (1 - rho2);
  clients3 = rho3 / (1 - rho3);
  clients4 = rho4 / (1 - rho4);
  clients5 = rho5 / (1 - rho5);
endfunction
