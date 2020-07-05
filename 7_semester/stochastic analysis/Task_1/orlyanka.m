function S_n = orlyanka(n)
p = 0.5;% На случай, если захочу изменить
coin_resoults = 2*bernrnd(p,[1,n])-1;
S_n = sum(tril(repmat(coin_resoults,[n,1])),2);
end

