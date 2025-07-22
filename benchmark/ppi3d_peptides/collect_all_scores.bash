#!/bin/bash

cd "$(dirname $0)"

for SCORINGMODE in vorochipmunk vorochipmunk_en voromqa
do
	find "./output/global_scores_${SCORINGMODE}/" -type f \
	| sort \
	| xargs -L 1 cat \
	| awk '{if(NR==1 || $1!="input_receptor"){print $0}}' \
	| sed 's/\s\+/\t/g' \
	> "./output/all_global_scores_table_${SCORINGMODE}.tsv"
done

