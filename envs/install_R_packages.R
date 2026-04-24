# install_R_packages.R
# Instala todos los paquetes de R/Bioconductor necesarios para el análisis
#
# Uso: Rscript envs/install_R_packages.R
# Versión de R recomendada: >= 4.3

# --- CRAN ---------------------------------------------------------------------
cran_packages <- c(
  "ggplot2",
  "dplyr",
  "tidyr",
  "tibble",
  "ggrepel",
  "pheatmap",
  "RColorBrewer",
  "viridis",
  "readr",
  "stringr"
)

install.packages(cran_packages, repos = "https://cloud.r-project.org")

# --- Bioconductor -------------------------------------------------------------
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

bioc_packages <- c(
  "DESeq2",           # Expresión diferencial
  "edgeR",            # Expresión diferencial (alternativa)
  "clusterProfiler",  # Enriquecimiento funcional
  "org.Hs.eg.db",     # Anotación humana
  "EnhancedVolcano",  # Volcano plots
  "fgsea",            # GSEA
  "AnnotationDbi",    # Herramientas de anotación
  "GenomicFeatures",  # Características genómicas
  "tximport",         # Importar cuantificación de Salmon
  "biomaRt"           # Consultas a Ensembl BioMart
)

BiocManager::install(bioc_packages)

message("✓ Todos los paquetes instalados correctamente.")
