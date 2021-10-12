function p = poisdf(lambda,k)
p = lambda.^(k)./factorial(k).*exp(-lambda);
end

