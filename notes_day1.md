# Nextflow course
## Day 1 

### Introduction

* Nextflow uses Groovy as a general purpose programming language
* Which is in turn a less verbose version of java
* Pretty much same realtionship as C and Python

### Examples: RNA-seq pipeline

1. indexing
2. salmon
3. fastqc
4. multiqc

This is what happens in case you do not specifiy the workflow after the process:

```N E X T F L O W  ~  version 23.10.1
Launching `script1.nf` [furious_avogadro] DSL2 - revision: 252b860808
This is where the content can be found

transcriptome: /home/vittorio/Desktop/nextflow_course/nf-training/nf-training/data/ggal/transcriptome.fa
reads        : /home/vittorio/Desktop/nextflow_course/nf-training/nf-training/data/ggal/gut_{1,2}.fq
outdir       : results


reads: /home/vittorio/Desktop/nextflow_course/nf-training/nf-training/data/ggal/gut_{1,2}.fq
=============================================================================
=                                WARNING                                    =
= You are running this script using DSL2 syntax, however it does not        = 
= contain any 'workflow' definition so there's nothing for Nextflow to run. =
=                                                                           =
= If this script was written using Nextflow DSL1 syntax, please add the     = 
= setting 'nextflow.enable.dsl=1' to the nextflow.config file or use the    =
= command-line option '-dsl1' when running the pipeline.                    =
=                                                                           =
= More details at this link: https://www.nextflow.io/docs/latest/dsl2.html  =
=============================================================================
```

### Channel factories

See script4.nf

We also saw that when running Nextflow from the command line: 
* one dash: nextflow parameter
* two dashes: gets passed to the internal script(s)


### How to add final message

See script7.nf

For this, we use workflow.onComplete

* ```with-report``` creates a nextflow report (like the reports you get when you run SCENIC pipeline)
* ```with-timeline``` creates a report of how lon each process took (again, SCENIC does the same)

### Github mirroring

You can run a pipeline directing from a github repo. 
Nextflow will pull the dir automatically and run it

### Containers and dependencies

Containers are immutable. If you want to change one you have to make a new container. 

They are OS independent. 

You can browse all docker containers in DockerHub. A bioinformatics-specialized version of DockerHub is Quay. 

For us Singularity is more interesting.
Reason is Docker wants you to have root permissions. 
On the HPC, you can not have root permission. 

So it is interesting to convert a Docker image to a Singularity image:

```
singularity pull docker://debian:bullseye-slim
```

Another option is Conda. You can build any environment using the yaml file. 

### Software directives

