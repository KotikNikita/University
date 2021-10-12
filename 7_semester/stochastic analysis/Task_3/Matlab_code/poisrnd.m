function answer = poisrnd(lambda,n)
% if (p>1) || (p<0)
%     error('p = %4.2f is out of bounds [0, 1]',p)
% end
if nargin < 1
    lambda = 0.5; % success prob
    n = 1; % vectol length

end
if nargin < 2
    n = 1;
end
answer = zeros(n,1);% number of failures before the first success
acc = zeros(n,1);
mask = ones(n,1);% the mask will not allow to add failures after the first success
while sum(mask)>0
   ex = exprnd(lambda,[n,1]);% generate appropriate distribution
   acc = acc + ex;
   mask = mask.*(acc<1);% update the mask after the next test
   answer = answer+mask;
end
end

