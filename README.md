# In Silico Characterization of PTPN22 Genetic Architecture through R-Based Association Mapping

## Overview
A computational meta-analysis investigating the association between the PTPN22 rs2476601 
(C1858T, R620W) variant and Type 1 Diabetes (T1D) susceptibility, conducted using publicly 
available GWAS summary statistics.

## Question
Does the PTPN22 rs2476601 variant show a consistent, statistically robust association with 
T1D risk across independent GWAS studies, and how does this association vary by ancestry?

## Data Source
NHGRI-EBI GWAS Catalog (queried via `gwasrapidd`), dbSNP, and 1000 Genomes Project Phase 3 
(via Ensembl) — 39 independent studies, ~40,000 individuals.

## Methods
- Meta-analysis: random-effects model (DerSimonian-Laird estimator), `metafor`
- Genetic models tested: allelic, genotypic, dominant, recessive
- Heterogeneity: I², τ²; publication bias assessed via Begg's funnel plot, Egger's regression
- Visualization: `ggplot2`, `ComplexHeatmap`, `fmsb`, base R `stats::prcomp` for PCA
- Full tool list and versions in the report (Methodology section, Table 4)

## Key Findings
- Pooled OR: 1.7–1.83 for the minor T allele across the allelic contrast model
- Significant across all inheritance models tested (P < 0.05)
- No significant publication bias detected (Begg's funnel plot)
- Strongest effect and highest MAF (8–12%) in European populations; more modest associations 
  in North Indian/Pakistani cohorts — highlighting a research gap in South Asian ancestry data

## Limitations
Conducted entirely on public summary statistics (no raw genotype-level data); substantial 
between-study heterogeneity (I² > 74%); South Asian ancestry underrepresented in source data.

## Repository Contents
- `/analysis` — key R analysis snippets (PCA, QQ plot, SNP frequency, heatmap generation)
- `/report` — full project report (PDF)

## Full Report
See `/report` for the complete write-up including background, methodology, discussion, and references.
