function [vectorFFT] = vectorFFT(y,Fs,fft_point)
frame_shift = (0.01*Fs);% chieu dai do dich khung
frame_len = (0.03*Fs);  % chieu dai cua khung
frame_num = floor((size(y,1) - frame_len)/(frame_shift)) + 1; % so luong khung
vectorFFT = zeros(frame_num,fft_point);
hm = hamming(frame_len); % muc dich de lam min do thi
for i=1:frame_num
    yy = zeros(frame_len,1);
    % trich xuat khung
    start = (i-1)*frame_shift+1;
    finish = (i-1)*frame_shift+frame_len;
    frame = y(start:finish);
    for j=1:frame_len
        yy(j) = frame(j).*hm(j);
    end
    vectorFFT(i,:) = abs(fft(yy,fft_point));
    % tra ve mot chuoi vecto, moi vecto dac trung cho 1 khung tin hieu
    % fft : tinh dac trung cua moi am
end
end