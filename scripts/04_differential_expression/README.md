# scripts/04_differential_expression — Análisis de expresión diferencial

Scripts en R para identificar genes diferencialmente expresados (DEGs) entre monocitos y macrófagos.

## Herramientas

- **DESeq2** (Bioconductor) — método principal
- **edgeR** (Bioconductor) — método de validación/comparación

## Scripts

| Script | Descripción |
|--------|-------------|
| `01_load_and_filter.R` | Carga la matriz de conteos, filtra genes de baja expresión |
| `02_deseq2_analysis.R` | Análisis completo con DESeq2 (normalización, PCA, DEGs) |
| `03_volcano_heatmap.R` | Volcano plot y heatmap de los DEGs principales |

## Cómo ejecutar

```r
# Desde R o RStudio, ejecutar en orden:
source("scripts/04_differential_expression/01_load_and_filter.R")
source("scripts/04_differential_expression/02_deseq2_analysis.R")
source("scripts/04_differential_expression/03_volcano_heatmap.R")
```

## Salidas

- `results/tables/DEGs_monocyte_vs_macrophage.csv` — tabla completa de DEGs
- `results/figures/PCA_plot.pdf`
- `results/figures/volcano_plot.pdf`
- `results/figures/heatmap_top50_DEGs.pdf`
