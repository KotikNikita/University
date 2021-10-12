function x = cauchyrnd(x_0,gamma,varargin)
if (gamma<=0)
    error('gamma = %4.2f is <= 0',gamma)
end
if nargin<1
    x_0=0;
    gamma=1;
    varargin = 1;
    disp('varargin<1');
elseif nargin<2
    gamma=1;
    varargin = 1;
    disp('varargin<2');
elseif nargin<3
    varargin = 1;
    disp('varargin<3');
end
y = rand(varargin{:});
x = x_0 + gamma*tan(pi*(y - 1/2));

end


