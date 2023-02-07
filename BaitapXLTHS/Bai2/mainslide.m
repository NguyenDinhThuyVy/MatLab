close all; clear; clc;
labelFile = { '02FVA'};

vectorTrack = zeros(length(labelFile),10); % vector danh dau thoi gian
% hang thu i tuong ung thu tu thu i trong labelFile
% 1 hang bao gom 10 cot, moi cap 2 cot tuong ung voi cap thoi gian cua file nguyen am
% vd hang 1 tuong ung file 01MDA, cot 1 va 2 tuong ung voi thoi gian cua nguyen am a,...
for j = 1:length(labelFile)
    path = strcat('C:\Users\Thuy Vy\Documents\MATLAB\xlths\TinHieuCuoiKy\NguyenAmHuanLuyen-16k/', labelFile(j));
    vectorTrack = findVowel(path,labelFile(j), j, vectorTrack);
end

% Ham Chuan Hoa
function [normal] = Normalize(x)
    xmin = min(x); xmax = max(x);
    normal = (x- xmin)/(xmax-xmin);
end

% Ham tinh Nang luong
function E = Energy(x)
%     wHamm = hamming(length(x));
    x2 = x.^2;
    E = sum(x2);
end

% Ham STE
function [boundS,  ySTE] = STE(sig, fs, N, frameLen, overlapLen) 
    %Phan biet Sil và Vowel bang phuong phap Short Time Energy (STE)
    %Dung de xac dinh bien khoang lang va nguyen am
    %input: tin hieu, do dai cua tin hieu theo mau, frameLen, overlapLen, so luong khung
    %output: bien cua sinh vien va nang luong cua khung
    threshold = 0.093696358890318; % nguong phan biet
    % so frame
    numFrame = floor((N-frameLen)/(frameLen - overlapLen));
    % tinh ham STE cho tat ca frame
    STEx = zeros(numFrame, 1); 
    start = 1; finish = start + overlapLen;
    ySTE = zeros(1,N);
%     sig = hamming(length(sig)).*sig;
    % vong lap tinh nang luong ngan han cua tung frame
    for i = 1 : numFrame
       start = finish - overlapLen; % vi tri bat dau cua frame
       finish = start + frameLen - 1; % vi tri ket thuc cua frame
       frame = sig(start:finish); % khung tin hieu cua frame dang xet
       frame = hamming(length(frame)).*frame;
       STEx(i) = Energy(frame);
       ySTE(start:finish) = STEx(i); %tinh truc Oy de ve do thi / khop voi do dai tin hieu
    end
    STEnorm = Normalize(STEx); % chuan hoa / frame - tin toan khi can 
    ySTE = Normalize(ySTE); % chuan hoa / truc Oy de bieu dien tren do thi khop voi do dai tin hieu
    
    
    vowel = zeros(1,numFrame); %khoi tao mang frame danh dau sil/vowel: silence = 0; vowel = 1; 
    for i = 1:length(STEnorm)
        if (STEnorm(i) >= threshold) % dung nguong de xac dinh 
            vowel(i) = 1;
        end
    end
    boundS = []; % bien cua sinh vien tinh duoc
    for i = 1: length(vowel)-1
       if (vowel(i) == 0 && vowel(i+1) == 1)
           boundS = [boundS i];
       end
       if (vowel(i) == 1 && vowel(i+1) == 0)
           boundS = [boundS i-1];
       end
    end
    
    % xu ly cac doan tim duoc co bien trung nhau hoac khoang lang ao
    boundS = boundS.*(frameLen - overlapLen)/fs;
    newbound = boundS; boundS = [];
    for i = 1:2:length(newbound)-1
       if (newbound(i)~=newbound(i+1))
           boundS = [boundS newbound(i)];
           boundS = [boundS newbound(i+1)];
       end
    end
    if (length(boundS) > 2)
        newbound = boundS; boundS = [];
        for i = 2:2:length(newbound)-1
           boundS = [boundS newbound(i-1)];
           if ((newbound(i+1) - newbound(i)) <= 0.3)
               i = i + 2;
           end
           boundS = [boundS newbound(i)];
        end
    end
end

% Ham phan biet nguyen am khoang lang
function vectorTrack = findVowel(path,labelFile,number,vectorTrack)
    %input: path: duong dan cua bo tin hieu hien tai, labelFile: nhan cua bo tin hieu, j: thu tu, vectorTrack: vector danh dau
    %output: vector danh dau thoi gian
    figure('Name', labelFile{1}, 'NumberTitle', 'off');
    filename = {'a', 'e', 'i', 'o', 'u'};
    for j = 1:length(filename)
        newPath = strcat(path, '\', filename(j), '.wav'); %doc file tin hieu
        [sig,fs] = audioread(newPath{1}); %tin hieu va tan so lay mau
        frame = 0.01; overlap = 0.0; % moi frame dai 10-30s
        frameLen = frame * fs; overlapLen = overlap * fs; %frameLen va overlapLen theo mau
        % do dai cua file am thanh theo sample
        N = length(sig);
        % tao ma tran thoi gian cua file am thanh
        t = (1:N)/fs; 
        [boundS, ySTE] = STE(sig, fs, N, frameLen, overlapLen); %tim bien thoi gian va nang luong
        % bieu dien bang do thi
        subplot(5, 1, j);
        plot(t,sig,'linewidth',1); xlabel('Time(s)'); ylabel('Amplitude'); % plot tin hieu
        title(strjoin({'Voice/Silence /', filename{j}, '/'})); % tieu de cua plot
        hold on
        plot(t,ySTE,'r','linewidth',1); % plot nang luong STE cua file
        for i = 1 : length(boundS)
            line([boundS(i) boundS(i)], [-1 1], 'Color', 'k', 'LineWidth', 1.2); % plot bien tim duoc
        end
        hold off
        % danh dau thoi gian
        lengthT = (boundS(2) - boundS(1))/3;
        start = boundS(1) + lengthT;
        finish = start + lengthT;
        vectorTrack(number,(j-1)*2 + 1) =  start;
        vectorTrack(number,(j-1)*2 + 2) =  finish;
        % kiem tra 2 diem danh dau co chinh xac khong
        line([start start], [-1 1], 'Color', 'y', 'LineWidth', 1.2);
        line([finish finish], [-1 1], 'Color', 'y', 'LineWidth', 1.2);
    end
end