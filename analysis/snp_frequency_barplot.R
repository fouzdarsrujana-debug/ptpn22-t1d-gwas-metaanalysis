# SNP frequency distribution by chromosomal position
library(ggplot2)

plot <- ggplot(chr_freq, aes(x = as.factor(CHR_POS), y = Frequency)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(title = "SNP Frequency by CHR_POS",
       x = "CHR_POS",
       y = "Frequency")

print(plot)
