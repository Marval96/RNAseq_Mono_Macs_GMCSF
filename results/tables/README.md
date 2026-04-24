# results/tables — Tablas de resultados

Tablas generadas por los análisis, listas para ser incluidas en la tesis y publicación.

## Archivos esperados

| Archivo | Descripción | Script que lo genera |
|---------|-------------|----------------------|
| `DEGs_monocyte_vs_macrophage.csv` | Todos los genes con estadísticos DESeq2 | `04/02_deseq2_analysis.R` |
| `GO_BP_enrichment_results.csv` | Términos GO Biological Process enriquecidos | `05/01_GO_enrichment.R` |
| `KEGG_enrichment_results.csv` | Vías KEGG enriquecidas | `05/02_KEGG_enrichment.R` |

## Columnas principales en la tabla de DEGs

| Columna | Descripción |
|---------|-------------|
| `gene_id` | ID del gen (Ensembl) |
| `baseMean` | Expresión promedio entre todas las muestras |
| `log2FoldChange` | Log2 del cambio de expresión (macrófago / monocito) |
| `lfcSE` | Error estándar del LFC |
| `stat` | Estadístico de prueba |
| `pvalue` | p-valor |
| `padj` | p-valor ajustado (FDR, método Benjamini-Hochberg) |
