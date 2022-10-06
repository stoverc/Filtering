function [vectpos,vectvel,vectacc] = alpha_beta_filter(pos,pos0,vel0,acc0,dt,alpha,beta,gamma)

xk1 = pos0;
vk1 = vel0;
ak1 = acc0;
vectpos = zeros(size(pos));
vectvel = zeros(size(pos));
vectacc = zeros(size(pos));

for i=1:numel(pos)
    xm = pos(i);

    xk = xk1 + (vk1 * dt) + (ak1 * dt * dt / 2);
    vk = vk1 + (ak1 * dt);
    ak = ak1;

    rk = xm - xk;

    xk = xk + alpha * rk;
    vk = vk + (beta * rk) / dt;
    ak = ak + (gamma * rk) / (0.5 * dt * dt);

    xk1 = xk;
    vk1 = vk;
    ak1 = ak

    vectpos(i) = xk1;
    vectvel(i) = vk1;
    vectacc(i) = ak1;
end