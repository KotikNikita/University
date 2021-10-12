function p_value = f_criterion(sample1, sample2)
m1 = length(sample1);
sample_mean1 = sum(sample1)/m1;
s_sqr1 = sum((sample1-sample_mean1).^2)/(m1-1);
m2 = length(sample2);
sample_mean2 = sum(sample2)/m2;
s_sqr2 = sum((sample2-sample_mean2).^2)/(m2-1);
F = max([s_sqr1/s_sqr2,s_sqr2/s_sqr1]);
if s_sqr1>s_sqr2
    p_value = 1 - fcdf(F,m1-1,m2-1);
else
    p_value = 1 - fcdf(F,m2-1,m1-1);
end

end

