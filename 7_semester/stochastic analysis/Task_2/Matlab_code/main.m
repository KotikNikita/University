%% Task 2.1
clear();
clc();
n = 10000;
[X,F] = kantorrnd(n);
[x,I] = sort(X);
y = F(I);
plot(x,y,'-');
% hold on;
% Kolmogorov's criterion
p_value = kolmogorov_criterion_p_val(X, F);
disp(p_value)
%% Task 2.2
clear();
clc();
n = 10000;
[X1,~] = kantorrnd_var(n);% first sample
[X2,~] = one_minus_kantorrnd_var(n);% second sample
p_value = smirnov_criterion_p_val(X1, X2);
disp(p_value);% X and 1-X

[X3,~] = kantorrnd_var(n);
[X4,~] = kantorrnd_var(n);
X3 = X3(X3<1/3);
X4 = X4/3;
p_value = smirnov_criterion_p_val(X3, X4);
disp(p_value);% X|X<1/3 and X/3
%% Task 2.3
clear();
clc();
step = 100;
border = 200*step;
for i = step:step:border
    [X1,~] = kantorrnd_var1(i);
    m(i/100) = mean(X1);
    v(i/100) = var(X1);
end
plot(step:step:border,m,step:step:border,v);
legend('mean','var')
grid on;