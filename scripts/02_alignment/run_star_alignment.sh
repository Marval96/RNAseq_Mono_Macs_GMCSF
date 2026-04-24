#!/bin/bash
# run_star_alignment.sh
# Alinea todas las muestras al genoma de referencia usando STAR
#
# Uso: bash scripts/02_alignment/run_star_alignment.sh
# Requisitos: STAR, samtools en el PATH (ver envs/environment.yml)
# Prerequisito: índice de STAR construido con build_star_index.sh

set -euo pipefail

STAR_INDEX="data/reference/star_index"
RAW_DIR="data/raw"
OUT_DIR="data/processed/alignments"
THREADS=8

mkdir -p "${OUT_DIR}"

# Obtener lista de muestras (sin extensión _R1.fastq.gz)
SAMPLES=$(ls "${RAW_DIR}"/*_R1.fastq.gz | sed 's|.*/||; s|_R1.fastq.gz||')

echo "=== Iniciando alineamiento con STAR ==="

for SAMPLE in ${SAMPLES}; do
    echo "--- Procesando: ${SAMPLE} ---"

    STAR \
        --runThreadN "${THREADS}" \
        --genomeDir "${STAR_INDEX}" \
        --readFilesIn "${RAW_DIR}/${SAMPLE}_R1.fastq.gz" "${RAW_DIR}/${SAMPLE}_R2.fastq.gz" \
        --readFilesCommand zcat \
        --outSAMtype BAM SortedByCoordinate \
        --outSAMattributes NH HI AS NM MD \
        --outFileNamePrefix "${OUT_DIR}/${SAMPLE}_" \
        --quantMode GeneCounts \
        --outReadsUnmapped Fastx

    # Indexar BAM
    samtools index "${OUT_DIR}/${SAMPLE}_Aligned.sortedByCoord.out.bam"

    echo "    Completado: ${SAMPLE}"
done

echo "=== Alineamiento completado. Resultados en: ${OUT_DIR} ==="
