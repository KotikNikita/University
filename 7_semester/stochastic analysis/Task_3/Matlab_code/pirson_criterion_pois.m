function p_value = pirson_criterion_pois(sample,lambda)
    [unic_data,~,ic] = unique(sample);
    k = length(unic_data);
    n = length(sample);
    sample_counts = accumarray(ic,1);
%     value_counts = [unic_data',sample_counts];
    xi_sqr = sum(((sample_counts - n*poisdf(lambda,unic_data')).^2)./(n*poisdf(lambda,unic_data')));
    degrees_of_freedom = k-2;
    p_value = 1 - chi2cdf(xi_sqr,degrees_of_freedom);
end

