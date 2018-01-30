clear
load('compEx3data.mat');

std1 = std (x {1 }(1:2 ,:) ,0 ,2);
x1mean = mean (x {1 }(1:2 ,:) ,2);
x2mean = mean (x {2 }(1:2 ,:) ,2);

std2 = std (x {2 }(1:2 ,:) ,0 ,2);



N1 = [std1(1), 0, -std1(1)*x1mean(1); 0 std1(2) -std1(2)*x1mean(2); 0 0 1];
N2 = [std2(1), 0, -std2(1)*x2mean(1); 0 std2(2) -std2(2)*x2mean(2); 0 0 1];


x1 = N1 * x{1};
x2 = N2 * x{1};
figure;
plot (x1 (1 ,:) , x1 (2 ,:) , '. ')
figure;
plot (x2 (1 ,:) , x2 (2 ,:) , '. ')


