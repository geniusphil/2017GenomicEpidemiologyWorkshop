# 2017 Genomic Epidemiology Workshop
### NGS Variant Annotation: Hands-on session
---
* Date: 2017.8.7-14
* Place: Academia Sinica
* Register URL: http://www.genomics.sinica.edu.tw/genomicepi2017/index.html
* Software download
  * URL: http://annovar.openbioinformatics.org/en/latest/

* Raw data
  * demo_sample.vcf.gz (Ogden Syndrome, reference hg19)
  * HG00403.chr20.gatk.vcf.gz (reference hg38)

* Result data
  * demo_sample.hg19_multianno.csv
  * demo_sample.hg19_multianno.txt
  * demo_sample.hg19_multianno.xlsx
  *


### Download Annovar db
```
$ ./annovar_db_download.sh
```

### VCF to Annovar input format

```
$ convert2annovar.pl -format vcf4 demo_sample.vcf.gz > demo_sample.avinput
```

```
NOTICE: Finished reading 1479 lines from VCF file
NOTICE: A total of 1479 locus in VCF file passed QC threshold, representing 1318 SNPs (892 transitions and 426 transversions) and 161 indels/substitutions
NOTICE: Finished writing 1318 SNP genotypes (892 transitions and 426 transversions) and 161 indels/substitutions for 1 sample
```

### Run Annovar table function

```
* tab output
$ table_annovar.pl demo_sample.avinput /usr/src/annovar/humandb/ -buildver hg19 -out demo_sample -remove -protocol refGene,ensGene,cytoBand,genomicSuperDups,avsnp147,esp6500siv2_all,1000g2015aug_all,1000g2015aug_afr,1000g2015aug_amr,1000g2015aug_eur,1000g2015aug_eas,1000g2015aug_sas,nci60,cosmic82,clinvar_20170130,ljb26_all -operation g,g,r,r,f,f,f,f,f,f,f,f,f,f,f,f -otherinfo -nastring NA

* csv output
table_annovar.pl demo_sample.avinput /usr/src/annovar/humandb/ -buildver hg19 -out demo_sample -remove -protocol refGene,ensGene,cytoBand,genomicSuperDups,avsnp147,esp6500siv2_all,1000g2015aug_all,1000g2015aug_afr,1000g2015aug_amr,1000g2015aug_eur,1000g2015aug_eas,1000g2015aug_sas,nci60,cosmic82,clinvar_20170130,ljb26_all -operation g,g,r,r,f,f,f,f,f,f,f,f,f,f,f,f -otherinfo -nastring . -csvout
```
* Gene-based (g)
  * refGene
  * ensGene

* Region-based (r)
  * cytoBand
  * genomicSuperDups

* Filter-based (f)
  * avsnp147
  * esp6500siv2_all
  * 1000g2015aug_all
  * 1000g2015aug_afr
  * 1000g2015aug_amr
  * 1000g2015aug_eur
  * 1000g2015aug_eas
  * 1000g2015aug_sas
  * nci60
  * cosmic82
  * clinvar_20170130
  * ljb26_all


