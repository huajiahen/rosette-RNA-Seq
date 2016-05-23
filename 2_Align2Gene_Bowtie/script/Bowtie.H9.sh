echo ============== H9 Start at : `date`=================
export LD_LIBRARY_PATH=/ifs4/BC_PUB/biosoft/pipeline/RNA/RNA_module/RNA_module_V1.0/Alignment/Alignment_Bowtie/lib/RNA_lib:$LD_LIBRARY_PATH && /ifs4/BC_PUB/biosoft/pipeline/RNA/RNA_module/RNA_module_V1.0/Alignment/Alignment_Bowtie/bin/bowtie/bowtie2 -q --phred64 --sensitive --dpad 0 --gbar 99999999 --mp 1,1 --np 1 --score-min L,0,-0.1 -p 16 -k 200 -x /ifs4/BC_PUB/biosoft/pipeline/RNA/RNA_RNAseq/RNA_RNAseq_version3.1_beta/Database/hg19/GeneBowtie2Index/refMrna.fa -U /lfs1/ST_PMO2015G/STN11023/project/single_cell/Bulk_analysis/Expression/1_Filter_SOAPnuke/H9/547DV01091N2_L01_16.fq.gz | /ifs4/BC_PUB/biosoft/pipeline/RNA/RNA_module/RNA_module_V1.0/Alignment/Alignment_Bowtie/bin/samtools view -S -b -o /lfs1/ST_PMO2015G/STN11023/project/single_cell/Bulk_analysis/Expression/2_Alignments/Align2Gene_Bowtie/H9/H9.bam -
echo ============== H9 Finished at : `date` ======================
