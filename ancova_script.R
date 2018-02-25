library(sas7bdat)
library(car)
library(multcomp)

## SET WD AND GRAB DATA

wd = 'C:\\Users\\Bobby\\Desktop\\Program\\R\\week6'
setwd(wd)
my_data = read.sas7bdat('ancova_data.sas7bdat')
summary(my_data)

## BOX PLOTS

par(mfrow=c(1,2))
boxplot(my_data$Revenue~my_data$Promo,xlab='Promo',ylab='Revenue')
boxplot(my_data$Recency~my_data$Promo,xlab='Promo',ylab='Recency')
par(mfrow=c(1,1))

## ANOVA MODEL

model = aov(Revenue~Promo,data=my_data)
summary(model)

## ANCOVA

model1 = aov(Revenue~Promo+Recency,data=my_data)
summary(model1)

## aov() by default uses Type I SS
## For Type III SS use "Anova" function from car package

Anova(model1, type="III")

## For a posthoc Tukey's test we use glht function from the mulcomp package
posthoc = glht(model1, linfct=mcp(Promo="Tukey"))
summary(posthoc)