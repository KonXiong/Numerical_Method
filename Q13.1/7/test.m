clear;clc;
A=[ 2,-1, 1;
   -1,-2, 3;
    1, 3, 1];
B=[ 1, 2, 3;
    2, 1, 4;
    5, 2, 1];
normAi = norm(A,inf)
normA1 = norm(A,1)
normA2 = norm(A,2)
normBi = norm(B,inf)
normB1 = norm(B,1)
normB2 = norm(B,2)

condAi = cond(A,inf)
condA1 = cond(A,1)
condA2 = cond(A,2)
condBi = cond(B,inf)
condB1 = cond(B,1)
condB2 = cond(B,2)
