function d = distance_v(vectoA,vectoB)
    d=0;
    for i=1:length(vectoA)
        d = d+(vectoA(i)-vectoB(i))^2;
    end
    d=sqrt(d);
end