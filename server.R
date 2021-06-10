function(input, output, session) {
  

  
  
  #Covid-Cases-ziehen
  library (readxl)
  library(httr)
  #library(ggplot2)
  #library(lubridate)
  
  
  #Covid-Cases-ziehen
  
  url <- "https://www.rki.de/DE/Content/InfAZ/N/Neuartiges_Coronavirus/Daten/Fallzahlen_Kum_Tab.xlsx?__blob=publicationFile"
  
  GET(url, write_disk("covid_all.xlsx", overwrite=TRUE))
  cases_all<- read_excel("covid_all.xlsx", na="NA", sheet="Fälle-Todesfälle-gesamt", range = "A3:H800")
  cases_all<- cases_all[!is.na(cases_all$Berichtsdatum),]
  
  colnames(cases_all)[2] <- "FallKum"
  colnames(cases_all)[4] <- "Fall"
  id <- rownames(cases_all)
  cases_all <- cbind(id=id, cases_all)
 
  
  
 # inzidenz <- c(as.integer(impfdaten$inzidenz))
  
  output$bar <- renderPlot({
    barplot(cases_all$Fall[input$bereich[1]:input$bereich[2]],
            xlab = "id")
  })
  
}

