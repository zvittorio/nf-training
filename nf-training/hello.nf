#!/usr/bin/env nextflow

params.greeting = 'Bonjour le monde!'
params.greeting2 = 'Hola mundo!'
greeting_ch = Channel.of(params.greeting, params.greeting2)

process SPLITLETTERS {
    input:
    val x

    output:
    path 'chunk_*'

    """
    printf '$x' | split -b 6 - chunk_
    """
}

process CONVERTTOUPPER {
    input:
    path y

    output:
    stdout

    """
    #cat $y | tr '[a-z]' '[A-Z]' 
    rev $y | sed 's/B/3/g'
    """
}

workflow {
    letters_ch = SPLITLETTERS(greeting_ch)
    results_ch = CONVERTTOUPPER(letters_ch.flatten())
    results_ch.view{ it }
}

