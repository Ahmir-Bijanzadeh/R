library(readr)
dat <- read_csv("C:/Users/ahmir/OneDrive/Desktop/mlb09.csv")

dat

ncol(dat)

nrow(dat)
head(dat)

x=dat$at_bats

y=dat$runs

plot(x, y)
cor(x, y)
round(cor(x, y),4)
model = lm(y~x)

model    #This gives you the slope and intercept directly

summary(model)   # This gives you the slope, intercept, and more information about them 


qt(.005,199,lower.tail = T)
pt(1.32,199,lower.tail=F)*2


dat=c(7,18,35,40,55,62,85)
fivenum(dat)

pnorm(-1.164,lower.tail = T)
pchisq(4.3625,3,lower.tail=F)
       