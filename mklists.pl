#!/usr/bin/perl
# ABSTRACT: Generate machine parsable package lists for depchase tooling.
use strict;
use warnings;
use autodie;
use Getopt::Std;
use List::Util 1.33 qw/none/;
use Text::CSV_XS qw/csv/;

my $module = undef;
my $package = undef;
my $rationale = undef;
my @arches = ();
my @sources = ();

my %modules;
my %packages;
# Hash table with all known arches
my %arches = map { $_ => 1 }
    qw/aarch64 armv7hl i686 ppc64 ppc64le x86_64 s390x/;

sub HELP_MESSAGE {
    print "Usage: mklists.pl -m {bootstrap|hp}\n";
    print "Select what module lists should be generated.\n";
}

my %opts;
getopts('m:', \%opts);
my $mode = $opts{m} // '';
$mode =~ /^(?:bootstrap|hp)$/ or HELP_MESSAGE;

open my $fh, '<', 'README.md';
while (<$fh>) {
    chomp;
    if (/^#{3}\s\`(?<module>[^`]+)\`$/) {
        if ($+{module} eq 'bootstrap' && $mode eq 'hp') {
            $module = undef;
            $package = undef;
            @arches = ();
            @sources = ();
            next;
        }
        $module = $+{module};
        $package = undef;
        $modules{$module} = {};
        next;
    }
    if (/^\*\s\`(?<package>[^`]+)\`
         (\s?\(
            (?<sources>\`.+?\`)?
            (?:;\s?)?
            (?<arches>\*.+?\*)?
         \))?
         (?:,\s?(?<rationale>.*))?$/x && defined $module) {
        $package = $+{package};
        $rationale = $+{rationale} // '';
        @sources = defined $+{sources}
            ? ( split /,\s?/, $+{sources} =~ s/\`//gr )
            : ( $package );
        @arches = defined $+{arches}
            ? ( split /,\s?/, $+{arches} =~ s/^\*|\*$//gr )
            : ();
        for (@arches) {
            $arches{$_} = 1;
        }
        for (@sources) {
            $modules{$module}->{$_} = {
                rationale => $modules{$module}->{$_}->{rationale}
                    ? $modules{$module}->{$_}->{rationale} . "; ${rationale}"
                    : $rationale,
            };
        }
        $packages{$package} = {
            count => defined $packages{$package}
                     ? $packages{$package} + 1
                     : 1,
            arches => [ @arches ],
        };
    } elsif (defined $module && defined $package && ! /^$/) {
        s/^\s+|\s+$//g;
        for my $src (@sources) {
            $modules{$module}->{$src}->{rationale} .= ' '
                if $modules{$module}->{$src}->{rationale};
            $modules{$module}->{$src}->{rationale} .= $_;
        }
    } else {
        $package = undef;
        @arches = ();
        @sources = ();
    }
}
close $fh;

for $module (keys %modules) {
    csv in => [
            map
            { [ $_, $modules{$module}->{$_}->{rationale} ] }
            sort keys %{ $modules{$module} }
        ],
        out => "${module}.csv";
}

for my $arch (keys %arches) {
    mkdir $mode unless -d $mode;
    mkdir "${mode}/${arch}" unless -d "${mode}/${arch}";
    open $fh, '>', "${mode}/${arch}/toplevel-binary-packages.txt";
    for $package (sort keys %packages) {
        next if @{ $packages{$package}->{arches} } &&
                none { $_ eq $arch } @{ $packages{$package}->{arches} };
        print { $fh } "$package\n";
        print { *stderr } "Warning: Duplicate package - ${package}\n"
            if $packages{$package}->{count} > 1;
    }
    close $fh;
}
