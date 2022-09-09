
mod2_UI <- function(id){

  ## From https://shiny.rstudio.com/articles/modules.html
  # `NS(id)` returns a namespace function, which was save as `ns` and will
  # invoke later.
  ns <- NS(id)

  ## UI elements wrapped in a tagList() function
  tagList(

    h3("More input", align = "center"),

    br(),

    sidebarLayout(

      sidebarPanel(

        textOutput(outputId = ns("check_approach")),

        br(),

        sliderInput(
          inputId = ns("n_cat"),
          label = "Number of categories",
          value = 2,
          min = 2,
          max = 4
        ),

        actionButton(inputId = ns("start_calc_mod2"), label = "Launch calculations"),

        br(),

        p("Categories selected:"),

        verbatimTextOutput(ns("check_cat"))

      ),

      mainPanel(

        br(),

        plotOutput(outputId = ns("cat_plot")),

        width = 8) ## End mainPanel

    ), ## End sidebarLayout

    h4(icon("arrow-right"), "Continue to:", HTML("&nbsp;"),
       actionButton(ns("btn_to_results"), "Results")
    )

  ) ## END tagList

} ## END function mod2_UI()
