%% ������������ �������������
clear();
clc();
n = 100;
p = 0.5;
shape = [100000,1];
% calculations
data1 = birnd(n,p,shape);% ���������� ������
myBins = linspace(-100,100,201); % pick my own bin locations 
y1 = hist(data1, myBins); % get bins
y1 = y1/sum(y1);% ���������
% plot the results: 
figure(3); 
bar(myBins, y1','b','FaceAlpha',0.5);
xlim(n*p + 3*sqrt(n*p*(1-p))*[-1,1])% ������� ��� ����
xlabel('����� �������');
ylabel('�����������');

%% �������������� �������������
clear();
clc();
alpha=0.01;
p=0.2;
n=100000;
% calculations
right_border = round(log(alpha)/log(1-p) - 1);% F^{-1}(1-alpha)
data1 = geomrnd(p,n);  % data of one size 
myBins = linspace(0,right_border+100,right_border+101); % pick my own bin locations 
y1 = hist(data1, myBins);  
y1 = y1/sum(y1);% ����������
% plot the results: 
figure(3); 
bar(myBins, y1','r','FaceAlpha',0.5);
xlim([-0.5,right_border])% �� 0 �� F^{-1}(1-alpha)
xlabel('����� ������ �� ������� ������');
ylabel('�����������');
%% ���������� ������ ��������������� �������������
clear();
clc();
alpha=0.01;% ��� ������� ���� �������
p=0.2;
m=3;% ����� ������������� �� ������ ������������ �.�.
n=100000;% �� �������� �������������, � ������ �������

right_border = round(log(alpha)/log(1-p) - 1);
data1 = geomrnd(p,n);  % first dataset 
data2 = geomrnd(p,n);  % second dataset 
myBins = linspace(0,right_border+102,right_border+103); % pick my own bin locations 
data2 = data2(data2>=m);% ����������� ������ ������� �� �������� �������
data2 = data2-m;% �������, ����� �������� ����������
% Hists will be the same size because we set the bin locations: 
y1 = hist(data1, myBins); % ������ ������ ��� bar
y2 = hist(data2, myBins); % ������ ������ ��� bar
y1 = y1/sum(y1); % ���������
y2 = y2/sum(y2); %
% plot the results: 
figure(3); 
bar(myBins, y1','r','FaceAlpha',0.5);
hold on;
bar(myBins, y2','b','FaceAlpha',0.5);
legend('P(Y\geqn)','P(Y\geqn+m|Y\geqm)')
xlim([-0.5,right_border])
xlabel('����� ������ �� ������� ������');
ylabel('�����������');
%% ���� � �������
clear();
clc();
n = 10000;% ����� ������� � ����

S_n = orlyanka(n);% ���������� ���� � �������
Y = S_n./(sqrt(n));% ��������� �������� �� �������

plot(Y);
xlabel('n');
ylabel('Y(n)');