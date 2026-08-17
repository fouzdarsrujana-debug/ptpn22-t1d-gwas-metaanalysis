# QQ plot for assessing statistical enrichment of GWAS p-values
library(ggplot2)

qq_data <- data.frame(expected, observed)

qq_plot <- ggplot(qq_data, aes(x = expected, y = observed)) +
  geom_point(size = 1.5, alpha = 0.6, color = "#2C7FB8") +
  geom_abline(intercept = 0, slope = 1,
              color = "red", linetype = "dashed") +
  labs(
    title = "QQ Plot of GWAS P-values",
    x = "Expected -log10(P)",
    y = "Observed -log10(P)"
  ) +
  theme_minimal(base_size = 14) +
  theme(plot.title = element_text(face = "bold", hjust = 0.5))
