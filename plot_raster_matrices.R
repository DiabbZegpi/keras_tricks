# Visualize raster objects with ggplot
# Train data was obtain from keras::dataset_mnist()
# The train_data object is an array of 3 dimensions:
# (sample, width, height)

library(ggplot2)
library(reshape)

# 1st create an empty dataframe
results <- data.frame(matrix(ncol = 4, nrow = 0)) 
colnames(results) <- c('x', 'y', 'value', 'img')

# 2nd save the images in matrices and append them to results
for (i in 1:16) {
  mymatrix <- train_data[i,,]
  mymatrix <- t(apply(mymatrix, 2, rev)) # rotates the image 90 degrees
  dimnames(mymatrix) <- list(x = 1:28, y = 1:28)
  df <- melt(mymatrix)
  df$img = as.character(i)
  results <- rbind(results, df)
}

# 3rd use geom_raster and ggplot. Voilà!
ggplot(results, aes(x, y, fill = value)) +
  geom_raster(show.legend = FALSE) +
  scale_fill_gradient(low = '#000000', high = '#FFFFFF') +
  theme_void() + 
  facet_wrap(~sort(img), ncol = 4, nrow = 4) +
  theme(strip.background = element_blank(),
        strip.text = element_blank())