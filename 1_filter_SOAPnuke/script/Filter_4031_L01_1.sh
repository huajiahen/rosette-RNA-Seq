echo ==========start at : `date` ==========
tile=''
echo $tile
/ifs4/BC_PUB/biosoft/pipeline/RNA/RNA_module/RNA_module_V1.0/Filter/Filter_SOAPnuke/bin/SOAPnuke filter -l 5 -q 0.5 -n 0.1 -Q 2 -1 /lfs1/ST_PMO2015G/STN11023/project/single_cell/Bulk_analysis/raw-data/4031_L01_1.fq.gz -f AAGTCGGAGGCCAAGCGGTCTTAGGATT  -o /lfs1/ST_PMO2015G/STN11023/project/single_cell/Bulk_analysis/Expression/1_Filter_SOAPnuke/4031_L01_1 -C 4031_L01_1.fq -c 30 
/ifs4/BC_PUB/biosoft/pipeline/RNA/RNA_module/RNA_module_V1.0/Filter/Filter_SOAPnuke/bin/fqcheck -r /lfs1/ST_PMO2015G/STN11023/project/single_cell/Bulk_analysis/Expression/1_Filter_SOAPnuke/4031_L01_1/4031_L01_1.fq.gz -c /lfs1/ST_PMO2015G/STN11023/project/single_cell/Bulk_analysis/Expression/1_Filter_SOAPnuke/4031_L01_1/fqcheck/4031_L01_1.fqcheck
/ifs4/BC_PUB/biosoft/pipeline/RNA/RNA_module/RNA_module_V1.0/Filter/Filter_SOAPnuke/bin/fqcheck_distribute.pl /lfs1/ST_PMO2015G/STN11023/project/single_cell/Bulk_analysis/Expression/1_Filter_SOAPnuke/4031_L01_1/fqcheck/4031_L01_1.fqcheck -o /lfs1/ST_PMO2015G/STN11023/project/single_cell/Bulk_analysis/Expression/1_Filter_SOAPnuke/4031_L01_1/fqcheck/4031_L01_1.
echo ==========end at : `date` ==========
