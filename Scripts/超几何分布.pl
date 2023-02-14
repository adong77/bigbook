#calculate hypergeometric test
#Version 1.0, 22/09/2004
#Author: Yu Xue
use strict;

my $n;
my $n1;
my $m;
my $m1;
my $k;
my $p_value=0;
my $c1;
my $c2;
my $c3;

print "N= ";
$n=<>;
print "n= ";
$n1=<>;
print "M= ";
$m=<>;
print "m= ";
$m1=<>;
my $Enrich=0;

$Enrich=(($m1/$m)/($n1/$n));
print "This is Enrichment_ratio!\n";
print  $Enrich,"\n";

if ($Enrich >= 1) 
{
	for ($k=$m1;$k<=$n1;$k++) {
	
	
	$c1=binominal($m,$k);
	$c2=binominal(($n-$m),($n1-$k));
	$c3=binominal($n,$n1);
    $p_value=$p_value+ exp(($c1+$c2)-$c3);
	}
}
else 
{
	for ($k=0;$k<=$m1;$k++) {
	
	
	$c1=binominal($m,$k);
	$c2=binominal(($n-$m),($n1-$k));
	$c3=binominal($n,$n1);
    $p_value=$p_value+exp(($c1+$c2)-$c3);
	}

}
print "This is p-value!\n";
print $p_value,"\n";

sub binominal
{
	
	my ($d1,$d2)=@_;
	my $sum2=0;
	my $q=0;
	for ($q=0;($q<$d2 && $q<$d1);$q++) 
	{
		$sum2=$sum2 + log($d1-$q)- log($d2-$q);
	}
	return($sum2);

}