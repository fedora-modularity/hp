#!/usr/bin/perl
# ABSTRACT: Generate machine parsable component lists for depchase tooling.
use strict;
use warnings;
use autodie;
use List::Util 1.33 qw/none/;
use Text::CSV_XS qw/csv/;

my $module = undef;
my $component = undef;

my %modules;
my %components;
my %arches;

open my $fh, '<', './README.md';
while (<$fh>) {
    chomp;
    if (/^#{3}\s\`(?<module>[^`]+)\`$/) {
        $module = $+{module};
        $component = undef;
        $modules{$module} = {};
        next;
    }
    if (/^\*\s\`(?<component>[^`]+)\`(\s\((?<arches>[^)]+)\))?(?:,\s?(?<rationale>.*))?$/) {
        die "Malformed README.md?\n" unless defined $module;
        $component = $+{component};
        my $rationale = $+{rationale} // '';
        my @arches = defined $+{arches} ? ( split /,\s?/, $+{arches} ) : ();
        for (@arches) {
            $arches{$_} = 1;
        }
        $modules{$module}->{$component} = {
            rationale => $rationale,
        };
        $components{$component} = {
            count => defined $components{$component}
                     ? $components{$component} + 1
                     : 1,
            arches => [ @arches ],
        };
    } elsif (defined $module && defined $component && ! /^$/) {
        s/^\s+|\s+$//g;
        $modules{$module}->{$component}->{rationale} .= ' '
            if $modules{$module}->{$component}->{rationale};
        $modules{$module}->{$component}->{rationale} .= $_;
    } else {
        $component = undef;
    }
}
close $fh;

for $module (keys %modules) {
    csv in => [
            map
            { [ $_, $modules{$module}->{$_}->{rationale} ] }
            sort keys %{ $modules{$module} }
        ],
        out => "./${module}.csv";
}

for my $arch (keys %arches) {
    mkdir $arch unless -d $arch;
    open $fh, '>', "./${arch}/toplevel-binary-packages.txt";
    for my $component (sort keys %components) {
        next if @{ $components{$component}->{arches} } &&
                none { $_ eq $arch } @{ $components{$component}->{arches} };
        print { $fh } "$component\n";
        print { *stderr } "Warning: Duplicate component - ${component}\n"
            if $components{$component}->{count} > 1;
    }
    close $fh;
}
