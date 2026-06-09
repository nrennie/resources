library(tidyverse)
library(rnaturalearth)
library(sf)
bg_col <- "#F2F4F8"
highlight_col <- "#7F055F"

# Data
world <- ne_countries()
map_data <- world |>
  st_transform(crs = "ESRI:54009")

# Plot
ggplot() +
  geom_sf(data = map_data,
          fill = highlight_col,
          colour = highlight_col,
          alpha = 0.3) +
  coord_sf(expand = FALSE) +
  theme_void() +
  theme(
    plot.background = element_rect(fill = bg_col, colour = bg_col)
  )

ggsave("maps/featured.png", height = 4, width = 4, bg = bg_col)
