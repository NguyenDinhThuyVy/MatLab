%tinh nang luong moi khung
function [ste]= calSTE(frames)
   ste = zeros(size(frames,1),1);
    for i=1: size(frames,1)
        ste(i)= sum(frames(i,:).^2);
    end
    ste = ste ./ max(ste);
end