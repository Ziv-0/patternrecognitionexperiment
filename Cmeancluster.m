function [Mconver,Xlabelcover,Mhistory,Xlabelhistory] = Cmeancluster(X,M)
%   C��ֵ���෽��
%   XΪ�������ݣ�MΪ��ֵ���� 
%   MconverΪ�������������������,Mhistory����������ĵ�ÿ�ε�������ʷ���
%   XlabelcoverΪ���������,Xlabelhistoryÿ�ε����������ʷ���
while(flag ==1)
    flag = 0;
    nclass = size(M,1);
    for i = 1:size(X,1)
        x = X(1,:);
        labe = nearest(x,M);
    end
    m = zeros(size(M));
    for i = 1:size(X,1)
        m(X(i,end),:) =  m(X(i,end),:) + X(i,1:end-1);
        labe = nearest(x,M);
    end
    flag = notisequal()
end
end

