function p_value = smirnov_criterion_p_val(sample1, sample2)
n = length(sample1);
[x,~] = sort(sample1);
m = length(sample2);
[y,~] = sort(sample2);
D_nm = max(abs(EFR([x;y],sample1) - EFR([x;y],sample2)));
p_value = 1 - kolmcdf(sqrt(n*m/(n+m))*D_nm);
end

