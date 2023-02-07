close all;
clc; clear;

for i=1:8
    if i==1
        path='C:\Users\Thuy Vy\Documents\MATLAB\BaitapXLTHS\NguyenAmHuanLuyen-16k\01MDA\';
        files = dir('C:\Users\Thuy Vy\Documents\MATLAB\BaitapXLTHS\NguyenAmHuanLuyen-16k\01MDA\*.wav');
        show_Figure=figure('Name','File 01MDA') ;      
    end
    if i==2
         path='C:\Users\Thuy Vy\Documents\MATLAB\BaitapXLTHS\NguyenAmHuanLuyen-16k\02FVA\';
         files = dir('C:\Users\Thuy Vy\Documents\MATLAB\BaitapXLTHS\NguyenAmHuanLuyen-16k\02FVA\*.wav');
         show_Figure=figure('Name','02FVA') ;
    end
    if i==3
        path='C:\Users\Thuy Vy\Documents\MATLAB\BaitapXLTHS\NguyenAmHuanLuyen-16k\03MAB\';
        files = dir('C:\Users\Thuy Vy\Documents\MATLAB\BaitapXLTHS\NguyenAmHuanLuyen-16k\03MAB\*.wav');
        show_Figure=figure('Name','03MAB') ;
      
    end
    if i==4
        path='C:\Users\Thuy Vy\Documents\MATLAB\BaitapXLTHS\NguyenAmHuanLuyen-16k\04MHB\';
        files = dir('C:\Users\Thuy Vy\Documents\MATLAB\BaitapXLTHS\NguyenAmHuanLuyen-16k\04MHB\*.wav');
        show_Figure=figure('Name','04MHB') ; 
    end
    if i==5
        path='C:\Users\Thuy Vy\Documents\MATLAB\BaitapXLTHS\NguyenAmHuanLuyen-16k\05MVB\';
        files = dir('C:\Users\Thuy Vy\Documents\MATLAB\BaitapXLTHS\NguyenAmHuanLuyen-16k\05MVB\*.wav');
        show_Figure=figure('Name','05MVB') ;  
      
    end
    if i==6
         path='C:\Users\Thuy Vy\Documents\MATLAB\BaitapXLTHS\NguyenAmHuanLuyen-16k\06FTB\';
         files = dir('C:\Users\Thuy Vy\Documents\MATLAB\BaitapXLTHS\NguyenAmHuanLuyen-16k\06FTB\*.wav');
         show_Figure=figure('Name','06FTB') ;
       
    end
    if i==7
          path='C:\Users\Thuy Vy\Documents\MATLAB\BaitapXLTHS\NguyenAmHuanLuyen-16k\07FTC\';
          files = dir('C:\Users\Thuy Vy\Documents\MATLAB\BaitapXLTHS\NguyenAmHuanLuyen-16k\07FTC\*.wav');
          show_Figure=figure('Name','07FTC') ;
      
    end
    if i==8
        path='C:\Users\Thuy Vy\Documents\MATLAB\BaitapXLTHS\NguyenAmHuanLuyen-16k\08MLD\';
        files = dir('C:\Users\Thuy Vy\Documents\MATLAB\BaitapXLTHS\NguyenAmHuanLuyen-16k\08MLD\*.wav');
        show_Figure=figure('Name','08MLD') ;
     
    end   
   NguyenAm = ['a' 'e' 'i' 'o' 'u'];
   for ll=1:length(files)
        p=strcat(path,files(ll).name);
        %disp(s);
        [d,fs] = audioread(p);
        subplot(5, 1, ll);
        spectrogram(d, floor(5*10^(-3)*fs), floor(2*10^(-3)*fs), 1024, fs, 'yaxis');
        ylim([0  8]);     
%         colormap(parula);
        title({strcat('Vowel: /', strcat(NguyenAm(ll), '/'))});
        xlabel('time(s)');
    end
end