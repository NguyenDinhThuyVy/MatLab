function [index, index1_3] = Bien(y, fs, nguong)
    ste = STE(y, fs);
    dodichkhung = 0.01;
    dd = zeros;
    for i = 1 : length(ste)
        if (ste(i) > nguong)
            dd(i) = 1;
        else 
            dd(i) = 0;
        end
    end

    for i = 1 : length(dd)- 30
        if (dd(i) == 1 && dd(i+30)==1)
            dd(i : i+30) = 1; 
        end
    end

    for i = 1 : length(ste) - 10
        if (dd(i) == 0 && dd(i+10)==0)
            dd(i : i+10) = 0; 
        end
    end

    index = zeros;
    dem = 1;
    for i = 1 : length(dd)-1 
        if (dd(i) == 0 && dd(i+1)==1) ||(dd(i) == 1 && dd(i+1)==0)
            index(dem) = i*dodichkhung;
            dem = dem + 1;
        end
    end

    index1_3 = zeros;
    try
        index1_3(1) = (index(2) - index(1))/3 + index(1);
        index1_3(2) = (index(2) - index(1))*2/3 + index(1);
    catch
        index1_3(1) = 0;
        index1_3(2) = 0;
    end
end