library(tidyverse)
library(showtext)
font_add_google("Oswald")
bg_col <- "#F2F4F8"
highlight_col <- "#7F055F"

# Plot
ggplot() +
  geom_text(
    data = data.frame(
      x = 0,
      y = 0,
      label = "R"
    ),
    family = "Oswald",
    size = 48,
    mapping = aes(x = x, y = y, label = label),
    colour = highlight_col
  ) +
  theme_void() +
  theme(
    plot.background = element_rect(
      fill = bg_col, color = bg_col
    ),
    plot.margin = margin(30, 30, 30, 30),
    aspect.ratio = 1
  )

ggsave("R/featured.png", height = 4, width = 4, bg = bg_col)
