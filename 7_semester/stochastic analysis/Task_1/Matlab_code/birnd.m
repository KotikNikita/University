function x = birnd(n,p,varargin)
    A = bernrnd(p,[n,varargin{:}]);
    x = sum(A,1);
end

