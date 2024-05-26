#Program for Data Visualization:
#  Use packages like ggplot2 or plot to create various types of charts, such as bar charts,
#  line plots, scatter plots, or heatmaps.
#   • Read a dataset from a CSV file or other data sources.
#   • Customise the charts by adding labels, titles, legends, and adjusting the axis
#     scales
#   • Create interactive visualizations with tooltips, zooming, or filtering options.
#   • Export the visualizations to different file formats or display them within an R
#     notebook or Shiny application.

library(ggplot2)
library(dplyr)
library(plotly)

#Reading the titanic dataset
data=read.csv("d:/Users/USER/Documents/Workspace/R programming/tested.csv")
data=na.omit(data)

#Converting into factor
titanic$Survived=factor(titanic$Survived,levels=c("0","1"))

#Visualsing the charts
#Bar plot
bar_plot=ggplot(data,aes(x=factor(Pclass),fill=factor(Survived)))+geom_bar(position="dodge")+labs(title="Pclass vs Survivors",x="Passenger class",y="Count",fill="Survived")+scale_color_manual(values=c("0"="red","1"="blue"))

#Line plot
line_plot=ggplot(data,aes(x=Age,y=after_stat(density)))+geom_density(fill="blue",alpha=0.5)+labs(title="Age distribution",x="Age",y="Density")

#Scatter plot
scatter_plot=ggplot(data,aes(x=Age,y=Fare,color=factor(Survived)))+geom_point()+labs(title="Age vs Fare",x="Age",y="Fare",color="Survived")+scale_color_manual(values=c("0"="pink","1"="green"))

#Heatmap
heatmap=ggplot(data,aes(x=Pclass,y=Survived))+stat_bin_2d(bins=10,aes(fill=after_stat(count)))+labs(title="Heatmap",x="Pclass",y="Survived",fill="Frequency")+scale_color_continuous(name="Frequency",low="white",high="blue")+theme_minimal()

#cREATING INTERACTIVE VISUALIZATIONS USING PLOTLY
interactive_bar_plot=ggplotly(bar_plot)
interactive_line_plot=ggplotly(line_plot)
interactive_scatter_plot=ggplotly(scatter_plot)
interactive_heatmap=ggplotly(heatmap)

#saving it to system
ggsave("bar_plot.png",plot=bar_plot,width=8,height=6)
ggsave("line_plot.png",plot=line_plot,width=8,height=6)
ggsave("scatter_plot.png",plot=scatter_plot,width=8,height=6)
ggsave("heatmap.png",plot=heatmap,width=8,height=6)

#Exporthing the interactive plotly into the html files
htmlwidgets::saveWidget(interactive_bar_plot,"interactive_bar_plot.html",selfcontained=TRUE)
htmlwidgets::saveWidget(interactive_line_plot,"interactive_line_plot.html",selfcontained=TRUE)
htmlwidgets::saveWidget(interactive_scatter_plot,"interactive_scatter_plot.html",selfcontained=TRUE)
htmlwidgets::saveWidget(interactive_heatmap,"interactive_heatmap.html",selfcontained=TRUE)
