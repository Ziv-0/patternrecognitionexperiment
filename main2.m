clear all;
close all;
%% ����
mu1 = [-2,-2];sigma1=[1 0;0 1];
mu2 = [ 2,2]; sigma2=[1 0;0 4]; 
%% ������������
N = 1100;
X1 = mvnrnd(mu1,sigma1,1100);
X2 = mvnrnd(mu2,sigma2,1100);
X = [X1,ones(N,1);X2,2*ones(N,1)];
%% ������������ɢ��ͼ
mulclasscatter2(X);
axis equal;
%% ��Ҷ˹���߷�����

