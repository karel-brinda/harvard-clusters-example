import glob
import os
import snakemake

snakemake.shell.prefix("set -eo pipefail;")

localrules: all, index

rule all:
	input:
		"alignments.bam"

rule index:
	input:
		index="data/ref.fa",
		reads="data/reads.fq",
	output:
		bam="alignments.bam",
	conda: "env.bwa.yaml"
	benchmark:
		"benchmarks/bwa_log.log"
	shell:
		"""
			bwa mem "{input.index}" "{input.reads}" \
				| samtools view -b \
				> "{output.bam}"
		"""
