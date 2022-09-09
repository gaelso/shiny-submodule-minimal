


mod1_UI <- function(id){

  ## From https://shiny.rstudio.com/articles/modules.html
  # `NS(id)` returns a namespace function, which was save as `ns` and will
  # invoke later.
  ns <- NS(id)

  ## UI elements wrapped in a tagList() function
  tagList(

    h3("User input", align = "center"),

    br(),

    ##
    ## Select approach ######################################################
    ##

    h4("Select an approach"),

    wellPanel(
      div(
        shinyWidgets::radioGroupButtons(
          inputId = ns("approach"),
          label = "",
          choiceNames = c(
            'Approach 1: some calculations' ,
            'Approach 2: different calculations'
          ),
          choiceValues = c("a1", "a2"),
          selected = "a1",
          checkIcon = list(
            yes = icon("ok",
                       lib = "glyphicon")),
          justified = FALSE
        ),
        align = "center"),

      div(
        actionButton(inputId = ns("start_input"), label = "Continue")
      ),

      class="bg1"), ## END wellPanel approach



    ##
    ## Approach 1: Some calculations ########################################
    ##

    shinyjs::hidden(div(
      id = ns("layout_a1"),

      mod1sub_a1_UI(id = ns("user_input_a1")),

    )),



    ##
    ## Approach 2: different calculations ###################################
    ##

    shinyjs::hidden(div(
      id = ns("layout_a2"),

      mod1sub_a2_UI(id = ns("user_input_a2"))

    )),



    ##
    ## Move to next section #################################################
    ##

    h4(icon("arrow-right"), "Continue to:", HTML("&nbsp;"),
       actionButton(ns("btn_to_more_input"), "More input")
    )

  ) ## END tagList

} ## END function mod1_UI()
