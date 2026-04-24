#!/bin/bash
# run_fastqc.sh
# Ejecuta FastQC en todos los archivos FASTQ del directorio de datos crudos
#
# Uso: bash scripts/01_quality_control/run_fastqc.sh
# Requisitos: fastqc en el PATH (ver envs/environment.yml)

set -euo pipefail

RAW_DIR="data/raw"
OUT_DIR="results/reports/fastqc"
THREADS=4

mkdir -p "${OUT_DIR}"

echo "=== Ejecutando FastQC ==="
fastqc \
    --outdir "${OUT_DIR}" \
    --threads "${THREADS}" \
    "${RAW_DIR}"/*.fastq.gz

echo "FastQC completado. Resultados en: ${OUT_DIR}"
