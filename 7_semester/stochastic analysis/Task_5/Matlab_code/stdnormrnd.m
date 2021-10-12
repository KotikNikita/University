function [x,y] = stdnormrnd(varargin)
    omega = exprnd(1/2,varargin{:});
    phi = 2*pi*rand(varargin{:});
    x = sqrt(omega).*cos(phi);
    y = sqrt(omega).*sin(phi);
end

