#!/bin/bash

SCRIPTDIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

cd "$SCRIPTDIR"

rm -rf "./output"
mkdir -p "./output"

for SCORINGMODE in vorochipmunk vorochipmunk_en voromqa sas_voromqa all
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

  ../voronikon \
    --input-receptor ./input/receptor.pdb \
    --input-ligand ./input/ligand.sdf \
    --scoring-mode ${SCORINGMODE}  \
    --estimate-tolerance \
    --print-mode v \
  > "./output/${SCORINGMODE}_global_scores_1_with_estimated_tolearance.txt"

  ../voronikon \
    --input-complex ./input/complex.cif \
    --scoring-mode ${SCORINGMODE}  \
    --output-id "test1" \
  > "./output/${SCORINGMODE}_global_scores_1_from_complex.txt"
done

echo "Comparing the computed test output with the checkpoint test output:"

ALTERED_FILES_COUNT="$(git status -s ./output/ 2>&1 | wc -l)"

if [ "$ALTERED_FILES_COUNT" -gt "0" ]
then
	echo "${ALTERED_FILES_COUNT} tests output files changed:"
	git status -s ./output/
else
	echo "$No test output files changed."
fi

