function answer = geomrnd(p,n)
if (p>1) || (p<0)
    error('p = %4.2f is out of bounds [0, 1]',p)
end
if nargin < 1
    p = 0.5; % вероятность успеха
    n = 1; % длинна вектора

end
if nargin < 2
    n = 1;
end
answer = zeros(n,1);% количество неудач до первого успеха
mask = ones(n,1);% маска не позволит прибавлять неудачи после первого успеха
while sum(mask)>0
   bern = bernrnd(p,n,1);% генерируем соответствующее распределение бернули
   mask = mask.*(1-bern);% обновляем маску после очередного испытания
   answer = answer+mask;
end
end

