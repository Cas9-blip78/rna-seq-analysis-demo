

###sra数据转化与数据质控


##使用fasterq-dump  3.4.1进行数据格式转换
===== 循环设计说明 =====
# 开发调试顺序：
# Step1：先 读取SRR列表, echo ${i} 测试变量读取是否正常
# Step2：echo打印 fasterq-dump，及选项，使用-S选项，生成read1、read2，确认压缩参数生效
# Step3：套入循环批量执行；为防止并发过多，本脚本采用串行逐个处理
# Step4：转换完成后，原始sra文件保留（可后续自行添加删除sra的代码，这里不自动删，避免误删）
# 注意：SRR_ACC.list 需要和sra文件在同一目录，一行一个SRR编号，不要空行
 for i in /ifs1/Vip4Data/9.rnaseq/data/PRJNA229998/*.sra;do echo fasterq-dump ${i} -S ; done ;

##压缩文件
pigz -p 32 *.fastq

##数据指控
 ===== 循环设计说明 =====
  # 开发调试顺序
# Step1读取上一步生成.gz文件，使用xargs -n -2对每两个文件分组
#Step2文件按R1,R2位于一行；while读取每组R1(i)、R2(j)
#Step3循环体内生成fastp命令，追加输出到脚本 fastp.sh， 后续可手动运行 fastp.sh
#fastp参数说明：
#    -q 20：碱基质量阈值；-u 30：允许低质量碱基占比上限；-w 12：线程数；
#    -z 4：输出压缩级别；-n 10：过滤N含量过高reads；输出质控后的压缩双端文件
#文件夹下不能存在其他.gz文件单端文件、孤儿read文件
mamba activate rnaseq 
ls -1 *.gz|xargs -n 2|while read {i,j};do  fastp -i ${i} -I ${j} -q 20 -u 30 -w 12 -z 4 -n 10 -o ${i%1.fastq.gz*}_clean_1.fastq.gz -O ${j%2.fastq.gz*}_clean_2.fastq.gz >> fastp.sh ;done
