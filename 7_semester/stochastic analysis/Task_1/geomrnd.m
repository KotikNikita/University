function answer = geomrnd(p,n)
if (p>1) || (p<0)
    error('p = %4.2f is out of bounds [0, 1]',p)
end
if nargin < 1
    p = 0.5; % ����������� ������
    n = 1; % ������ �������

end
if nargin < 2
    n = 1;
end
answer = zeros(n,1);% ���������� ������ �� ������� ������
mask = ones(n,1);% ����� �� �������� ���������� ������� ����� ������� ������
while sum(mask)>0
   bern = bernrnd(p,n,1);% ���������� ��������������� ������������� �������
   mask = mask.*(1-bern);% ��������� ����� ����� ���������� ���������
   answer = answer+mask;
end
end

