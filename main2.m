clear all;
close all;
rng(5);
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
h = plot(points(:,1),points(:,2),'DisplayName','FisherͶӰƽ��');
%% ��������ƽ��
n = [w(2),-w(1)];
%xsweep = -5:5;
points = center  +  xsweep.'*n;
h = plot(points(:,1),points(:,2),'DisplayName','Fisher����ƽ��');
%% ����
%ѵ�������ಢ�ܽ������
threshold = center*w.';
Trprelabel =linearclass(XTrain(:,1:end-1),w,threshold);
[Tracc,TrSummary,TrSummaryinrate] = classResSumary(Trprelabel,XTrain(:,end))
disp(['ѵ����������' num2str(1 - Tracc)]);
%���Լ����ಢ�ܽ������
Teprelabel =linearclass(XTest(:,1:end-1),w,threshold);
[Teacc,TeSummary,TeSummaryinrate] = classResSumary(Teprelabel,XTest(:,end))
disp(['���Լ�������' num2str(1 - Teacc)]);
%% ����Bhattacharyya������
Jb = 1/8*(mu2-mu1)/((sigma1+sigma2)/2)*(mu2-mu1).'...
    + 0.5*log(det((sigma1+sigma2)/2)/sqrt(det(sigma1)*det(sigma2)));
pe = 0.5*exp(-Jb);
disp(['Bhattacharyya���������:' num2str(pe)]);
%% ��Ҷ˹�������
syms x
syms y 
if size(mu1,2)~=1
mu1 = mu1.';
mu2 = mu2.';
end
XY = [x;y];
pxw1 = 1/(2*pi*sqrt(det(sigma1)))*exp(-(XY-mu1).'*inv(sigma1)*(XY-mu1)/2);
pxw2 = 1/(2*pi*sqrt(det(sigma2)))*exp(-(XY-mu2).'*inv(sigma2)*(XY-mu2)/2);
%��Ҷ˹��������
g = solve(pxw1==pxw2,x);
gnumeric = str2func(['@(y)',vectorize(simplify(g))]);
%������Ҷ˹������
figure(1);
tempy=-15:0.01:10;
tempx = feval(gnumeric,tempy);
plot(tempx,tempy,'DisplayName','��Ҷ˹������')
%ͨ�����ּ���pe1
h1 = int(pxw1,x,g,inf);
fy1 = str2func(['@(y)',vectorize(simplify(h1))]);
pe1 = integral(fy1,-inf,inf);
%ͨ�����ּ���pe2
h2 = int(pxw2,x,-inf,g);
fy2 = str2func(['@(y)',vectorize(simplify(h2))]);
pe2 = integral(fy2,-inf,inf);
%��Ҷ˹�������
pe = 0.5*pe1 + 0.5*pe2;
disp(['��Ҷ˹�������:' num2str(pe)]);