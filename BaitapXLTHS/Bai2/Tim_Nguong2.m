function [nguong] = Tim_Nguong2()

    [y01,fs01] = audioread('C:\Users\Thuy Vy\Documents\MATLAB\BaitapXLTHS\TinHieuHuanLuyen\studio_F2.wav');
    [y02,fs02] = audioread('C:\Users\Thuy Vy\Documents\MATLAB\BaitapXLTHS\TinHieuHuanLuyen\studio_M2.wav');
    [y03,fs03] = audioread('C:\Users\Thuy Vy\Documents\MATLAB\BaitapXLTHS\TinHieuHuanLuyen\phone_F2.wav');
    [y04,fs04] = audioread('C:\Users\Thuy Vy\Documents\MATLAB\BaitapXLTHS\TinHieuHuanLuyen\phone_M2.wav');
  
    [ste1] = STE(y01, fs01);
    [ste2] = STE(y02, fs02);
    [ste3] = STE(y03, fs03);
    [ste4] = STE(y04, fs04);
    

    std_F2V= [78:125 128:135 142:176 184:198 207:237];
    std_F2U= [1:77 126:127 136:141 177:183 199:206 238:314];
    std_M2V= [46:18 78:79 89:92 133:137 154:159 194:238];
    std_M2U= [1:45 49:77 80:88 93:132 138:153 160:193];
    p_F2V= [103:188 196:216 226:260 276:334 339:345 363:380 392:400 405:480];
    p_F2U= [1:102 189:195 217:225 261:275 335:338 346:362 381:391 401:404];
    p_M2V = [54:105 113:124 132:146 169:197 207:212 218:230 244:250 253:280];
    p_M2U = [1:53 106:112 125:131 147:168 198:206 213:217 231:243 251:252];
    
    nguong1 = Binary_Search(ste1,std_F2U, std_F2V);
    nguong2 = Binary_Search(ste2, std_M2U, std_M2V);
    nguong3 = Binary_Search(ste3, p_F2U,p_F2V);
    nguong4 = Binary_Search(ste4, p_M2U, p_M2V);
    
    nguong = (nguong1 + nguong2 + nguong3 + nguong4 )/4;
end