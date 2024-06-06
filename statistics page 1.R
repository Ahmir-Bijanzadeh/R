S=c(1,2,3,4,5,6)
Prob=c(1/6,1/6,1/6,1/6,1/6,1/6)

Roll.10 = sample(x = S, size = 10, prob = Prob, replace = TRUE)

install.packages('plyr')
library(plyr)
count(Roll.10)

mean(S)

library(discreteRV)
x=RV(outcomes=S,probs=Prob)
E(x)
V(x)
sd(x)

#used for chapter 3 quiz probability for outcomes (tables with data and probability for each)
#data
Q=c(0,1,2,3)
ProbQ=c(.05,0.4,0.35,0.2)
#formula
x=RV(outcomes=Q,probs=ProbQ)
E(x)
V(x)
SD(x)




#CHAPTER 4

#lower tail is stuff to the left (on by default)
#pnorm(z<1.64)
pnorm(1.64)
pnorm(.02,lower.tail = F) #false lower tail to get stuff to the right


#normal distribution subtracting ch4 slide16
#doing the formula plug in
pnorm(70,64.5,2.5,lower.tail = T)-pnorm(68,64.5,2.5,lower.tail = T)
#after already getting the answer
pnorm(2.2,lower.tail = T)-pnorm(1.4,lower.tail = T)



#area to the left of z ch4 slide 17
qnorm(.1,lower.tail = T)
qnorm(.1)



#ch 4 slide 19
qnorm(.2119)#left side (default)
qnorm(.5793,lower.tail = F)#right side
qnorm((1-.9030)/2)#between the two
qnorm((1-.2282)/2)#btwn the 2
#x value = qnorm(z,mu,rho)
qnorm(.07,120,15,lower.tail = F)


#ch4 slide21/22 example
pnorm(10,8.35,2.5,lower.tail = T)-pnorm(5,8.35,2.5,lower.tail = T)
1- pnorm(4,8.35,2.5,lower.tail = T)
qnorm(.02,8.35,2.5,lower.tail = F)#same entry style for qnorm(%,mean,stand/dev)


#ch4.3 probability of binomial distribution
sum(dbinom((3:5),5,.25))

#4.3 slide 11
sum(dbinom((1520:2500),2500,.6))
sum(dbinom((0:3),10,.1))

sum(dbinom((100:23),100,.2)) #range of resutls 
dbinom(23,100,0.2)#single result (x= 23)



sum(dbinom((11:14),14,0.71))
sum(dbinom((110:160),160,0.71))



sum(dbinom((2:10),10,.697))



  
#create a vector with those values
a=c(102,170,106,110,152,143,160,150,161,154)
sd(a)  
mean(a)  
fivenum(a)  






1-pnorm(-.25)


a=c(0,1,2,3,4)
b=c(.03,.07,.25,.3,.35)
library(discreteRV)
x=RV(outcomes=a,probs=b)
E(x)
SD(x)




pnorm(425,375,55,lower.tail = F)
pnorm(350,375,55,lower.tail = T)
pnorm(435,375,55,lower.tail = T) - pnorm(360,375,55,lower.tail = T)
qnorm(.15,375,55,lower.tail = F)


#Chapter 5
#5.10
a1=sample(0:9,100,replace = T)
a1
length((which(a<5)))
  
a2=sample(0:9,100,replace = T)
a2
length((which(a<5)))

#chapter 5 LAB 1
download.file("http://www.openintro.org/stat/data/ames.RData", destfile = "ames.RData")
load("ames.RData")
ncol(ames)  
nrow(ames)
names(ames)
names(ames)[1]
#room assigned to rooms above ground
ames$TotRms.AbvGrd
rooms=ames$TotRms.AbvGrd
mean(rooms)
median(rooms)
hist(rooms) #error if bottom right window is too small
summary(rooms)

#lab day 2
sample(rooms,size=75)
set.seed(1) #set the probability to a set outcome (match classmates)
samp1=sample(rooms,size = 75)
p_hat=length((which(samp1>6))) / length(samp1) # proportion of rooms>6 in sample
p_hat # print phat
std_err = sqrt(p_hat*(1-p_hat)/length(samp1)) #baiscally just the math operation for standar error
std_err #print standard error
z_star = qnorm(p = .975) #find the value for the Z refer to 5.28
z_star #print z star
lb = p_hat - z_star*std_err #lower bound of the interval
ub = p_hat + z_star*std_err #upper bound of the interval
c(lb,ub) #print the lower and upper bounds 
p=length((which(rooms>6))) / length(rooms) #find the actual value 
p #print p




#5.28
qnorm(.05)
qnorm(.95)
qnorm(.025)

#lab ch5 
pnorm(1.15,lower.tail = F)
  
pnorm(3.19,lower.tail = F)*2

pnorm(2.146,lower.tail = F)


#chapter 6
#6.11
round(qnorm(.025),2) #round 2 decimals
abs(round(qnorm(.025),2)) #round 2 decimals plus absolute value


#6.27
pchisq(18,4,lower.tail = F,)
#6.31
pchisq(11.208,3,lower.tail = F,)


#ch6 Lab 2
std_err = sqrt(p_hat*(1-p_hat)/length(samp1)) #baiscally just the math operation for standar error
std_err
z_star = qnorm(p = .975) #find the value for the Z refer to 5.28
z_star
lb = p_hat - z_star*std_err #lower bound of the interval
ub = p_hat + z_star*std_err #upper bound of the interval
c(lb,ub) #print the lower and upper bounds 

