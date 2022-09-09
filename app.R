
app <- function(...) {

  ## GLOBAL #################################################################

  library(shiny)
  library(shinyjs)
  library(tidyverse)

  source("R/mod1sub_a1_UI.R")
  source("R/mod1sub_a1_server.R")
  source("R/mod1sub_a2_UI.R")
  source("R/mod1sub_a2_server.R")
  source("R/mod1_UI.R")
  source("R/mod1_server.R")
  source("R/mod2_UI.R")
  source("R/mod2_server.R")
  source("R/mod3_UI.R")
  source("R/mod3_server.R")



  ## UI #####################################################################
  ui <- fluidPage(

    shinyjs::useShinyjs(),

    titlePanel(
      title = "Testing modules and sub-modules",
      windowTitle = "Optimize NFI"
    ),

    navbarPage(
      id = "navbar", title = NULL, selected = "user_input",
      tabPanel(title = "User input", value = "user_input", icon = icon("campground"), mod1_UI("tab_user_input")),
      tabPanel(title = "More input", value = "more_input", icon = icon("map")       , mod2_UI("tab_more_input")),
      tabPanel(title = "Results"    , value = "results"  , icon = icon("table")     , mod3_UI("tab_results"))
    ) ## END navbarPage
  ) ## END fluidPage


  ## Server #################################################################
  server <- function(input, output, session) {

    ## + Initiate reactive values list to be passed between modules =========
    rv <- reactiveValues(
      mod1 = reactiveValues(),
      mod2 = reactiveValues()
    )

    ## + Module server functions ============================================
    mod1_server("tab_user_input", rv = rv)

    mod2_server("tab_more_input", rv = rv)

    mod3_server("tab_results", rv = rv)

    ## + Trans modules events ===============================================
    observeEvent(rv$to_more_input, {
      updateTabsetPanel(session, "navbar", "more_input")
    })

    observeEvent(rv$to_results, {
      updateTabsetPanel(session, "navbar", "results")
    })

  }

  ## App call ###############################################################
  shinyApp(ui, server, ...)

} ## END function app()
