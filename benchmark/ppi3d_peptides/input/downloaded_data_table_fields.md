# Description of fields in the PPI3D data table #

Most of the field names are self-explanatory, other ones are described in this document.

## PDB data ##

* pdb_id
* biounit_no
* release_date
* resolution
* pdb_annotation

## Interation types ##

* protein_peptide_interaction
* protein_nucleic_interaction
* protein_protein_interaction
* domain_domain_interaction
* homo

## Information about subunit 1 ##

* subunit_1
* s1_protein_type
* subunit_1_title
* scop_family_1
* s1_taxonomy_id: the ID of NCBI Taxonomy database
* s1_number_of_residues: total number of residues in the sequence
* s1_number_of_visible_residues: number of residues that have coordinates in the structure
* s1_sequence

## Information about subunit 2 ##

* subunit_2
* s2_protein_type
* subunit_2_title
* scop_family_2
* s2_taxonomy_i: the ID of NCBI Taxonomy database
* s2_number_of_residues: total number of residues in the sequence
* s2_number_of_visible_residues: number of residues that have coordinates in the structure
* s2_sequence

## Interface properties ##

* area
* number_of_contacts
* number_of_interface_ligands

## Clustering information for subunits ##

* s1_sequence_cluster_95: cluster according to protein sequences at 95% identity
* s1_binding_site_cluster_data_95: cluster of the binding site, in the form of {sequence_cluster}\_{structure\_cluster}
* s1_sequence_cluster_70: cluster according to protein sequences at 70% identity
* s1_binding_site_cluster_data_70: cluster of the binding site, in the form of {sequence_cluster}\_{structure\_cluster}
* s1_sequence_cluster_40: cluster according to protein sequences at 40% identity
* s1_binding_site_cluster_data_40: cluster of the binding site, in the form of {sequence_cluster}\_{structure\_cluster}
* s1_binding_site_cluster_data_40_area: cluster of the binding site, in the form of {sequence_cluster}\_{structure\_cluster}
* s2_sequence_cluster_95: cluster according to protein sequences at 95% identity
* s2_binding_site_cluster_data_95: cluster of the binding site, in the form of {sequence_cluster}\_{structure\_cluster}
* s2_sequence_cluster_70: cluster according to protein sequences at 70% identity
* s2_binding_site_cluster_data_70: cluster of the binding site, in the form of {sequence_cluster}\_{structure\_cluster}
* s2_sequence_cluster_40: cluster according to protein sequences at 40% identity
* s2_binding_site_cluster_data_40: cluster of the binding site, in the form of {sequence_cluster}\_{structure\_cluster}
* s2_binding_site_cluster_data_40_area: cluster of the binding site, in the form of {sequence_cluster}\_{structure\_cluster}

## Clustering information for interaction interface ##

* cluster_data_95: cluster of the interface, in the form of {interface_type}\_{sequence\_cluster}\_{structure\_cluster}
* cluster_data_70: cluster of the interface, in the form of {interface_type}\_{sequence\_cluster}\_{structure\_cluster}
* cluster_data_40: cluster of the interface, in the form of {interface_type}\_{sequence\_cluster}\_{structure\_cluster}
* cluster_data_40_area: cluster of the interface, in the form of {interface_type}\_{sequence\_cluster}\_{structure\_cluster}

"Interface type" fields have 0 for protein-protein interaction, and 1 for protein-peptide or protein-nucleic acid interactions. If clustering by sequences only is necessary for the interaction interface, both first two parts of the cluster number should be used.

## Download URLs

* download_url: URL to download PDB formatted file of binary complex

