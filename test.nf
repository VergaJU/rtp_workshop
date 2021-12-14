#!/usr/bin/env nextflow

params.foo = "String"
params.bar = 5

println params.foo.size()

process TEST{
    publishDir "/home/jacopo/Documents/RTP/nextflow/test", mode:'copy'

    echo true

    input:
    val(foo) from params.foo
    val(bar) from params.bar

    output:
    file("foobar.txt") into out

    script:
    """
    echo "Script body printing foo: $foo, bar: $bar" >> foobar.txt
    """
}

out.view()
