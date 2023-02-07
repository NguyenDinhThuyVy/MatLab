% Loc du lieu
function [filter]= Filter(data)
% 11011
for i=2:length(data)-1
    if(data(i) ~= data(i+1)) && (data(i) ~=data(i-1))
        data(i)= data(i-1);
    end
end

% 110011
for i=2:length(data)-2
    if(data(i) == data(i+1)) && (data(i) ~=data(i-1)) &&(data(i) ~=data(i+2))
        data(i)= data(i-1);
        data(i+1)= data(i-1);
    end
end
    filter=data;
end