# =============================================================================
# 01_GO_enrichment.R
# Análisis de enriquecimiento de términos Gene Ontology
#
# Autor: Marval96
# Proyecto: Tesis de Maestría — UIVC-HIMFG
# =============================================================================

library(clusterProfiler)
library(org.Hs.eg.db)
library(ggplot2)
library(dplyr)

FDR_CUTOFF <- 0.05
LFC_CUTOFF <- 1.0

OUT_FIGURES <- "results/figures"
OUT_TABLES  <- "results/tables"
dir.create(OUT_FIGURES, showWarnings = FALSE, recursive = TRUE)
dir.create(OUT_TABLES,  showWarnings = FALSE, recursive = TRUE)

# --- Cargar DEGs --------------------------------------------------------------
res_df <- read.csv("results/tables/DEGs_monocyte_vs_macrophage.csv", row.names = 1)

# Genes significativos: sobreexpresados en macrófagos
up_genes <- res_df %>%
  filter(!is.na(padj), padj < FDR_CUTOFF, log2FoldChange >= LFC_CUTOFF) %>%
  rownames()

# Convertir Ensembl IDs a Entrez (ajustar keyType según tus IDs)
up_entrez <- bitr(up_genes,
                  fromType = "ENSEMBL",
                  toType   = "ENTREZID",
                  OrgDb    = org.Hs.eg.db)$ENTREZID

# --- Enriquecimiento GO -------------------------------------------------------
ego <- enrichGO(gene         = up_entrez,
                OrgDb        = org.Hs.eg.db,
                ont          = "BP",     # Proceso Biológico (Biological Process)
                pAdjustMethod = "BH",
                pvalueCutoff = FDR_CUTOFF,
                readable     = TRUE)

# Guardar tabla
write.csv(as.data.frame(ego),
          file.path(OUT_TABLES, "GO_BP_enrichment_results.csv"),
          row.names = FALSE)

# Dot plot
pdf(file.path(OUT_FIGURES, "GO_BP_dotplot.pdf"), width = 10, height = 8)
dotplot(ego, showCategory = 20, title = "GO Biological Process — Macrófago vs. Monocito")
dev.off()

message("Análisis GO completado.")
