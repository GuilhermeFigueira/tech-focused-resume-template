#import "../helpers.typ": generic-one-by-two, generic-two-by-two, link-helper, text-with-icon

#let project-title-line(
  name: "",
  tagline: "",
  role: "",
  dates: "",
) = {
  if role == "" {
    [
      *#name*
      #if tagline != "" [
        *— #tagline*
      ]
    ]
  } else {
    [
      *#role*, #name
      #if tagline != "" [
        — #tagline
      ]
    ]
  }
}

#let project(
  name: "",
  tagline: "",
  role: "",
  show-url: false,
  url: (
    prefix: "",
    value: "",
    icon: "",
  ),
  dates: "",
  relation: "",
  relation-type: "",
  body,
) = {
  let project-link = link-helper(
    link-type: "https://",
    prefix: url.prefix,
    value: url.value,
    show-prefix: true,
  )

  if relation == "" {
    generic-one-by-two(
      left: [
        #project-title-line(
          name: name,
          tagline: tagline,
          dates: dates,
          role: role,
        )
        #if show-url and dates != "" [
          #project-link
        ]
      ],
      right: {
        if dates == "" and show-url {
          project-link
        } else {
          dates
        }
      },
    )
  } else {
    generic-two-by-two(
      top-left: [
        #project-title-line(
          name: name,
          tagline: tagline,
          dates: dates,
          role: role,
        )
        #if show-url and dates != "" [
          #project-link
        ]
      ],
      top-right: {
        if dates == "" and show-url {
          project-link
        } else {
          dates
        }
      },
      bottom-left: {
        [
          #emph(relation-type) - #emph(relation)
        ]
      },
    )
  }
  body
}
