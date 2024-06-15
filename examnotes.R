#exam workspace
library(tidyverse)
library(ggplot2)

auto=read_csv("C:/Users/ahmir/OneDrive/Desktop/375/code/autompg.csv")

iris %>% select(1:5)
mean(auto)


presi=data.frame(lastname = c("Bush","Clinton","Bush","Obama"), firstname = c("George","Bill","George W.","Barrack"),state=c("Texas","Arkansas","Texas","Hawaii"))
terms=data.frame(lastname = c("Bush","Clinton","Bush","Obama"), firstname = c("Ronald","Ronald", "Bill","George W.","Barrack"), start = c(1981,1985,1989,1993,1997,2001,2005),end=c(1985,1989,1993,1997,2001,2005,2009))
presi
terms %>$ pivot_wider(names_from = firstname, values_from = start)

nombers=c(2, 12, 16, 40, 26, 24, 20, 20, 50)
nombers
sort(nombers)
median(nombers)
quantile(nombers)
fivenum(nombers)

IQR(nombers)
five= fivenum(nombers)

lowQuart=five[2]
upperQuart=five[4]

upperBound=upperQuart+IQR(nombers)*1.5
lowerBound=lowQuart-IQR(nombers)*1.5
upperBound
lowerBound

outliers = nombers>upperBound | nombers<lowerBound
nombers[outliers]


esoph
ggplot(data = esoph) + geom_point(aes(x =ncases, y =ncontrols))+facet_grid(esoph$alcgp)+labs(x="Number of Cases", y="Number of Controls", title="Cases and Controls Organized by Age Group")

esoph %>% arrange(tobgp) %>% select(agegp,tobgp,alcgp)
esoph %>% count(ncases=0)
esoph %>% filter(ncases>mean(ncases))
esoph %>% filter(ncases==max(ncases))
esoph %>% group_by(agegp) %>% summarise(max.ncontrols = max(ncontrols))
#35-44" and "45-54
esoph %>% filter(agegp=="35-44" | agegp=="45-54") %>% summarise(max.ncontrols = max(ncontrols))


presidents %>$ pivot_wider(names_from = term_home, values_from = year_state)
