.PHONY: all clean orchestra o2 odyssey

SHELL=/usr/bin/env bash

.SECONDARY:

all:
	snakemake --use-conda --cores -p

o2:
	snakemake --cores 9999 -p \
		--use-conda --conda-prefix /n/scratch2/${USER}/conda-envs \
		--cluster-config cluster.o2.json \
		--cluster 'sbatch -p {cluster.queue} -n {cluster.n} -t {cluster.time} --mem={cluster.memory}'

odyssey:
	snakemake --cores 9999 -p \
		--use-conda --conda-prefix /scratch/${USER}/conda-envs \
		--cluster-config cluster.odyssey.json \
		--cluster 'sbatch -p {cluster.queue} -n {cluster.n} -t {cluster.time} --mem={cluster.memory}'

orchestra:
	snakemake --cores 9999 -p \
		--use-conda --conda-prefix /n/scratch2/${USER}/conda-envs \
		--cluster-config cluster.orchestra.json \
		--cluster 'bsub -q {cluster.queue} -n {cluster.n} -W {cluster.time} -R "rusage[mem={cluster.memory}]"'

clean:
	rm -f *.bam *.out

