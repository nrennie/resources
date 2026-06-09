function iconlink(args, kwargs, meta)
  local url = pandoc.utils.stringify(args[1])
  local label = pandoc.utils.stringify(args[2])
  local icon = pandoc.utils.stringify(args[3])

  local icon_html = string.format('<i class="fa-solid fa-%s"></i>', icon)
  local html = string.format(
    '<a href="%s" class="icon-link" target="_blank" rel="noopener">%s %s</a>',
    url, icon_html, label
  )

  return pandoc.RawInline("html", html)
end
