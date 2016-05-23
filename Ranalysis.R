library(reshape2)
library(ggplot2)
library(limma)
library(GOplot)
source("ggbiplot.R")
source("multiplot.R")
source("load_data.R")

#rescale
rescale <- function(x) {
  x / max(x)
}

rescale <- function(x) {
  (x - min(x)) / (max(x) - min(x))
}

