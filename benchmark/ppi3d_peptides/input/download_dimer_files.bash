#!/bin/bash

cd "$(dirname $0)"

mkdir -p "./downloaded_dimer_files"

cd "./downloaded_dimer_files"

cat ../data_urls.tsv | awk '{print $4}' | xargs -L 1 -P 4 wget &> /dev/null

