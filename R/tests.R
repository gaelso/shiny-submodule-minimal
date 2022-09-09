
##
## test sub module 1.1 ######################################################
##

source("R/mod1sub_a1_UI.R")
source("R/mod1sub_a1_server.R")

mod1sub1 <- function(...) {

  library(shiny)
  library(shinyjs)
  library(tidyverse)

  ui <- fluidPage(

    mod1sub_a1_UI(id = "user_input_a1")

  )

  server <- function(input, output, session) {

    ## + Initiate reactive values list to be passed between modules =========
    rv <- reactiveValues(
      mod1 = reactiveValues(),
      mod2 = reactiveValues()
    )

    ## + Module server functions ============================================
    mod1sub_a1_server("user_input_a1", rv = rv)

  }

  shinyApp(ui, server, ...)

} ## END function mod1sub1()



##
## test sub module 1.2 ######################################################
##

source("R/mod1sub_a2_UI.R")
source("R/mod1sub_a2_server.R")

mod1sub2 <- function(...) {

  library(shiny)
  library(shinyjs)
  library(tidyverse)

  ui <- fluidPage(

    mod1sub_a2_UI(id = "user_input_a2")

  )

  server <- function(input, output, session) {

    ## + Initiate reactive values list to be passed between modules =========
    rv <- reactiveValues(
      mod1 = reactiveValues(),
      mod2 = reactiveValues()
    )

    ## + Module server functions ============================================
    mod1sub_a2_server("user_input_a2", rv = rv)

  }

  shinyApp(ui, server, ...)

} ## END function mod1sub2()



##
## Test module 1 ############################################################
##

source("R/mod1_UI.R")
source("R/mod1_server.R")


mod1 <- function(...) {

  library(shiny)
  library(shinyjs)
  library(tidyverse)

  ui <- fluidPage(

    shinyjs::useShinyjs(),

    mod1_UI(id = "user_input")

  )

  server <- function(input, output, session) {

    ## + Initiate reactive values list to be passed between modules =========
    rv <- reactiveValues(
      mod1 = reactiveValues(),
      mod2 = reactiveValues()
    )

    ## + Module server functions ============================================
    mod1_server("user_input", rv = rv)

  }

  shinyApp(ui, server, ...)

} ## END function mod1()


