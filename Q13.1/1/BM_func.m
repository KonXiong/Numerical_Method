function [x,hasroot] = BM_func(func,a,b,eps1,eps2)
k = 0;
hasroot = 0;
%hasroot=0表示无根，为1则有根
    while k<10000
        x = (a+b)/2;
        xe = (b-a)/2;
        %满足精度退出
        if abs(func(x)) < eps1
            hasroot = 1;
            break;
        elseif abs(xe) < eps2
            break;
        end
        %趋向零点
        if func(a)*func(x)<0
            b=x;
        else
            a=x;
        end
    end
end