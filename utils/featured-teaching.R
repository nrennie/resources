library(tidyverse)
bg_col <- "#F2F4F8"
highlight_col <- "#7F055F"

# Plot
set.seed(123)
ggplot() +
  geom_segment(
    data = data.frame(
      x = rep(0, 4),
      xend = rep(1, 4),
      y = 1:4
    ),
    mapping = aes(x = x, xend = xend, y = y),
    colour = highlight_col,
    linewidth = 2
  ) +
  geom_point(
    data = data.frame(
      x = sample(seq(0.05, 0.95, by = 0.1), 12, replace = TRUE),
      y = rep(1:4, 3)
    ),
    mapping = aes(x = x, y = y),
    colour = highlight_col,
    size = 8
  ) +
  scale_y_continuous(limits = c(0.5, 4.5), sec.axis = dup_axis()) +
  coord_cartesian(expand = FALSE) +
  theme_void() +
  theme(
    plot.background = element_rect(
      fill = bg_col, color = bg_col
    ),
    axis.line.y.left = element_line(color = highlight_col, linewidth = 4),
    axis.line.y.right = element_line(color = highlight_col, linewidth = 4),
    plot.margin = margin(30, 30, 30, 30),
    aspect.ratio = 1
  )

ggsave("teaching/featured.png", height = 4, width = 4, bg = bg_col)
