%chuan hoa dua tren cthuc 2.17 sach CS425
function g = normalise(f,T)
    for i=1 : length(f)
        if(f(i) >=T)
            g(i) = (f(i)-T)/(max(f)-T);
        elseif(f(i) <=T)
            g(i) = (f(i)-T)/(T-min(f));
        end
    end
end

