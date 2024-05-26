#Program for Data Analysis:
#  • Read a dataset from a CSV file and perform exploratory data analysis, including
#    summary statistics, data visualization, and identifying missing values.
#  • Clean the data by removing duplicates, handling missing values, and
#    transforming variables if necessary.
#  • Perform data manipulation operations such as filtering, sorting, and merging
#    datasets based on certain criteria.
#  • Conduct statistical analysis, such as hypothesis testing or correlation analysis,
#    to derive insights from the data.
#  • Generate reports or visualizations to present the analysis results.#


library(dplyr)
library(ggplot2)

file_path="d:/Users/USER/Documents/Workspace/tested.csv"
data=read.csv(file_path)


summary_stats=summary(data)
print(summary_stats)

#Creating histogram
print(ggplot(data,aes(x=Age))+geom_histogram(binwidth = 5,fill="pink",color="black")+labs(title="Distribution of Age",x="Age",y="Frequency"))

#Bar plot
print(ggplot(data,aes(x=factor(Survived),fill=factor(Survived)))+geom_bar()+labs(title="Number of survivors on titanic",x="Survived",y="Count")+scale_fill_manual(values=c("pink","green")))

missing_values=colSums(is.na(data))
print(missing_values)

data$Age[is.na(data$Age)]=mean(data$Age,na.rm=TRUE)

missing_values=colSums(is.na(data))
print(missing_values)

adult_passengers=filter(data,Age>60)
print(adult_passengers)

sorted_titanic=arrange(data,desc(Age))
print(sorted_titanic)


