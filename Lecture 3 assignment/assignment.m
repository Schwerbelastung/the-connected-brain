%% Part-1 Calculation of measures

load('macaque71.mat')
%% 1. Degree and similiarity

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

% b. Joint degree

[Joint_dgr] = jdegree(CIJ);
figure()
imagesc(Joint_dgr)
colorbar
title('Joint degree Matrix')



% c. Neighborhood overlap

[Nhood_ovlp] = edge_nei_overlap_bd(CIJ);
figure()
imagesc(Nhood_ovlp)
title('Neighborhood overlap matrix')
colorbar
% f. Matching index

[match_ndx] = matching_ind(CIJ);
figure()
imagesc(match_ndx)
title('Matching index')
xlabel('nodes')
ylabel('nodes')
title('Matching index')
colorbar


%% 2. Density and Rentian Scaling

% a. Density

[Dens] = density_dir(CIJ);

%% 3. Clustering and Community Structure

% a. Clustering coefficient

 [clus] = clustering_coef_bd(CIJ);

figure()
subplot(1,3,1)
stem(clus)
title('clustering coeffecients')
xlabel('nodes')
ylabel('clustering coeffecients')
subplot(1,3,2)
hist(clus)
title('histogram-clusering coeffecient')
xlabel('clusering coeffecients')
ylabel('clusering coeffecient counts')
subplot(1,3,3)
boxplot(clus)
title('boxplot-clusering coeffecient')
xlabel('all nodes')
ylabel('clusering coeffecients')

% b. Transitivity

 [trans] = transitivity_bd(CIJ);
 
% c. Local Efficiency

E=efficiency_bin(CIJ,1);

figure()
subplot(1,3,1)
stem(E)
title('Local Efficiency')
xlabel('nodes')
ylabel('Local Efficiency')
subplot(1,3,2)
hist(E)
title('histogram-Local Efficiency')
xlabel('Local Efficiency')
ylabel('Local Efficiency counts')
subplot(1,3,3)
boxplot(E)
title('boxplot-Local Efficiency')
xlabel('all nodes')
ylabel('Local Efficiency')

% d. community structure and Modularity

[M,Q]= community_louvain(CIJ);

figure()
subplot(1,3,1)
stem(M)
title('Community structure')
xlabel('nodes')
ylabel('Community structure')
subplot(1,3,2)
hist(M)
title('histogram-Community structure')
xlabel('Community structure')
ylabel('Community structure counts')
subplot(1,3,3)
boxplot(M)
title('boxplot-Community structure')
xlabel('all nodes')
ylabel('Community structure')

%% 4. Assortativity

% a. Assortativity

r = assortativity_bin(CIJ,1);
r = assortativity_bin(CIJ,2);
r = assortativity_bin(CIJ,3);
r = assortativity_bin(CIJ,4);

%% b. rich club coefficient

[R,Nk,Ek] = rich_club_bd(CIJ);

stem(Nk,R)
title('number of nodes with degree>k ~Rich club coefficients')
ylabel('Rich club coefficients')
xlabel('number of nodes with degree>k')

% c. Core periphery structure

[C,q] = core_periphery_dir(CIJ);

plot(C)
title('Core periphery structure')
ylabel('binary vector of optimal core structure')
xlabel('nodes')

% K-Kore

[CIJkcore,kn,peelorder,peellevel] = kcore_bd(CIJ);

% Dont know what is K

%% 5. Paths and Distances

% a. walks

[Wq,twalk,wlq] = findwalks(CIJ);

% How to plot Wq? Its 3D, which function is suitable?

% b. reachability and Distance

[R,D] = reachdist(CIJ);

imagesc(D)
title('lengths of shortest paths between all pairs of nodes')
xlabel('nodes')
ylabel('nodes')
colorbar

%
imagesc(R)
title('reachability between all pairs of nodes')
xlabel('nodes')
ylabel('nodes')
colorbar

% c.

[lambda,efficiency,ecc,radius,diameter] = charpath(D);

% Giving infinte values, some problem

% d. Cycle probability: need findpaths matrix which needs many unknown
% parameters
%% 6. Efficiency and Diffusion
%Efficiency has been already done

% a. Mean first passage time

