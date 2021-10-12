function y = EFR(x,arr)
y = zeros([length(x),1]);
for i = 1:length(x)
    y(i) = mean(arr<x(i));
end
end

