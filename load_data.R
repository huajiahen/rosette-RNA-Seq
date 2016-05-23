library(dplyr)

#load data
All.gene.expression = read.table("3_Expression/All.gene.expression.xls", sep = "\t", header = T, na.strings = "-", quote = "", fill = T) %>%
  select(-UHRR_1, -UHRR_2, -DA) %>% #remove unused data
  filter(!(H9 == 0 & EB == 0 & R3 == 0 & R5 == 0 & NSC == 0)) %>%  #remove empty data
  filter(!grepl("^RNA\\d+S", Symbol)) #remove rRNA data

#load data all
#All.gene.expression = read.table("3_Expression/All.gene.expression.xls", sep = "\t", header = T, na.strings = "-", quote = "", fill = T) %>%
#  filter(!grepl("^RNA\\d+S", Symbol)) #remove rRNA data

#threshold <- 1
#All.gene.expression$H9[All.gene.expression$H9 < threshold] = 0
#All.gene.expression$EB[All.gene.expression$EB < threshold] = 0
#All.gene.expression$R3[All.gene.expression$R3 < threshold] = 0
#All.gene.expression$R5[All.gene.expression$R5 < threshold] = 0
#All.gene.expression$NSC[All.gene.expression$NSC < threshold] = 0
#All.gene.expression = filter(All.gene.expression, !(H9 == 0 & EB == 0 & R3 == 0 & R5 == 0 & NSC == 0 & DA == 0))

#Pathway
top20_pathway <- read.table("8_Figure/7_KEGG/top20_pathway.forDrawFigure.txt", sep = "\t", quote = "", header = T)
top20_pathway$Sample = factor(top20_pathway$Sample, levels = c("H9", "EB", "R3", "R5", "NSC"))

#DAVID

H9.pathway <- read.table("8_Figure/7_KEGG/H9/H9_KEGG.txt", header = T, sep = "\t", quote = "")
H9.GO.BP <- read.table("8_Figure/7_KEGG/H9/H9_GO-BP.txt", header = T, sep = "\t", quote = "")
H9.GO.CC <- read.table("8_Figure/7_KEGG/H9/H9_GO-CC.txt", header = T, sep = "\t", quote = "")
H9.GO.MF <- read.table("8_Figure/7_KEGG/H9/H9_GO-MF.txt", header = T, sep = "\t", quote = "")

EB.pathway <- read.table("8_Figure/7_KEGG/EB/EB_KEGG.txt", header = T, sep = "\t", quote = "")
EB.GO.BP <- read.table("8_Figure/7_KEGG/EB/EB_GO-BP.txt", header = T, sep = "\t", quote = "")
EB.GO.CC <- read.table("8_Figure/7_KEGG/EB/EB_GO-CC.txt", header = T, sep = "\t", quote = "")
EB.GO.MF <- read.table("8_Figure/7_KEGG/EB/EB_GO-MF.txt", header = T, sep = "\t", quote = "")

R3.pathway <- read.table("8_Figure/7_KEGG/R3/R3_KEGG.txt", header = T, sep = "\t", quote = "")
R3.GO.BP <- read.table("8_Figure/7_KEGG/R3/R3_GO-BP.txt", header = T, sep = "\t", quote = "")
R3.GO.CC <- read.table("8_Figure/7_KEGG/R3/R3_GO-CC.txt", header = T, sep = "\t", quote = "")
R3.GO.MF <- read.table("8_Figure/7_KEGG/R3/R3_GO-MF.txt", header = T, sep = "\t", quote = "")

R5.pathway <- read.table("8_Figure/7_KEGG/R5/R5_KEGG.txt", header = T, sep = "\t", quote = "")
R5.GO.BP <- read.table("8_Figure/7_KEGG/R5/R5_GO-BP.txt", header = T, sep = "\t", quote = "")
R5.GO.CC <- read.table("8_Figure/7_KEGG/R5/R5_GO-CC.txt", header = T, sep = "\t", quote = "")
R5.GO.MF <- read.table("8_Figure/7_KEGG/R5/R5_GO-MF.txt", header = T, sep = "\t", quote = "")

