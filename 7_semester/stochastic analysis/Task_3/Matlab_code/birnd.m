function x = birnd(n,p,varargin)
bern = bernrnd(p,[n,varargin{:}]);
x = sum(bern,1);
end

