# =============================================================================
# 03_volcano_heatmap.R
# Visualización de DEGs: Volcano plot y Heatmap
#
# Autor: Marval96
# Proyecto: Tesis de Maestría — UIVC-HIMFG
# =============================================================================

library(ggplot2)
library(dplyr)
library(EnhancedVolcano)
library(pheatmap)
library(DESeq2)

FDR_CUTOFF <- 0.05
LFC_CUTOFF <- 1.0
TOP_N_GENES <- 50

OUT_FIGURES <- "results/figures"
dir.create(OUT_FIGURES, showWarnings = FALSE, recursive = TRUE)

# --- Cargar resultados DESeq2 -------------------------------------------------
res_df <- read.csv("results/tables/DEGs_monocyte_vs_macrophage.csv", row.names = 1)

# --- Volcano plot -------------------------------------------------------------
pdf(file.path(OUT_FIGURES, "volcano_plot.pdf"), width = 8, height = 7)
EnhancedVolcano(res_df,
  lab            = rownames(res_df),
  x              = "log2FoldChange",
  y              = "padj",
  pCutoff        = FDR_CUTOFF,
  FCcutoff       = LFC_CUTOFF,
  title          = "Macrófago vs. Monocito (GM-CSF)",
  subtitle       = paste0("FDR < ", FDR_CUTOFF, " | |LFC| >= ", LFC_CUTOFF),
  pointSize      = 2,
  labSize        = 3
)
dev.off()

message("Volcano plot guardado.")

# --- Heatmap top DEGs ---------------------------------------------------------
# Seleccionar los top N genes más significativos
top_genes <- res_df %>%
  filter(!is.na(padj), padj < FDR_CUTOFF, abs(log2FoldChange) >= LFC_CUTOFF) %>%
  arrange(padj) %>%
  head(TOP_N_GENES) %>%
  rownames()

# Nota: para el heatmap se necesita la matriz de conteos normalizados
# Cargar vsd guardado desde 02_deseq2_analysis.R (si lo guardaste con saveRDS)
# vsd <- readRDS("data/processed/vsd.rds")
# mat <- assay(vsd)[top_genes, ]

message(sprintf("Heatmap: seleccionados %d genes top DEGs", length(top_genes)))
message("Para generar el heatmap, cargar el objeto vsd guardado desde 02_deseq2_analysis.R")
