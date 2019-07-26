% To implement the gradient descent algorithm.
% Example: [xs,fs,k] = grad_desc('f_rosen','g_rosen',[0; 2],1e-9);
function [xs,k] = grad_desc_path(fname,gname,x0,epsi)
format compact
format long
k = 1;
xk = x0;
xs = [xk];
gk = feval(gname,xk);
dk = -gk;
ak = bt_lsearch(xk,dk,fname,gname);
adk = ak*dk;
er = norm(adk);
while er >= epsi,
  
  % prevent runnaway to infinite asymptote
  if k >= 2000
      disp('RUNAWAY condition occurred!!!');
      break;
  end
  xk = xk + adk;
  gk = feval(gname,xk);
  dk = -gk;
  ak = bt_lsearch(xk,dk,fname,gname);
  adk = ak*dk;
  er = norm(adk);
  k = k + 1;
  xs = [xs xk];
end
