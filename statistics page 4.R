library(readr)
dat <- read_csv("C:/Users/ahmir/OneDrive/Desktop/mlb09.csv")

dat

x=dat$at_bats 

y=dat$runs

plot(x, y)

r=cor(x, y) ; r  # correlation
xbar=mean(x) ; xbar

sx=sd(x) ; sx

ybar=mean(y) ; ybar

sy=sd(y) ;sy
b1=r*sy/sx ; b1 # slope
b0=ybar-b1*xbar ; b0   # y-intercept
model=lm(y~x)
model


