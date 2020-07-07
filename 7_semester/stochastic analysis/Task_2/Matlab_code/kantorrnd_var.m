function [x,F] = kantorrnd_var(n)
N = 30;
p=1/2;
if nargin < 1
    n = 1; % size 
end
% Creating multiplier array
multiplier = 1:N;
multiplier = 2*(1/3).^multiplier';
bern_arr = bernrnd(p,[n,N]);
x1 = bern_arr*multiplier;
% Same, for F(x)
multiplier = 1:N;
multiplier = (1/2).^multiplier';
F1 = bern_arr*multiplier;

[x,I] = sort(x1);
F = F1(I);
end

