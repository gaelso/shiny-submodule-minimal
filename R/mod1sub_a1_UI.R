

mod1sub_a1_UI <- function(id){

  ## From https://shiny.rstudio.com/articles/modules.html
  # `NS(id)` returns a namespace function, which was save as `ns` and will
  # invoke later.
  ns <- NS(id)

  ## UI elements wrapped in a tagList() function
  tagList(

      h4(strong("User Input sub module approach 1:")),

      p("Simulate numbers from normal distribution"),

      sidebarLayout(

        ## A1 input sidebar

        sidebarPanel(

          numericInput(
            inputId = ns("a1_mean"),
            label = "mean",
            value = 0,
            min = 0,
            max = 100,
            step = 10
          ),

          numericInput(
            inputId = ns("a1_sd"),
            label = "standard deviation",
            value = 1,
            min = 1,
            max = 10,
            step = 1
          ),

          numericInput(
            inputId = ns("a1_n"),
            label = "n",
            value = 100,
            min = 10,
            max = 1000,
            step = 10
          ),

          actionButton(inputId = ns("start_calc_a1"), label = "Launch calculations")

        ),

        ## + A1 quick view ==================================================

        mainPanel(

          br(),

          plotOutput(outputId = ns("rnorm_plot")),

          width = 8) ## End mainPanel

      ) ## End sidebarLayout

  ) ## END tagList

}
