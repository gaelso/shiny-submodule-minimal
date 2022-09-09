

mod3_server <- function(id, rv) {
  moduleServer(id, function(input, output, session) {

    ns <- session$ns

    output$plot1 <- renderPlot({

      req(rv$mod1$approach)

      if(rv$mod1$approach == "a1") {
        req(rv$mod1$data_a1)
        ggplot(rv$mod1$data_a1) +
          geom_point(aes(x = id, y = value))
      } else {
        req(rv$mod1$data_a2)
        ggplot(rv$mod1$data_a2) +
          geom_point(aes(x = id, y = value))
      }

    })

    output$plot2 <- renderPlot({

      req(rv$mod2$data)

      ggplot(rv$mod2$data) +
        geom_point(aes(x = id, y = value, color = cat))

    })


    output$plot3 <- renderPlot({

      req(rv$mod2$data)

      ggplot(rv$mod2$data) +
        geom_point(aes(x = id, y = value, color = cat)) +
        facet_wrap(~cat)

    })


  }) ## END moduleServer

} ## END function mod3_server()
