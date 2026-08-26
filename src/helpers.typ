// Cannot just use normal --- ligature becuase ligatures are disabled for good reasons
#let dates-helper(
  start-date: "",
  end-date: "",
) = {
  start-date + " " + sym.dash.em + " " + end-date
}

#let section(title, spacing-between: -0.5em, body) = {
  [== #title]
  body
  v(spacing-between)
}

// Generic two by two component for resume
#let generic-two-by-two(
  top-left: "",
  top-right: "",
  bottom-left: "",
  bottom-right: "",
) = {
  [
    #top-left #h(1fr) #top-right \
    #bottom-left #h(1fr) #bottom-right
    #linebreak()
  ]
}
// Generic one by two component for resume
#let generic-one-by-two(
  left: "",
  right: "",
) = {
  [
    #left #h(1fr) #right
    #linebreak()
  ]
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
