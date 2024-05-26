#Program for Linear Regression:
#  • Read a dataset from a CSV file that contains variables for independent and
#    dependent variables.
#  • Perform linear regression analysis to model the relationship between the
#    variables.
#  • Calculate the coefficients and intercept of the regression model.
#  • Evaluate the model's goodness-of-fit using metrics like R-squared and adjusted
#    R-squared.
#  • Plot the regression line and residuals to visualize the relationship between the
#    variables.

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
