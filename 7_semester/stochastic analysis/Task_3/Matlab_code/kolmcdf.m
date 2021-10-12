function y = kolmcdf(x)
N = 20;
k = 1:N;
tmp = size(x);
if tmp(2) ~= 1
    error('Transpose x');
end
n = length(x);
minus_one = repmat((-1).^k,[n,1]);
k_2 = repmat(k.^2,n);
X = repmat(x,[1,N]);
F = 1 + 2 * sum(minus_one.*exp(-2*k_2.*X.^2),2);
y = F;

end

