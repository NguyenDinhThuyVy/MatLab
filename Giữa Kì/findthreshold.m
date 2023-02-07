% thuat toan tim nguong dua tren thuat toan CS425
function T = findthreshold(f,g)
% Calculate f, g - Step 1: Already

% Step 2
if max(f)< max(g)
    T_max = max(g);
else T_max = max(f);
end
if min(f) < min(g)
    T_min = min(f);
else T_min = min(g);
end
% Step 3
T = 0.5*(T_min+T_max);
% Step 4
i = length(find(f<T)); % so luong phan tu nho hon T cua f
p = length(find(g>T)); % so luong phan tu lon hon T cua g

% Step 5
j = -1; % so luong phan tu nf cu
q = -1; % so luong phan tu ng cu
N_f = length(f);
N_g = length(g);

% Step 6
while ~( i==j && p==q)
    if sum(f(f>T)-T)/N_f - sum(T-g(g<T))/N_g > 0 % so sanh ti le phan tu bi mat voi nguong T cua f() va g()
        T_min = T;
    else T_max = T; 
    end
% Step 8
    T = 0.5*(T_min+T_max);
% Step 9
    j = i; 
    q = p;
% Step 10
    i = sum(f<T);
    p = sum(g>T);
end
end
