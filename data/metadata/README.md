# data/metadata — Metadatos del experimento

Esta carpeta contiene la información que describe el diseño experimental y las muestras. Es fundamental para el análisis de expresión diferencial.

## Archivos

### `sample_info.csv`
Tabla con la información de cada muestra. Debe contener al menos:

| Columna | Descripción |
|---------|-------------|
| `sample_id` | Identificador único de la muestra (debe coincidir con los nombres de los FASTQ) |
| `condition` | Condición experimental (ej. `monocyte`, `macrophage`) |
| `replicate` | Número de réplica biológica |
| `batch` | Lote de extracción / secuenciación (si aplica) |
| `time_point` | Tiempo de diferenciación en días (si aplica) |

### `experimental_design.md`
Descripción detallada del protocolo experimental:
- Origen de las células (donantes, buffy coat, etc.)
- Protocolo de diferenciación (dosis de GM-CSF, duración)
- Extracción de RNA (kit, integridad RIN)
- Librería y secuenciación (paired-end/single-end, profundidad)
