x = -4: 0.1: 5;

y1 = x;
y2 = cos(x);
y3 = exp(x);
y4 = x.* x;
y5 = log(x);
y6 = asin(x);

%histogram
for i=1:6
    eval(['figure;hist(y' num2str(i) ',x);']);
end

