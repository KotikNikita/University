function y = expdf(lambda,x)
tmp = x;
tmp(tmp<0)=0;
y = 1 - exp(-lambda*tmp);
end

