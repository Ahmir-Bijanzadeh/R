#day 7
library(tidyverse)
m.spc = lm(data=iris, formula = Petal.Length~Petal.Width +Species)#species is a categorical var
m.spc
summary(m.spc)

library(modelr)
iris = iris %>% add_predictions(m.spc)
iris
ggplot(data = iris) + geom_point(mapping = aes(y = Petal.Length, x = Petal.Width,color=Species)) + geom_line(mapping = aes(x=Petal.Width, y=pred ,color = Species),size=2)
#the equation will look like this: petalLength = 1.211+1.019*petal.Width + 1.698*speciesversicolor + 2.277*speciesvirginica
#if species == "setosa" Petal.Length = 1.211+1.019*petal.Width 
#if species == "versicolor" Petal.Length = 1.211+1.019*petal.Width + 1.698
#if species == "virginica" Petal.Length = 1.211+1.019*petal.Width + 2.277


data = data.frame(sem = c("Freshman", "Soph", "Junior", "Senior"))
model.matrix(~ sem - 1, data = data)

auto=read_csv("C:/Users/ahmir/OneDrive/Desktop/375/code/autompg.csv")
auto = auto %>% mutate(cylinders= as.factor(cylinders)) #coerce the cylinders to be a factor rather than a double
#alt method = autompg$cylinders <- asfactor(autompg$cylinders)
auto
mod_displ_cyl = lm(mpg~displacement + cylinders, data=auto)
mod_displ_cyl
summary(mod_displ_cyl)

auto = auto %>% add_predictions(mod_displ_cyl)


#formula mpg = 24.434454 - 0.053579(displacement) + 10.735065(cylinders4) + 10.701120(cylinders5) + 7.239065(cylinders6) + 9.013815(cylinders8)
ggplot(data = auto) + geom_point(mapping = aes(y = mpg, x = displacement,color=cylinders)) + geom_line(mapping = aes(x=displacement, y=pred,color=cylinders))


###
vect = c(5,0,-1)
vect2 = c(7,3,5)

(vect-vect2)
sqrt(sum((vect-vect2)^2))
