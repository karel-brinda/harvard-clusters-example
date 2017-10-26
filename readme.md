# Harvard clusters - example

This repository contains an example of a simple Snakemake pipeline that can be
run on all three Harvard clusters - Odyssey, Orchestra and O2.

Each cluster has own configuration JSON file (e.g., `cluster.orchestra.json`
for Odyssey).  These files specify requested memory, time, queue and number of
threads, and they can be further adjusted.

All required programs are installed automatically using Conda, based on the
environment specification in `env.bwa.yaml`.


## Commands

* `make odyssey` - submit the jobs to Odyssey
* `make orchestra` - submit the jobs to Orchestra
* `make o2` - submit the jobs to O2
* `make clean` - remove generated files
