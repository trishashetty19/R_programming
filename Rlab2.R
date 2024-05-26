library(dplyr)
library(ggplot2)
library(tidyr)

data=read.csv("d:/Users/USER/Documents/Workspace/marks.csv")

missing_values=sum(is.na(data))

data=na.omit(data)

lm_model=lm(External~Internal,data=data)
print(lm_model)

print(coef(lm_model))
print(coef(lm_model)[1])

x=summary(lm_model)
print(x)

print(ggplot(data,aes(x=Internal,y=External))+geom_point()+geom_smooth(method="lm",se=FALSE,color="blue")+ggtitle("sdfghjk")+xlab("dfgh")+ylab("sdfgh")+theme_minimal())

print(ggplot(data,aes(x=fitted(lm_model),y=residuals(lm_model)))+geom_point()+geom_hline(yintercept = 0,linetype="dashed",color="red")+theme_minimal())