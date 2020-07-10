#!/usr/bin/perl

use strict;
use warnings;

use HTML::Latemp::GenMakeHelpers ();

use Path::Tiny qw/ path tempdir tempfile cwd /;

my $generator = HTML::Latemp::GenMakeHelpers->new(
    'hosts' => [
        map {
            +{
                'id'         => $_,
                'source_dir' => "src/$_",
                'dest_dir'   => "\$(ALL_DEST_BASE)/$_",
                },
        } (qw(common iglu))
    ]
);

$generator->process_all();

path("Makefile")->spew_utf8("include lib/make/main.mak\n");

1;
