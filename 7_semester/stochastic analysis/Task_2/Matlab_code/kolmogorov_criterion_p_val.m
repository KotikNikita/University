function p_value = kolmogorov_criterion_p_val(sample, f_sample)
n = length(sample);
[~,I] = sort(sample);
%D_n = max(abs(EFR(x,sample)-f_sample(I)));
D_n = max(abs((1:n)'/n-f_sample(I)));
p_value = 1 - kolmcdf(sqrt(length(sample))*D_n);
end

