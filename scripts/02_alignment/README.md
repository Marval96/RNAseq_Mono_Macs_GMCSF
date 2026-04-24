# scripts/02_alignment — Alineamiento al genoma de referencia

Scripts para alinear las lecturas procesadas al genoma de referencia humano.

## Herramientas

- **STAR** (recomendado) o **HISAT2**
- Genoma de referencia: GRCh38 (hg38)
- Anotación: Ensembl / GENCODE

## Scripts

| Script | Descripción |
|--------|-------------|
| `build_star_index.sh` | Construye el índice de STAR (se hace una sola vez) |
| `run_star_alignment.sh` | Alinea todas las muestras con STAR |

## Cómo ejecutar

```bash
# 1. Construir índice (solo la primera vez, requiere el FASTA del genoma y GTF)
bash scripts/02_alignment/build_star_index.sh

# 2. Alinear
bash scripts/02_alignment/run_star_alignment.sh
```

## Salidas

Archivos BAM ordenados e indexados en `data/processed/alignments/`.

> ⚠️ Los archivos BAM no se almacenan en el repositorio (son muy pesados). Se regeneran ejecutando estos scripts.
