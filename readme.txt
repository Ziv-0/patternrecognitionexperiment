实验一源程序
   主函数：main1.m   
   子函数：Cmeancluster.m C均值聚类子函数
                功能：迭代进行类别划分和聚类中心的计算，直到聚类中心不发生变化，
		      并计算迭代次数，程序包含每次迭代的可视化过程，每次迭代结
                      果画图后会pause，通过enter键使程序接着运行，各输入变量涵
                      义在对应.m文件里有说明
           fuzzyCmeans.m 模糊C均值聚类子函数
		功能：迭代进行类别划分和聚类中心的计算，直到聚类中心的变化小于阈
                      值（函数输入指定阈值大小threshold）程序包含每次迭代的可视化
                      过程，每次迭代结果画图后会pause，通过enter键使程序接着运行，
                      各输入变量涵义在对应.m文件里有说明
           

实验二源程序
   主函数：main2.m   产生仿真数据，设计fisher分类器，画出fisher分类器投影平面和决
                     策平面，调用子函数对测试集和训练集分类，得出各自分类结果并计
                     算错误率，计算贝叶斯决策面方程，并根据条件概率分布在决策域积
		     分得出贝叶斯理论最优错误率，此外计算了Bhattacharyya误差界限
   子函数：mulclasscatter2.m 多类别样本可视化
                功能：将二维的不同类别的样本以不同的颜色画在二维坐标系中
           linearclass.m 线性分类器
                功能： 利用输入的线性分类器参数w和阈值对样本进行分类，w和样本乘积
                       大于阈值和小于阈值的各分为一类
           classResSumary.m 对分类结果进行总结的函数，输出错误率，混淆矩阵等
                功能：通过对比样本的标签和分类器的预测标签，并进行统计，得到以个数
　　　　　　　　　　　为单位的混淆矩阵（Summary）和比率形式的混淆矩阵（Summaryinrate）
　　　　　　　　　　　以及总的正确率ａｃｃ
               