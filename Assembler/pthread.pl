#!/usr/bin/perl


###############################################################################
#                               LE1 Tool-Chain                                #
#                            Assembler/pthread.pl                             #
#                           Dave Stevens - A767169                            #
#                          Loughborough University                            #
#                              D.Stevens.ac.uk                                #
###############################################################################
$line_count = 1;

while( <> )
{
    if(/\s*pthread_exit\(/)
    {
	print "$line_count : PTHREAD_EXIT\n";
    }
    elsif(/\s*fprintf\(/)
    {
	print "$line_count : FPRINTF\n";
    }
    elsif(/\s*sprintf\(/)
    {
	print "$line_count : SPRINTF\n";
    }
    elsif(/\s*printf\(/)
    {
	print "$line_count : PRINTF\n";
    }
    elsif(/clock\(\)/)
    {
	print "$line_count : CLOCK\n";
    }
    elsif(/\s*fopen\(/)
    {
	print "$line_count : FOPEN\n";
    }
    elsif(/\s*fscanf\(/)
    {
	print "$line_count : FSCANF\n";
    }
    elsif(/\s*fclose\(/)
    {
	print "$line_count : FCLOSE\n";
    }
    elsif(/\s*feof\(/)
    {
	print "$line_count : FEOF\n";
    }
    elsif(/\s*fflush\(/)
    {
	print "$line_count : FFLUSH\n";
    }
    elsif(/\s*fgetc\(/)
    {
	print "$line_count : FGETC\n";
    }
    elsif(/\s*fgets\(/)
    {
	print "$line_count : FGETS\n";
    }
    elsif(/\s*fputc\(/)
    {
	print "$line_count : FPUTC\n";
    }
    elsif(/\s*fputs\(/)
    {
	print "$line_count : FPUTS\n";
    }
    elsif(/\s*fread\(/)
    {
	print "$line_count : FREAD\n";
    }
    elsif(/\s*fwrite\(/)
    {
	print "$line_count : FWRITE\n";
    }
    elsif(/\s*sscanf\(/)
    {
	print "$line_count : SSCANF\n";
    }
    $line_count++;
}
