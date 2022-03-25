function R1=Do_Game
disp(' ');
R1 = input('请输入您的选择【1-石头，2-剪刀，3-布，0-不玩了】：');
if (R1==0) 
    return 
end
%随机数
R0 = floor(3*rand + 1);
fprintf('您选择了%d,计算机选择了%d\n\n',R1,R0);
% disp(sprintf('您选择了%d,计算机选择了%d\n',R1,R0));
if (R1==R0)
    disp('两者一样，和！');
elseif (R1==1)
    %if分行
    if (R0==2)
        disp('您赢了！');
    else
        disp('您输了！');
    end
elseif (R1==2)
    %if同行
    if (R0==1),disp('您输了！');else disp('您赢了！'); end 
elseif (R1==3)
    if (R0==1),disp('您赢了！');else disp('您输了！'); end
end