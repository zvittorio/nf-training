params.reads = "$projectDir/data/ggal/gut_{1,2}.fq"
params.transcriptome_file = "$projectDir/data/ggal/transcriptome.fa"
params.outdir = "results"
params.multiqc = "$projectDir/multiqc"

log.info """\
This is where the content can be found

transcriptome: $params.transcriptome_file
reads        : $params.reads
outdir       : $params.outdir

"""

println "reads: $params.reads"

process INDEX {
    cpus 2

    input:
    path transcriptome // this is just the scope of the function, then it takes the input
    // given to INDEX in the workflow part
    // really like specifying a function at the beginning of the script

    output:
    path 'salmon_index'

    script:
    """
    salmon index --threads $task.cpus -t $transcriptome -i salmon_index
    """
    //task.cpus can be declared in the process only, no need for a params
}

workflow {
    index_ch = INDEX(params.transcriptome_file)

    index_ch.view()
}