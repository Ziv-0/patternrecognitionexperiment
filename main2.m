clear all;
close all;
%% ����
mu1 = [-2,-2];sigma1=[1 0;0 1];
mu2 = [ 2,2]; sigma2=[1 0;0 4]; 
%% ������������
N = 1100;
X1 = mvnrnd(mu1,sigma1,1100);
X2 = mvnrnd(mu2,sigma2,1100);
Ntrain = 100;
X1Train = X1(1:Ntrain,:);
X2Train = X2(1:Ntrain,:);
XTrain = [X1Train,ones(Ntrain,1);X2Train,2*ones(Ntrain,1)];
XTest = [ X1(Ntrain+1:end,:),ones(N-Ntrain,1); X2(Ntrain+1:end,:),2*ones(N-Ntrain,1)];
%% ������������ɢ��ͼ
mulclasscatter2(XTrain);
title('ѵ�������ֲ�');
axis equal;
%% fisher ���Է��������
mu1T = mean(X1Train)
mu2T = mean(X2Train)
sigmaX1T = cov(X1Train)
sigmaX2T = cov(X2Train)
sw = sigmaX1T + sigmaX2T;
w = (sw^-1*(mu1T-mu2T).').';
%% ����ͶӰƽ��
center = (mu1T+mu2T)/2;
xsweep = -6:6;
points = center  +  xsweep.'*w;
h = plot(points(:,1),points(:,2),'DisplayName','ͶӰƽ��');
%% ��������ƽ��
n = [w(2),-w(1)];
%xsweep = -5:5;
points = center  +  xsweep.'*n;
h = plot(points(:,1),points(:,2),'DisplayName','����ƽ��');
%% ����
%ѵ�������ಢ�ܽ������
threshold = center*w.';
Trprelabel =linearclass(XTrain(:,1:end-1),w,threshold);
[Tracc,TrSummary,TrSummaryinrate] = classResSumary(Trprelabel,XTrain(:,end))
disp('ѵ����������');
PeTr = 1 - Tracc
%���Լ����ಢ�ܽ������
Teprelabel =linearclass(XTest(:,1:end-1),w,threshold);
[Teacc,TeSummary,TeSummaryinrate] = classResSumary(Teprelabel,XTest(:,end))
disp('���Լ�������');
PeTe = 1 - Teacc
%% ����Bhattacharyya������
Jb = 1/8*(mu2-mu1)/((sigma1+sigma2)/2)*(mu2-mu1).'...
    + 0.5*log(det((sigma1+sigma2)/2)/sqrt(det(sigma1)*det(sigma2)));
disp('���������:');
pe = 0.5*exp(-Jb)
disp('1-���������:');
acc = 1 - pe



