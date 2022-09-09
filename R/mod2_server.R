

mod2_server <- function(id, rv) {
  moduleServer(id, function(input, output, session) {

    ns <- session$ns

    observeEvent(input$stat_calc_mod2, {

      req(rv$mod1$approach)

      if (rv$mod1$approach == "a1") rv$mod2$data <- rv$mod1$data_a1 else rv$mod2$data <- rv$mod1$data_a2

      rv$mod2$cat <- rep(letters[1:input$n_cat], each = floor(nrow(rv$mod2$data)/input$n_cat))

      if (length(rv$mod2$cat) < nrow(rv$mod2$data)) {

        rv$mod2$cat <- c(rv$mod2$cat, rep(letters[input$n_cat], nrow(rv$mod2$data) - length(rv$mod2$cat)))

      }

      rv$mod2$data <- rv$mod2$data %>%
        mutate(cat = rv$mod2$cat)

    })

    output$check_approach <- renderText({

      paste0("Approach selected: ", rv$mod1$approach, ".")

    })

    output$check_cat <- renderPrint({


    })


    output$cat_plot <- renderPlot({

      req(rv$mod2$data)

      ggplot(rv$mod2$data) +
        geom_point(aes(x = id, y = value, color = cat))

    })

    ## Move input to rv for trans module action
    observeEvent(input$btn_to_results, {
      rv$to_results <- input$btn_to_results
    })

  }) ## END moduleServer

} ## END function mod2_server()
