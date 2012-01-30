#!/usr/bin/perl

# use new XML input to generate vhdl and VEX mm files
use strict;
use XML::Simple;

my $machine_name = $ARGV[0];
my $outdir = $ARGV[1];
if(!(-e $machine_name)) {
    print "Machine model does not exist: $machine_name\n";
    exit(-1);
}
if(!(-d $outdir)) {
    print "Output directory does not exist: $outdir\n";
    exit(-1);
}

my $galaxy = XMLin("$machine_name", ForceArray => 1); # contains LE1 configuration xml file
######################################

if($galaxy->{type}[0] eq "homogeneous") { # for when dealing with hetrogeneous or homogeneous le1 systems
    for(my $tempS=0;$tempS<$galaxy->{systems}[0];$tempS++) {
	my $system = $galaxy->{system}[0];
	my $context = $system->{context}[0];
	for(my $tempHC=0;$tempHC<$context->{HYPERCONTEXTS}[0];$tempHC++) {
	    my $hypercontext = $context->{hypercontext}[0];
	    my $total_GPR = 0;
	    my $total_PR = 0;
	    open VEXMM, "> $outdir/model.mm" or die;
	    print VEXMM <<VEX;
RES: IssueWidth $context->{ISSUE_WIDTH_MAX}[0]
RES: MemLoad 1
RES: MemStore 1
RES: MemPft 1
VEX

		my $hc_cluster_allocation = -1;
		while(my $cluster_alloc = $hypercontext->{cluster}[++$hc_cluster_allocation]) {
		    (my $cluName, my $cluInst) = split(/_/, $cluster_alloc);
		    $cluName = "Cluster" . $cluName;

		    my $clu = -1;
		    my $found = 0;
		    for(my $clu=0;$clu<$context->{CLUST_TEMPL}[0];$clu++) {
			my $clusterTemp = $context->{clusterTemplate}[$clu];
			if(($clusterTemp->{name}[0] eq $cluName) &&
			   ($clusterTemp->{INSTANCES}[0] > $cluInst) &&
			   ($clusterTemp->{INSTANTIATE}[0])) {
			    print VEXMM <<VEX;
RES: IssueWidth.$hc_cluster_allocation $clusterTemp->{ISSUE_WIDTH}[0]
RES: Alu.$hc_cluster_allocation $clusterTemp->{IALUS}[0]
RES: Mpy.$hc_cluster_allocation $clusterTemp->{IMULTS}[0]
RES: CopySrc.$hc_cluster_allocation $clusterTemp->{LSU_CHANNELS}[0]
RES: CopyDst.$hc_cluster_allocation $clusterTemp->{LSU_CHANNELS}[0]
RES: Memory.$hc_cluster_allocation $clusterTemp->{LSU_CHANNELS}[0]

DEL: AluR.$hc_cluster_allocation 2
DEL: Alu.$hc_cluster_allocation 2
DEL: CmpBr.$hc_cluster_allocation 2
DEL: CmpGr.$hc_cluster_allocation 2
DEL: Select.$hc_cluster_allocation 2
DEL: Multiply.$hc_cluster_allocation 2
DEL: Load.$hc_cluster_allocation 2
DEL: LoadLr.$hc_cluster_allocation 2
DEL: Store.$hc_cluster_allocation 2
DEL: Pft.$hc_cluster_allocation 2
DEL: Asm1L.$hc_cluster_allocation 2
DEL: Asm2L.$hc_cluster_allocation 2
DEL: Asm3L.$hc_cluster_allocation 2
DEL: Asm4L.$hc_cluster_allocation 2
DEL: Asm1H.$hc_cluster_allocation 2
DEL: Asm2H.$hc_cluster_allocation 2
DEL: Asm3H.$hc_cluster_allocation 2
DEL: Asm4H.$hc_cluster_allocation 2
DEL: CpGrBr.$hc_cluster_allocation 2
DEL: CpBrGr.$hc_cluster_allocation 2
DEL: CpGrLr.$hc_cluster_allocation 2
DEL: CpLrGr.$hc_cluster_allocation 2
DEL: Spill.$hc_cluster_allocation 2
DEL: Restore.$hc_cluster_allocation 2
DEL: RestoreLr.$hc_cluster_allocation 2

VEX
			    $found = 1;
			    $total_GPR += $clusterTemp->{S_GPR_FILE_SIZE}[0];
			    $total_PR += $clusterTemp->{S_PR_FILE_SIZE}[0];
			}
		    }
		    if(!$found) {
			print "Could not find cluster ($cluName : $cluInst)\n";
			exit(-1);
		    }
		}
		print VEXMM <<VEX;
REG: \$r0 $total_GPR
REG: \$b0 $total_PR;
VEX
	}
    }
}
else {
    my $tempS = -1;
    while(my $system = $galaxy->{system}[++$tempS]) {
	my $tempC = -1;
	while(my $context = $system->{context}[++$tempC]) {
	    my $tempHC = -1;
	    while(my $hypercontext = $context->{hypercontext}[++$tempHC]) {
		my $total_GPR = 0;
		my $total_PR = 0;
		open VEXMM, "> $outdir/$tempS\_$tempC\_$tempHC.mm" or die;
		print VEXMM <<VEX;
RES: IssueWidth $context->{ISSUE_WIDTH_MAX}[0]
RES: MemLoad 1
RES: MemStore 1
RES: MemPft 1
VEX

		my $hc_cluster_allocation = -1;
		while(my $cluster_alloc = $hypercontext->{cluster}[++$hc_cluster_allocation]) {
		    (my $cluName, my $cluInst) = split(/_/, $cluster_alloc);
		    $cluName = "Cluster" . $cluName;

		    my $clu = -1;
		    my $found = 0;
		    while(my $clusterTemp = $context->{clusterTemplate}[++$clu]) {
			if(($clusterTemp->{name}[0] eq $cluName) &&
			   ($clusterTemp->{INSTANCES}[0] > $cluInst) &&
			   ($clusterTemp->{INSTANTIATE}[0])) {
			    print VEXMM <<VEX;
RES: IssueWidth.$hc_cluster_allocation $clusterTemp->{ISSUE_WIDTH}[0]
RES: Alu.$hc_cluster_allocation $clusterTemp->{IALUS}[0]
RES: Mpy.$hc_cluster_allocation $clusterTemp->{IMULTS}[0]
RES: CopySrc.$hc_cluster_allocation $clusterTemp->{LSU_CHANNELS}[0]
RES: CopyDst.$hc_cluster_allocation $clusterTemp->{LSU_CHANNELS}[0]
RES: Memory.$hc_cluster_allocation $clusterTemp->{LSU_CHANNELS}[0]

DEL: AluR.$hc_cluster_allocation 2
DEL: Alu.$hc_cluster_allocation 2
DEL: CmpBr.$hc_cluster_allocation 2
DEL: CmpGr.$hc_cluster_allocation 2
DEL: Select.$hc_cluster_allocation 2
DEL: Multiply.$hc_cluster_allocation 2
DEL: Load.$hc_cluster_allocation 2
DEL: LoadLr.$hc_cluster_allocation 2
DEL: Store.$hc_cluster_allocation 2
DEL: Pft.$hc_cluster_allocation 2
DEL: Asm1L.$hc_cluster_allocation 2
DEL: Asm2L.$hc_cluster_allocation 2
DEL: Asm3L.$hc_cluster_allocation 2
DEL: Asm4L.$hc_cluster_allocation 2
DEL: Asm1H.$hc_cluster_allocation 2
DEL: Asm2H.$hc_cluster_allocation 2
DEL: Asm3H.$hc_cluster_allocation 2
DEL: Asm4H.$hc_cluster_allocation 2
DEL: CpGrBr.$hc_cluster_allocation 2
DEL: CpBrGr.$hc_cluster_allocation 2
DEL: CpGrLr.$hc_cluster_allocation 2
DEL: CpLrGr.$hc_cluster_allocation 2
DEL: Spill.$hc_cluster_allocation 2
DEL: Restore.$hc_cluster_allocation 2
DEL: RestoreLr.$hc_cluster_allocation 2

VEX
			    $found = 1;
			    $total_GPR += $clusterTemp->{S_GPR_FILE_SIZE}[0];
			    $total_PR += $clusterTemp->{S_PR_FILE_SIZE}[0];
			}
		    }
		    if(!$found) {
			print "Could not find cluster ($cluName : $cluInst)\n";
			exit(-1);
		    }
		}
		print VEXMM <<VEX;
REG: \$r0 $total_GPR
REG: \$b0 $total_PR;
VEX
	    }
	}
    }
}

exit(0);

