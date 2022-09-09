

mod3_UI <- function(id){

  ## From https://shiny.rstudio.com/articles/modules.html
  # `NS(id)` returns a namespace function, which was save as `ns` and will
  # invoke later.
  ns <- NS(id)

  ## UI elements wrapped in a tagList() function
  tagList(

    h3("Results", align = "center"),

    br(),

    fluidRow(

      column(6, plotOutput(outputId = ns("plot1"))),

      column(6, plotOutput(outputId = ns("plot2"))),

    ),

    fluidRow(
      column(width = 8, offset = 2, plotOutput(outputId = ns("plot3")))
    )

  ) ## END tagList

} ## END function mod2_UI()
