#gene expression

drawGenes <- function(Genes) {
  All.gene.expression %>%
    filter(Symbol %in% Genes) %>%
    subset(select = 2:7) %>%
    melt(measure.vars = 1:5) %>%
    mutate(value = log2(value + 1)) %>%
    ggplot(aes(x=variable, y=value, group=Symbol)) +
    geom_line(aes(color=Symbol)) +
    geom_point(aes(color=Symbol)) +
    ylim(0, 10) +
    labs(x = "", y = "", title = "") +
    theme(legend.title = element_blank())
}

drawGene.like <- function(Gene, title = "") {
  All.gene.expression %>%
    filter(grepl(Gene, Symbol)) %>%
    subset(select = 2:7) %>%
    melt(measure.vars = 1:5) %>%
    mutate(value = log2(value + 1)) %>%
    ggplot(aes(x=variable, y=value, group=Symbol)) +
    geom_line(aes(color=Symbol)) +
    geom_point(aes(color=Symbol)) +
    ylim(0, 8) +
    labs(x = "", y = "", title = title) +
    theme(legend.title = element_blank())
}

##Wnt

#R3 WNT8B
#R5 WNT1 WNT3 WNT3A WNT8B
drawGene.like("WNT")

#Frizzled
drawGene.like("FZD")
drawGene.like("^SMO$")

#DVL
drawGene.like("^DVL")
drawGene.like("^APC")

(Nestin <- drawGeneID("10763"))
(NCAM <- drawGeneID("4684"))
(NCAD <- drawGeneID("1000"))#aka. CDH2 Gene
(PAX6 <- drawGeneID("5080"))
(SOX1 <- drawGeneID("6656"))
(ZO1 <- drawGeneID("7082"))#aka. TJP1
(PH3 <- drawGeneID("80012"))#aka. PHC3
(BLBP <- drawGeneID("2173"))#aka. FABP7 
(GLAST <- drawGeneID("6507"))#aka. SLC1A3
(SLC9A3R2 <- drawGeneID("9351"))
(SLC1A1 <- drawGeneID("6505"))
(SLC1A5 <- drawGeneID("6510"))
(FOXG1 <- drawGeneID("2290")) #!!!!
(THY1 <- drawGeneID("7070"))
# no significant change for notch signal pathway block gene: NUMB, DVL1, DVL2, DVL3

# change for MAPK signal pathway Key component

#RAS no change
# MAP4K no change
# MAP3K no change
# MAP2K no change
#MAPK ~ JNK
drawGenes("MAPK10") #!

#TNF?
drawGenes(c("TNF", "TNFAIP8L2-SCNM1", "TNFRSF12A"))

#Cadherins
p1 = drawGenes(c("CDH1", "CDH2"), "Cadherins")

#Neuroepithelial/NSC
drawGenes(c("PAX6", "SOX1", "SOX2", "HES5"), "Neuroepithelial/NSC")

#Radial gilal/NSC
#drawGenes(c("FABP7", "SLC1A3", "S100B"), "Radial gilal/NSC")

#Polarity
#drawGenes(c("PARD6B", "CDC42", "PRKCI"), "Polarity")

#R-NSC Marker
p3 = drawGenes(c("PLAGL1", "DACH1", "ZBTB16"), "R-NSC Marker")

#ESC/Reprograming
p2 = drawGenes(c("POU5F1", "KLF4", "MYC", "NANOG"), "ESC/Reprograming")

#Anterior CNS
p4 = drawGenes(c("FOXG1", "EMX2"), "Anterior CNS")

#Posterior CNS
p5 = drawGenes(c("HOXB2", "HOXB3", "HOXB4"), "Posterior CNS")

#Neuron
drawGenes(c("MAP1B", ""), "Neuron")

#Neural blast
drawGenes(c("CD24"), "Neural Blast")

#Neural crest
drawGenes(c("NGFR", "SOX10", "TFAP2B"), "Neural Crest")

#NSC/ Gilal
drawGenes(c("OLIG1", "OLIG2", "AQP4", "S100B", "EGFR"), "NSC/ Gilal")

#DV Axes
p6 = drawGenes(c("BMP4", "TBX5"), "DV Axes")

source("multiplot.R")
multiplot(p1, p2, p3, p4, p5, p6, layout = matrix(c(1,2,3,4,5,6), ncol = 2, byrow=T))