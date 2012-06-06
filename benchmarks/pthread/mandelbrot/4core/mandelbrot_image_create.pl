#!/usr/bin/perl

$width = 240;
$height = 240;

$count = 0;
$start = 0x5c;

print "P3\n$width $height\n255\n";

while(<>)
{
    #/0x(\w+)\s*:\s*0x(\w+)/;
    if(/Location\s+0x(\w+)\s*\(\d+\)\s+\-\s+0x(\w+)/) {
	$addr = hex($1);
	$data = hex($2);

	if($addr >= $start)
	{
	    print (($data >> 24) & 0xff);
	    print "\n";
	    print (($data >> 16) & 0xff);
	    print "\n";
	    print (($data >> 8) & 0xff);
	    print "\n";
	    print (($data >> 0) & 0xff);
	    print "\n";

	    $count+=4;
	    
	    if($count >= (($width * $height) * 3))
	    {
		exit(0);
	    }
	}
    }
}
