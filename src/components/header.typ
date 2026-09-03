#import "../utils.typ": link-helper, text-with-icon

// Contact

#let contact-item(
  value,
  prefix: "",
  link-type: "",
  icon-name: none,
  show-icons: false,
) = {
  if value != "" {
    let content = if link-type != "" {
      link-helper(
        link-type: link-type,
        prefix: prefix,
        value: value,
        show-prefix: not show-icons,
      )
    } else {
      value
    }

    if icon-name != none and show-icons {
      text-with-icon(icon-name: icon-name)[#content]
    } else {
      content
    }
  }
}

#let contact-fields = (
  (key: "phone", icon: "phone", sensitive: true),
  (key: "location", icon: "location", sensitive: true),
  (key: "email", icon: "envelope", link-type: "mailto:", sensitive: false),
  (key: "github", icon: "github", link-type: "https://", prefix: "github.com/", sensitive: false),
  (key: "linkedin", icon: "linkedin", link-type: "https://", prefix: "linkedin.com/in/", sensitive: false),
  (key: "personal-site", icon: "link", link-type: "https://", sensitive: false),
)

#let default-contact-info = {
  let d = (:)
  for f in contact-fields {
    d.insert(f.key, "")
  }
  d
}

#let contact-info(
  config: (
    show-icons: false,
    show-sensitive-info: true,
    position: left,
    gap: 0.2em,
    info: default-contact-info,
  ),
) = {
  let build-item(field) = contact-item(
    config.info.at(field.key, default: ""),
    prefix: field.at("prefix", default: ""),
    link-type: field.at("link-type", default: ""),
    icon-name: field.icon,
    show-icons: config.show-icons,
  )

  let fields = if config.show-sensitive-info {
    contact-fields
  } else {
    contact-fields.filter(f => not f.sensitive)
  }

  let items = fields.map(build-item).filter(x => x != none)

  if config.position == horizon {
    items.map(x => [#x]).join([#h(1fr) #sym.dot.c #h(1fr)])
  } else {
    align(config.position)[
      #items.join(
        [
          #h(config.gap)
          #sym.dot.c
          #h(config.gap)
        ],
      )
    ]
  }
}

#let author-title(
  author: (
    name: "",
    position: left,
    headline: "",
    uppercase: false,
  ),
  font-size: 10pt,
) = align(author.position, {
  let name = text(
    weight: "extrabold",
    size: font-size + 12pt,
  )[#author.name]

  let headline = author.headline

  if author.uppercase {
    name = upper(name)
    headline = upper(headline)
  }
  name
  if author.headline != "" {
    v(-1.8em)
    text(
      size: font-size * 1.5,
      headline,
    )
  }
})


// Header


#let header(
  config: (
    style: "row",
    contact: (
      show-icons: false,
      show-sensitive-info: true,
      position: left,
      gap: 0.2em,
      info: default-contact-info,
    ),
    author: (
      name: "",
      position: left,
      headline: "",
    ),
  ),
  font-size: 10pt,
) = {
  assert(
    config.style in ("row", "column"),
    message: "header style must be \"row\" or \"column\", received: " + repr(config.style),
  )

  assert(
    config.contact.position in (left, right, center, horizon),
    message: "contact info position must be \"left\", \"right\", \"center\", or \"horizon\", received: "
      + repr(config.style),
  )

  assert(
    config.author.position in (left, right, center),
    message: "author info position must be \"left\", \"right\", or \"center\" received: " + repr(config.style),
  )

  if config.style == "row" {
    stack(
      spacing: 1em,
      author-title(author: config.author, font-size: font-size),
      contact-info(config: config.contact),
    )
    v(-1em)
  } else {
    grid(
      columns: (1fr, 1fr),
      align: horizon,
      author-title(author: config.author, font-size: font-size), contact-info(config: config.contact),
    )
    v(-0.5em)
  }
}