std_err = sqrt(((.2374*(1-.2374)/438)+(.3149*(1-.3149)/416)))
std_err

x1=104
x2=131
n1=438
n2=416
p1hat=x1/n1
p2hat=x2/n2
p1hatR=round(p1hat,4)
p2hatR=round(p2hat,4)

phat=(x1+x2)/(n1+n2)
phatR=round(phat,4)


se=sqrt(phatR*(1-phatR)*(1/n1+1/n2))
       
z=(p1hatR-p2hatR/se)

(pnorm(-2.5327,lower.tail = T)
  
  
  
#6.41  
pchisq(10.42,2,lower.tail=F)

pchisq(13.5,2,lower.tail=F)

#Ch7 start
pt(-2.1,18,lower.tail = T)
pt(1.65,20,lower.tail = F)
pt(-2.42,30,lower.tail = T)
#pt(q,df,lower.tail = F) t distribution formula

#7.21
qt(.05,29,lower.tail = T) #t distribution for t* value

#7.23
qt(.025,146,lower.tail = T)
pt(-3.066,146,lower.tail = T)*2


#chapter 7 lab
download.file("http://www.openintro.org/stat/data/ames.RData", destfile = "ames.RData")
load("ames.RData")
ncol(ames)  
nrow(ames)
names(ames)
names(ames)[1]
#room assigned to rooms above ground
ames$TotRms.AbvGrd
rooms=ames$TotRms.AbvGrd
mean(rooms)

median(rooms)
hist(rooms) #error if bottom right window is too small
summary(rooms)

mean(rooms)
set.seed(1) 
sample(rooms,size=75)
set.seed(1);  sample(rooms,size = 75)
set.seed(1); samp1=sample(rooms,size = 75)
mean(samp1)
hist(samp1)
summary(samp1)
set.seed(2);  samp2=sample(rooms,size = 75)
mean(samp2)

sample_means = rep(0, 5000)

for(i in 1:5000){
  samp <- sample(rooms, 75)
  sample_means[i] = mean(samp)
}

hist(sample_means, probability = TRUE)

summary(sample_means)
summary(rooms)
hist(rooms)
xbar = mean(sample_means) # sample mean
se = sd(sample_means) # sample standard deviation
xbar
se
sigma= sd(rooms) #population standard deviation

sigma
sigma/sqrt(75)
mean(rooms)
se = sd(sample_means) # sample standard deviation
se


hist(sample_means, probability = TRUE)
lines(x = seq(3,10,0.01), y = dnorm(seq(3,10,0.01), mean = xbar, sd = se), col = "blue")

#7.27
pt(1.28,68,lower.tail = F)


#7.34
qnorm(.01,lower.tail = F)
pnorm(1.33,lower.tail = F)




pt(2.2857,63,lower.tail = F)
pt(.9530,326,lower.tail = F)


#7.41 ftest
#pf(q,dfGroup,dfError,lower.tail = F)
pf(2.189,4,1171,lower.tail = F)
pf(14.07,4,30,lower.tail = F)


qt(.05,326)
qt(.05,19)
2*(pt(-.248,55,lower.tail = T))

qnorm(.01, lower.tail = F) #aka the upper bound``
qnorm(.99)



#Rstudio Notes for full equations




#ch6 proportion testing using r studio REMEMBER TO CHECK CONDITIONS !!!

#one sample
p_hat=.23
n=45
p_not=.34

std_err = sqrt(p_hat*(1-p_hat)/n) #baiscally just the math operation for standar error
std_err
z_star = qnorm(p = .975) #find the value for the Z refer to 5.28
z_star

#confidence intervals
lb = p_hat - z_star*std_err #lower bound of the interval
ub = p_hat + z_star*std_err #upper bound of the interval
c(lb,ub) #print the lower and upper bounds 


#test statistic not working
z=(p_hat-p_not)/sqrt(p_not*(1-p_not)/n)
z
pnorm(z)


#2 sample 

x1=46
x2=21
n1=340
n2=85
p1hat=x1/n1
p2hat=x2/n2
p1hatR=round(p1hat,4) #round to 4 decimals
p2hatR=round(p2hat,4)

phat=(x1+x2)/(n1+n2) #p^ aka p^pooled
phatR=round(phat,4)


se=sqrt(phatR*(1-phatR)*(1/n1+1/n2)) #standard error aka denomenator for test statistic

z=(p1hatR-p2hatR/se) #test statistic
z
pnorm(z,lower.tail = T)
pnorm(-5.46,lower.tail = T)
pnorm(1.23,lower.tail = T)

pf(5.48,2,147,lower.tail = F)

qnorm(.05)
pnorm(1.688,lower.tail = F)
1-.04570











#chapter 8
#scatter plot stuff (slide 8.16)

x=c(2521,2555,2735,2846,3028,3049,3198,3198) #all the x values
y=c(400,426,428,435,469,475,488,455) #all the y values

#calc xbar and ybar (the averages for the vectors above)
mean(x)
mean(y)

#alternatve way to print things
xbar=mean(x)
ybar=mean(y)
xbar
ybar

#calc the standard dev 
sd(x)
sd(y)

#calc error with formula in mind
sx=sd(x)
sy=sd(y)
sx
sy

#correlation check (should give a number between -1 and 1)
r=cor(x,y)
r

#find the slope
b1=r*(sx/sy)
b1

#find the y intercept
b0=ybar-b1*xbar
b0

#print the thing
model=lm(y~x)
model


adat=c(2,13,20,23,31,32,32,32,36,47)
fivenum(adat)

















