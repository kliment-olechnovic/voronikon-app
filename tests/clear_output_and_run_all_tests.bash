#!/bin/bash

SCRIPTDIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

cd "$SCRIPTDIR"

rm -rf "./output"
mkdir -p "./output"

for SCORINGMODE in vorochipmunk vorochipmunk_en voromqa
do
  ../voronikon \
    --input-receptor ./input/receptor.pdb \
    --input-ligand ./input/ligand.sdf \
    --scoring-mode ${SCORINGMODE} \
    --output-details-dir "./output/${SCORINGMODE}_details_1" \
  > "./output/${SCORINGMODE}_global_scores_1.txt"

  ../voronikon \
    --input-receptor ./input/receptor.pdb \
    --input-ligand ./input/ligand_mutated.sdf \
    --scoring-mode ${SCORINGMODE}  \
    --output-details-dir "./output/${SCORINGMODE}_details_2" \
  > "./output/${SCORINGMODE}_global_scores_2.txt"
done

find "./output/" -type f -name '*global_scores*' \
| grep -v "_details_" \
| sort \
| while read -r RESULTFILE
do
	echo "$RESULTFILE"
	cat "$RESULTFILE" | sed 's/^/    /'
	echo
done

