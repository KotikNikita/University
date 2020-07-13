%% Task 4.1
clear();
clc();
n = 100000;
x_0=0;
gamma=2;
data = cauchyrnd(x_0,gamma,[1,n]);

myBins = linspace(x_0-4*gamma,x_0+4*gamma,200);
y1 = hist(data, [x_0-4*gamma-1,myBins,x_0+4*gamma+1]);  
y1 = y1/sum(y1);% normalize
% plot the results: 
figure(3); 
bar([x_0-4*gamma-1,myBins,x_0+4*gamma+1], y1','b','FaceAlpha',0.5);
xlim([x_0-3*gamma,x_0+3*gamma])% 3-gamma rule
%% Task 4.2
clear();
clc();
n = 100000;
mu=0;
gamma=1;
data = stdnormrnd_illumination(n);
normplot(mu+gamma*data)
%% Task 4.3
clear();
clc();
n=1000000;
tic;
stdnormrnd_illumination(n);
t1=toc();

tic;
stdnormrnd([n,1]);
t2=toc();
disp(t1);
disp(t2);
%%
clear();
clc();
t1 = [0,0,0,0,0];
t2 = [0,0,0,0,0];
for i = [1,2,3,4,5]
    tic;
    stdnormrnd_illumination(10^i);
    t1(i)=toc();
end

for i = [1,2,3,4,5]
    tic;
    stdnormrnd([10^i,1]);
    t2(i)=toc();
end
x=[1,2,3,4,5];
plot(x,t1,x,t2);
xlabel('lg(n)');
ylabel('t');