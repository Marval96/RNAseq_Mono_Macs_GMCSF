# =============================================================================
# 02_deseq2_analysis.R
# Análisis de expresión diferencial con DESeq2
# Comparación: Monocitos vs. Macrófagos (diferenciación con GM-CSF)
#
# Autor: Marval96
# Proyecto: Tesis de Maestría — UIVC-HIMFG
# =============================================================================

# --- Paquetes -----------------------------------------------------------------
library(DESeq2)
library(ggplot2)
library(dplyr)

# --- Parámetros ---------------------------------------------------------------
COUNTS_FILE   <- "data/processed/counts_matrix.txt"
METADATA_FILE <- "data/metadata/sample_info.csv"
OUT_DIR       <- "results"
FDR_CUTOFF    <- 0.05
LFC_CUTOFF    <- 1.0   # |log2FoldChange| >= 1 (equivalente a 2x)

dir.create(file.path(OUT_DIR, "tables"),  showWarnings = FALSE, recursive = TRUE)
dir.create(file.path(OUT_DIR, "figures"), showWarnings = FALSE, recursive = TRUE)

# --- Cargar datos -------------------------------------------------------------
# Matriz de conteos (featureCounts: saltar las primeras 2 filas de metadatos)
counts_raw <- read.table(COUNTS_FILE, header = TRUE, skip = 1, row.names = 1)

# Conservar solo columnas de conteos (las últimas N columnas, después de Chr/Start/End/Strand/Length)
counts <- counts_raw[, 6:ncol(counts_raw)]

# Limpiar nombres de columnas (remover path y sufijo)
colnames(counts) <- sub(".*alignments/(.*?)_Aligned.*", "\\1", colnames(counts))

# Metadatos de muestras
metadata <- read.csv(METADATA_FILE, row.names = 1)
metadata$condition <- factor(metadata$condition, levels = c("monocyte", "macrophage"))

# Verificar que el orden de muestras coincide
stopifnot(all(colnames(counts) == rownames(metadata)))

# --- DESeq2 -------------------------------------------------------------------
dds <- DESeqDataSetFromMatrix(
  countData = counts,
  colData   = metadata,
  design    = ~ condition
)

# Filtrar genes con muy pocas lecturas
keep <- rowSums(counts(dds) >= 10) >= 2
dds  <- dds[keep, ]
message(sprintf("Genes después de filtrado: %d", nrow(dds)))

# Análisis
dds <- DESeq(dds)

# Resultados: macrófago vs. monocito (referencia = monocito)
res <- results(dds,
               contrast  = c("condition", "macrophage", "monocyte"),
               alpha     = FDR_CUTOFF)

summary(res)

# --- Guardar resultados -------------------------------------------------------
res_df <- as.data.frame(res) %>%
  tibble::rownames_to_column("gene_id") %>%
  arrange(padj)

write.csv(res_df,
          file      = file.path(OUT_DIR, "tables", "DEGs_monocyte_vs_macrophage.csv"),
          row.names = FALSE)

message("Tabla de DEGs guardada en results/tables/")

# --- PCA ----------------------------------------------------------------------
vsd <- vst(dds, blind = FALSE)

pca_data <- plotPCA(vsd, intgroup = "condition", returnData = TRUE)
pct_var  <- round(100 * attr(pca_data, "percentVar"))

pca_plot <- ggplot(pca_data, aes(x = PC1, y = PC2, color = condition, label = name)) +
  geom_point(size = 4) +
  ggrepel::geom_text_repel(size = 3) +
  xlab(paste0("PC1: ", pct_var[1], "% varianza")) +
  ylab(paste0("PC2: ", pct_var[2], "% varianza")) +
  theme_bw() +
  ggtitle("PCA — Monocitos vs. Macrófagos (GM-CSF)")

ggsave(file.path(OUT_DIR, "figures", "PCA_plot.pdf"),
       pca_plot, width = 7, height = 5)

message("PCA guardado en results/figures/")
