close all;
clear all;
%% ��ȡʵ������
data = load('ʵ��1����.mat');
X = data.samples.';
%% ���ó�ʼ��ֵ
m1=[1,1,1];m2 =[-1,1,-1];M0 =[m1;m2];
%m1 = [1,1,-1];m2 = [0,0,0];M0 =[m1;m2];
%m1 =[0,0,0];m2 =[1,1,1];m3 =[-1,0,2];M0 = [m1;m2;m3];
%m1 =[-0.1,0,0.1];m2 =[0,-0.1,0.1]; m3 =[-0.1,-0.1,0.1];M0 = [m1;m2;m3];
[M,Xlabel,niter,Xlabelhistory] = Cmeancluster(X,M0);   %C��ֵ����
%[M,Xlabel,niter,Xlabelhistory] =fuzzyCmeans(X,M0,2,0.00001);  %ģ��C��ֵ����
%% ��ͼ
colors = ['or';'ok';'ob';'og';'oy'];
centers = ['*r';'*k';'*b';'*g';'*y'];
for ii = 1:size(M,1)
   idii = find(Xlabel==ii);
   scatter3(X(idii,1),X(idii,2),X(idii,3),colors(ii,:));
   hold on;
   scatter3(M(ii,1),M(ii,2),M(ii,3),centers(ii,:));
   hold on;
end
title('���ս��');

