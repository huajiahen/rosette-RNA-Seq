echo ========== H9-VS-NSC start at : `date` ==========
perl /ifs4/BC_RD/USER/linruichai/RNA_module/GeneDiff/GeneDiff_possionDis/bin/ExpDiff.pl -compare /lfs1/ST_PMO2015G/STN11023/project/single_cell/Bulk_analysis/Expression/5_GeneDiff_possionDis/script/H9-VS-NSC.list -outdir /lfs1/ST_PMO2015G/STN11023/project/single_cell/Bulk_analysis/Expression/5_GeneDiff_possionDis/H9-VS-NSC -GeneIDColumn 1 -GeneExpColumn 4 -GeneLenColumn 3 -standardColumn 5 -standardMethod FPKM -log2 1 -fdr 0.001
perl /ifs4/BC_RD/USER/linruichai/RNA_module/GeneDiff/GeneDiff_possionDis/bin/addDesc.pl -input /lfs1/ST_PMO2015G/STN11023/project/single_cell/Bulk_analysis/Expression/5_GeneDiff_possionDis/H9-VS-NSC/H9-VS-NSC.GeneDiffExp.xls -desc /ifs4/BC_RD/USER/linruichai/RNAseq3.1_test/result.SE/prepareFiles/human.desc.xls -output /lfs1/ST_PMO2015G/STN11023/project/single_cell/Bulk_analysis/Expression/5_GeneDiff_possionDis/H9-VS-NSC/H9-VS-NSC.GeneDiffExp.xls
perl /ifs4/BC_RD/USER/linruichai/RNA_module/GeneDiff/GeneDiff_possionDis/bin/addDesc.pl -input /lfs1/ST_PMO2015G/STN11023/project/single_cell/Bulk_analysis/Expression/5_GeneDiff_possionDis/H9-VS-NSC/H9-VS-NSC.GeneDiffExpFilter.xls -desc /ifs4/BC_RD/USER/linruichai/RNAseq3.1_test/result.SE/prepareFiles/human.desc.xls -output /lfs1/ST_PMO2015G/STN11023/project/single_cell/Bulk_analysis/Expression/5_GeneDiff_possionDis/H9-VS-NSC/H9-VS-NSC.GeneDiffExpFilter.xls
echo ========== H9-VS-NSC Finished at : `date` ==========
