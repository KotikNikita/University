function p_value = t_criterion_mean(sample1,sample2)
m1 = length(sample1);
sample_mean1 = sum(sample1)/m1;
s_sqr1 = sum((sample1-sample_mean1).^2)/(m1-1);
m2 = length(sample2);
sample_mean2 = sum(sample2)/m2;
s_sqr2 = sum((sample2-sample_mean2).^2)/(m2-1);

df = (s_sqr1^2/m1 + s_sqr2^2/m2)^2 / ((s_sqr1^2/m1)^2 / (m1-1) + (s_sqr2^2/m2)^2 / (m2-1));
t = (sample_mean1-sample_mean2)/(sqrt(s_sqr1^2/m1 + s_sqr2^2/m2));
degrees_of_freedom = df;
p_value = min([2*tcdf(t,degrees_of_freedom),2*(1-tcdf(t,degrees_of_freedom))]);
end

