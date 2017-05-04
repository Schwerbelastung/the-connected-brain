%% Calculation of measures

load('macaque71.mat')
% 1. Degree and similiarity

% a. Degree

[deg] = degrees_und(CIJ);
figure()
subplot(1,3,1)
stem(deg)
title('nodes~degree')
xlabel('nodes')
ylabel('degree')
subplot(1,3,2)
hist(deg)
title('histogram distribution of degrees')
xlabel('degrees')
ylabel('degree counts')
subplot(1,3,3)
boxplot(deg)
title('boxplot of degrees')
xlabel('all nodes')
ylabel('degree')

% b.Strength 
