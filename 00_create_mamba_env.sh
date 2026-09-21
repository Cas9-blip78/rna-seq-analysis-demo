# 00_setup_rnaseq_env.sh
# Purpose: Create mamba environment "rnaseq" for RNA-seq analysis
# Software list: fastqc, fastp, STAR, subread (featureCounts)
# Usage: bash 00_setup_rnaseq_env.sh
# Note: This script only creates & installs packages, does NOT auto-activate env
# After installation: mamba activate rnaseq


###创建mamba环境
mamba create -n rnaseq -y

###安装mamba软件
##安装数据过滤，质控软件
mamba install -n rnaseq -y fastqc
mamba install -n rnaseq -y fastp

##安装数据对比软件
mamba install -n rnaseq -y star=2.6.1d

##安装 read count软件
mamba install -n rnaseq -y subread
