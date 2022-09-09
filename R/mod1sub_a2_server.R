

mod1sub_a2_server <- function(id, rv) {
  moduleServer(
    id,
    ## Below is the module function
    function(input, output, session) {

      ns <- session$ns

      observeEvent(input$start_calc_a2, {

        rv$mod1$data_a2 <- tibble(
          id = 1:input$a2_n,
          value = rpois(n = input$a2_n, lambda = input$a2_lambda)
        )

      })

      output$rpois_plot <- renderPlot({

        req(rv$mod1$data_a2)

        ggplot(rv$mod1$data_a2) +
          geom_point(aes(x = id, y = value))

      })

    } ## END module server function
  )
} ## END function CV_model_server()

