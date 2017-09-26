source("newData.R")

shinyServer(function(input, output) {
  
  output$text <- renderText({
    testy<-input$text
    paste("Input text is:", testy)
    test(testy)
  })
})

