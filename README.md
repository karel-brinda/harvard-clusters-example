# Harvard clusters - example

This repository contains an example of a simple Snakemake pipeline that can be
run on all three Harvard clusters - Odyssey, Orchestra and O2.

Each cluster has own configuration JSON file (e.g., `cluster.o2.json`
for O2).  These files specify requested memory, time, queue and number of
threads, and they can be further adjusted.

All required programs are installed automatically using BioConda, based on the
environment specification in `env.bwa.yaml`, unless a `_*` rule is used.

## Prerequisites

* [GNU Make](https://www.gnu.org/software/make/)
* [Snakemake](https://snakemake.readthedocs.io)
* [BioConda](https://bioconda.github.io/)

## Commands

* `make odyssey` - submit jobs to Odyssey
* `make _odyssey` - submit jobs to Odyssey and don't use BioConda for SW installation
* `make orchestra` - submit jobs to Orchestra
* `make _orchestra` - submit jobs to Orchestra and don't use BioConda for SW installation
* `make o2` - submit jobs to O2
* `make _o2` - submit jobs to O2 and don't use BioConda for SW installation
* `make clean` - remove all generated files
