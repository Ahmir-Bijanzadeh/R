help(mean)
?mean
2+5
log(10)
a=20 #for writing in console a <- 20
a
exp(a)
1<5

a[1]
sum(a)
sum(cee)
#sum(c) works when c is written alone (only in console)
1:5
a[1:2]
d<-c(10,20,30)
seq(1,10)
1:10
sum(d)


#classroom excercise my version

a=(1:100)
mean(a)
cee=c(1,2,5)
mean(cee)
mag = sqrt((cee[1]^2)+(cee[2]^2)+(cee[3]^2))
mag
norml=cee[1:3]/mag
norml
normag=(norml[1]^2)+(norml[2]^2)+(norml[3]^2)
normag

#notes day 2
mydata=c(10,20,30,40,50,60,77,33,56,34,123)
mydata
mydata>50
which(mydata>50)
mydata[c(1,5,7)]

DF=data.frame(localisation = c("proximal","distal","proximal"), tumorsize = c(6.3,8.0,10.0),progress=c(FALSE,TRUE,FALSE))
DF
DF[1,2]#whats in location row1,col2
DF[1,2:3]#first row 2nd and 3rd col
DF[1:2,2]#First two rows 2nd col
DF[1:2,2:3]#first 2 rows and 2nd+3rd col
DF[1,]#whole first row
DF[,1]#whole first col
DF$tumorsize #lookup by name
DF[,"tumorsize"] #alt way

#classwork day 2
iris
iris$Sepal.Length>7.6 
big=max(iris$Sepal.Length)
big
meen=mean(iris$Sepal.Length)
meen
levels(iris$Species)
iris[1:10,]
iris$Sepal.Length

which(iris$Sepal.Length>3.0)
which(iris$Species == "setosa")
iris[iris$Species == "setosa",]
which(iris$Species == "setosa" & iris$Sepal.Length>3.0)
which(iris$Sepal.Length==max(iris$Sepal.Length))
iris[iris$Sepal.Length==max(iris$Sepal.Length),5]

x=iris$Sepal.Length
y=iris$Sepal.Width
plot(x,y)

library(ggplot2)
ggplot(data = iris) + geom_point(aes(x =Sepal.Length, y =Sepal.Width), color="red")

