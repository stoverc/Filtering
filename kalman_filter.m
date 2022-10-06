function [vectpos,vectpk] = kalman_filter(meas,est,est_err,meas_err,q)

vectpos = zeros(size(meas));
vectpk = zeros(size(meas));

if nargin == 4
    qq=0;
else
    qq = q;
end

kg = kalman_gain(est_err,meas_err,qq,numel(meas));
xk1 = est;
pk1 = est_err^2;

for i=1:numel(meas)
    xm = meas(i);

    xk = xk1 + kg(i) * (xm - xk1);
    pk = (1 - kg(i)) * pk1;
    
    vectpos(i) = xk;
    vectpk(i) = pk;

    xk1 = xk;
    pk1 = pk;
end