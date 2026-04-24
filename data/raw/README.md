# data/raw — Datos crudos (archivos FASTQ)

Esta carpeta contiene (o apunta a) los archivos FASTQ originales generados por el secuenciador.

## ⚠️ Importante

Los archivos FASTQ **NO se almacenan en este repositorio** porque son demasiado pesados (varios GB por muestra). Están excluidos mediante `.gitignore`.

## 📥 Cómo obtener los datos crudos

> *(Completar esta sección cuando los datos estén depositados en un repositorio público)*

### Opción A — Descarga desde SRA (NCBI)
```bash
# Reemplazar SRR_XXXXXXX con los números de acceso reales
fastq-dump --split-files --gzip SRR_XXXXXXX
```

### Opción B — Descarga desde GEO
Número de acceso GEO: `GSEXXXXXXX`  
URL: https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSEXXXXXXX

---

## 📁 Estructura esperada de archivos

```
data/raw/
├── muestra1_R1.fastq.gz
├── muestra1_R2.fastq.gz
├── muestra2_R1.fastq.gz
├── muestra2_R2.fastq.gz
└── ...
```

## 📝 Nomenclatura de muestras

| Nombre de archivo | Condición | Réplica |
|-------------------|-----------|---------|
| *(completar)*     | Monocito  | R1      |
| *(completar)*     | Macrófago | R1      |
