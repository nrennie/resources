library(htmltools)

# Filter data
resource_list <- function(list_type) {
  list_type <- paste0(list_type, ";")
  resources <- readr::read_csv("../resources.csv") |>
    dplyr::filter(stringr::str_detect(Lists, list_type)) |>
    dplyr::mutate(
      LinkText = stringr::str_remove_all(Link, "https://|/$"),
      Link = glue::glue("<a href='{Link}' target = '_blank'>{LinkText}</a>")
    ) |>
    dplyr::select(-c(LinkText, Lists)) |>
    dplyr::mutate(
      Notes = stringr::str_replace_all(Notes, ";", "; ")
    )
  resources_tbl <- resources |>
    dplyr::arrange(Type, Title) |>
    reactable::reactable(
      columns = list(
        Type = reactable::colDef(
          name = "Type",
          filterInput = filter_fct,
          maxWidth = 150
        ),
        Link = reactable::colDef(
          html = TRUE
        ),
        Notes = reactable::colDef(
          maxWidth = 400
        )
      ),
      searchable = TRUE,
      striped = TRUE,
      pagination = FALSE,
      elementId = "resources-tbl",
      filterable = TRUE,
      sortable = TRUE,
      showSortable = TRUE
    )
  return(resources_tbl)
}

# Filter
filter_fct <- function(values, name) {
  tags$select(
    tags$option(value = "", "All"),
    purrr::map(unique(values), tags$option),
    onchange = glue::glue(
      "Reactable.setFilter(
        'resources-tbl',
        '{name}',
        event.target.value
      )"
    )
  )
}
