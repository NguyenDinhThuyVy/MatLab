function [T_tb] = Binary_Search(ste, vol, sil)
    f = ste(sil);
    g = ste(vol);
    T_min = max(min(f), min(g));
    T_max = min(max(f), max(g));
    T_tb = (T_min + T_max)/2;
    N_f = length(f);
    N_g = length(g);
    i = length(find(f<T_tb));
    p = length(find(g>T_tb));
    j = -1;
    q = -1;
    while (i~=j && p~=q)
        a = sum(f(f>T_tb)-T_tb)/N_f;
        b = sum(T_tb-g(g<T_tb))/N_g;
        if a - b > 0
            T_min = T_tb;
        else
            T_max = T_tb;
        end
        T_tb = (T_min+T_max)/2;
        j = i;
        q = p;
        i = sum(f<T_tb);
        p = sum(g>T_tb);
    end
end