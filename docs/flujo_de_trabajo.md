# Flujo de trabajo — Análisis RNA-seq Monocito-Macrófago (GM-CSF)

Este documento describe paso a paso el flujo de análisis bioinformático.

---

## Prerrequisitos

1. Instalar el entorno conda: `conda env create -f envs/environment.yml`
2. Instalar paquetes de R: `Rscript envs/install_R_packages.R`
3. Descargar datos crudos según `data/raw/README.md`
4. Descargar genoma de referencia GRCh38 y anotación GTF de Ensembl/GENCODE

---

## Paso 1 — Control de calidad

```bash
conda activate rnaseq_gmcsf
bash scripts/01_quality_control/run_fastqc.sh
bash scripts/01_quality_control/run_multiqc.sh
```

**Revisar:** `results/reports/multiqc/multiqc_report.html`  
**Decisión:** Si hay adaptadores contaminantes o calidad baja en extremos, correr Trimmomatic/Trim Galore antes de continuar.

---

## Paso 2 — Alineamiento

```bash
bash scripts/02_alignment/run_star_alignment.sh
```

**Revisar:** Porcentaje de lecturas mapeadas en los logs de STAR (esperado >80%).

---

## Paso 3 — Cuantificación

```bash
bash scripts/03_quantification/run_featurecounts.sh
```

**Salida:** `data/processed/counts_matrix.txt`

---

## Paso 4 — Expresión diferencial (R)

```r
source("scripts/04_differential_expression/02_deseq2_analysis.R")
source("scripts/04_differential_expression/03_volcano_heatmap.R")
```

**Salidas:**
- `results/tables/DEGs_monocyte_vs_macrophage.csv`
- `results/figures/PCA_plot.pdf`
- `results/figures/volcano_plot.pdf`

---

## Paso 5 — Análisis funcional (R)

```r
source("scripts/05_functional_analysis/01_GO_enrichment.R")
```

**Salidas:**
- `results/tables/GO_BP_enrichment_results.csv`
- `results/figures/GO_BP_dotplot.pdf`

---

## Criterios de significancia estadística

| Parámetro | Umbral |
|-----------|--------|
| FDR (padj) | < 0.05 |
| |log2FoldChange| | ≥ 1 (≥2x cambio) |
| Conteos mínimos | ≥10 lecturas en ≥2 muestras |

---

## Referencias de software

- Andrews S. (2010). FastQC. https://www.bioinformatics.babraham.ac.uk/projects/fastqc/
- Ewels P. et al. (2016). MultiQC. *Bioinformatics*, 32(19):3047-3048.
- Dobin A. et al. (2013). STAR. *Bioinformatics*, 29(1):15-21.
- Liao Y. et al. (2014). featureCounts. *Bioinformatics*, 30(7):923-930.
- Love M.I. et al. (2014). DESeq2. *Genome Biology*, 15:550.
- Yu G. et al. (2012). clusterProfiler. *OMICS*, 16(5):284-287.
