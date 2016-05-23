#difference expression preprocess

H9.vs.EB <- read.table("5_GeneDiff_possionDis/H9-VS-EB/H9-VS-EB.GeneDiffExpFilter.xls", sep = "\t", header = T, na.strings = "-", quote = "")
EB.vs.R3 <- read.table("5_GeneDiff_possionDis/EB-VS-R3/EB-VS-R3.GeneDiffExpFilter.xls", sep = "\t", header = T, na.strings = "-", quote = "")
R3.vs.R5 <- read.table("5_GeneDiff_possionDis/R3-VS-R5/R3-VS-R5.GeneDiffExpFilter.xls", sep = "\t", header = T, na.strings = "-", quote = "")
R5.vs.NSC <- read.table("5_GeneDiff_possionDis/R5-VS-NSC/R5-VS-NSC.GeneDiffExpFilter.xls", sep = "\t", header = T, na.strings = "-", quote = "")

EB.vs.NSC <- read.table("5_GeneDiff_possionDis/EB-VS-NSC/EB-VS-NSC.GeneDiffExpFilter.xls", sep = "\t", header = T, na.strings = "-", quote = "")
H9.vs.NSC <- read.table("5_GeneDiff_possionDis/H9-VS-NSC/H9-VS-NSC.GeneDiffExpFilter.xls", sep = "\t", header = T, na.strings = "-", quote = "")

unioned.1To5 <- union(union(union(H9.vs.EB$geneID, EB.vs.R3$geneID), R3.vs.R5$geneID), R5.vs.NSC$geneID)
unioned.all <- union(union(union(union(union(H9.vs.EB$geneID, EB.vs.R3$geneID), R3.vs.R5$geneID), R5.vs.NSC$geneID), EB.vs.NSC$geneID), H9.vs.NSC$geneID)
intersected.1To5 <- intersect(intersect(intersect(H9.vs.EB$geneID, EB.vs.R3$geneID), R3.vs.R5$geneID), R5.vs.NSC$geneID)
intersected.all <- intersect(intersect(intersect(intersect(intersect(H9.vs.EB$geneID, EB.vs.R3$geneID), R3.vs.R5$geneID), R5.vs.NSC$geneID), EB.vs.NSC$geneID), H9.vs.NSC$geneID)

#write table
write.table(R3.vs.R5$geneID, "R3.vs.R5.GeneID.txt", row.names = F, col.names = F)
write.table(tmp$X, "EB.top2000.GeneID.txt", row.names = F, col.names = F)
