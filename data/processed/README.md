# data/processed — Datos procesados

Esta carpeta contiene los archivos generados durante el procesamiento de los datos crudos que son suficientemente pequeños para almacenar en el repositorio.

## Contenido esperado

| Archivo / Carpeta | Descripción | Generado por |
|-------------------|-------------|--------------|
| `counts_matrix.csv` | Matriz de conteos crudos (genes × muestras) | featureCounts / HTSeq |
| `normalized_counts.csv` | Conteos normalizados (TPM / CPM / VST) | DESeq2 / edgeR |
| `DEGs_results.csv` | Tabla de genes diferencialmente expresados | DESeq2 |
| `salmon_quant/` | Cuantificación por Salmon (uno por muestra) | Salmon |

## ⚠️ Nota

Archivos muy pesados (BAM, índices del genoma) no se almacenan aquí. Consulta los scripts en `scripts/02_alignment/` para regenerarlos.
