[s1, fs1] = audioread('C:\Users\Thuy Vy\Documents\MATLAB\BaitapXLTHS\NguyenAmHuanLuyen-16k\01MDA\i.wav');
figure;
subplot(4,2,1);
spectrogram(s1, round(5*10^(-3)*fs1), round(2*10^(-3)*fs1), 1024, fs1, 'yaxis')
title(" /i/ 01MDA");
% ----------------------------------------------------------------
[s2, fs2] = audioread('C:\Users\Thuy Vy\Documents\MATLAB\BaitapXLTHS\NguyenAmHuanLuyen-16k\02FVA\i.wav');
subplot(4,2,2);
spectrogram(s2, round(5*10^(-3)*fs2), round(2*10^(-3)*fs2), 1024, fs2, 'yaxis')
title("/i/ 02FVA");
% ----------------------------------------------------------------
[s3, fs3] = audioread('C:\Users\Thuy Vy\Documents\MATLAB\BaitapXLTHS\NguyenAmHuanLuyen-16k\03MAB\i.wav');
subplot(4,2,3);
spectrogram(s3, round(5*10^(-3)*fs3), round(2*10^(-3)*fs3), 1024, fs3, 'yaxis')
title("/i/ 03MAB");
% ----------------------------------------------------------------
[s4, fs4] = audioread('C:\Users\Thuy Vy\Documents\MATLAB\BaitapXLTHS\NguyenAmHuanLuyen-16k\04MHB\i.wav');
subplot(4,2,4);
spectrogram(s4, round(5*10^(-3)*fs4), round(2*10^(-3)*fs4), 1024, fs4, 'yaxis')
title("/i/ 04MHB");
% ----------------------------------------------------------------
[s5, fs5] = audioread('C:\Users\Thuy Vy\Documents\MATLAB\BaitapXLTHS\NguyenAmHuanLuyen-16k\05MVB\i.wav');
subplot(4,2,5);
spectrogram(s5, round(5*10^(-3)*fs5), round(2*10^(-3)*fs5), 1024, fs5, 'yaxis')
title("/i/ 05MVB");
% ----------------------------------------------------------------
[s6, fs6] = audioread('C:\Users\Thuy Vy\Documents\MATLAB\BaitapXLTHS\NguyenAmHuanLuyen-16k\06FTB\i.wav');
subplot(4,2,6);
spectrogram(s6, round(5*10^(-3)*fs6), round(2*10^(-3)*fs6), 1024, fs6, 'yaxis')
title("/i/ 06FTB");
% ----------------------------------------------------------------
[s7, fs7] = audioread('C:\Users\Thuy Vy\Documents\MATLAB\BaitapXLTHS\NguyenAmHuanLuyen-16k\07FTC\i.wav');
subplot(4,2,7);
spectrogram(s7, round(5*10^(-3)*fs7), round(2*10^(-3)*fs7), 1024, fs7, 'yaxis')
title("/i/ 07FTC");
% ----------------------------------------------------------------
[s8, fs8] = audioread('C:\Users\Thuy Vy\Documents\MATLAB\BaitapXLTHS\NguyenAmHuanLuyen-16k\08MLD\i.wav');
subplot(4,2,8);
spectrogram(s8, round(5*10^(-3)*fs8), round(2*10^(-3)*fs8), 1024, fs8, 'yaxis')
title("/i/ 08MLD");