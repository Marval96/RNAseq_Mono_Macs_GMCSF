# scripts/05_functional_analysis — Análisis funcional y enriquecimiento

Scripts para interpretar biológicamente los DEGs identificados.

## Herramientas

- **clusterProfiler** (Bioconductor) — enriquecimiento GO y KEGG
- **fgsea** — Gene Set Enrichment Analysis (GSEA)
- **org.Hs.eg.db** — base de datos de anotación humana

## Scripts

| Script | Descripción |
|--------|-------------|
| `01_GO_enrichment.R` | Enriquecimiento de términos Gene Ontology (BP, MF, CC) |
| `02_KEGG_enrichment.R` | Enriquecimiento de vías metabólicas KEGG |
| `03_GSEA.R` | GSEA con MSigDB Hallmarks |

## Cómo ejecutar

```r
source("scripts/05_functional_analysis/01_GO_enrichment.R")
source("scripts/05_functional_analysis/02_KEGG_enrichment.R")
```

## Salidas

- `results/figures/GO_dotplot.pdf`
- `results/figures/KEGG_dotplot.pdf`
- `results/tables/GO_enrichment_results.csv`
- `results/tables/KEGG_enrichment_results.csv`
