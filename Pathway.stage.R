#pathway heatmap

identified.heatmap <- function(data, Term.vector, TermSliceStart = 12) {
  data %>% filter(Term %in% Term.vector) %>% 
    dcast(Term ~ CellType, value.var = "Fold.Enrichment", fill = 1) %>%
    melt(id.vars = c("Term")) %>%
    mutate(Term = substring(Term, TermSliceStart), 
           variable = factor(variable, levels = c("H9", "EB", "R3", "R5", "NSC", "DA"))) %>%
    ggplot(aes(variable, Term)) + 
    labs(x = "", y = "") +
    geom_tile(aes(fill = value), colour = "white") + 
    scale_fill_gradient(low = "white", high = "steelblue")
}

identified.heatmap.rescale <- function(data, Term.vector, TermSliceStart = 12) {
  tmp <- data %>% filter(Term %in% Term.vector) %>% 
    dcast(Term ~ CellType, value.var = "Fold.Enrichment", fill = 1)
  tmp[, 2:6] <- as.matrix(tmp[, 2:6]) %>% apply(1, rescale) %>% t
  
  tmp %>% melt(id.vars = c("Term")) %>%
  mutate(Term = substring(Term, TermSliceStart), 
         variable = factor(variable, levels = c("H9", "EB", "R3", "R5", "NSC"))) %>%
  ggplot(aes(variable, Term)) + 
  labs(x = "", y = "") +
  geom_tile(aes(fill = value), colour = "white") + 
  scale_fill_gradient(low = "white", high = "steelblue") +
  theme(legend.title = element_blank()) +
  theme(axis.text.y = element_text(size=8), axis.text.x = element_text(size=8))
}

all.pathway <- bind_rows(
  list(H9 = H9.pathway, EB = EB.pathway, R3 = R3.pathway, R5 = R5.pathway, NSC = NSC.pathway),
  .id = "CellType")

identified.heatmap(all.pathway %>% mutate(Term = substring(Term, 10)), top20_pathway$Term %>% levels, 0)
identified.heatmap.rescale(all.pathway %>% 
                             mutate(Term = substring(Term, 10)), top20_pathway$Term %>%
                             levels, 0)

#GO Biological Process heatmap

FDR.filtered_GO.BP <- (rbind.data.frame(H9.GO.BP, EB.GO.BP, R3.GO.BP, R5.GO.BP, NSC.GO.BP) %>%
                         filter(FDR < 0.05))$Term %>% unique %>% as.character
all.GO.BP <- bind_rows(
  list(H9 = H9.GO.BP, EB = EB.GO.BP, R3 = R3.GO.BP, R5 = R5.GO.BP, NSC = NSC.GO.BP),
  .id = "CellType") %>% filter(!grepl("anaphase", Term))

identified.heatmap(all.GO.BP, FDR.filtered_GO.BP)
identified.heatmap.rescale(all.GO.BP, FDR.filtered_GO.BP)

#GO Cellular Component heatmap

FDR.filtered_GO.CC <- (rbind.data.frame(H9.GO.CC, EB.GO.CC, R3.GO.CC, R5.GO.CC, NSC.GO.CC) %>%
                         filter(FDR < 0.05))$Term %>% unique %>% as.character
all.GO.CC <- bind_rows(
  list(H9 = H9.GO.CC, EB = EB.GO.CC, R3 = R3.GO.CC, R5 = R5.GO.CC, NSC = NSC.GO.CC),
  .id = "CellType")

identified.heatmap(all.GO.CC, FDR.filtered_GO.CC)
identified.heatmap.rescale(all.GO.CC, FDR.filtered_GO.CC)

#GO Molecular Function heatmap

FDR.filtered_GO.MF <- (rbind.data.frame(H9.GO.MF, EB.GO.MF, R3.GO.MF, R5.GO.MF, NSC.GO.MF) %>%
                         filter(FDR < 0.05))$Term %>% unique %>% as.character
all.GO.MF <- bind_rows(
  list(H9 = H9.GO.MF, EB = EB.GO.MF, R3 = R3.GO.MF, R5 = R5.GO.MF, NSC = NSC.GO.MF),
  .id = "CellType") %>% filter(!grepl("oxidoreductase", Term))

identified.heatmap(all.GO.MF, FDR.filtered_GO.MF)
identified.heatmap.rescale(all.GO.MF, FDR.filtered_GO.MF)

#pathway genes
expressionForTerm <- function(data, pathway) {
  genes <- data %>% 
    filter(grepl(pathway, Term)) %>% 
    select(Genes) %>% 
    unlist %>% 
    lapply(function(x) { x %>% as.character %>% strsplit(", ") %>% unlist }) %>%
    unlist %>% 
    unique
  All.gene.expression %>% filter(Symbol %in% genes)
}

rescale.expression <- function(expression) {
  expression[, 2:6] <- as.matrix(expression[, 2:7]) %>% apply(1, rescale) %>% t
  expression
}

heatmap.expression <- function(expression) {
  expression %>%
    melt(measure.vars = 2:6) %>%
    mutate(variable = factor(variable, levels = c("H9", "EB", "R3", "R5", "NSC"))) %>%
    ggplot(aes(variable, Symbol)) + 
    labs(x = "", y = "") +
    geom_tile(aes(fill = value), colour = "white") + 
    scale_fill_gradient(low = "white", high = "steelblue")
}

expressionForTerm(all.GO.BP, "regulation of protein modification process") %>% View

# PLA2G2A PLA2G1B FGF23 CACNA1A
# Calcium Channel !!!
expressionForTerm(all.pathway, "MAPK") %>% rescale.expression %>% heatmap.expression

#WNT3A WNT8B SMAD4? NKD2 NFATC2 MMP7 FZD3 
expressionForTerm(all.pathway, "Wnt") %>% rescale.expression %>% heatmap.expression

#RPL21P28
expressionForTerm(all.pathway, "Ribosome") %>% rescale.expression %>% heatmap.expression

#PTGS2 PRKCG PLCG1 PLCG2 PIK3R2 NFATC(1~4) JMJD7-PLA2G4B/JMJD7
expressionForTerm(all.pathway, "VEGF") %>% rescale.expression %>% heatmap.expression

#TAF7 UBE2E1 SMAD4 SET RPS27A RB1CC1 PTPRC PRKCZ PRKCG PIAS4 PIAS1 NF2 MAP3K1 MAD2L1 CD4 CARD14 ATG10 ADAM17
expressionForTerm(all.GO.BP, "regulation of protein modification process") %>%
  rescale.expression %>% heatmap.expression
