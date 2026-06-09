library(tidyverse)
bg_col <- "#F2F4F8"
highlight_col <- "#7F055F"

# Plot
ggplot() +
  geom_col(
    data = data.frame(
      x = LETTERS[1:3],
      y = c(2, 5, 3)
    ),
    mapping = aes(x = x, y = y),
    fill = highlight_col
    ) +
  theme_void() +
  theme(
    plot.background = element_rect(
      fill = bg_col, color = bg_col
    ),
    axis.line.x.bottom = element_line(color = highlight_col, linewidth = 2),
    axis.line.y.left = element_line(color = highlight_col, linewidth = 2),
    plot.margin = margin(30, 30, 30, 30),
    aspect.ratio = 1
  )

ggsave("data-viz/featured.png", height = 4, width = 4, bg = bg_col)
