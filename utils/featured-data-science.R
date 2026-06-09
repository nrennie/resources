library(tidyverse)
bg_col <- "#F2F4F8"
highlight_col <- "#7F055F"
saffron <- "#E4BB25"
stormy_teal <- "#197176"

# Plot
ggplot() +
  geom_point(
    data = penguins,
    mapping = aes(x = bill_len, y = bill_dep, colour = species,
                  shape = species),
    size = 2
  ) +
  scale_colour_manual(
    values = c(highlight_col, saffron, stormy_teal)
  ) +
  theme_void() +
  theme(
    plot.background = element_rect(
      fill = bg_col, color = bg_col
    ),
    legend.position = "none",
    axis.line.x.bottom = element_line(color = highlight_col, linewidth = 2),
    axis.line.y.left = element_line(color = highlight_col, linewidth = 2),
    plot.margin = margin(30, 30, 30, 30),
    aspect.ratio = 1
  )

ggsave("data-science/featured.png", height = 4, width = 4, bg = bg_col)
