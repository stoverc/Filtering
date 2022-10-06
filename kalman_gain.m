function kal = kalman_gain(est,meas,q,n)

num1 = est^2;
r = meas^2;

if nargin == 3
    qq=0;
else
    qq = q;
end

k1 = 1.0 * num1 / (num1 + r);
kaltemp = [k1];
nums = [num1];
temp = [num1 + qq];

if n == 1
    kal = kaltemp;
end

if n >= 2
    for i = 2:n
        nums = [nums, (1.0 - kaltemp(i-1))*nums(i-1)];
        temp = [temp, nums(i)+qq];
        kaltemp = [kaltemp, temp(i)/(temp(i)+r)];
    end

    kal = kaltemp;
end
  