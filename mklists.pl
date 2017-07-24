#!/usr/bin/perl
# ABSTRACT: Generate machine parsable component lists for depchase tooling.
use strict;
use warnings;
use autodie;
use Text::CSV_XS qw/csv/;

my $state = undef;

my %modules;
my %components;

open my $fh, '<', './README.md';
while (<$fh>) {
    chomp;
    if (/^#{3}\s\`(?<section>[^`]+)\`$/) {
        $state = $+{section};
        $modules{$+{section}} = [];
        next;
    }
    if (/^\*\s\`(?<component>[^`]+)\`(?:,\s(?<rationale>.+))?$/) {
        die "Malformed README.md?\n" unless defined $state;
        push @{ $modules{$state} }, [$+{component}, $+{rationale}];
    }
}
close $fh;

for my $module (keys %modules) {
    $modules{$module} = [sort { $a->[0] cmp $b->[0] } @{ $modules{$module} }];
    csv in => $modules{$module}, out => "./${module}.csv";
    map { $components{$_->[0]}++ } @{ $modules{$module} };
}

open $fh, '>', './toplevel-binary-packages.txt';
for my $component (keys %components) {
    print { $fh } "$component\n";
    print { *stderr } "Warning: Duplicate component - ${component}\n"
        if $components{$component} > 1;
}
close $fh;
