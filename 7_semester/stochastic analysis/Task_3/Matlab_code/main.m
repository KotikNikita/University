%% Task 3.1
clear();
clc();
n=1000000;
m=3;
lambda=1;
lambda2=2;
alpha = 0.01;
right_border = -1/lambda*log(alpha);
n_bins = 100;
myBins = linspace(0.+(right_border - 0)/n_bins,right_border+(right_border - 0)/n_bins,n_bins); % pick my own bin locations 
data1 = exprnd(lambda,[n,1]);
data2 = exprnd(lambda,[n,1]);
data2 = data2(data2>m);
y1 = hist(data1, myBins); % Create a vector for bar plot
y2 = hist(data2-m, myBins); % Create a vector for bar plot
y1 = y1/sum(y1); % normalize
y2 = y2/sum(y2); %
% plot the results: 
figure(3); 
bar(myBins, y1','r','FaceAlpha',0.5);
hold on;
bar(myBins, y2','b','FaceAlpha',0.5);
legend('P(Y\geqn)','P(Y\geqn+m|Y\geqm)')
xlim([0,right_border])
xlabel('Number of failures before the first success');
ylabel('Probability');

data1 = exprnd(lambda,[n,1]);
data2 = exprnd(lambda2,[n,1]);
p_value = kolmogorov_criterion_p_val(min([data1,data2],[],2), expdf(lambda+lambda2,min([data1,data2],[],2)));
disp(p_value);
%% Task 3.2
clear();
clc();
lambda = 5;
n=10000;
mu = lambda;
sigma = sqrt(lambda);
data1 = poisrnd(lambda,n);  % data of one size 
myBins = round(mu)-3*round(sigma):1:round(mu)+3*round(sigma);
y1 = hist(data1, [round(mu)-round(3*sigma)-100,myBins,round(mu)+round(3*sigma)+100]);  
y1 = y1/sum(y1);% normalize
% plot the results: 
figure(3); 
bar([round(mu)-round(3*sigma)-100,myBins,round(mu)+round(3*sigma)+100], y1','r','FaceAlpha',0.5);
xlim([max(round(mu)-round(3*sigma),-0.5),round(mu)+round(3*sigma)])% 3-sigma rule
%% Task 3.3
clear();
clc();
lambda = 5;
size = 10000;
n=4000;
mu = lambda;
sigma = sqrt(lambda);

data1 = poisrnd_lim(lambda,n,size);  % data of one size 
myBins = round(mu)-3*round(sigma):1:round(mu)+3*round(sigma);
y1 = hist(data1, [round(mu)-round(3*sigma)-100,myBins,round(mu)+round(3*sigma)+100]);  
y1 = y1/sum(y1);% normalize
% plot the results: 
figure(3); 
bar([round(mu)-round(3*sigma)-100,myBins,round(mu)+round(3*sigma)+100], y1','r','FaceAlpha',0.5);
xlim([max(round(mu)-round(3*sigma),-0.5),round(mu)+round(3*sigma)])% 3-sigma rule
p_value = pirson_criterion_pois(data1,lambda);
disp(p_value);
%% Task 3.4
clear();
clc();
n = 100000;
mu=0;
sigma=1;
[data1,data2] = stdnormrnd([n,1]);
p_value_mean = t_criterion_mean(data1,data2);
p_value_mean_var = f_criterion(data1, data2);
disp(p_value_mean);
disp(p_value_mean_var);

myBins = linspace(mu-3*sigma,mu+3*sigma,100);
y1 = hist(data1, [mu-3*sigma-1,myBins,mu+3*sigma+1]);  
y1 = y1/sum(y1);% normalize
% plot the results: 
figure(3); 
bar([mu-3*sigma-1,myBins,mu+3*sigma+1], y1','r','FaceAlpha',0.5);
xlim([mu-3*sigma,mu+3*sigma])% 3-sigma rule