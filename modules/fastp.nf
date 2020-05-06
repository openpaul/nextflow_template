process fastp {
      publishDir "${params.output}/${name}/fastp/", mode: 'copy', pattern: "${name}.clean.R*.fastq"
      publishDir "${params.output}/${name}/fastp/", mode: 'copy', pattern: "${name}.qc.html"
      label 'fastp'
    input:
      tuple val(name), file(sread)
    output:
      tuple val(name), file("${name}.clean.R*.fastq")
      tuple val(name), file("${name}.qc.html") 
    script:
      """
      fastp -w ${task.cpus} --in1 ${sread[0]} --in2 ${sread[1]} --out1 "${name}.clean.R1.fastq" \
        --out2 "${name}.clean.R2.fastq" --json "${name}.qc.json" --html "${name}.qc.html"
      #touch ${name}.clean.R1.fastq
      #touch ${name}.clean.R2.fastq
      #touch ${name}.qc.html
      """
}
