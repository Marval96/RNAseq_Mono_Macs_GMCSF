#!/bin/bash
# run_featurecounts.sh
# Genera la matriz de conteos crudos usando featureCounts
#
# Uso: bash scripts/03_quantification/run_featurecounts.sh
# Requisitos: subread (featureCounts) en el PATH (ver envs/environment.yml)

set -euo pipefail

BAM_DIR="data/processed/alignments"
GTF="data/reference/annotation.gtf"
OUT_DIR="data/processed"
THREADS=8

mkdir -p "${OUT_DIR}"

# Lista de BAMs
BAMS=$(ls "${BAM_DIR}"/*_Aligned.sortedByCoord.out.bam)

echo "=== Ejecutando featureCounts ==="
featureCounts \
    -T "${THREADS}" \
    -p \
    -a "${GTF}" \
    -o "${OUT_DIR}/counts_matrix.txt" \
    ${BAMS}

echo "Cuantificación completada. Matriz de conteos: ${OUT_DIR}/counts_matrix.txt"
