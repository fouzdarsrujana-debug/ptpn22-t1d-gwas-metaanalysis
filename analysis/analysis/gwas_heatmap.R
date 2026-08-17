# Multi-trait GWAS heatmap: pleiotropic landscape of PTPN22 variants
library(dplyr)
library(stringr)
library(ComplexHeatmap)
library(circlize)

# Clean and filter to handle duplicates and overlap
# Threshold of 7.3 (approx p < 5e-8) keeps only significant hits
plot_data <- df %>%
  filter(PVALUE_MLOG > 7.3) %>%
  group_by(`DISEASE.TRAIT`, SNPS) %>%
  summarize(PVALUE_MLOG = max(PVALUE_MLOG, na.rm = TRUE), .groups = "drop") %>%
  mutate(`DISEASE.TRAIT` = str_trunc(`DISEASE.TRAIT`, 45))

# Pivot data into a matrix
pivot_df <- plot_data %>%
  pivot_wider(names_from = SNPS, values_from = PVALUE_MLOG, values_fill = 0)
mat <- as.matrix(pivot_df[,-1])
rownames(mat) <- pivot_df[[1]]

# Aesthetic parameters
col_fun <- colorRamp2(c(0, 10, max(mat)), c("#f7fbff", "#6baed6", "#08306b"))
dynamic_height <- max(8, nrow(mat) * 0.22)

# Create heatmap
ht <- Heatmap(mat,
              name = "-log10(p)",
              col = col_fun,
              row_names_gp = gpar(fontsize = 8, fontface = "italic"),
              column_names_gp = gpar(fontsize = 8),
              column_names_rot = 45)
