#!/bin/bash

cd "$(dirname $0)"

INFILE="$1"

if [ ! -s "$INFILE" ]
then
	echo >&2 "Error: input file '$INFILE' does not exist"
	exit 1
fi

FNAME="$(basename ${INFILE} .pdb | sed 's|^protein_peptide-||')"

OUTDIR="./split_dimer_files/$(echo ${FNAME} | sed 's|^\(..\).*$|\1|')"

mkdir -p "$OUTDIR"

cat "$INFILE" | ../../../tools/voronota-js-pdb-utensil-filter-atoms --selection '[-chain A -t! het]' > "./${OUTDIR}/${FNAME}__receptor.pdb"

../../../tools/convert-pdb-to-sdf "$INFILE" "[-chain B]" "./${OUTDIR}/${FNAME}__ligand.sdf"

