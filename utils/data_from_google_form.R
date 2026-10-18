library(tidyverse)
library(googlesheets4)

# Google authentication
options(
  gargle_oauth_cache = ".secrets",
  gargle_oauth_email = "nrennie.research@gmail.com"
)
googledrive::drive_auth()
sheet_id <- googledrive::drive_get("Resources Responses")$id

# Read Google sheet
raw_data <- read_sheet(sheet_id)

# Format new data
new_data <- raw_data |>
  select(-Timestamp) |>
  mutate(
    Lists = str_replace_all(Lists, ", ", ";"),
    Lists = paste0(Lists, ";")
  )

# Check if already exists
old_data <- read_csv("resources.csv")
to_add <- new_data |>
  filter_out(Link %in% old_data$Link)
# View(to_add) # Inspect
new_data <- rbind(old_data, to_add) |>
  arrange(Type, Title)

# Save to CSV
write_csv(new_data, "resources.csv", na = "")

# Remove rows from form
range_clear(sheet_id, range = "A2:ZZ")
