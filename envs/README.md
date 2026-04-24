# envs — Entornos de software

Esta carpeta contiene los archivos necesarios para reproducir el entorno computacional completo del análisis.

## Archivos

| Archivo | Descripción |
|---------|-------------|
| `environment.yml` | Entorno conda con todas las herramientas de línea de comandos |
| `install_R_packages.R` | Script para instalar paquetes de R/Bioconductor |

## Instalación

### 1. Crear el entorno conda

```bash
# Instalar Conda/Miniconda si no lo tienes:
# https://docs.conda.io/en/latest/miniconda.html

# Crear el entorno
conda env create -f envs/environment.yml

# Activar el entorno
conda activate rnaseq_gmcsf
```

### 2. Instalar paquetes de R

```bash
# Con el entorno conda activo (o con tu instalación de R >= 4.3):
Rscript envs/install_R_packages.R
```

## Versiones de software

| Software | Versión | Propósito |
|----------|---------|-----------|
| FastQC | 0.12.1 | Control de calidad |
| MultiQC | 1.21 | Reporte QC consolidado |
| STAR | 2.7.11a | Alineamiento |
| featureCounts | 2.0.6 | Cuantificación |
| Salmon | 1.10.3 | Cuantificación quasi-mapping |
| R | >= 4.3 | Análisis estadístico |
| DESeq2 | Bioconductor | Expresión diferencial |
