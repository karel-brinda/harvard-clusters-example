.PHONY: all clean orchestra

SHELL=/usr/bin/env bash -euc -o pipefail

.SECONDARY:

all:
	snakemake --use-conda --cores -p

orchestra:
	snakemake --cores 9999 -p \
		--use-conda --conda-prefix /n/scratch2/${USER}/conda-envs \
		--cluster-config cluster.orchestra.json \
		--cluster 'bsub -q {cluster.queue} -n {cluster.n} -W {cluster.time} -R "rusage[mem={cluster.memory}]"'

clean:
	rm -f *.bam

