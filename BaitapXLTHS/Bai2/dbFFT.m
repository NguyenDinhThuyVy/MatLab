function [k_mean_vecto_A,k_mean_vecto_E,k_mean_vecto_I,k_mean_vecto_O,k_mean_vecto_U] = dbFFT(k_mean,fft_point)
signal = ['01MDA','02FVA','03MAB','04MHB','05MVB','06FTB','07FTC','08MLD','09MPD','10MSD','11MVD','12FTD','14FHH','15MMH','16FTH','17MTH','18MNK','19MXK','20MVK','21MTL','22MHL'];
vowel =  ['a','e','i','o','u'];
% nguong = Tim_Nguong2();
nguong = 0.01;
% figure
% hold on
num = fft_point;
k_mean_vecto_A = zeros(k_mean,num);
k_mean_vecto_E = zeros(k_mean,num);
k_mean_vecto_I = zeros(k_mean,num);
k_mean_vecto_O = zeros(k_mean,num);
k_mean_vecto_U = zeros(k_mean,num);

for j=1:length(vowel)
    vecto = [];
    for k=1 : length(signal)/5
        path = 'C:\Users\Thuy Vy\Documents\MATLAB\BaitapXLTHS\NguyenAmHuanLuyen-16k\';
        path = [path signal((k-1)*5+1:5*k) '\' vowel(j) '.wav'];
        [y,Fs] = audioread(path);
        [index, index1_3] = Bien(y, Fs, nguong);
         data = vectorFFT(y(floor(index1_3(1)*Fs) : floor(index1_3(2)*Fs)),Fs,fft_point);
        vecto = [vecto;data];
        
    end
    aa = ones(k_mean,num);
    
    [idx,C] = kmeans(vecto,k_mean,'Start',aa);
    switch j
        case 1
            k_mean_vecto_A = C(:,1:num/2);
        case 2
            k_mean_vecto_E = C(:,1:num/2);
        case 3
            k_mean_vecto_I = C(:,1:num/2);
        case 4
            k_mean_vecto_O = C(:,1:num/2);
        case 5
            k_mean_vecto_U = C(:,1:num/2);

    end
end
end