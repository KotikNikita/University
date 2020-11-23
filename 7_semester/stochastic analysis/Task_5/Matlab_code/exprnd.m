function x = exprnd(lambda,varargin)
% if (p>1) || (p<0)
%     error('p = %4.2f is out of bounds [0, 1]',p)
% end
x = (-1/lambda)*log(1-rand(varargin{:}));
end

