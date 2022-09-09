
library(shiny)
library(tidyverse)

## UI #####################################################################
ui <- fluidPage(

  mod1sub_approach1_UI(id = "user_input_a1")

)


## Server #################################################################
server <- function(input, output, session) {

  ## + Initiate reactive values list to be passed between modules =========
  rv <- reactiveValues()

  ## + Module server functions ============================================
  mod1sub_approach1_server("user_input_a1", rv = rv)

}

## App call ###############################################################
shinyApp(ui, server)