MFPT = mean_first_passage_time(CIJ);
imagesc(MFPT)
colorbar
title('Mean first passage time')
xlabel('nodes')
ylabel('nodes')

% b. Diffusion efficiency

[GEdiff,Ediff] = diffusion_efficiency(CIJ);

imagesc(Ediff)
colorbar
title('Diffusion efficiency')
xlabel('nodes')
ylabel('nodes')

%% 7. Centrality

% a. Betweenness Centrality

BC=betweenness_bin(CIJ);
figure()
subplot(1,3,1)
stem(BC)
title('Betweenness Centrality')
xlabel('nodes')
ylabel('Betweenness Centrality')
subplot(1,3,2)
hist(BC)
title('histogram Betweenness Centrality')
xlabel('centrality')
ylabel('counts')
subplot(1,3,3)
boxplot(BC)
title('boxplot')
xlabel('all nodes')
ylabel('Betweenness Centrality')

% b. Edge betweenness centrality


[EBC,BC]=edge_betweenness_bin(CIJ);
imagesc(EBC)
colorbar
title('Edge betweenness centrality')
xlabel('nodes')
ylabel('nodes')

%% c. Within-module degree z-score

Z=module_degree_zscore(CIJ,M,3);

figure()
subplot(1,3,1)
stem(Z)
title('Z score')
xlabel('nodes')
ylabel('Z score')
subplot(1,3,2)
hist(Z)
title('histogram Z score')
xlabel('Z score')
ylabel('counts')
subplot(1,3,3)
boxplot(Z)
title('boxplot')
xlabel('all nodes')

%% d. Participation coeffecient

 P = participation_coef(CIJ,M,1);

 figure()
subplot(1,3,1)
stem(P)
title(' Participation coeffecients')
xlabel('nodes')
ylabel(' Participation coeffecient')
subplot(1,3,2)
hist(P)
title('histogram')
xlabel(' Participation coeffecient')
ylabel('counts')
subplot(1,3,3)
boxplot(P)
title('boxplot')
xlabel('all nodes')

% e. K coreness centrality

[coreness,kn] = kcoreness_centrality_bd(CIJ);

subplot(1,3,1)
stem(coreness)
title('k coreness centrality')
xlabel('nodes')
ylabel('coreness')
subplot(1,3,2)
hist(coreness)
title('histogram')
xlabel('k coreness centrality')
ylabel('counts')
subplot(1,3,3)
boxplot(coreness)
title('boxplot')
xlabel('k coreness centrality')

% f. Flow Coeffecients

[hc,HC,total_flo] = flow_coef_bd(CIJ);

subplot(1,3,1)
stem(hc)
title('flow coeffecients for each node')
xlabel('nodes')
ylabel('flow coeffecient')
subplot(1,3,2)
hist(hc)
title('histogram')
xlabel('flow coeffecient')
ylabel('counts')
subplot(1,3,3)
boxplot(hc)
title('boxplot')
xlabel('all nodes')

% g. Shortcuts

[Erange,eta,Eshort,fs] = erange(CIJ);

imagesc(Erange)
colorbar
xlabel('nodes')
ylabel('nodes')
title('range for each edge')

%% H) Motifs

% 

make_motif34lib

[f,F] = motif3struct_bin(CIJ);
[f4,F4] = motif4struct_bin(CIJ);

imagesc(F)
title('node structural class-4 motif')
xlabel('nodes')
ylabel('node motif frequency fingerprint')

%

[f,F] = motif4funct_bin(CIJ);
[f4,F4] = motif4funct_bin(CIJ);
%
imagesc(F)
title('node functional class-4 motif')
xlabel('nodes')
ylabel('node motif frequency fingerprint')
colorbar


%% Part-2 Visualization

% Grid communities

                              
    [C,Q] = modularity_und(CIJ);     % get community assignments
    [X,Y,INDSORT] = grid_communities(C); % call function
    imagesc(CIJ(INDSORT,INDSORT));           % plot ordered adjacency matrix
    hold on;                                 % hold on to overlay community visualization
    plot(X,Y,'r','linewidth',2);
    title('grid visualization')
    xlabel('nodes')
    ylabel('nodes')

