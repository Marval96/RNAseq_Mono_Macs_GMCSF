# Análisis Transcriptómico de la Diferenciación Monocito-Macrófago inducida por GM-CSF

> **Tesis de Maestría** — Unidad de Investigación en Virología y Cáncer (UIVC), HIMFG

Este repositorio documenta el análisis de RNA-seq de la diferenciación Monocito-Macrófago conducida por el Factor Estimulante de Colonias de Granulocitos y Macrófagos (GM-CSF). Contiene todos los scripts, metadatos esenciales y resultados organizados para garantizar la **reproducibilidad** del análisis y servir como base para la publicación científica derivada de la tesis.

---

## 🗂️ Estructura del repositorio

```
RNAseq_Mono_Macs_GMCSF/
├── data/
│   ├── raw/            # Archivos FASTQ originales — NO se suben a GitHub; ver instrucciones
│   ├── processed/      # Matrices de conteos y archivos intermedios
│   └── metadata/       # Diseño experimental e información de muestras
├── scripts/
│   ├── 01_quality_control/          # FastQC, MultiQC
│   ├── 02_alignment/                # Alineamiento al genoma de referencia (STAR)
│   ├── 03_quantification/           # Cuantificación de expresión (featureCounts / Salmon)
│   ├── 04_differential_expression/  # Expresión diferencial (DESeq2)
│   ├── 05_functional_analysis/      # Análisis funcional (GO, GSEA, vías metabólicas)
│   └── 06_visualization/            # Figuras y visualizaciones adicionales
├── results/
│   ├── figures/        # Todas las figuras generadas
│   ├── tables/         # Tablas de resultados (genes DEGs, enriquecimiento, etc.)
│   └── reports/        # Reportes de control de calidad (MultiQC HTML, etc.)
├── envs/               # Entornos de software reproducibles (conda, R)
└── docs/               # Documentación del flujo de trabajo
```

---

## ⚡ Flujo de análisis

| Paso | Descripción | Herramienta |
|------|-------------|-------------|
| 1 | Control de calidad de lecturas | FastQC + MultiQC |
| 2 | Alineamiento al genoma de referencia | STAR |
| 3 | Cuantificación de expresión génica | featureCounts / Salmon |
| 4 | Análisis de expresión diferencial | DESeq2 (R/Bioconductor) |
| 5 | Análisis funcional y de enriquecimiento | clusterProfiler, GSEA |
| 6 | Visualización | ggplot2, pheatmap, EnhancedVolcano |

---

## 🔁 Reproducibilidad

- Los entornos de software se encuentran en [`envs/`](envs/).
- Los archivos FASTQ crudos **no se incluyen** en el repositorio por su tamaño; consultar [`data/raw/README.md`](data/raw/README.md) para instrucciones de descarga.
- Todos los scripts están numerados en orden de ejecución.
- El flujo completo paso a paso está documentado en [`docs/flujo_de_trabajo.md`](docs/flujo_de_trabajo.md).

---

## 📋 Información del experimento

- **Organismo:** *Homo sapiens*
- **Tipo de muestra:** Monocitos de sangre periférica diferenciados a macrófagos con GM-CSF
- **Tipo de experimento:** RNA-seq bulk (extremos pareados / *paired-end*)
- **Número de acceso a datos crudos:** *(Agregar número de acceso SRA/GEO cuando estén disponibles)*

---

## 👩‍🔬 Autora

**Marval96** — Maestría en Ciencias, UIVC-HIMFG  
*(Agregar correo institucional u ORCID)*

---

## 📄 Licencia

Este repositorio se distribuye bajo la licencia indicada en el archivo [LICENSE](LICENSE).
