function [surrogate,p] = double_p(X,Y,k)

% Here we have a function which receives two vectors, and a value
% corresponding to the number of permutations. It then swaps a subset of 
% values at each permutation and computes the mean difference. The function
% returns the list of the surrogate values with a plot. This is similar to
% 'permutations.m' to a certain extent, also found in this repository.

%% First, set necessary variables and create a loop.

l=length(X);

% This loop swaps a subset (one pair) of values at each permutation, and
% computes the mean difference.

for i=1:l
   for j=1:l
  
    A=X;
    B=Y;
    A(i)=Y(j);
    B(j)=X(i);
    m(i,j)= mean(A)-mean(B);
    end
end
 
% Create vector for means & surrogate vector

means = reshape(m,[1,l*l]);

surrogate = means(1:k);

% Draw histogram of the distribution of surrogates

hist(surrogate)
hold on
r_mean=mean(X-Y);
line([r_mean r_mean],[0 4],'color','r')
title('permutations for two vectors')
xlabel('means')
ylabel('counts')

% Report the p value of the calculation by finding the fraction of
% permutation surrogate values smaller than the actual unpermuted
% difference of the means.

mm= find(surrogate<r_mean);

p= (1 - length(mm)/length(surrogate));

fprintf('P-value = %d',p);

end