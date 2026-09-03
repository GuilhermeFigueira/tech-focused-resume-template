#import "../layout.typ": body-helper, generic-one-by-two, generic-two-by-two
#import "../utils.typ": link-helper, text-with-icon

#let project-title-line(
  name: "",
  tagline: "",
  role: "",
  link: "",
) = {
  if role == "" [
    *#name*
    #if tagline != "" [
      *— #tagline*
    ]
  ] else [
    *#role*, #name
    #if tagline != "" [
      — #tagline
    ]
  ]
}

#let project(
  name: "",
  tagline: "",
  role: "",
  url: "",
  dates: "",
  relation: "",
  relation-type: "",
  body,
) = {
  if url != "" {
    name = link(url)[#name]
  }

  if relation == "" {
    generic-one-by-two(
      project-title-line(
        name: name,
        tagline: tagline,
        role: role,
      ),
      [*#dates*],
    )
  } else {
    generic-two-by-two(
      top-left: [
        #project-title-line(
          name: name,
          tagline: tagline,
          role: role,
        )
      ],
      top-right: [
        *#dates*
      ],
      bottom-left: [
        #emph(relation-type) - #emph(relation)
      ],
    )
  }
  body-helper(body)
}
