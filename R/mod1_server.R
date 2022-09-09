


mod1_server <- function(id, rv) {
  moduleServer(
    id,
    ## Below is the module function
    function(input, output, session) {

      ns <- session$ns

      observeEvent(input$start_input, {

        rv$mod1$approach <- input$approach

        if(rv$mod1$approach == "a1") {

          ## Re-initiate panels
          shinyjs::reset("layout_a1")
          shinyjs::show("layout_a1")
          shinyjs::hide("layout_a2")

        } else if (rv$mod1$approach == "a2") {

          ## Re-initiate panels
          shinyjs::reset("layout_a2")
          shinyjs::show("layout_a2")
          shinyjs::hide("layout_a1")

        }

        })

      mod1sub_a1_server("user_input_a1", rv = rv)

      mod1sub_a2_server("user_input_a2", rv = rv)

      ## Move input to rv for trans module action
      observeEvent(input$btn_to_more_input, {
        rv$to_more_input <- input$btn_to_more_input
      })

    } ## END module server function
  )

} ## END function CV_model_server()
