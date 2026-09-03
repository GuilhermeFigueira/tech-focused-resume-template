#import "../helpers.typ": body-helper, generic-one-by-two, generic-two-by-two

#let edu(
  institution: "",
  dates: "",
  degree: "",
  gpa: "",
  location: "",
  // Makes dates on upper right like rest of components
  body,
) = {
  generic-two-by-two(
    top-left: strong(institution),
    top-right: strong(dates),
    bottom-left: emph(degree),
    bottom-right: emph(location),
  )
  body-helper(body, padding: false)
}
