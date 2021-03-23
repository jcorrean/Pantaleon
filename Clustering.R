data("USArrests")
df <- USArrests
# Quitemos cualquier valor perdido en los datos
df <- na.omit(df)
# Vamos a estandarizar los valores de las variables
df <- scale(df)
set.seed(123)
ss <- sample(1:50, 15)
df <- USArrests[ss, ]
df.scaled <- scale(df)
dist.eucl <- dist(df.scaled, method = "euclidean")
round(as.matrix(dist.eucl)[1:3, 1:3], 1)
library("factoextra")
dist.cor <- get_dist(df.scaled, method = "pearson")
library(factoextra)
fviz_dist(dist.eucl)
