library(rvest)
library(httr)
library(xml2)

url="https://en.wikipedia.org/wiki/List_of_countries_and_dependencies_and_their_capitals_in_native_languages"

#Sending the http requests and authentication
response=tryCatch(GET(url),error=function(e)e)

if(!inherits(response,"error")){
  
  cat("Successfully connected to website")
  
  #Retriveing the html content
  html_content=read_html(response$content,encoding="UTF-8")
  
  #Extracting the data
  name=html_content%>%
    html_nodes(xpath="/html/body/div[2]/div/div[3]/main/div[3]/div[3]/div[1]/table[2]/tbody/tr/td[1]")%>%
    html_text()
  
  price=html_content%>%
    html_nodes(xpath="/html/body/div[2]/div/div[3]/main/div[3]/div[3]/div[1]/table[2]/tbody/tr/td[2]")%>%
    html_text()
  
  #Data cleaning 
  clean_name=gsub("\\[.*?\\]","",name)
  clean_name=gsub("&nbsp;"," ",clean_name)
  
  clean_price=gsub("\\[.*?\\]","",price)
  clean_price=gsub("&nbsp;"," ",clean_price)
  
  #Removing the unicode characters
  clean_name=enc2utf8(iconv(clean_name,"UTF-8","ASCII",sub=""))
  clean_price=enc2utf8(iconv(clean_price,"UTF-8","ASCII",sub=""))
  
  #Combing the extracted data into dataframe 
  coins=data.frame(NAME=name,PRICE=price)
  print(coins)
  write.csv(coins,"coinMar.csv",row.names = FALSE)
}else{
  cat("Connected failed!")
}

