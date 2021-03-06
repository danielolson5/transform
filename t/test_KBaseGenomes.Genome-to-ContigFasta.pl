use strict;
use File::Temp;
# test trns_transform_KBaseGenomes.Genome-to-ContigFasta.pl

my $temp = File::Temp->new();
close($temp);

my @url = ("--url", "http://tutorial.theseed.org/services/genome_annotation");

my @cmd = ('trns_transform_KBaseGenomes.Genome-to-ContigFasta', '-i', 'rhodobacter.gto', '--from-file', '-o', "$temp", @url);
my $rc = system(@cmd);

if ($rc != 0)
{
    die "Test failed with rc=$rc: @cmd\n";
}

if (! -s "$temp")
{
    die "Export did not write any data\n";
}
