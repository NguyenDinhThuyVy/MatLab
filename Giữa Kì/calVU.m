%ket hop ste va zcr de tim vi tri voice va unvoice
function [vu]= calVU(ste_norm,zcr_norm,T)
    for i=1:length(ste_norm)
        if(ste_norm(i)- zcr_norm(i) <T || ste_norm(i)<-0.8)
            vu(i)=0;
        else vu(i)=1;
        end
    end
end