function labels =linearclass(X,w,threshold)
%   ���Է�����
%   w*x��threshold��Ϊ��һ�࣬����Ϊ�ڶ���
Nx = size(X,1);
labels = 2*ones(Nx,1);
results = X*w.';
labels(find(results>threshold)) = 1;
end

