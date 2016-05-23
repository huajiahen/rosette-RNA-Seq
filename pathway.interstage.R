identified.heatmap.rescale.interstage <- function(data, Term.vector, TermSliceStart = 12) {
  tmp <- data %>% filter(Term %in% Term.vector) %>% 
    dcast(Term ~ CellType, value.var = "Fold.Enrichment", fill = 1)
  tmp[, 2:5] <- as.matrix(tmp[, 2:5]) %>% apply(1, rescale) %>% t

  tmp %>%
  filter(H9.vs.EB + EB.vs.R3 + R3.vs.R5 + R5.vs.NSC > 1) %>%
  melt(id.vars = c("Term")) %>%
  mutate(Term = substring(Term, TermSliceStart), 
         variable = factor(variable, levels = c("H9.vs.EB", "EB.vs.R3", "R3.vs.R5", "R5.vs.NSC"))) %>%
  ggplot(aes(variable, Term)) + 
  labs(x = "", y = "") +
  geom_tile(aes(fill = value), colour = "white") + 
  scale_fill_gradient(low = "white", high = "steelblue") +
  theme(legend.title = element_blank()) +
  theme(axis.text.x = element_text(angle = 15, hjust = 1), axis.text.y = element_text(size=8))
}

#pathway
top20.pathway.interstage <- rbind.data.frame(H9.vs.EB.pathway %>% head(20),
                                              EB.vs.R3.pathway %>% head(20),
                                              R3.vs.R5.pathway %>% head(20),
                                              R5.vs.NSC.pathway %>% head(20))$Term %>% 
                               unique %>% as.character
all.pathway.interstage <- bind_rows(
  list(H9.vs.EB = H9.vs.EB.pathway, EB.vs.R3 = EB.vs.R3.pathway, R3.vs.R5 = R3.vs.R5.pathway, R5.vs.NSC = R5.vs.NSC.pathway),
  .id = "CellType")

identified.heatmap.rescale.interstage(all.pathway.interstage, top20.pathway.interstage, 10)

#GO BP
GO.BP_filtered.interstage <- rbind.data.frame(H9.vs.EB.GO.BP %>% filter(FDR < 0.01),
                                              EB.vs.R3.GO.BP %>% filter(FDR < 0.01),
                                              R3.vs.R5.GO.BP %>% filter(FDR < 0.01),
                                              R5.vs.NSC.GO.BP %>% filter(FDR < 0.01))$Term %>% 
  unique %>% as.character
all.GO.BP.interstage <- bind_rows(
  list(H9.vs.EB = H9.vs.EB.GO.BP, EB.vs.R3 = EB.vs.R3.GO.BP, R3.vs.R5 = R3.vs.R5.GO.BP, R5.vs.NSC = R5.vs.NSC.GO.BP),
  .id = "CellType")

identified.heatmap.rescale.interstage(all.GO.BP.interstage, GO.BP_filtered.interstage)


#GO CC
GO.CC_filtered.interstage <- rbind.data.frame(H9.vs.EB.GO.CC %>% filter(FDR < 0.05),
                                              EB.vs.R3.GO.CC %>% filter(FDR < 0.05),
                                              R3.vs.R5.GO.CC %>% filter(FDR < 0.05),
                                              R5.vs.NSC.GO.CC %>% filter(FDR < 0.05))$Term %>% 
  unique %>% as.character
all.GO.CC.interstage <- bind_rows(
  list(H9.vs.EB = H9.vs.EB.GO.CC, EB.vs.R3 = EB.vs.R3.GO.CC, R3.vs.R5 = R3.vs.R5.GO.CC, R5.vs.NSC = R5.vs.NSC.GO.CC),
  .id = "CellType")

identified.heatmap.rescale.interstage(all.GO.CC.interstage, GO.CC_filtered.interstage)


#GO MF
GO.MF_filtered.interstage <- rbind.data.frame(H9.vs.EB.GO.MF %>% filter(FDR < 0.05),
                                              EB.vs.R3.GO.MF %>% filter(FDR < 0.05),
                                              R3.vs.R5.GO.MF %>% filter(FDR < 0.05),
                                              R5.vs.NSC.GO.MF %>% filter(FDR < 0.05))$Term %>% 
  unique %>% as.character
all.GO.MF.interstage <- bind_rows(
  list(H9.vs.EB = H9.vs.EB.GO.MF, EB.vs.R3 = EB.vs.R3.GO.MF, R3.vs.R5 = R3.vs.R5.GO.MF, R5.vs.NSC = R5.vs.NSC.GO.MF),
  .id = "CellType")

identified.heatmap.rescale.interstage(all.GO.MF.interstage, GO.MF_filtered.interstage)
