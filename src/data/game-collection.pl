#!/usr/bin/perl

open (INPUT, $ARGV[0]);
open (OUTPUT, '>', './games.json');

print "Starting";

my @raw_header = split("\t", <INPUT>);
my @header;

foreach my $header (@raw_header) {
  $header =~ s/ //g;
  push @header, $header;
}

$header[$#header] = substr $header[$#header], 0, (length($header[$#header]) - 2);

my $id = 0;

while ( my $line = <INPUT> ) {

  my @item = split("\t", $line);
  my $index = 0;
  my $convertedData = '{ "id": "' . $id . '", ';

  foreach my $header (@header) {

    $line =~ s/"/\\"/g;

    if ($index < $#header) {

        $convertedData .= '"' . $header . '": "' . $item[$index] . '", ';

        } else {

          $item[$index] = substr $item[$index], 0, (length($item[$index]) - 2);
          $convertedData .= '"' . $header . '": "' . $item[$index] . '"';

        }

      $index++;
  }

  $convertedData .= " },\n";
  print OUTPUT $convertedData;
  print ".";
  $id ++;
  
}

print "Done.\n";
close INPUT;
close OUTPUT;