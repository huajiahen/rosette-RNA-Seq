echo ======= DA start at: `date` ============
export LD_LIBRARY_PATH=/ifs4/BC_PUB/biosoft/pipeline/RNA/RNA_module/RNA_module_V1.0/GeneAndIsoformExp/GeneAndIsoformExp_RSEM/lib/RNA_lib:/opt/gridengine/lib/lx26-amd64 && /ifs4/BC_PUB/biosoft/pipeline/RNA/RNA_module/RNA_module_V1.0/GeneAndIsoformExp/GeneAndIsoformExp_RSEM/bin/rsem/rsem-calculate-expression --bam /lfs1/ST_PMO2015G/STN11023/project/single_cell/Bulk_analysis/Expression/2_Alignments/Align2Gene_Bowtie/DA/DA.bam -p 8 /lfs1/ST_PMO2015G/STN11023/project/CG_data_evaluation/CG_evaluation_by_60M_Raw_data/GeneAndIsoformExp_RSEM_4/refMrna.fa /lfs1/ST_PMO2015G/STN11023/project/single_cell/Bulk_analysis/Expression/3_GeneExpression/DA/DA
awk '{if($7!=0.00)print $1"\t"$2"\t"$3"\t"$5"\t"$7}' /lfs1/ST_PMO2015G/STN11023/project/single_cell/Bulk_analysis/Expression/3_GeneExpression/DA/DA.genes.results > /lfs1/ST_PMO2015G/STN11023/project/single_cell/Bulk_analysis/Expression/3_GeneExpression/DA/DA.genes.FPKM.xls
awk '{if($7!=0.00)print $1"\t"$2"\t"$3"\t"$5"\t"$7}' /lfs1/ST_PMO2015G/STN11023/project/single_cell/Bulk_analysis/Expression/3_GeneExpression/DA/DA.isoforms.results > /lfs1/ST_PMO2015G/STN11023/project/single_cell/Bulk_analysis/Expression/3_GeneExpression/DA/DA.isoforms.FPKM.xls
echo ========== DA end at : `date` ==========