ggplot(data = iris) + geom_point(mapping=aes(x =Sepal.Length, y =Sepal.Width ,color=Species)
ggplot(data = iris) + geom_point(mapping=aes(x=Sepal.Length, y=Sepal.Width)) + facet_wrap(~Species)
ggplot(data = iris) + geom_histogram(aes(x=Sepal.Length)) + geom_histogram(binwidth = 30)


ggplot(data=iris)+geom_point(mapping=aes(x=Sepal.Length,y=Sepal.Width,color=Species))

airquality

#day 3 
ggplot(data = iris) + geom_point(aes(x =Sepal.Length, y =Sepal.Width), color="red")+labs(x="Sepal Length", y="Sepal Width", title="My plot") + xlim(c(1,10))+ ylim(c(1,10))+theme_dark()
summary(iris)
summary(airquality)
which(is.na(airquality$Solar.R))
sum(is.na(airquality$Solar.R))


ggplot(data=iris)+geom_histogram(mapping=aes(x=Sepal.Length), binwidth = 0.1)


nombers=c(8, 11, 36, 17, 25, 24, 1, 20, 60)
nombers
sort(nombers)
median(nombers)
IQR(nombers)
quantile(nombers)
fivenum(nombers)
25+IQR(nombers)*1.5 #anything above this value is an outlier
11-IQR(nombers)*1.5 #anything below this value is an outlier

iris
ggplot(data=data.frame(myvar=nombers))+geom_boxplot(mapping=aes(y=myvar))

ggplot(data=iris)+geom_boxplot(mapping=aes(y=iris$Sepal.Length))

ggplot(data=iris)+geom_bar(mapping=aes(x=Sepal.Length,fill=Species))

ggplot(data = esoph) + geom_point(aes(x =ncases, y =ncontrols))+facet_grid(esoph$alcgp)+labs(x="Number of Cases", y="Number of Controls", title="Cases and Controls Organized by Age Group")

help("esoph")

airquality
quantile(airquality)
sum(airquality)
levels(airquality)
ggplot(data=airquality)+geom_boxplot(mapping=aes(y=Day))
fivenum(airquality)
fivenum(airquality$Solar.R)
IQR(airquality$Solar.R)
115-IQR(airquality$Solar.R)*1.5
259+IQR(airquality$Solar.R)*1.5
months=as.factor(airquality$Month)
ggplot(data=airquality)+geom_bar(mapping=aes(x=Temp,fill=months))

#day4
mean(which(iris$Sepal.Length>3.0))
which(iris$Sepal.Length>3.0) & which(iris$Sepal.Width>3.0)
mean(iris$Sepal.Length)
mean()
library(tidyverse)

#filter
filter(mpg, cty>27)
filter(mpg, cty>27 & hwy>40)
filter(mpg, cty>27 , hwy>40) 
filter(mpg, manufacturer == "honda" | manufacturer == "toyota")
filter(mpg, manufacturer == "honda" | manufacturer == "toyota" | manufacturer == "audi")
filter(mpg, manufacturer %in% c("honda", "audi", "toyota"))

#select
select(mpg, manufacturer)
select(mpg, manufacturer, model)
select(mpg, 1,3,4) #by col num
select(mpg, 1:3)
select(mpg, -manufacturer) #all col except these
select(mpg, -manufacturer,-model)
select(mpg, contains("del")) #column contains part of this
select(filter(mpg, cty>27), manufacturer, model)

#pipeline
# %>% data pipeline operator
filter(mpg, cty>27) %>% select(manufacturer, model)
mpg %>% filter(cty>27) %>% select(manufacturer, model)
#combining functions together



iris %>% filter(Petal.Length>3.0) %>% filter(Petal.Width>1.0) %>% select(Sepal.Length,Sepal.Width)
iris %>% select(Sepal.Length,Sepal.Width) %>% filter(Petal.Length>3.0) %>% filter(Petal.Width>1.0) #errors out because youve removed the petal len/wid from the data!


#arrange
mpg %>% arrange(cty)
mpg %>% arrange(class, hwy) #sort by cond 1 first, tiebreakers decided by cond 2
mpg %>% arrange(-cty)# reverse order (biggest first)
mpg %>% arrange(desc(manufacturer)) #cant use - to go reverse alphabetical, strings dont work, have to use the descending funct

#classwork
mpg %>% arrange(-cty) %>% select(manufacturer,cty,hwy) 
mpg %>% arrange(-cty) %>% filter(manufacturer == "audi") %>% select(manufacturer,cty,hwy) 
mpg %>% arrange(-cty) %>% filter(manufacturer == "honda",cty>25) %>% select(model) 
mpg %>% select(manufacturer, cty) %>% arrange(cty)
#ctr+shft+m = %>% 

#mutate
mpg %>% view
mpg %>% mutate(average=(cty+hwy)/2) %>% view
# use defining mpg= or mpg<- to permanently modify

#summarise
mpg %>% summarise(mean(cty))#outputs a table with 1 row and 1 col with the answr inside
mpg %>% summarise(avg=mean(cty))
mpg %>% summarise(avg=mean(cty), maxymum=max(cty))
mpg %>% summarise(n()) #just straight up count em

#group by
mpg %>% group_by(manufacturer) %>% view()
mpg %>% group_by(manufacturer) %>% summarise(mean(cty))  #one answer for each subgroup
mpg %>% group_by(year)
mpg %>% group_by(year) %>% summarise(mean(cty)) 
mpg %>% group_by(manufacturer, year) %>% summarise(mean(cty)) 
mpg %>% group_by(year,manufacturer) %>% summarise(mean(cty))

#original classwork
iris %>% filter(Petal.Length>3.0) %>% summarise(mean(Sepal.Length),mean(Sepal.Width))
iris %>% filter(Species=="setosa") %>% summarise(mean(Sepal.Length),mean(Sepal.Width))
iris %>% group_by(Species) %>% summarise(mean(Sepal.Length),mean(Sepal.Width))


install.packages("nycflights13")
library(nycflights13)

str(flights)

flights %>% filter(month==2,day==12,year==2013)
flights %>% filter(dep_delay>2.0 & arr_delay>2.0)
flights %>% filter(dep_delay>2.0 | arr_delay>2.0)
flights %>% filter(carrier %in% c("AA","D","UA"))
flights %>% arrange(air_time)
flights %>% arrange(-air_time)

flights %>% arrange(-air_time) %>% select(origin,dest) 
flights %>% mutate(totalDelay=(dep_delay+arr_delay)) %>% select(totalDelay)

flights %>% mutate(totalDelay=(dep_delay+arr_delay)) %>% arrange(-totalDelay) %>%  select(origin,dest)

flights %>% mutate(totalDelay=(dep_delay+arr_delay)) %>% arrange(-totalDelay) %>%  select(origin,dest)


#day 5

#slice
mpg %>% slice(c(1,2,7))
mpg %>% arrange(desc(cty)) %>% slice(1:5)

#classwork
mpg %>% group_by(manufacturer) %>% summarise(mean(cty)) %>% arrange(-`mean(cty)`) %>% slice(1:3)

#joins
band_members
band_instruments
band_members %>% inner_join(band_instruments)
band_members %>% left_join(band_instruments)
band_members %>% right_join(band_instruments)
band_members %>% full_join(band_instruments)

band_members_4rows = band_members %>% add_row(name="Paul", band="Wings")
band_instruments_4rows = band_instruments %>% add_row(name="Paul", plays="Vocals")
band_members_4rows
band_instruments_4rows


band_members_4rows %>% inner_join(band_instruments_4rows)
band_members_4rows %>% left_join(band_instruments_4rows)
band_members_4rows %>% right_join(band_instruments_4rows)
band_members_4rows %>% full_join(band_instruments_4rows)

#filter joins
#tables that REMOVE entries based on what entries appear in the second table
band_members %>% semi_join(band_instruments)
band_members %>% anti_join(band_instruments) #keep the rows that DONT match



airquality %>% summarise(mean(Ozone))
airquality %>% filter(is.na(Ozone))%>% summarise(mean(Ozone))

view(relig_income)
relig_income %>% pivot_longer(cols=-religion,names_to = "income",values_to = "freq")

table4a %>% pivot_longer(cols=2:3,names_to = "year",values_to = "cases")


grades = tibble(CWID=c(1234567, 2356902, 5005667), NAME=c("Mary", "Lee", "Elena"), CPSC120=c(3,4,NA), CPSC121=c(3.3,3,2), CPSC131=c(3,4,3.7), MATH338=c(3,NA,3.3))
grades
grades %>% pivot_longer( cols=3:6, names_to = "Class", values_to = 'GPA', values_drop_na = TRUE)
grades %>% pivot_longer( -c(1:2), names_to = "Class", values_to = 'GPA', values_drop_na = TRUE) #alt way of specifying the cols

#day 6

library(tidyverse)
data = read_csv("C:/Users/ahmir/OneDrive/Desktop/375/language_diversity.csv")
data
view(data)
data %>% pivot_wider(names_from = Measurement, values_from = Value)
data %>% pivot_wider(names_from = Measurement, values_from = Value) %>% group_by(Continent) %>% summarise(sum(Langs))
data %>% pivot_wider(names_from = Measurement, values_from = Value) %>% mutate(density=(Population/Area)) %>% view()

table3  %>% separate(rate, into = c("option1", "option2"))
#something like a single name column seperated out into first and last name, birthdays (day/month/year)

billboard


ggplot(data=iris) + geom_point(aes(x =Petal.Width, y =Petal.Length), color="blue")+ geom_abline(aes(slope = 2.6, intercept = 0.8), color="red")

ggplot(data = iris) + geom_point(aes(x = Petal.Width, y = Petal.Length)) + geom_abline(slope = 2.6, intercept = 0.8)

model=lm(data= iris, Petal.Length~Petal.Width)
#gives the optimal y int and slope for the two data pts
model
ggplot(data=iris) + geom_point(aes(x =Petal.Width, y =Petal.Length), color="blue")+ geom_abline(aes(slope = 2.23, intercept = 1.08), color="red")#manually added the vals

summary(model)
iris
ggplot(data=iris) + geom_point(aes(x =Petal.Width, y =Petal.Length)+ geom_abline(aes(slope =coef(model)[2], intercept = coef(model)[1])
ggplot(data = iris) + geom_point(aes(x = Petal.Width, y = Petal.Length)) + geom_abline(slope = coef(model)[2], intercept = coef(model)[1])
                                                                                 

data2 = read_csv("C:/Users/ahmir/OneDrive/Desktop/375/autompg.csv")
data2

model2=lm(data = data2,mpg~displacement)
model2

ggplot(data=data2) + geom_point(aes(x =displacement , y =mpg))+ geom_abline(slope = coef(model2)[2], intercept = coef(model2)[1], color = "red")
billboard


library(modelr)
iris %>% add_residuals(model)
iris <- iris %>% add_residuals(model)
ggplot(data=iris) + geom_histogram(mapping=aes(x=resid))

#outliers
rstandard(model)
iris <- iris %>% mutate(rstd=rstandard(model))
irisOutlier <- iris %>% filter(abs(rstd)>2)
ggplot(data = iris) + geom_point(aes(x = Petal.Width, y = Petal.Length)) + geom_abline(slope = coef(model)[2], intercept = coef(model)[1])+ geom_point(data=irisOutlier,aes(x = Petal.Width, y = Petal.Length),color="red")

#predictions

predx <- data.frame(Petal.Width=c(1,2,3,4,5)) #manually entered in
predx
predict(model,predx)
predict(model,predx, interval="prediction")#show the lower and upper bounds
predict(model,predx, interval="confidence") %>% as.data.frame() %>% mutate(upr-lwr)


petals <- lm(data=iris, Petal.Width~Petal.Length+Sepal.Length) 
#the equation will look like y=mx+b as petalWidth=.44(PL) -.082(SL) -.0089
summary(petals)
summary(model)
petals2 <- lm(data=iris, Petal.Width~Petal.Length+Sepal.Length+Sepal.Width) 
summary(petals2)
#test with a bad data set
iris %>% mutate(x=runif(150))
petals3 <- lm(data=iris, Petal.Width~Petal.Length+Sepal.Length+Sepal.Width+x) 
summary(petals3)