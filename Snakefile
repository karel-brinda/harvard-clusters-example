import glob
import os
import snakemake

snakemake.shell.prefix("set -eo pipefail;")

localrules: all, index

rule all:
	input:
		["alignments.{}.bam".format(x) for x in ("ex1", "ex2")]

rule bwa:
	input:
		index="data/ref.fa",
		reads="data/reads.{id}.fq",
	output:
		bam="alignments.{id}.bam",
	conda: "env.bwa.yaml"
	benchmark:
		"benchmarks/bwa.{id}.log"
	shell:
		"""
			bwa mem "{input.index}" "{input.reads}" \
				| samtools view -b \
				> "{output.bam}"
		"""
