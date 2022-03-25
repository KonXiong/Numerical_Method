function Grade = letter_grade2(Score)
x_y=size(Score);
Grade=strings(x_y(1,1),x_y(1,2));
for g=1:max(x_y)
    %正数区间fix截尾和floor取小功能一样
    switch(fix(Score(g,1)/10))
        case 10 
            Grade(g,1) = 'A';
        case 9
            Grade(g,1) = 'A';
        case 8
            Grade(g,1) = 'B';
        case 7
            Grade(g,1) = 'C';
        case 6
            Grade(g,1) = 'D';
        otherwise
            Grade(g,1) = 'F';
    end
    if Score(g,1)>100 || Score(g,1)<0
        Grade(g,1) = 'Error';
    end
end
Grade=[Score Grade];
