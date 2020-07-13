function X = stdnormrnd_illumination(length)
X = [];
while size(X,1)<length
    x = cauchyrnd(0,1,1);
    nu = bernrnd(sqrt(exp(1))*exp((-x^2) / 2)*(x^2+1)/2,1);
    if nu==1
        X = cat(1,X,x);
    end
end 
end

