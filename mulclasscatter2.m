function  mulclasscatter2(X)
%   ��������������ݵ�ɢ��ͼ
%   XΪ�������ݣ�����Ϊn*3����������Ϊǰ���У����Ϊ������,
%   ������࣬��ͨ����colors����֧�������,�����Ŵ�1��ʼ
%   by xupengzheng in hit
 colors = ['or';'ok';'ob';'og';'oy'];
 Xlabel = X(:,end);
 C = unique(Xlabel);
 figure;
 str_legend=[];
for ii = 1:length(C)
   idii = find(Xlabel==ii);
   scatter(X(idii,1),X(idii,2),colors(ii,:));
   str_legend=([str_legend;['��' num2str(ii) '��']]);
   hold on;
end
legend(str_legend);
end
