function Grade = letter_grade(Score);
switch(fix(Score/10))
    case 10  
        Grade = 'A';
    case 9
        Grade = 'A';
    case 8
        Grade = 'B';
    case 7
        Grade = 'C';
    case 6
        Grade = 'D';
    otherwise
        Grade = 'F';
end
if Score>100 || Score<0
    Grade = 'Error';
end