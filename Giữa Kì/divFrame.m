function [frames] = divFrame(data,fs,f_d) % f_d= do dai thoi gian moi khung (s)
    numberSample = f_d * fs; %So phan tu tren moi khung
    numberFrame= floor(length(data)/ numberSample); %truong hop co phan le trong tin hieu thi se bo
    for i=1: numberFrame
        for j=1: numberSample
            frames(i,j)= data(numberSample*(i-1)+j);
        end
    end
end