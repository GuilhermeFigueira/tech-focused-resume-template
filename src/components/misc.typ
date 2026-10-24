#import "../layout.typ": generic-one-by-two, no-marker-list-helper

#let certificates(
  name: "",
  issuer: "",
  url: "",
  date: "",
  columns: (1fr, 1fr),
) = {
  if url != "" {
    name = link(url)[#name]
  }
  generic-one-by-two(
    cols: columns,
    [*#name*, #issuer],
    [*#date*],
  )
}

#let extracurriculars(
  activity: "",
  dates: "",
  columns: (1fr, 1fr),
) = {
  generic-one-by-two(
    cols: columns,
    strong(activity),
    dates,
  )
}

#let skills(body) = {
  no-marker-list-helper(body)
}

#let languages(body) = {
  no-marker-list-helper(body)
}
