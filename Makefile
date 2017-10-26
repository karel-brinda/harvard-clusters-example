.PHONY: all clean orchestra o2 odyssey _*

SHELL=/usr/bin/env bash

.SECONDARY:

all:
	snakemake --use-conda --cores -p

o2:
	CONDA=--use-conda --conda-prefix /n/scratch2/${USER}/conda-envs¬
	snakemake --cores 9999 -p \
		$(CONDA) \
		--cluster-config cluster.o2.json \
		--cluster 'sbatch -p {cluster.queue} -n {cluster.n} -t {cluster.time} --mem={cluster.memory}'

odyssey:
	CONDA=--use-conda --conda-prefix /scratch/${USER}/conda-envs¬
	snakemake --cores 9999 -p \
		$(CONDA) \
		--cluster-config cluster.odyssey.json \
		--cluster 'sbatch -p {cluster.queue} -n {cluster.n} -t {cluster.time} --mem={cluster.memory}'

orchestra:
	CONDA=--use-conda --conda-prefix /n/scratch2/${USER}/conda-envs¬
	snakemake --cores 9999 -p \
		$(CONDA) \
		--cluster-config cluster.orchestra.json \
		--cluster 'bsub -q {cluster.queue} -n {cluster.n} -W {cluster.time} -R "rusage[mem={cluster.memory}]"'

clean:
	rm -f *.bam *.out

# run without conda
_%:
	$(MAKE) $* CONDA=
