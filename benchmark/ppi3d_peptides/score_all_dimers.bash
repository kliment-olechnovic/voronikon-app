#!/bin/bash

cd "$(dirname $0)"

find ./input/split_dimer_files/ -type f -name '*__receptor.pdb' | sort | xargs -L 1 -P 6 ./score_single_dimer.bash

