
library(rvest)


url <- "https://nmamit.nitte.edu.in/department-AI&DS.php"

html_content=read_html(url)


titles=html_content%>%
  html_nodes(xpath="/html/body/div[1]/section[5]/div/div/div/div/div/div/div/div[1]/div/div[2]/ul/li[2]")%>%
  html_text()%>%
  trimws()

data_book=data.frame(TITLE=titles)
print(data_book)

write.csv(data_book,"book.csv",row.names = FALSE)

