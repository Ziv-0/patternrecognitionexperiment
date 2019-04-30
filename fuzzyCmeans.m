function [Mconver,Xlabelcover,niter,Xlabelhistory] = fuzzyCmeans(X,M,b,threshold)
%   ģ��C��ֵ���෽��
%   XΪ�������ݣ�MΪ��ֵ���� ,bΪ����,thresholdΪ����M�ĵ��������ֵ��С����ֵ����Ϊ����
%   MconverΪ�������������������
%   XlabelcoverΪ���������,Xlabelhistoryÿ�ε����������ʷ���
nx = size(X,1);
nclass = size(M,1);
X = [X,zeros(nx,1)];
Xlabelhistory = [];
mu = zeros(nx,nclass);
while(1)
%% ����
    for i = 1:nx
        mu(i,:) =  MemshipDegree(X(i,1:end-1),M,b);
        [~,X(i,end)] = max(mu(i,:));
    end
    Xlabel = X(:,end);
    Xlabelhistory = [Xlabelhistory,Xlabel];
%% ÿ�ε����Ľ����ͼ
 close all;
 colors = ['or';'ok';'ob';'og';'oy'];
 centers = ['*r';'*k';'*b';'*g';'*y'];
for ii = 1:size(M,1)
   idii = find(Xlabel==ii);
   scatter3(X(idii,1),X(idii,2),X(idii,3),colors(ii,:));
   hold on;
   scatter3(M(ii,1),M(ii,2),M(ii,3),centers(ii,:));
   hold on;
end
title('��ͼ�ȴ���,��enter����������');
pause; 
%% ��ֵ����
    Mupdated = zeros(size(M));
    for j = 1:nclass
        temp  = (mu(:,j).^b).'*X(:,1:end-1);
        Mupdated(j,:) = temp/sum(mu(:,j).^b);
    end
    if sum(sum(abs(Mupdated-M)))<threshold  %�ж��Ƿ�����
        break
    end
    M = Mupdated;
end
niter = size(Xlabelhistory,2);
Mconver = M;
Xlabelcover =  Xlabelhistory(:,end);
end


function mu = MemshipDegree(x,M,b)
mu = zeros(1,size(M,1));
for i = 1:size(M,1)
    mu(i) =( 1/sum((x-M(i,:)).^2))^(1/(b-1));
end
mu = mu/sum(mu);
end
