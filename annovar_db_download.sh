# Date: 201708
# Annovar database download
# Reference genome version: GRCh37/hg19 | GRCh38/hg38
# URL: http://annovar.openbioinformatics.org/en/latest/user-guide/download/
# Hang-on database path: /usr/src/annovar/humandb/
#---------------------------

# Creat humandb folder
if [ -d ~/humandb ]; then
        echo 'humandb folder exist!!'
else mkdir ~/humandb;
        echo 'Create humandb folder done!'
fi

export DB_PATH=$HOME/humandb/

## Gene-based ##
# NCBI RefSeq v.201706
annotate_variation.pl -buildver hg19 -downdb -webfrom annovar refGene $DB_PATH
annotate_variation.pl -buildver hg38 -downdb -webfrom annovar refGene $DB_PATH
# UCSC KnownGene v.201706
annotate_variation.pl -buildver hg19 -downdb -webfrom annovar knownGene $DB_PATH
annotate_variation.pl -buildver hg38 -downdb -webfrom annovar knownGene $DB_PATH
# Ensembl Gene v.201706
annotate_variation.pl -buildver hg19 -downdb -webfrom annovar ensGene $DB_PATH

## Region-based ##
# UCSC cytoBand
annotate_variation.pl -buildver hg19 -downdb cytoBand $DB_PATH
# UCSC cytoBand hg38
# cd $DB_PATH && wget -c http://hgdownload.cse.ucsc.edu/goldenpath/hg38/database/cytoBand.txt.gz && gunzip -d cytoBand.txt.gz && mv cytoBand.txt hg38_cytoBand.txt

# UCSC genomicSuperDups
annotate_variation.pl -buildver hg19 -downdb genomicSuperDups $DB_PATH
# UCSC genomicSuperDups hg38
# cd $DB_PATH && wget -c http://hgdownload.cse.ucsc.edu/goldenpath/hg38/database/genomicSuperDups.txt.gz && gunzip -d genomicSuperDups.txt.gz && mv genomicSuperDups.txt hg38_genomicSuperDups.txt

# UCSC phastConsElements100way
annotate_variation.pl -buildver hg19 -downdb phastConsElements100way $DB_PATH
# cd $DB_PATH && wget -c http://hgdownload.cse.ucsc.edu/goldenpath/hg38/database/phastConsElements100way.txt.gz && gunzip -d phastConsElements100way.txt.gz && mv phastConsElements100way.txt hg38_phastConsElements100way.txt


## Filter-based ##
# 1000 Genome v.20150824
annotate_variation.pl -buildver hg19 -downdb -webfrom annovar 1000g2015aug $DB_PATH
annotate_variation.pl -buildver hg38 -downdb -webfrom annovar 1000g2015aug $DB_PATH
# LJB v.20140925
annotate_variation.pl -buildver hg19 -downdb -webfrom annovar ljb26_all $DB_PATH
annotate_variation.pl -buildver hg38 -downdb -webfrom annovar ljb26_all $DB_PATH
# COSMIC70 v.20140911
# annotate_variation.pl -buildver hg19 -downdb -webfrom annovar cosmic70 $DB_PATH

# NCBI dbSNP147 v.20160606
annotate_variation.pl -buildver hg19 -downdb -webfrom annovar avsnp147 $DB_PATH
annotate_variation.pl -buildver hg38 -downdb -webfrom annovar avsnp147 $DB_PATH
# NCI60 v.20130724
annotate_variation.pl -buildver hg19 -downdb -webfrom annovar nci60 $DB_PATH
annotate_variation.pl -buildver hg38 -downdb -webfrom annovar nci60 $DB_PATH
# NCBI ClinVar v.20170215
annotate_variation.pl -buildver hg19 -downdb -webfrom annovar clinvar_20170130 $DB_PATH
annotate_variation.pl -buildver hg38 -downdb -webfrom annovar clinvar_20170130 $DB_PATH
# ESP6500 v.20141222
annotate_variation.pl -buildver hg19 -downdb -webfrom annovar esp6500siv2_all $DB_PATH
annotate_variation.pl -buildver hg38 -downdb -webfrom annovar esp6500siv2_all $DB_PATH


## COSMIC database v.82 (GRCh37/GRCh38)##
## GRCh37 ##
# URL: http://cancer.sanger.ac.uk/cosmic/download
# COSMIC VCF files for coding and non-coding mutations:
# PATH: /files/grch37/cosmic/v82/VCF/CosmicCodingMuts.vcf.gz and CosmicNonCodingVariants.vcf.gz
# COSMIC Mutant
# PATH: /files/grch37/cosmic/v82/CosmicMutantExport.tsv.gz and
## GRCh38 ##
# COSMIC VCF files for coding and non-coding mutations:
# PATH: /files/grch38/cosmic/v82/VCF/CosmicCodingMuts.vcf.gz and CosmicNonCodingVariants.vcf.gz
# COSMIC Mutant
# PATH: /files/grch38/cosmic/v82/CosmicMutantExport.tsv.gz and
