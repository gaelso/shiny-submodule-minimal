

mod1sub_a1_server <- function(id, rv) {
  moduleServer(
    id,
    ## Below is the module function
    function(input, output, session) {

      ns <- session$ns

      observeEvent(input$start_calc_a1, {

        rv$mod1$data_a1 <- tibble(
          id = 1:input$a1_n,
          value = rnorm(n = input$a1_n, mean = input$a1_mean, sd = input$a1_sd)
          )

        })

      output$rnorm_plot <- renderPlot({

        req(rv$mod1$data_a1)

        ggplot(rv$mod1$data_a1) +
          geom_point(aes(x = id, y = value))

      })

    } ## END module server function
  )
} ## END function CV_model_server()
