# Análisis Transcriptómico de la Diferenciación Monocito-Macrófago inducida por GM-CSF

> **Tesis de Maestría** — Unidad de Investigación en Virología y Cáncer (UIVC), HIMFG

Este repositorio documenta el análisis de RNA-seq de la diferenciación Monocito-Macrófago conducida por GM-CSF (Factor Estimulante de Colonias de Granulocitos y Macrófagos). Contiene todos los scripts, metadatos esenciales y resultados organizados para garantizar la **reproducibilidad** del análisis y servir de base para la publicación científica.

---

## 🗂️ Estructura del repositorio

```
RNAseq_Mono_Macs_GMCSF/
├── data/
│   ├── raw/            # Datos crudos (FASTQs) — no se suben a GitHub; ver instrucciones
│   ├── processed/      # Matrices de conteos, archivos procesados
│   └── metadata/       # Diseño experimental, información de muestras
├── scripts/
│   ├── 01_quality_control/         # FastQC, MultiQC
│   ├── 02_alignment/               # Alineamiento al genoma de referencia (STAR / HISAT2)
│   ├── 03_quantification/          # Cuantificación de expresión (featureCounts / Salmon)
│   ├── 04_differential_expression/ # Expresión diferencial (DESeq2 / edgeR)
│   ├── 05_functional_analysis/     # Análisis funcional (GO, GSEA, vías metabólicas)
│   └── 06_visualization/           # Figuras y visualizaciones
├── results/
│   ├── figures/        # Todas las figuras generadas
│   ├── tables/         # Tablas de resultados (genes DEGs, etc.)
│   └── reports/        # Reportes de QC (MultiQC HTML, etc.)
├── envs/               # Entornos de software (conda, R)
└── docs/               # Documentación del flujo de trabajo
```

---

## ⚡ Flujo de análisis

| Paso | Descripción | Herramienta |
|------|-------------|-------------|
| 1 | Control de calidad de lecturas | FastQC + MultiQC |
| 2 | Alineamiento al genoma de referencia | STAR / HISAT2 |
| 3 | Cuantificación de expresión génica | featureCounts / Salmon |
| 4 | Análisis de expresión diferencial | DESeq2 (R/Bioconductor) |
| 5 | Análisis funcional y de enriquecimiento | clusterProfiler, GSEA |
| 6 | Visualización | ggplot2, pheatmap, EnhancedVolcano |

---

## 🔁 Reproducibilidad

- Los entornos de software se encuentran en [`envs/`](envs/).
- Los archivos FASTQ crudos **no se incluyen** en el repositorio por su tamaño; ver [`data/raw/README.md`](data/raw/README.md) para instrucciones de descarga.
- Todos los scripts están numerados en orden de ejecución.

---

## 📋 Datos

- **Organismo:** *Homo sapiens*
- **Tipo de muestra:** Monocitos de sangre periférica diferenciados a macrófagos con GM-CSF
- **Tipo de experimento:** RNA-seq bulk
- **Acceso a datos crudos:** *(Agregar número de acceso SRA/GEO cuando estén disponibles)*

---

## 👩‍🔬 Autor

**Marval96** — Maestría en Ciencias, UIVC-HIMFG  
*(Agregar correo institucional o ORCID)*

---

## 📄 Licencia

Este repositorio se distribuye bajo la licencia [LICENSE](LICENSE).
