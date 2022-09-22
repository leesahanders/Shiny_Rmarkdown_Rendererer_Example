library(shiny)
library(knitr)
library(pins)
library(dplyr)
library(tidyr)
library(RPostgres)
library(dbplyr)
library(DBI)
library(timevis)
library(kableExtra)
library(DT)
library(htmltools)
library(purrr)
library(jsonlite) 
library(here)
library(future)
library(yaml)
library(rvest)
library(rmarkdown)

ui <- shinyUI(
  fluidPage(
    sliderInput("slider", "Slider", 1, 100, 50),
    actionButton("report", "Generate report", class = "btn-success"), 
    htmlOutput("document")
  )
)

server <- function(input, output) {
  
  ui_rmd <- eventReactive(input$report, {
    path_rmd <- "report.Rmd"
    path_html <- tempfile(fileext = ".html")
    param_render <- list(n = input$slider)
    render(
      path_rmd,
      params = param_render,
      output_file = path_html
    )
    includeHTML(path_html)
  })

  output$document <- renderUI({
    ui_rmd()
  })
  
}

shinyApp(ui, server)

# References: 
## https://davidruvolo51.github.io/shinytutorials/tutorials/rmarkdown-shiny/ 
## https://stackoverflow.com/questions/34816637/parameterized-rmarkdown-document-on-shiny-application
## https://shiny.rstudio.com/articles/generating-reports.html 
## https://shiny.rstudio.com/reference/shiny/1.6.0/varSelectInput.html
## https://community.rstudio.com/t/shiny-selectinput-to-get-list-from-a-dataframe-column/89736/5
## https://shiny.rstudio.com/reference/shiny/1.0.1/observeEvent.html
## https://www.rstudio.com/resources/rstudioconf-2018/parameterized-r-markdown-reports-with-rstudio-connect/
## https://www.r-bloggers.com/2021/06/shiny-inception-javascript-in-rendered-markdown/

