### Annovar ###

table_annovar.pl demo_sample.avinput /usr/src/annovar/humandb/ -buildver hg19 -out demo_sample -remove -protocol refGene,ensGene,cytoBand,genomicSuperDups,avsnp147,esp6500siv2_all,1000g2015aug_all,1000g2015aug_afr,1000g2015aug_amr,1000g2015aug_eur,1000g2015aug_eas,1000g2015aug_sas,nci60,cosmic70,clinvar_20160302,ljb26_all -operation g,g,r,r,f,f,f,f,f,f,f,f,f,f,f,f -otherinfo -nastring NA