NSC.pathway <- read.table("8_Figure/7_KEGG/NSC/NSC_KEGG.txt", header = T, sep = "\t", quote = "")
NSC.GO.BP <- read.table("8_Figure/7_KEGG/NSC/NSC_GO-BP.txt", header = T, sep = "\t", quote = "")
NSC.GO.CC <- read.table("8_Figure/7_KEGG/NSC/NSC_GO-CC.txt", header = T, sep = "\t", quote = "")
NSC.GO.MF <- read.table("8_Figure/7_KEGG/NSC/NSC_GO-MF.txt", header = T, sep = "\t", quote = "")

H9.vs.EB.pathway <- read.table("8_Figure/7_KEGG/H9-VS-EB/H9-VS-EB_KEGG.txt", header = T, sep = "\t", quote = "")
H9.vs.EB.GO.BP <- read.table("8_Figure/7_KEGG/H9-VS-EB/H9-VS-EB_GO-BP.txt", header = T, sep = "\t", quote = "")
H9.vs.EB.GO.CC <- read.table("8_Figure/7_KEGG/H9-VS-EB/H9-VS-EB_GO-CC.txt", header = T, sep = "\t", quote = "")
H9.vs.EB.GO.MF <- read.table("8_Figure/7_KEGG/H9-VS-EB/H9-VS-EB_GO-MF.txt", header = T, sep = "\t", quote = "")

EB.vs.R3.pathway <- read.table("8_Figure/7_KEGG/EB-VS-R3/EB-VS-R3_KEGG.txt", header = T, sep = "\t", quote = "")
EB.vs.R3.GO.BP <- read.table("8_Figure/7_KEGG/EB-VS-R3/EB-VS-R3_GO-BP.txt", header = T, sep = "\t", quote = "")
EB.vs.R3.GO.CC <- read.table("8_Figure/7_KEGG/EB-VS-R3/EB-VS-R3_GO-CC.txt", header = T, sep = "\t", quote = "")
EB.vs.R3.GO.MF <- read.table("8_Figure/7_KEGG/EB-VS-R3/EB-VS-R3_GO-MF.txt", header = T, sep = "\t", quote = "")

R3.vs.R5.pathway <- read.table("8_Figure/7_KEGG/R3-VS-R5/R3-VS-R5_KEGG.txt", header = T, sep = "\t", quote = "")
R3.vs.R5.GO.BP <- read.table("8_Figure/7_KEGG/R3-VS-R5/R3-VS-R5_GO-BP.txt", header = T, sep = "\t", quote = "")
R3.vs.R5.GO.CC <- read.table("8_Figure/7_KEGG/R3-VS-R5/R3-VS-R5_GO-CC.txt", header = T, sep = "\t", quote = "")
R3.vs.R5.GO.MF <- read.table("8_Figure/7_KEGG/R3-VS-R5/R3-VS-R5_GO-MF.txt", header = T, sep = "\t", quote = "")

R5.vs.NSC.pathway <- read.table("8_Figure/7_KEGG/R5-VS-NSC/R5-VS-NSC_KEGG.txt", header = T, sep = "\t", quote = "")
R5.vs.NSC.GO.BP <- read.table("8_Figure/7_KEGG/R5-VS-NSC/R5-VS-NSC_GO-BP.txt", header = T, sep = "\t", quote = "")
R5.vs.NSC.GO.CC <- read.table("8_Figure/7_KEGG/R5-VS-NSC/R5-VS-NSC_GO-CC.txt", header = T, sep = "\t", quote = "")
R5.vs.NSC.GO.MF <- read.table("8_Figure/7_KEGG/R5-VS-NSC/R5-VS-NSC_GO-MF.txt", header = T, sep = "\t", quote = "")
