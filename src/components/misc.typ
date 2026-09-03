
#let certificates(
  name: "",
  issuer: "",
  url: "",
  date: "",
) = {
  [
    *#name*, #issuer
    #if url != "" {
      [
        (#link("https://" + url)[#url])
      ]
    }
    #h(1fr) #date
  ]
}

#let extracurriculars(
  activity: "",
  dates: "",
) = {
  generic-one-by-two(
    left: strong(activity),
    right: dates,
  )
}

#let skills-line(label, items) = {
  // [*#label*: #items.join([ #sym.dot.c ])]
  [
    *#label*: #items.join([, ])
  ]
}

#let skills(body) = {
  if body != [] {
    set par(leading: 0.6em)
    set list(
      marker: [],
    )
    body
  }
}

#let languages(body) = {
  set par(leading: 0.6em)
  set list(
    marker: [],
  )
  body
}
