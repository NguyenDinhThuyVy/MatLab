clear all ;close all;
% -----------------------------------------------------------------------
fd=0.01;
%khoi tao gia tri ban dau cho nguong chung cua ste va zcr
T_ste=0;
T_zcr=0;
% -------------------------------------------------------------------------
for i=1:4
    if i==1  
        [data,fs] = audioread('studio_F2.wav');
        frames=divFrame(data,fs,fd);
        ste = calSTE(frames);
        zcr = calZCR(frames);
        std_F2V= [78:125 128:135 142:176 184:198 207:237];
        std_F2U= [1:77 126:127 136:141 177:183 199:206 238:314];
%         std_F2V= [1:68 71:110 114:122 128:165 171:176 180:186 193:215];
%         std_F2U= [69:70 111:113 123:127 166:170 177:179 187:192 216:286];
        T_ste = T_ste + findthreshold(ste(std_F2V),ste(std_F2U));
        T_zcr = T_zcr +findthreshold(zcr(std_F2V),zcr(std_F2U));
    end
    
    if i==2
        [data,fs] = audioread('studio_M2.wav');
        frames=divFrame(data,fs,fd);
        ste = calSTE(frames);
        zcr = calZCR(frames);
        std_M2V= [46:18 78:79 89:92 133:137 154:159 194:238];
        std_M2U= [1:45 49:77 80:88 93:132 138:153 160:193];
%         std_M2V= [88:94 127:133 160:166 179:182 207:273];
%         std_M2U= [1:87 95:126 134:159 167:178 183:206];
        T_ste = T_ste +findthreshold(ste(std_M2V),ste(std_M2U));
        T_zcr = T_zcr +findthreshold(zcr(std_M2V),zcr(std_M2U));
    end
    
    if i==3
        [data,fs] = audioread('phone_F2.wav');
        frames=divFrame(data,fs,fd);
        ste = calSTE(frames);
        zcr = calZCR(frames);
        p_F2V= [103:188 196:216 226:260 276:334 339:345 363:380 392:400 405:480];
        p_F2U= [1:102 189:195 217:225 261:275 335:338 346:362 381:391 401:404];
%         p_F2V= [ 54:114 122:135 146:160 184:220 229:235 241:252 267:273 276:323];
%         p_F2U= [ 1:53  115:121 136:145 161:183 221:228 236:240 253:266 274:275];
        T_ste = T_ste+findthreshold(ste(p_F2V),ste(p_F2U));
        T_zcr = T_zcr +findthreshold(zcr(p_F2V),zcr(p_F2U));
    end
    
    if i==4
        [data,fs] = audioread('phone_M2.wav');
        frames=divFrame(data,fs,fd);
        ste = calSTE(frames);
        zcr = calZCR(frames);
        p_M2V = [54:105 113:124 132:146 169:197 207:212 218:230 244:250 253:280];
        p_M2U = [1:53 106:112 125:131 147:168 198:206 213:217 231:243 251:252];
%         p_M2V = [47:139  151:169 180:278 287:293 311:329 346:352];
%         p_M2U = [1:46 140:150 170:179 279:286 294:310 330:345 353:415];
        T_ste = T_ste+ findthreshold(ste(p_M2V),ste(p_M2U));
        T_zcr = T_zcr +findthreshold(zcr(p_M2V),zcr(p_M2U));
    end
end
T_zcr = T_zcr/4;
T_ste = T_ste/4;
%Ket thuc tinh nguong chung
% -------------------------------------------------------------------------
%Bat dau giai quyet bai toan
for i=1:4
    if i==1
        show_Figure=figure('Name','File studio_F2') ;
        [data,fs] = audioread('studio_F2.wav');    
        point= [0.77 1.25 1.27 1.35 1.41 1.76 1.83 1.98 2.06 2.37];
%           point= [0.68 0.70 1.10 1.13 1.22 1.27 1.65 1.70 1.76 1.79 1.86 1.92 2.15 2.86];
%         
    end
    if i==2
        show_Figure=figure('Name','File studio_M2') ;
        [data,fs] = audioread('studio_M2.wav');
        point =[0.48 0.77 0.79 0.88 0.92 1.32 1.37 1.53 1.59 1.93];
%           point =[0.87 0.94 1.26 1.33 1.59 1.66 1.78 1.82 2.06 2.73]; 
    end
    if i==3
        show_Figure=figure('Name','File phone_F2') ;
        [data,fs] = audioread('phone_F2.wav');
        point =[1.02 1.88 1.95 2.16 2.25 2.60 2.75 3.34 3.38 3.45 3.62 3.80 3.91 4.00 ];
%           point =[0.53 1.14 1.21 1.35 1.45 1.60 1.83 2.20 2.28 2.35 2.40 2.52 2.66 2.73 2.75 3.23 ];
    end
    if i==4
        show_Figure=figure('Name','File phone_M2') ;
        [data,fs] = audioread('phone_M2.wav');
        point =[0.53 1.05 1.12 1.24 1.31 1.46 1.68 1.97 2.06 2.12 2.17 2.30 2.43 2.50];
