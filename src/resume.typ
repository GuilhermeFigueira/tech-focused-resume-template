#import "components/header.typ": contact-info, default-contact-info, header

/*
 * Lines that start with == are formatted into section headings
 * You can use the specific formatting functions if needed
 * The following formatting functions are listed below
 * #edu(dates: "", degree: "", gpa: "", institution: "", location: "", consistent: false)
 * #work(company: "", dates: "", location: "", title: "")
 * #project(dates: "", name: "", role: "", url: "")
 * certificates(name: "", issuer: "", url: "", date: "")
 * #extracurriculars(activity: "", dates: "")
 * There are also the following generic functions that don't apply any formatting
 * #generic-two-by-two(top-left: "", top-right: "", bottom-left: "", bottom-right: "")
 * #generic-one-by-two(left: "", right: "")
 */
#let resume(
  header-info: (
    style: "row",
    contact: (
      show-icons: false,
      show-sensitive-info: true,
      position: left,
      gap: 0.2em,
      info: default-contact-info,
    ),
    author: (
      name: str,
      headline: str,
      position: left,
      uppercase: false,
    ),
  ),
  style: (
    accent-color: "#000000",
    font: "Calibri",
    paper: "us-letter",
    font-size: 10pt,
    margin: (
      top: 0.3in,
      bottom: 0.3in,
      left: 0.4in,
      right: 0.5in,
    ),
  ),
  config: (
    lang: "en",
    region: "us",
  ),
  document-metadata: (
    title: "",
    description: "",
    keywords: "cv",
  ),
  body,
) = {
  // resume-config.update(cfg => (
  //   cfg
  //     + (
  //       section-spacing: style.section-spacing,
  //       accent-color: style.accent-color,
  //       font-size: style.font-size,
  //     )
  // ))

  // Sets document metadata
  set document(
    author: header-info.author.name,
    title: document-metadata.title,
    keywords: document-metadata.keywords,
    description: document-metadata.description,
    date: none,
  )

  // Document-wide formatting, including font and margins
  set text(
    // LaTeX style font
    font: style.font,
    size: style.font-size,
    lang: config.lang,
    region: config.region,
    // Disable ligatures so ATS systems do not get confused when parsing fonts.
    ligatures: false,
  )

  set page(
    margin: (
      top: style.margin.top,
      bottom: style.margin.bottom,
      right: style.margin.right,
      left: style.margin.left,
    ),
    paper: style.paper,
  )

  // Link styles
  show link: underline
  show link: set text(fill: rgb("#0645AD"))

  // Accent Color Styling
  show heading: set text(
    fill: rgb(style.accent-color),
  )

  // Small caps for section titles
  show heading.where(
    level: 1,
  ): it => block[
    #set text(style.font-size + 2pt, weight: "bold")
    #smallcaps(it.body)
    #v(-1em)
    #line(length: 100%, stroke: stroke(thickness: 0.4pt))
  ]
  // show heading.where(level: 1): it => block[
  //   #pad(top: 0pt, bottom: -10pt, [#smallcaps(it.body)])
  //   #line(length: 100%, stroke: 1pt)
  // ]

  // Header
  header(
    config: header-info,
    font-size: style.font-size,
  )

  // Main body.
  set par(justify: true)
  body
}


