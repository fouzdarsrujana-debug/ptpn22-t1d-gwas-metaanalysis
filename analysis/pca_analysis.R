# PCA of trait-SNP association matrix
# Note: excerpted from the full analysis pipeline (see report for complete workflow)

# Select numeric columns only
num_data <- data[, sapply(data, is.numeric)]
num_data <- scale(num_data)

pca <- prcomp(num_data, center = TRUE, scale. = TRUE)
summary(pca)

plot(pca, type = "l", main = "Scree Plot")
plot(pca$x[,1], pca$x[,2],
     xlab = "PC1", ylab = "PC2",
     main = "PCA Plot")

library(ggplot2)
pca_df <- as.data.frame(pca$x)

ggplot(pca_df, aes(x = PC1, y = PC2)) +
  geom_point(size = 3, color = "blue") +
  theme_minimal()
