### Annovar ###
use Getopt::Std;

sub Usage{
    print STDERR <<EOF;
    Usage: annovar.pl -i <sample name>  -r <reference version> -o <annotation output>

    Command:
             -i	 sample file convert to annovar format (Example: *.avinput)
             -r  reference version (hg19 / hg38)
             -o	 sample file annotation output

EOF
    exit;
}
my %opt;
getopt("i:r:o:", \%opt);
my $input = $opt{i} or &Usage();
my $rf = $opt{r} or &Usage();
my $output = $opt{o} or &Usage();
my $PATH = '/usr/src/annovar/';
my $DB_PATH = '/usr/src/annovar/humandb/';


`$PATH/table_annovar.pl $input $DB_PATH -buildver $rf -out $output -remove -protocol refGene,ensGene,cytoBand,genomicSuperDups,avsnp147,esp6500siv2_all,1000g2015aug_all,1000g2015aug_afr,1000g2015aug_amr,1000g2015aug_eur,1000g2015aug_eas,1000g2015aug_sas,nci60,cosmic70,clinvar_20160302,ljb26_all -operation g,g,r,r,f,f,f,f,f,f,f,f,f,f,f,f -otherinfo -nastring NA`;

print STDERR "Finished\n";