%           point =[0.46 1.39 1.50 1.69 1.79 2.78 2.86 2.93 3.10 3.29 3.45 3.52 4.15];
    end
%  ------------------------------------------------------------------------
    frames=divFrame(data,fs,fd);
    ste = calSTE(frames);
    zcr = calZCR(frames);
    %In do thi ket qua chuan ra
    subplot(5,1,3);
    time = length(data)/fs;
    t = linspace(0, time ,length(data));
    plot(t,data,'linewidth',1); 
    title('DO THI KET QUA CHUAN');
    for i=1:length(point)
     x = [point(i) point(i)];
     y = [-1 1];
     line(x,y,'Color','r','LineStyle','-.','linewidth',1);
    end
    for i=1:2:length(point)
        text((point(i+1)-0.03),0.8,'v','Color','m','linewidth',4);
        text(point(i)-0.02,-0.7,'u','Color','g','linewidth',4);
    end 
    legend('Signal','Result')
% -------------------------------------------------------------------------    
    %do thi so sanh ket qua dat duoc
    subplot(5,1,5);
    time = length(data)/fs;
    t = linspace(0, time ,length(data));
    plot(t,data,'linewidth',1); 
    title('DO THI SO SANH KET QUA ');
    xlabel('Thoi gian(s)');  
    for i=1:length(point)
     x = [point(i) point(i)];
     y = [-1 1];
     line(x,y,'Color','r','LineStyle','-.','linewidth',1);
     end
% --------------------------------------------------------------------------    
    %tim nguong cua ste = mot nua tong nang luong trung binh
    ste_norm = normalise(ste,T_ste);
    zcr_norm = normalise(zcr,T_zcr);
    T = findthreshold(ste_norm,zcr_norm);
    vu =calVU(ste_norm,zcr_norm,T);
    vu=Filter(vu);
    line_vu=[]; %danh dau nhung diem chuyen tu huu am sang vo am
    index=1;
    for i=1:length(vu)-1
        if(vu(i)==0 && vu(i+1)==1 || vu(i)==1 && vu(i+1)==0)
            line_vu(index)=i*fd; %luu hoanh do cua nhung diem chuyen tiep
            index=index+1;
        end
    end
    hold on;
    for i=1:length(line_vu)
      a = [line_vu(i) line_vu(i)];
      y = [-1 1];
      line(a,y,'Color','b','linestyle','-','linewidth',1);
    end
    for i=1:2:length(line_vu)
        text((line_vu(i+1) -line_vu(i))/2+line_vu(i)-0.01,0.8,'v','Color','r');
        text(line_vu(i)-0.03,-0.7,'u','Color','g');
    end
    legend('Phan doan thuc hien','Phan doan chuan');
% ---------------------------------------------------------------------
    %Do thi ket qua thuc hien
    subplot(5,1,4);
    time = length(data)/fs;
    t = linspace(0, time ,length(data));
    plot(t,data,'linewidth',1); 
    title('DO THI KET QUA THUC HIEN');
    hold on;
   
    for i=1:length(line_vu)
     a = [line_vu(i) line_vu(i)];
     y = [-1 1];
     line(a,y,'Color','b','LineStyle','-','linewidth',1);
    end
    for i=1:2:length(line_vu)
        text((line_vu(i+1)-0.03),0.8,'v','Color','m');
        text((line_vu(i)-0.03),-0.7,'u','Color','g');
    end 
    legend('Signal','Result')
%--------------------------------------------------------------------------   
   %Ve do thi ZCR
    subplot(6,2,1);
    plot(t, data);
    title('DO THI STE');
    hold on;
    time1 = length(Make_wave(ste_norm,fs,fd))/fs;
    t1 = linspace(0, time1 ,length(Make_wave(ste_norm,fs,fd)));
    hold on;
    plot(t1,Make_wave(ste_norm,fs,fd),'r');
% -------------------------------------------------------------------------    
    % Ve do thi STE
    subplot(6,2,2);
    plot(t, data);
    title('DO THI ZCR');
    hold on;
    time1 = length(Make_wave(ste_norm,fs,fd))/fs;
    t1 = linspace(0, time1 ,length(Make_wave(ste_norm,fs,fd)));
    hold on;
    plot(t1,Make_wave(zcr_norm,fs,fd),'b');
% -------------------------------------------------------------------------
%     Do thi STE vaf ZCR
    subplot(5,1,2);
    plot(t, data,'linewidth',1);
    title('DO THI KET HOP GIUA STE VA ZCR');
    hold on;
    time1 = length(Make_wave(ste_norm,fs,fd))/fs;
    t1 = linspace(0, time1 ,length(Make_wave(ste_norm,fs,fd)));
    hold on;
    plot(t1,Make_wave(ste_norm,fs,fd),'r','LineWidth',1);
    hold on;
    plot(t1,Make_wave(zcr_norm,fs,fd),'-b','LineWidth',1);
    legend('ZCR','STE');
end

















