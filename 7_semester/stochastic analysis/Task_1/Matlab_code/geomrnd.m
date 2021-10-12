function answer = geomrnd(p,n)
if (p>1) || (p<0)
    error('p = %4.2f is out of bounds [0, 1]',p)
end
if nargin < 1
    p = 0.5; % success prob
    n = 1; % vectol length

end
if nargin < 2
    n = 1;
end
answer = zeros(n,1);% number of failures before the first success
mask = ones(n,1);% the mask will not allow to add failures after the first success
while sum(mask)>0
   bern = bernrnd(p,n,1);% generate appropriate distribution
   mask = mask.*(1-bern);% update the mask after the next test
   answer = answer+mask;
end
end