### Processing Information
```
NOTICE: Processing operation=g protocol=refGene

NOTICE: Running with system command <annotate_variation.pl -geneanno -buildver hg19 -dbtype refGene -outfile demo_sample.refGene -exonsort demo_sample.avinput /usr/src/annovar/humandb/>
NOTICE: Output files were written to demo_sample.refGene.variant_function, demo_sample.refGene.exonic_variant_function
NOTICE: Reading gene annotation from /usr/src/annovar/humandb/hg19_refGene.txt ... Done with 63481 transcripts (including 15216 without coding sequence annotation) for 27720 unique genes
NOTICE: Processing next batch with 1479 unique variants in 1479 input lines
NOTICE: Reading FASTA sequences from /usr/src/annovar/humandb/hg19_refGeneMrna.fa ... Done with 319 sequences
WARNING: A total of 405 sequences will be ignored due to lack of correct ORF annotation
-----------------------------------------------------------------
NOTICE: Processing operation=g protocol=ensGene

NOTICE: Running with system command <annotate_variation.pl -geneanno -buildver hg19 -dbtype ensGene -outfile demo_sample.ensGene -exonsort demo_sample.avinput /usr/src/annovar/humandb/>
NOTICE: Output files were written to demo_sample.ensGene.variant_function, demo_sample.ensGene.exonic_variant_function
NOTICE: Reading gene annotation from /usr/src/annovar/humandb/hg19_ensGene.txt ... Done with 196501 transcripts (including 101155 without coding sequence annotation) for 57905 unique genes
NOTICE: Processing next batch with 1479 unique variants in 1479 input lines
NOTICE: Reading FASTA sequences from /usr/src/annovar/humandb/hg19_ensGeneMrna.fa ... Done with 463 sequences
WARNING: A total of 6780 sequences will be ignored due to lack of correct ORF annotation
-----------------------------------------------------------------
NOTICE: Processing operation=r protocol=cytoBand

NOTICE: Running with system command <annotate_variation.pl -regionanno -dbtype cytoBand -buildver hg19 -outfile demo_sample demo_sample.avinput /usr/src/annovar/humandb/>
NOTICE: Output file is written to demo_sample.hg19_cytoBand
NOTICE: Reading annotation database /usr/src/annovar/humandb/hg19_cytoBand.txt ... Done with 862 regions
NOTICE: Finished region-based annotation on 1479 genetic variants
-----------------------------------------------------------------
NOTICE: Processing operation=r protocol=genomicSuperDups

NOTICE: Running with system command <annotate_variation.pl -regionanno -dbtype genomicSuperDups -buildver hg19 -outfile demo_sample demo_sample.avinput /usr/src/annovar/humandb/>
NOTICE: Output file is written to demo_sample.hg19_genomicSuperDups
NOTICE: Reading annotation database /usr/src/annovar/humandb/hg19_genomicSuperDups.txt ... Done with 51599 regions
NOTICE: Finished region-based annotation on 1479 genetic variants
-----------------------------------------------------------------
NOTICE: Processing operation=f protocol=avsnp147

NOTICE: Running system command <annotate_variation.pl -filter -dbtype avsnp147 -buildver hg19 -outfile demo_sample demo_sample.avinput /usr/src/annovar/humandb/>
NOTICE: Variants matching filtering criteria are written to demo_sample.hg19_avsnp147_dropped, other variants are written to demo_sample.hg19_avsnp147_filtered
NOTICE: Processing next batch with 1479 unique variants in 1479 input lines
NOTICE: Database index loaded. Total number of bins is 27868332 and the number of bins to be scanned is 1359
NOTICE: Scanning filter database /usr/src/annovar/humandb/hg19_avsnp147.txt...Done
-----------------------------------------------------------------
NOTICE: Processing operation=f protocol=esp6500siv2_all

NOTICE: Running system command <annotate_variation.pl -filter -dbtype esp6500siv2_all -buildver hg19 -outfile demo_sample demo_sample.avinput /usr/src/annovar/humandb/>
NOTICE: the --dbtype esp6500siv2_all is assumed to be in generic ANNOVAR database format
NOTICE: Variants matching filtering criteria are written to demo_sample.hg19_esp6500siv2_all_dropped, other variants are written to demo_sample.hg19_esp6500siv2_all_filtered
NOTICE: Processing next batch with 1479 unique variants in 1479 input lines
NOTICE: Database index loaded. Total number of bins is 594771 and the number of bins to be scanned is 554
NOTICE: Scanning filter database /usr/src/annovar/humandb/hg19_esp6500siv2_all.txt...Done
-----------------------------------------------------------------
NOTICE: Processing operation=f protocol=1000g2015aug_all

NOTICE: Running system command <annotate_variation.pl -filter -dbtype 1000g2015aug_all -buildver hg19 -outfile demo_sample demo_sample.avinput /usr/src/annovar/humandb/>
NOTICE: Variants matching filtering criteria are written to demo_sample.hg19_ALL.sites.2015_08_dropped, other variants are written to demo_sample.hg19_ALL.sites.2015_08_filtered
NOTICE: Processing next batch with 1479 unique variants in 1479 input lines
NOTICE: Database index loaded. Total number of bins is 2824642 and the number of bins to be scanned is 1118
NOTICE: Scanning filter database /usr/src/annovar/humandb/hg19_ALL.sites.2015_08.txt...Done
-----------------------------------------------------------------
NOTICE: Processing operation=f protocol=1000g2015aug_afr

NOTICE: Running system command <annotate_variation.pl -filter -dbtype 1000g2015aug_afr -buildver hg19 -outfile demo_sample demo_sample.avinput /usr/src/annovar/humandb/>
NOTICE: Variants matching filtering criteria are written to demo_sample.hg19_AFR.sites.2015_08_dropped, other variants are written to demo_sample.hg19_AFR.sites.2015_08_filtered
NOTICE: Processing next batch with 1479 unique variants in 1479 input lines
NOTICE: Database index loaded. Total number of bins is 2820101 and the number of bins to be scanned is 1118
NOTICE: Scanning filter database /usr/src/annovar/humandb/hg19_AFR.sites.2015_08.txt...Done
-----------------------------------------------------------------
NOTICE: Processing operation=f protocol=1000g2015aug_amr

NOTICE: Running system command <annotate_variation.pl -filter -dbtype 1000g2015aug_amr -buildver hg19 -outfile demo_sample demo_sample.avinput /usr/src/annovar/humandb/>
NOTICE: Variants matching filtering criteria are written to demo_sample.hg19_AMR.sites.2015_08_dropped, other variants are written to demo_sample.hg19_AMR.sites.2015_08_filtered
NOTICE: Processing next batch with 1479 unique variants in 1479 input lines
NOTICE: Database index loaded. Total number of bins is 2815096 and the number of bins to be scanned is 1117
NOTICE: Scanning filter database /usr/src/annovar/humandb/hg19_AMR.sites.2015_08.txt...Done
-----------------------------------------------------------------
NOTICE: Processing operation=f protocol=1000g2015aug_eur

NOTICE: Running system command <annotate_variation.pl -filter -dbtype 1000g2015aug_eur -buildver hg19 -outfile demo_sample demo_sample.avinput /usr/src/annovar/humandb/>
NOTICE: Variants matching filtering criteria are written to demo_sample.hg19_EUR.sites.2015_08_dropped, other variants are written to demo_sample.hg19_EUR.sites.2015_08_filtered
NOTICE: Processing next batch with 1479 unique variants in 1479 input lines
NOTICE: Database index loaded. Total number of bins is 2812033 and the number of bins to be scanned is 1118
NOTICE: Scanning filter database /usr/src/annovar/humandb/hg19_EUR.sites.2015_08.txt...Done
-----------------------------------------------------------------
NOTICE: Processing operation=f protocol=1000g2015aug_eas

NOTICE: Running system command <annotate_variation.pl -filter -dbtype 1000g2015aug_eas -buildver hg19 -outfile demo_sample demo_sample.avinput /usr/src/annovar/humandb/>
NOTICE: Variants matching filtering criteria are written to demo_sample.hg19_EAS.sites.2015_08_dropped, other variants are written to demo_sample.hg19_EAS.sites.2015_08_filtered
NOTICE: Processing next batch with 1479 unique variants in 1479 input lines
NOTICE: Database index loaded. Total number of bins is 2812769 and the number of bins to be scanned is 1118
NOTICE: Scanning filter database /usr/src/annovar/humandb/hg19_EAS.sites.2015_08.txt...Done
-----------------------------------------------------------------
NOTICE: Processing operation=f protocol=1000g2015aug_sas

NOTICE: Running system command <annotate_variation.pl -filter -dbtype 1000g2015aug_sas -buildver hg19 -outfile demo_sample demo_sample.avinput /usr/src/annovar/humandb/>
NOTICE: Variants matching filtering criteria are written to demo_sample.hg19_SAS.sites.2015_08_dropped, other variants are written to demo_sample.hg19_SAS.sites.2015_08_filtered
NOTICE: Processing next batch with 1479 unique variants in 1479 input lines
NOTICE: Database index loaded. Total number of bins is 2815886 and the number of bins to be scanned is 1118
NOTICE: Scanning filter database /usr/src/annovar/humandb/hg19_SAS.sites.2015_08.txt...Done
-----------------------------------------------------------------
NOTICE: Processing operation=f protocol=nci60

NOTICE: Running system command <annotate_variation.pl -filter -dbtype nci60 -buildver hg19 -outfile demo_sample demo_sample.avinput /usr/src/annovar/humandb/>
NOTICE: the --dbtype nci60 is assumed to be in generic ANNOVAR database format
NOTICE: Variants matching filtering criteria are written to demo_sample.hg19_nci60_dropped, other variants are written to demo_sample.hg19_nci60_filtered
NOTICE: Processing next batch with 1479 unique variants in 1479 input lines
NOTICE: Database index loaded. Total number of bins is 81308 and the number of bins to be scanned is 429
NOTICE: Scanning filter database /usr/src/annovar/humandb/hg19_nci60.txt...Done
-----------------------------------------------------------------
NOTICE: Processing operation=f protocol=cosmic82

NOTICE: Running system command <annotate_variation.pl -filter -dbtype cosmic82 -buildver hg19 -outfile demo_sample demo_sample.avinput /usr/src/annovar/humandb/>
NOTICE: the --dbtype cosmic82 is assumed to be in generic ANNOVAR database format
NOTICE: Variants matching filtering criteria are written to demo_sample.hg19_cosmic82_dropped, other variants are written to demo_sample.hg19_cosmic82_filtered
NOTICE: Processing next batch with 1479 unique variants in 1479 input lines
NOTICE: Scanning filter database /usr/src/annovar/humandb/hg19_cosmic82.txt...Done
-----------------------------------------------------------------
NOTICE: Processing operation=f protocol=clinvar_20170130
NOTICE: Finished reading 5 column headers for '-dbtype clinvar_20170130'

NOTICE: Running system command <annotate_variation.pl -filter -dbtype clinvar_20170130 -buildver hg19 -outfile demo_sample demo_sample.avinput /usr/src/annovar/humandb/ -otherinfo>
NOTICE: the --dbtype clinvar_20170130 is assumed to be in generic ANNOVAR database format
NOTICE: Variants matching filtering criteria are written to demo_sample.hg19_clinvar_20170130_dropped, other variants are written to demo_sample.hg19_clinvar_20170130_filtered
NOTICE: Processing next batch with 1479 unique variants in 1479 input lines
NOTICE: Database index loaded. Total number of bins is 36158 and the number of bins to be scanned is 208
NOTICE: Scanning filter database /usr/src/annovar/humandb/hg19_clinvar_20170130.txt...Done
-----------------------------------------------------------------
NOTICE: Processing operation=f protocol=ljb26_all
NOTICE: Finished reading 25 column headers for '-dbtype ljb26_all'

NOTICE: Running system command <annotate_variation.pl -filter -dbtype ljb26_all -buildver hg19 -outfile demo_sample demo_sample.avinput /usr/src/annovar/humandb/ -otherinfo>
NOTICE: the --dbtype ljb26_all is assumed to be in generic ANNOVAR database format
NOTICE: Variants matching filtering criteria are written to demo_sample.hg19_ljb26_all_dropped, other variants are written to demo_sample.hg19_ljb26_all_filtered
NOTICE: Processing next batch with 1479 unique variants in 1479 input lines
NOTICE: Database index loaded. Total number of bins is 557362 and the number of bins to be scanned is 448
NOTICE: Scanning filter database /usr/src/annovar/humandb/hg19_ljb26_all.txt...Done
-----------------------------------------------------------------
NOTICE: Multianno output file is written to demo_sample.hg19_multianno.txt
```

* Reference by:
  * [ANNOVAR](http://annovar.openbioinformatics.org/en/latest/)
  * [Using VAAST to Identify an X-Linked Disorder Resulting in Lethality in Male Infants Due to N-Terminal Acetyltransferase Deficiency](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3135802/)
  * [ANNOVAR: functional annotation of genetic variants from high-throughput sequencing data](http://www.ncbi.nlm.nih.gov/pubmed/20601685)
  * [Genomic variant annotation and prioritization with ANNOVAR and wANNOVAR](http://www.nature.com/nprot/journal/v10/n10/full/nprot.2015.105.html)
  * [NAA10 / rs387906701](http://www.ncbi.nlm.nih.gov/projects/SNP/snp_ref.cgi?rs=rs387906701)
  * [SNPedia](http://snpedia.com/index.php/Rs387906701)
  * [NAA10 mutation causing a novel intellectual disability syndrome with Long QT due to N-terminal acetyltransferase impairment](http://www.nature.com/articles/srep16022)
  * [OMIM - Ogden Syndrome](http://www.omim.org/entry/300855)


* All Information 2017 Genomic Epidemiology Workshop Use
* Edit by [Philippe](http://github.com/geniusphil)
