function [x,F] = kantorrnd_var1(n)
N = 30;
p=1/2;
if nargin < 1
    n = 1; % size 
end
% Creating multiplier array
% multiplier = 1:N;
% multiplier = repmat(2*(1/3).^multiplier,[1,n]);
% multiplier = reshape(multiplier,[n,N]);
bern_arr = bernrnd(p,[n,N]);
shape = length(size(bern_arr));
multiplier = ones([n,N]);
multiplier = cumsum(multiplier,shape);
multiplier1 = 2*(1/3).^multiplier;
multiplier2 = (1/2).^multiplier;
% size(bern_arr)
% size(multiplier)
x = sum(bern_arr.*multiplier1,shape);
% Same, for F(x)
% multiplier = 1:N;
% multiplier = repmat((1/2).^multiplier,n);
% multiplier = reshape(multiplier,[n,N]);
F = sum(bern_arr.*multiplier2,shape);

% [x,I] = sort(x1);
% F = F1(I);
end

