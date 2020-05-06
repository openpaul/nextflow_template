#!/usr/bin/env nextflow
nextflow.preview.dsl=2
params.removecontamination = true
if (params.help) { exit 0, helpMSG() }

println " "
println "Nextflow pipeline"
println " "
println "using profile: $workflow.profile"
println "using output: $params.output"
println " "



include fastp from './modules/fastp.nf' params(output: params.output)


// define workflows
workflow {


}

def helpMSG(){
    c_green = "\033[0;32m";
    c_reset = "\033[0m";
    c_yellow = "\033[0;33m";
    c_blue = "\033[0;34m";
    c_dim = "\033[2m";
    log.info """
    nextflow eukaryotic metagenome pipeline

    Universal pipeline working with what you got.
    You can pass as many or as few options. Options given 
    will overwrite. So if you give a bin folder,
    binning and assembly will be skipped.
    If you pass a contig file, assembly will be skipped.

    Reads will be cleaned

    --illumina 'SAMPLE_{1,2}.fastq.gz'  # reads
    --contigs   contigs.fasta           # already assembled contigs
    --bindir   folder                   # path to binned samples

    """.stripIndent()
}
