tic;
signal = ['23MTL','24FTL','25MLM','27MCM','28MVN','29MHN','30FTN','32MTP','33MHP','34MQP','35MMQ','36MAQ','37MDS','38MDS','39MTS','40MHS','41MVS','42FQT','43MNT','44MTT','45MDV'];
nguong = Tim_Nguong2();
vowel =  'a';
%Cách 1 dùng mfcc
%cách 2 dùng fft
k_mean = 4;
% num = 13;
fftpoint = 512;
[db_A,db_E,db_I,db_O,db_U] = dbFFT(k_mean,fftpoint);
freq_vowel = zeros(5,1);
freq_correct = zeros(5,1);
classify_rate = zeros(5,1);
confusion_matrix = zeros(5,5);
for j=1:length(vowel)
    for k=1 : length(signal)/5
        path = 'C:\Users\Thuy Vy\Documents\MATLAB\BaitapXLTHS\NguyenAmKiemThu-16k\';
        path = [path signal((k-1)*5+1:5*k) '\' vowel(j) '.wav'];
        [y,Fs] = audioread(path);
        [index, index1_3] = Bien(y, Fs, nguong);
         data = vectorFFT(y(floor(index1_3(1)*Fs) : floor(index1_3(2)*Fs)),Fs,0.03,0.01,fftpoint);
        [numframe,numdim] = size(data);
        featured_vector = zeros;
        for j1 = 1 : numdim
            sum1 = 0;
            for i1 = 1: numframe
                sum1 = sum1 + data(i1, j1);
            end
            featured_vector(j1) = sum1 /numframe;
        end
        featured_vector = featured_vector(1:length(featured_vector)/2);
        min = 9999;
        vowel_idx = 0;
        % so sanh 5 vector FFT cua tin hieu dau vao voi 5 vector dac trung
        for ii =1:k_mean
            if min > distance_v(db_A(ii,:),featured_vector)
                min = distance_v(db_A(ii,:),featured_vector);
                vowel_idx = 1;
            end
%             if min > distance_v(db_E(ii,:),featured_vector)
%                 min = distance_v(db_E(ii,:),featured_vector);
%                 vowel_idx = 2;
%             end
%             if min > distance_v(db_I(ii,:),featured_vector)
%                 min = distance_v(db_I(ii,:),featured_vector);
%                 vowel_idx = 3;
%             end
%             if min > distance_v(db_O(ii,:),featured_vector)
%                 min = distance_v(db_O(ii,:),featured_vector);
%                 vowel_idx = 4;
%             end
%             if min > distance_v(db_U(ii,:),featured_vector)
%                 min = distance_v(db_U(ii,:),featured_vector);
%                 vowel_idx = 5;
%             end
        end
        if j==vowel_idx
            freq_correct(j) = freq_correct(j) + 1;
        end
        freq_vowel(j) = freq_vowel(j) + 1;
        confusion_matrix(j,vowel_idx) = confusion_matrix(j,vowel_idx) + 1;
        disp(['File ' signal((k-1)*5+1:5*k) ': Muc tieu: ' ' ' vowel(j) ' - Du doan: ' ' ' vowel(vowel_idx)]);
    end
end
for i=1:5
    classify_rate(i) = freq_correct(i)/freq_vowel(i)*100;
end

% classify_rate_mean = sum(classify_rate)/length(classify_rate);
% disp('MA TRAN NHAM LAN:');
% disp_confusion_matrix = double(confusion_matrix);
% disp(['    ' vowel(1) '   ' vowel(2) '   ' vowel(3) '   ' vowel(4) '   ' vowel(5) ]);
% disp([vowel(1) '  ' num2str(confusion_matrix(1,:))]);
% disp([vowel(2) '   ' num2str(confusion_matrix(2,:))]);
% disp([vowel(3) '   ' num2str(confusion_matrix(3,:))]);
% disp([vowel(4) '   ' num2str(confusion_matrix(4,:))]);
% disp([vowel(5) '   ' num2str(confusion_matrix(5,:))]);
% dcx = ['Do chinh xac: ' num2str(classify_rate_mean)];
% disp(dcx);
% toc;
for k=1 : length(signal)/5
    figure
    hold on
    title(signal((k-1)*5+1:5*k));
    windowLength = round(0.03*16000);
    overlapLength = round(0.02*16000);
    for j=1:length(vowel)
        path = 'C:\Users\Thuy Vy\Documents\MATLAB\BaitapXLTHS\NguyenAmKiemThu-16k\';
        path = [path signal((k-1)*5+1:5*k) '\' vowel(j) '.wav'];
        [y,Fs] = audioread(path);
        [index, index1_3] = Bien(y, Fs, nguong);
        data = vectorFFT(y(floor(index1_3(1)*Fs) : floor(index1_3(2)*Fs)),Fs,0.03,0.01,fftpoint);
        [numframe,numdim] = size(data);
        featured_vector = zeros;
        for j1 = 1 : numdim
            sum1 = 0;
            for i1 = 1: numframe
                sum1 = sum1 + data(i1, j1);
            end
            featured_vector(j1) = sum1 /numframe;
        end
        featured_vector = featured_vector(1:length(featured_vector)/2);
        plot(featured_vector);
        hold on ;
        plot(db_A(1,:),"r");
    end
    legend('A',"CSDL");
end



