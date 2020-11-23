%% Task 5.1.1
clear();
clc();
N = 10000;
data = stdnormrnd([1,N]);
means = repmat(data,[N,1]);
means = tril(means);
means = sum(means, 2);
means = means./(1:N)';
plot(1:N,means);
set(gca,'Xscale','log');
grid on;
%% Task 5.1.2
clear();
clc();
n = 1000;
N = 10000;
% sigma = 2;
% mu = 3;
lambda = 1/2;
% data = mu+sigma*stdnormrnd([n,N]);%mean=3, sigma=2
data = exprnd(lambda,[n,N]);
means = ones([1,n]);
sigmas = zeros([1,n]);
for i = 1:n
    data_tmp = data(1:i,:);
    S_n = sum(data_tmp,1);
    Y = (S_n/i - 1/lambda)/((sqrt(1/lambda^2))/sqrt(i));
    means(i) = mean(Y);
    sigmas(i) = var(Y);
end
subplot(2,1,1)
plot(1:n,means);
grid on;
subplot(2,1,2)
plot(1:n,sigmas);
grid on;
figure();
hist(Y,100)
sample = Y;% stdnormrnd([1,N]);
f_sample = normcdf(sample',0,1);
p_value = kolmogorov_criterion_p_val(sample', f_sample);
disp(p_value)
%% Task 5.2.1
clear();
clc();
N = 100000;
sigma = 2;
mu = 3;
alpha = 0.95;
step = 2000;
begin = 1;
grd = begin:step:N;
sz = size(grd);
data = mu+sigma*stdnormrnd([1,N]);%mean=3, sigma=2
means = zeros(sz);
sigmas_sqr = zeros(sz);
err = zeros(sz);
yneg = zeros(sz);
ypos = zeros(sz);
% ypos = zeros([1,N]);
for i = 1:sz(2)
    n = i*step-begin;
    t = tinv((1+alpha)/2,n - 1);
    teta_1 = mean(data(1:n));
    teta_2_sqr = var(data(1:n));
    means(i) = teta_1;
    err(i) = t * sqrt(teta_2_sqr) / sqrt(n);
    sigmas_sqr(i) = teta_2_sqr;
    low_bd = (n - 1) * teta_2_sqr / chi2inv((1 + alpha)/2,n);
    up_bd = (n - 1) * teta_2_sqr / chi2inv((1 - alpha)/2,n);
    yneg(i) = teta_2_sqr - low_bd;
    ypos(i) = up_bd - teta_2_sqr;
end
subplot(1,2,1);
errorbar(grd,means,err);
grid on;
subplot(1,2,2);
errorbar(grd,sigmas_sqr,yneg, ypos);
grid on;
%% Task 5.3
clc();
clear();
N = 1000;
a = 0;
b = 3;
data = cauchyrnd(a,b,[1,N]);
means = repmat(data,[N,1]);
means = tril(means);
means = sum(means, 2);
means = means./(1:N)';
plot(1:N,means);
set(gca,'Xscale','log');
grid on;
