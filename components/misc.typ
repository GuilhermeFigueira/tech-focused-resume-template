
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
