function [vectpos] = alpha_filter(pos,pos0,alpha)
% Comment
xk1 = pos0;
vectpos = zeros(size(pos));

for i=1:numel(pos)
    xm = pos(i);

    xk = xk1;

    rk = xm - xk;
    
    if(numel(alpha)==1)
        xk = xk + alpha * rk;
    else
        xk = xk + alpha(i) * rk;
    end

    xk1 = xk;

    vectpos(i) = xk1;
end