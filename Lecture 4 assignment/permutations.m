function [surrogate,p]= permutations(x,k)
 
% input x is actual vector with + sign for active and -sign for rest state
% k is number of permutations
 
v=abs(x);
 
%%
% Here we set the variables and look for errors.
% Values:
% l = length of input vector
% m = maximum number of unique permutations considering vector length
% Possible errors: 
% 1) More permutations than possible. (This would crash the perm matrix loop) 
% 2) Input vector has uneven number of values.
 
l = length(v);

m = nchoosek(length(v),length(v)/2);

if k>m
    error('Error: The number of permutations is higher than the maximum number of possible permutations.')
end

if mod(l,2)~=0
    error('Error: The number of values in the input vector must be even.')
end

%% Create permutation matrix
% Here, we create the permutation matrix z. 
% The permutation matrix has an even number of positive and negative
% integers on each row, made of values -1 and +1. Thanks to the randperm
% function, the permutation matrix is different each time. You can view the
% permutation matrix by opening the variable z.


z=zeros(k,l);

for i=1:k
    permutation=zeros(1,l);
    while ismember(permutation,z,'rows')
        permutation = randperm(l);
        for j=1:length(permutation)
            if mod(permutation(j),2) ~= 0
                permutation(j) = 1;
            else permutation(j) = -1;
            end
        end
    end
    z(i,:) = permutation;
end
 
% Multiplication to randomly assign signs for permutations
mat=z.*v;
 
% Surrogate vector 
surrogate= mean(mat,2);
 
% Mean of actual vector
r_mean=mean(x);

% Create the histogram, and label the axes.

hist(surrogate)
hold on
line([r_mean r_mean],[0 3],'Color','red')
title('Mean for each permutation')
xlabel('Means')
ylabel('Counts')
 
% Calculate and print p value.

mm= find(surrogate<r_mean);
p= (1 - length(mm)/length(surrogate));
 
fprintf('P-value = %d',p);
end