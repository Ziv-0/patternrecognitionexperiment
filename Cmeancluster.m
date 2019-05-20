function [Mconver,Xlabelcover,niter,Xlabelhistory] = Cmeancluster(X,M)
%   C��ֵ���෽��
%   XΪ�������ݣ�MΪ��ֵ���� 
%   MconverΪ�������������������,niterΪ��������
%   XlabelcoverΪ���������,Xlabelhistoryÿ�ε����������ʷ���
nx = size(X,1);
nclass = size(M,1);
X = [X,zeros(nx,1)];
Xlabelhistory = [];
while(1)
%% ����
    for i = 1:nx
        X(i,end) = nearest(X(i,1:end-1),M);
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
    Nlabel = zeros(1,nclass);
    for i = 1:nx
        Mupdated(X(i,end),:) =  Mupdated(X(i,end),:) + X(i,1:end-1);
        Nlabel(X(i,end)) = Nlabel(X(i,end))+1;
    end
    for i = 1:nclass
        Mupdated(i,:) = Mupdated(i,:)/Nlabel(i);
    end
    if isequal(Mupdated,M)  %�ж��Ƿ�����
        break
    end
    M = Mupdated;
end
niter = size(Xlabelhistory,2);
Mconver = M;
Xlabelcover =  Xlabelhistory(:,end);
end

function label = nearest(x,M)
label = 1;
dismin = sum((x-M(1,:)).^2);
for i = 2:size(M,1)
    if sum((x-M(i,:)).^2)<dismin
        label =i;
         dismin =  sum((x-M(i,:)).^2);
    end
end
end
    
    

