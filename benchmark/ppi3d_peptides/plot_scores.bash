#!/bin/bash

cd "$(dirname $0)/output"

for SCORINGMODE in vorochipmunk vorochipmunk_en voromqa
do

R --vanilla --args "$SCORINGMODE" << 'EOF'
args=commandArgs(TRUE);
scorename=args[1];
df=read.table(paste0("all_global_scores_table_", scorename, ".tsv"), header=TRUE, stringsAsFactors=FALSE);
df=df[which(df$ligand_atoms<=250),];
png(paste0("plot_of_ligand_size_vs_interface_pseudo_energy_", scorename, ".png"), width=960, height=480);
par(mfrow=c(1, 2));

coloring=densCols(df$ligand_atoms, df$iface_energy_worst);
plot(df$ligand_atoms, df$iface_energy_worst, col=coloring, xlab="Ligand atoms", ylab="Interface pseudo-energy", main=paste0("Ligand atoms vs\ninterface pseudo-energy (", scorename, ")"));
abline(h=0);

coloring=densCols(df$ligand_atoms, df$iface_energy_worst/df$iface_area);
plot(df$ligand_atoms, df$iface_energy_worst/df$iface_area, col=coloring, xlab="Ligand atoms", ylab="Interface pseudo-energy per unit area", main=paste0("Ligand atoms vs interface\npseudo-energy per unit area (", scorename, ")"));
abline(h=0);

dev.off();
EOF

done

