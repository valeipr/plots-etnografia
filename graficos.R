library(tidyverse)
library(lubridate)
library(plotly)

# importar
datos <- read_csv("datos/data-libro.csv") %>%
  mutate(mes = dmy(mes))

# ggplot simple, frecuencia

datos %>%
  ggplot(aes(x = mes, y = palabras)) +
  geom_line() +
  geom_point() +
  scale_x_date(labels = scales::date_format("%b %Y", locale = "es"), date_breaks = "1 month") +
  theme_light() +
  labs(x = "",
       title = "Palabras escritas por mes") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) 

ggsave("plots/frecuencia.png")

# agregao
datos %>%
  ggplot(aes(x = mes, y = acumulado)) +
  geom_line() +
  geom_point() +
  scale_x_date(labels = scales::date_format("%b %Y", locale = "es"), date_breaks = "1 month") +
  theme_light() +
  labs(x = "",
       y = "palabras",
       title = "Palabras acumuladas por mes") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) 

ggsave("plots/acumulado.png")
