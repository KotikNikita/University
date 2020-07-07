function [x,F] = kantorrnd1(n)
N = 30;
p=1/2;
if nargin < 1
    n = 1; % size 
end
bern_arr = bernrnd(p,[n,N]);
shape = length(size(bern_arr));
multiplier = ones([n,N]);
multiplier = cumsum(multiplier,shape);
multiplier1 = 2*(1/3).^multiplier;
multiplier2 = (1/2).^multiplier;
x = sum(bern_arr.*multiplier1,shape);
F = sum(bern_arr.*multiplier2,shape);

end

