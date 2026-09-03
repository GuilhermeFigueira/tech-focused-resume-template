// #let resume-config = state("resume-config", (
//   section-spacing: -0.5em,
//   accent-color: "#000000",
//   font-size: 10pt,
// ))

// Cannot just use normal --- ligature becuase ligatures are disabled for good reasons
#let dates-helper(
  start-date: "",
  end-date: "",
) = {
  start-date + " " + sym.dash.em + " " + end-date
}


#let section(title, spacing-between: -0.5em, body) = {
  [= #title]
  pad(left: 1.4em, body)
  v(spacing-between)
}

// components/misc.typ (ou onde preferir centralizar layout helpers)

#let grid-section(
  columns: (1fr, 1fr),
  gutter: 2.5em,
  sections: (),
) = {
  v(2em, weak: true)
  grid(
    columns: columns,
    gutter: gutter,
    ..sections
  )
}

// Generic two by two component for resume
#let generic-two-by-two(
  top-left: "",
  top-right: "",
  bottom-left: "",
  bottom-right: "",
) = {
  grid(
    columns: (1fr, 1fr),
    align(left)[#top-left \ #bottom-left], align(right)[#top-right \ #bottom-right],
  )
  v(-0.2em)
}
// Generic one by two component for resume
#let generic-one-by-two(
  first,
  second,
) = {
  grid(
    columns: (1fr, 1fr),
    align(left, first), align(right, second),
  )
  v(-0.2em)
}

#let link-helper(
  link-type: "",
  prefix: "",
  value: "",
  show-prefix: true,
) = {
  box[
    #link(link-type + prefix + value)[
      #if show-prefix [#prefix]#value
    ]
  ]
}

#let text-with-icon(icon-name: "", content) = {
  let img = image("icons/" + icon-name + ".svg")
  box[
    #box(img, height: 1.2em, baseline: 0.25em)
    #content
  ]
}

#let body-helper(body, padding: true) = {
  if body != [] {
    v(-0.4em)
    set list(indent: 0.25em)
    pad(left: if padding { 1.5em } else { 0em }, body)
  }
}
