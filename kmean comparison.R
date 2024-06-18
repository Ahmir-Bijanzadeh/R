#k mean convergence
#kmeans(x,centers=k)
#x=data in mx Form
#centers = number of clusters
library(tidyverse)

irismeans = kmeans(iris[,3:4],centers = 3)
irismeans
irismeans$centers

#classwork

km = kmeans(iris[,1:4],centers = 3,nstart = 20000)
km$centers
ggplot(data=iris) + geom_point(mapping = aes(x=Petal.Width,y=Petal.Length, color=Species))+ geom_point(data=km$centers, mapping = aes(x=Petal.Width,y=Petal.Length), color ="red", size = 3)

km$cluster
iris$Species
table(iris$Species, km$cluster)

#testing with lower nstart vals to try and force a bad result:
km = kmeans(iris[,1:4],centers = 3, nstart = 1)
table(iris$Species, km$cluster)
