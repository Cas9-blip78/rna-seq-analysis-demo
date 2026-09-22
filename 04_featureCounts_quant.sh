# Script: 04_featureCounts_quant.sh
# Purpose: 使用STAR比对输出的BAM文件，通过featureCounts进行基因水平read计数
# Workflow dependency: 承接 03_star_align.sh 产生的 *.Aligned.sortedByCoord.out.bam
# Software: featureCounts 2.1.1 (subread软件包)
# Environment:承接00.sh准备的 mamba生信环境
# Input: STAR比对后排序BAM文件
# Output: 基因计数矩阵、计数汇总统计文件

featureCounts -g gene_id -a /ifs1/Database/refdata-gex-GRCh38-2024-A/genes/genes.gtf.gz -Q 10 --primary -s 0 -p -T 8 -o counts.txt  /ifs1/Vip4Data/9.r
naseq/data/bam_star/*.bam
#  运行参数详细说明
#    - -g gene_id：以基因为单位汇总计数结果
#    - -Q 10：过滤比对质量值低于10的无效reads
#    - --primary：仅统计主比对结果，忽略多重比对reads
#    - -s 0：适配无链特异性的RNA测序文库
#    - -p：适配双端测序数据模式
#    - -T 8：启用8线程并行运算，提升运行速度


