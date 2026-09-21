# Note: Please create SRR_ACC.list in the same folder, one SRR number per line.
# Example content inside SRR_ACC.list:
# SRR1234567
# SRR1234568


###从ENSEMBL 网站下载人基因组FASTA与GTF文件，从AWS上下载所用案例的数据
wget
http://ftp.ensembl.org/pub/release-98/fasta/homo_sapiens/dna/Homo_sapiens.GRCh
38.dna.primary_assembly.fa.gz
wget
http://ftp.ensembl.org/pub/release-98/gtf/homo_sapiens/Homo_sapiens.GRCh38.98.
gtf.gz

###从AWS 数据库上下载案例原始数据
##案例数据：采用了 4 种呼吸道平滑肌肉细胞（airway smooth muscle cells），每种细胞均有地塞米松治疗、非治疗两类。4 个人体气道平滑肌细胞系，使用药物地塞米松 dexamethasone，进行比较，样品名：N61311，N052611，N080611，N061011，分组：dex：untrt，trt

cat SRR_ACC.list | while read i;
do 
  echo aws s3 cp --no-sign-request s3://sra-pub-run-odp/sra/${i}/${i} ${i}.sra;
  done


