#!/bin/bash

cd "$(dirname $0)"

INPUT_RECEPTOR="$1"

if [ ! -s "$INPUT_RECEPTOR" ]
then
	echo >&2 "Error: input receptor file '$INPUT_RECEPTOR' does not exist"
	exit 1
fi

INPUT_LIGAND="$(echo ${INPUT_RECEPTOR} | sed 's|__receptor.pdb$|__ligand.sdf|')"

if [ ! -s "$INPUT_LIGAND" ]
then
	echo >&2 "Error: input ligand file '$INPUT_LIGAND' does not exist"
	exit 1
fi

FNAME="$(basename ${INPUT_RECEPTOR} __receptor.pdb)"

for SCORINGMODE in vorochipmunk vorochipmunk_en voromqa
do
	OUTFILE="./output/global_scores_${SCORINGMODE}/${FNAME}"
	
	[ -s "$OUTFILE" ] || \
	../../voronikon --scoring-mode "$SCORINGMODE" \
	  --input-receptor "$INPUT_RECEPTOR" --input-ligand "$INPUT_LIGAND" \
	  --output-table-file "$OUTFILE"
done

