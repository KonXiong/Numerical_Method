clear;clc;
A=[ 2,-1, 1;
   -1,-2, 3;
    1, 3, 1];
B=[ 1, 2, 3;
    2, 1, 4;
    5, 2, 1];
[LA,UA,PA]=lu(A)
[LB,UB,PB]=lu(B)
