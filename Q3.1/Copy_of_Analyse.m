clear; clc;
X = [76,79,91,0,19,41,1;76,61,93,81,27,46,83;95,7,73,5,19,44,20;95,7,73,89,20,74,52;95,7,40,35,60,93,67;95,45,92,41,13,1,84];
Max_Column = max(X, [], 1)  %计算每列最大值
Max_Row = max(X, [], 2)  %计算每行最大值
Min_Column = min(X, [], 1)  %计算每列最小值
Min_Row = min(X, [], 2)  %计算每行最小值
Ave_Column = mean(X, 1)  %计算每列平均值
Ave_Row = mean(X, 2)  %计算每行平均值
Med_Column = median(X, 1)  %计算每列中位数
Med_Row = median(X, 2)  %计算每行中位数
Std_Column = std(X, 0, 1)  %计算每列标准差
Std_Row = std(X, 0, 2)  %计算每行标准差

Sort_Rows = sortrows(X, [1 2 3])  %对1、2、3列同时排序

Max = max(max(X))  %所有元素中的最大值
Min = min(min(X))  %所有元素中的最小值
[NMax_Row, NMax_Column] = find(X==Max)  %找到最大值对应的行列
[NMin_Row, NMin_Column] = find(X==Min)  %找到最小值对应的行列

Sum_Column = sum(X)  %等同 Sum_Row = sum(X,1);  求每列的的和
Sum_Row = sum(X,2)  %求每行的和
Sum = sum(sum(X))  %求所有元素的和


