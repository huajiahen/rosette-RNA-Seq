
#fpkm visulize
All.gene.expression %>% 
  select(2:6) %>%
  mutate_each(funs(half = log2(. + 1))) %>% 
  ggplot(aes(x = R5)) +
  geom_histogram(binwidth = 0.2, fill = "steelblue", color = "black")

table(All.gene.expression$R3 < 1)

#pair plot
pairs(All.gene.expression %>% 
        select(2:6) %>%
        mutate_each(funs(half = log2(. + 1))), pch=".",lower.panel=NULL)

#pca
log.normal.expression <- All.gene.expression %>%
  filter(!is.na(Symbol)) %>%
  select(2:6) %>%
  mutate_each(funs(log.normal = log2(. + 1))) %>% 
  data.matrix %>%
  t %>%
  as.data.frame
colnames(log.normal.expression) <- (All.gene.expression %>% filter(!is.na(Symbol)))$Symbol

expression.pca <- prcomp(log.normal.expression, center = T, scale. = T)
plot(expression.pca, type = "l")

biplot(expression.pca, xlim = -0.4:1)
ggbiplot(expression.pca, obs.scale = 1, var.axes = F, var.scale = 1, groups = rownames(log.normal.expression)) +
  scale_color_discrete(name = '') +
  theme(legend.direction = 'horizontal', legend.position = 'top')

#unique gene
All.gene.expression %>%
  filter(R3 > H9 * 10, R3 > NSC * 10) %>%
  filter(R5 > H9 * 10, R5 > EB * 10, R5 > NSC * 10) %>%
  filter(R3 > 1, R5 > 1) %>%
  View

#venn
venn.H9 = All.gene.expression$H9 > 1
venn.EB = All.gene.expression$EB > 1
venn.R3 = All.gene.expression$R3 > 1
venn.R5 = All.gene.expression$R5 > 1
venn.NSC = All.gene.expression$NSC > 1

merged.venn = cbind(venn.H9, venn.EB, venn.R3, venn.R5, venn.NSC)
colnames(merged.venn) = c("H9", "EB", "R3", "R5", "NSC")
venn.counts = vennCounts(merged.venn)
vennDiagram(venn.counts, counts.col = "red")