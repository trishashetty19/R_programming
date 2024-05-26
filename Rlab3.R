#Program for Web Scraping and Data Extraction:
# Use R packages like rvest or httr to scrape data from a specific website or API.
#  • Define the target website or API endpoints and specify the data to be extracted.
#  • Retrieve the HTML content or JSON response from the website or API.
#  • Parse and extract the desired data using CSS selectors, XPath, or JSON parsing
#    techniques.
#  • Save the extracted data to a file or perform further analysis on it.

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

