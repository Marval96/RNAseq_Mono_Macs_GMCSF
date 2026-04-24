# scripts/01_quality_control — Control de calidad

Scripts para evaluar la calidad de las lecturas crudas antes del alineamiento.

## Herramientas

- **FastQC**: Análisis de calidad por muestra
- **MultiQC**: Reporte consolidado de todas las muestras

## Scripts

| Script | Descripción |
|--------|-------------|
| `run_fastqc.sh` | Ejecuta FastQC en todos los FASTQs |
| `run_multiqc.sh` | Genera reporte MultiQC agregado |

## Cómo ejecutar

```bash
# 1. Control de calidad individual
bash scripts/01_quality_control/run_fastqc.sh

# 2. Reporte consolidado
bash scripts/01_quality_control/run_multiqc.sh
```

## Salidas

Los reportes se guardan en `results/reports/`.
