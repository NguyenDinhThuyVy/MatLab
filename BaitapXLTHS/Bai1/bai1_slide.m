close all;
clc; clear;

for i=1:3
    if i==1
        x = [834 742 472 742 559];
        y = [1714 1833 2399 1044 890];
        show_Figure=figure('Name','File 01MDA') ;
    end
 
    if i==2
         x = [1020 785 453 862 425];
         y = [1573 2186 1415 1079 770];      
         show_Figure=figure('Name','06FTB') ;
       
    end
    if i==3
        x = [1036 692 366 747 405];
        y = [1799 2208 2388 1220 748];      
        show_Figure=figure('Name','08MLD') ;
     
    end
    sz = [80 80 80 80 80];
    c = [0 1 0; 1 0 0; 0.3010 0.7450 0.9330; 0.6 0 1 ; 0.9290 0.6940 0.1250];
    scatter(x,y,sz,c,"filled"); 
end
