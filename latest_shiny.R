library(DBI)
library(RPostgreSQL)
library(DT)



drv <- dbDriver("PostgreSQL")
con <- dbConnect(drv, host='ec2-54-202-248-148.us-west-2.compute.amazonaws.com', 
                 port='5432', dbname='postgres',
                 user='postgres', password='DAJJ')

dbExistsTable(con, "Movie_Data")

# create an empty list
container <- list()

myTable <- dbReadTable(con, "Movie_Data")
myTable <- na.omit(myTable) #Removing the NAs for simplicity
View(myTable)
## Only run examples in interactive R sessions
if (interactive()) {
  
  # demoing optgroup support in the `choices` arg
  shinyApp(
    ui = fluidPage(
      selectInput("gen", "Choose a state:",
                  c(" ",unique(as.character(myTable$genres)))),
      selectInput("content",
                  "Content:",
                  c(" ",
                    unique(as.character(myTable$content_rating)))),
      submitButton("Submit"),
      textOutput("table1"),
      textOutput("text2")

    ),
    
    server = function(input, output) {
      
      data <- myTable
      
      df_subset <- reactive({
        a<-subset(data, data$genres == input$gen & data$content_rating == input$content,
                  select=(movie_title))
        return(a)
      })
      print(df_subset)
      output$table1 <- renderPrint(df_subset())
      
      }) 
    }


