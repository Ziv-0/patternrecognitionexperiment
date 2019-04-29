function [Mconver,Xlabelcover,niter,Xlabelhistory] = Cmeancluster(X,M)
%   C��ֵ���෽��
%   XΪ�������ݣ�MΪ��ֵ���� 
%   MconverΪ�������������������,Mhistory����������ĵ�ÿ�ε�������ʷ���
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
    Xlabelhistory = [Xlabelhistory,X(:,end)];
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
    if isequal(Mupdated,M)
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
    end
end
end
    
    

