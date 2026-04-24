#!/bin/bash
# run_multiqc.sh
# Genera un reporte MultiQC consolidado a partir de los resultados de FastQC
#
# Uso: bash scripts/01_quality_control/run_multiqc.sh
# Requisitos: multiqc en el PATH (ver envs/environment.yml)

set -euo pipefail

FASTQC_DIR="results/reports/fastqc"
OUT_DIR="results/reports/multiqc"

mkdir -p "${OUT_DIR}"

echo "=== Ejecutando MultiQC ==="
multiqc \
    "${FASTQC_DIR}" \
    --outdir "${OUT_DIR}" \
    --filename "multiqc_report.html"

echo "MultiQC completado. Reporte en: ${OUT_DIR}/multiqc_report.html"
