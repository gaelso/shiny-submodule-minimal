



mod1sub_a2_UI <- function(id){

  ## From https://shiny.rstudio.com/articles/modules.html
  # `NS(id)` returns a namespace function, which was save as `ns` and will
  # invoke later.
  ns <- NS(id)

  ## UI elements wrapped in a tagList() function
  tagList(

    h4(strong("User Input sub module approach 2:")),

    p("Simulate numbers from Poisson distribution"),

    sidebarLayout(

      ## A1 input sidebar

      sidebarPanel(

        numericInput(
          inputId = ns("a2_lambda"),
          label = "lambda",
          value = 10,
          min = 1,
          max = 100,
          step = 10
        ),

        numericInput(
          inputId = ns("a2_n"),
          label = "n",
          value = 100,
          min = 10,
          max = 1000,
          step = 10
        ),

        actionButton(inputId = ns("start_calc_a2"), label = "Launch calculations")

      ),

      ## + A1 quick view ==================================================

      mainPanel(

        br(),

        plotOutput(outputId = ns("rpois_plot")),

        width = 8) ## End mainPanel

    ) ## End sidebarLayout

  ) ## END tagList

}
