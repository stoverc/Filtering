function [vectpos,vectvel] = alpha_beta_filter(pos,pos0,vel0,dt,alpha,beta)

xk1 = pos0;
vk1 = vel0;
vectpos = zeros(size(pos));
vectvel = zeros(size(pos));

for i=1:numel(pos)
    xm = pos(i);

    xk = xk1 + (vk1 * dt);
    vk = vk1;

    rk = xm - xk;

    xk = xk + alpha * rk;
    vk = vk + (beta * rk) / dt;

    xk1 = xk;
    vk1 = vk;

    vectpos(i) = xk1;
    vectvel(i) = vk1;
end