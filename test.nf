#!/usr/bin/env nextflow

Channel.fromFilePairs("./dummy_files/*_R{1,2}.fastq.gz", checkIfExists: true ).view()
       .into{ch_fwd; ch_rev}

forward_reads = ch_fwd.map{ it -> [ it[0], it[1][0]]}
reverse_reads = ch_rev.map{ it -> [ it[0], it[1][1]]}

forward_reads.join(reverse_reads).view()