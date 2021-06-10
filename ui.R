
fluidPage(
  sliderInput(inputId = "bereich",
              label = "Wähle einen Bereich",
              value = c(1, 472), min = 1, max = 472,
              dragRange = FALSE),
  plotOutput("bar")
)
