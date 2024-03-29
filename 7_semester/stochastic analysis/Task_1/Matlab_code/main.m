%% Binomial distribution
clear();
clc();
n = 100;
p = 0.5;
shape = [100000,1];
% calculations
data1 = birnd(n,p,shape);% generating data
myBins = linspace(-100,100,201); % pick my own bin locations 
y1 = hist(data1, myBins); % get bins
y1 = y1/sum(y1);% normalize
% plot the results: 
figure(3); 
bar(myBins, y1','b','FaceAlpha',0.5);
xlim(n*p + 3*sqrt(n*p*(1-p))*[-1,1])% the rule of three sigma
xlabel('Number of successes');
ylabel('Probability');

%% Geometric distribution
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
y1 = y1/sum(y1);% normalize
% plot the results: 
figure(3); 
bar(myBins, y1','r','FaceAlpha',0.5);
xlim([-0.5,right_border])% �� 0 �� F^{-1}(1-alpha)
xlabel('The number of failures before the first success');
ylabel('Probability');
%% Lack of geometrical distribution memory
clear();
clc();
alpha=0.01;% To calculate the chart window
p=0.2;
m=3;% The number of experiments before tracking r.v.
n=100000;% Not a distribution parameter, but a sample size

right_border = round(log(alpha)/log(1-p) - 1);
data1 = geomrnd(p,n);  % first dataset 
data2 = geomrnd(p,n);  % second dataset 
myBins = linspace(0,right_border+102,right_border+103); % pick my own bin locations 
data2 = data2(data2>=m);% We impose the necessary condition on the sample elements
data2 = data2-m;% We shift so that the columns overlap
% Hists will be the same size because we set the bin locations: 
y1 = hist(data1, myBins); % Create a vector for bar plot
y2 = hist(data2, myBins); % Create a vector for bar plot
y1 = y1/sum(y1); % normalize
y2 = y2/sum(y2); %
% plot the results: 
figure(3); 
bar(myBins, y1','r','FaceAlpha',0.5);
hold on;
bar(myBins, y2','b','FaceAlpha',0.5);
legend('P(Y\geqn)','P(Y\geqn+m|Y\geqm)')
xlim([-0.5,right_border])
xlabel('The number of failures before the first success');
ylabel('Probability');
%% Orlyanka
clear();
clc();
n = 10000;% The number of rounds in the game

S_n = orlyanka(n);% Orlyanka generate
Y = S_n./(sqrt(n));% Y(n)

plot(Y);
xlabel('n');
ylabel('Y(n)');