library(sas7bdat)
library(car)
library(multcomp)

## SET WD AND GRAB DATA

wd = 'C:\\Users\\Bobby\\Desktop\\Program\\R\\week6'
setwd(wd)
mancova_data = read.sas7bdat('MANCOVA_Data.sas7bdat')
summary(mancova_data)

## Performing MANOVA (without covariates)

model = manova(cbind(Satisfaction,Rating)~INDUSTRY_TYPE*FIRMSIZE,data=mancova_data)
summary(model)

summary(model, test='Wilks')

summary(model, test='Pillai')

summary(model, test='Hotelling-Lawley')

summary(model, test='Roy')

## MANCOVA - add the covariate "Usage"

model2 = manova(cbind(Satisfaction,Rating)~INDUSTRY_TYPE*FIRMSIZE+Usage,data=mancova_data)
summary(model2)

summary(model2, test='Wilks')

summary(model2, test='Pillai')

summary(model2, test='Hotelling-Lawley')

summary(model2, test='Roy')