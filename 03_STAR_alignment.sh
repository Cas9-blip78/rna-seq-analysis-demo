#03_STAR_alignment.sh
# Purpose: STAR剪接比对
# Input: 02输出的clean fastq
# Output: 排序后的BAM文件，STAR日志

#下载人基因组比对索引，10X genomics 官网下载
#https://support.10xgenomics.com/single-cell-gene-expression/software/releasenotes/build#GRCh38_2020A
#人基因组
wget https://cf.10xgenomics.com/supp/cell-exp/refdata-gex-GRCh38-2024-A.tar.gz
tar -zxf refdata-gex-GRCh38-2024-A.tar.gz

##STAR比对，适配star软件2.7.1a版本
# SRR1039508
STAR --genomeDir /ifs1/Database/refdata-gex-GRCh38-2024-A/star \
         --readFilesIn SRR1039508__clean_1.fastq.gz SRR1039508__clean_2.fastq.gz \
         --readFilesCommand zcat \
         --outDir ./03_bam/SRR1039508 \
         --outSAMtype BAM Unsorted

# SRR1039509
         STAR --genomeDir /ifs1/Database/refdata-gex-GRCh38-2024-A/star \
             --readFilesIn SRR1039509__clean_1.fastq.gz SRR1039509__clean_2.fastq.gz \
             --readFilesCommand zcat \
             --outDir ./03_bam/SRR1039509 \
             --outSAMtype BAM Unsorted

# SRR1039512
             STAR --genomeDir /ifs1/Database/refdata-gex-GRCh38-2024-A/star \
                 --readFilesIn SRR1039512__clean_1.fastq.gz SRR1039512__clean_2.fastq.gz \
                 --readFilesCommand zcat \
                 --outDir ./03_bam/SRR1039512 \
                 --outSAMtype BAM Unsorted

# SRR1039513
                 STAR --genomeDir /ifs1/Database/refdata-gex-GRCh38-2024-A/star \
                     --readFilesIn SRR1039513__clean_1.fastq.gz SRR1039513__clean_2.fastq.gz \
                     --readFilesCommand zcat \
                     --outDir ./03_bam/SRR1039513 \
                     --outSAMtype BAM Unsorted

# SRR1039516
                     STAR --genomeDir /ifs1/Database/refdata-gex-GRCh38-2024-A/star \
                         --readFilesIn SRR1039516__clean_1.fastq.gz SRR1039516__clean_2.fastq.gz \
                         --readFilesCommand zcat \
                         --outDir ./03_bam/SRR1039516 \
                         --outSAMtype BAM Unsorted

# SRR1039517
                         STAR --genomeDir /ifs1/Database/refdata-gex-GRCh38-2024-A/star \
                             --readFilesIn SRR1039517__clean_1.fastq.gz SRR1039517__clean_2.fastq.gz \
                             --readFilesCommand zcat \
                             --outDir ./03_bam/SRR1039517 \
                             --outSAMtype BAM Unsorted

# SRR1039520
                             STAR --genomeDir /ifs1/Database/refdata-gex-GRCh38-2024-A/star \
                                 --readFilesIn SRR1039520__clean_1.fastq.gz SRR1039520__clean_2.fastq.gz \
                                 --readFilesCommand zcat \
                                 --outDir ./03_bam/SRR1039520 \
                                 --outSAMtype BAM Unsorted

# SRR1039521
                                 STAR --genomeDir /ifs1/Database/refdata-gex-GRCh38-2024-A/star \
                                     --readFilesIn SRR1039521__clean_1.fastq.gz SRR1039521__clean_2.fastq.gz \
                                     --readFilesCommand zcat \
                                     --outDir ./03_bam/SRR1039521 \
                                     --outSAMtype BAM Unsorted
##--genomeDir：解压后的STAR索引文件夹，这里使用10X refdata-gex-GRCh38-2024-A作为star索引
# --readFilesIn：双端质控后的压缩fastq，正向、反向reads
# --readFilesCommand zcat：直接读取gz压缩文件，无需提前解压，节省磁盘空间
# --outSAMtype BAM Unsorted：输出未排序BAM
# 选择Unsorted原因：STAR内置坐标排序消耗大量CPU与时间；
# 后续如果需要排序，可单独用samtools sort分步处理，方便灵活调度资源



