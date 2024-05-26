library(dplyr)

#Reading multiple datasets 
data1=read.csv("d:/Users/USER/Documents/Workspace/R programming/sales.csv")
data2=read.csv("d:/Users/USER/Documents/Workspace/R programming/salary.csv")

#Common variable out of 2 datasets
merged_data=merge(data1,data2,by="ID")
print(merged_data)

#Aggregation function 
aggreagated_data=merged_data%>%
  group_by(Gender)%>%
  summarize(
    total_salary=sum(Salary),
    average_age=mean(Age),
    count=n()
  )

#Filtering
filtered_data=merged_data%>%
  filter(Age>18)

#Creating new variables 
transformed_data=merged_data%>%
  mutate(
    double_salary=Salary*2,
    seniority=ifelse(Age>18,"Senior","Junior")
  )
print("Aggregated data")
print(aggregated_data)

print("Filtered data")
print(filtered_data)

print("Transformed data")
print(transformed_data)