# results/reports — Reportes de control de calidad

Esta carpeta almacena los reportes HTML generados durante el control de calidad.

## Contenido

| Archivo / Carpeta | Descripción |
|-------------------|-------------|
| `fastqc/` | Reportes individuales de FastQC por muestra |
| `multiqc/multiqc_report.html` | Reporte consolidado de MultiQC (abrir en navegador) |

## Cómo interpretar MultiQC

El reporte MultiQC resume las métricas clave de calidad de todas las muestras:

- **Per base sequence quality** — calidad por posición de lectura
- **Per sequence GC content** — contenido GC (debe ser ~50% en humano)
- **Sequence duplication levels** — nivel de duplicados (esperado alto en RNA-seq)
- **Adapter content** — presencia de adaptadores (deben ser removidos si >5%)
