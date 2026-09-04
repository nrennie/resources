library(tidyverse)
bg_col <- "#F2F4F8"
highlight_col <- "#7F055F"
saffron <- "#E4BB25"
stormy_teal <- "#197176"

# Data
set.seed(123)
plot_data <- expand.grid(x = 1:5, y = 1:5)
plot_data$col <- sample(
  c(highlight_col, saffron, stormy_teal),
  25,
  replace = TRUE
)
plot_data$pch <- sample(
  21:25,
  25,
  replace = TRUE
)

# Plot
ggplot() +
  geom_point(
    data = plot_data,
    mapping = aes(x = x, y = y, fill = col, shape = pch),
    colour = highlight_col,
    size = 8
  ) +
  scale_x_continuous(limits = c(0.5, 5.5)) +
  scale_y_continuous(limits = c(0.5, 5.5)) +
  scale_fill_identity() +
  scale_shape_identity() +
  coord_cartesian(expand = FALSE) +
  theme_void() +
  theme(
    plot.background = element_rect(
      fill = bg_col, color = bg_col
    ),
    plot.margin = margin(30, 30, 30, 30),
    aspect.ratio = 1
  )

ggsave("all/featured.png", height = 4, width = 4, bg = bg_col)
