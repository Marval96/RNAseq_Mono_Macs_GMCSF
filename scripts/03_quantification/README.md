# scripts/03_quantification — Cuantificación de expresión génica

Scripts para generar la matriz de conteos a partir de los archivos BAM alineados.

## Herramientas

- **featureCounts** (subLread) — cuantificación rápida desde BAMs
- **Salmon** (alternativa) — cuantificación quasi-mapping desde FASTQs

## Scripts

| Script | Descripción |
|--------|-------------|
| `run_featurecounts.sh` | Genera matriz de conteos con featureCounts |
| `run_salmon.sh` | Cuantificación con Salmon (alternativa) |

## Cómo ejecutar

```bash
bash scripts/03_quantification/run_featurecounts.sh
```

## Salidas

- `data/processed/counts_matrix.txt` — matriz de conteos crudos (genes × muestras)
