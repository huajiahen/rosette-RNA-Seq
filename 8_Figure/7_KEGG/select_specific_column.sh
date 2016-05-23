#!/usr/bin/bash

for i in H9-VS-EB EB-VS-R3 R3-VS-R5 R5-VS-NSC NSC-VS-DA H9-VS-NSC EB-VS-NSC;
  do 
sed 's/GO:[0-9]*~//' `ls /lfs1/ST_PMO2015G/STN11023/project/single_cell/Bulk_analysis/Expression/8_Figure/7_KEGG/$i/*?BP.txt` |awk -F "\t" '{print $2"\t"$10"\t"$11}' |sed 's/Fold Enrichment/Enrichment/'|sed -n '1,21p' >/lfs1/ST_PMO2015G/STN11023/project/single_cell/Bulk_analysis/Expression/8_Figure/7_KEGG/$i/$i.for.drawFigure.txt;
  done
