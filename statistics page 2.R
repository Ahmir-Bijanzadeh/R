#chapter 8
#scatter plot stuff (slide 8.16)

x=c(2521,2555,2735,2846,3028,3049,3198,3198) #all the x values
y=c(400,426,428,435,469,475,488,455) #all the y values

#calc xbar and ybar (the averages for the vectors above)
#mean(x)
#mean(y)

#alternatve way to print things
xbar=mean(x)
ybar=mean(y)
xbar
ybar

#calc the standard dev 
#sd(x)
#sd(y)

#calc error with formula in mind
sx=sd(x)
sy=sd(y)
sx
sy

#correlation check (should give a number between -1 and 1)
r=cor(x,y)
r

#find the slope
b1=r*(sy/sx)
b1

#find the y intercept
b0=ybar-b1*xbar
b0

#print the thing
model=lm(y~x)
model


