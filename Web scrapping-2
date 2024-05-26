#Program for Web Scraping and Data Extraction:
#  • Install and Load Required Packages:
#     ▪ Install the necessary packages for web scraping, such as rvest, xml2, and
#       httr.
#     ▪ Load the packages into your R environment using the library() function.
#  • Specify the Target Website and URL:
#     ▪ Identify the website you want to scrape data from.
#     ▪ Define the URL of the specific webpage or API endpoint containing the
#       data you need.
#  • Send HTTP Requests and Handle Authentication (if required):
#     ▪ Use the GET() or POST() functions from the httr package to send HTTP
#       requests to the website.
#     ▪ Set headers, parameters, or authentication credentials as needed.
#  • Retrieve HTML Content and Parse XML/HTML:
#     ▪ Use the GET() function to retrieve the HTML content of the webpage.
#     ▪ Parse the HTML content using the read_html() function from the rvest
#       package.
#  • Extract Data from HTML:
#     ▪ Inspect the HTML structure of the webpage to identify the elements and
#       attributes containing the desired data.
#     ▪ Use functions such as html_nodes() and html_text() from the rvest
#       package to extract specific elements or text from the HTML content.
#     ▪ Apply CSS selectors or XPath expressions to target specific elements.
#  • Perform Data Cleaning and Transformation:
#     ▪ Clean the extracted data by removing unwanted characters, handling
#       missing values, or applying regular expressions.
#     ▪ Convert the extracted data into appropriate data structures (e.g., data
#       frames, lists, or vectors) for further analysis or storage.
#  • Save or Analyse the Extracted Data:
#     ▪ Save the extracted data to a file (e.g., CSV or Excel) using R functions like
#       write.csv() or write.xlsx().
#     ▪ Perform further data analysis or visualization on the extracted data using
#       appropriate R packages and techniques.


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

