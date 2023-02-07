function [ste] = STE(y, fs)
    N = length(y);
    dodai1khung = 0.02;
    somau1khung = dodai1khung * fs;
    khoangcach2khung = 0.01;
    sokhung = floor(N / (khoangcach2khung*fs));
    for i = N : (sokhung+1)*somau1khung/2
        y(i) = 0;
    end

    data = zeros;
    for i = 1 : sokhung
        for j = 1 : somau1khung
            data(i, j) = y((i-1)*somau1khung/2 + j);
        end
    end
    
    ste = zeros;
    for i = 1 : sokhung
        ste(i) = sum(abs(data(i,:)).^2); 
    end
    
    ste = ste./max(ste);
end