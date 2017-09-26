#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
shinyUI(fluidPage(
  titlePanel("submitButton example"),
  fluidRow(
    column(3, wellPanel(
      checkboxGroupInput("text", label = h3("Select Genre:"), choices = c("Drama" = "Drama",
                                                                           "Horror" = "Horror",
                                                                           "Action" = "Action")),
      checkboxGroupInput("text", label = h3("Select Rating:"), choices = c("R" = "R",
                                                                          "PG13" = "PG13",
                                                                          "G" = "G")),
      submitButton("Submit")
    )),
    column(6,
           verbatimTextOutput("text")
    )
  )
))
