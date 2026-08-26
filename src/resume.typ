#import "components/header.typ": contact-info, default-contact-info, header
#import "components/education.typ": edu
#import "components/work.typ": work
#import "components/project.typ": project
#import "components/misc.typ": certificates, extracurriculars, skills-line
#import "helpers.typ": *

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
  author: (
    name: "",
    headline: "",
    position: left,
    font-size: 20pt,
  ),
  header-info: (
    style: "row",
    contact: (
      show-icons: false,
      show-sensitive-info: true,
      position: left,
      gap: 0.2pt,
      info: default-contact-info,
    ),
  ),
  style: (
    accent-color: "#000000",
    font: "Calibri",
    paper: "us-letter",
    font-size: 10pt,
  ),
  config: (
    lang: "pt",
    region: "br",
  ),
  body,
) = {
  // Sets document metadata
  set document(author: author.name, title: author.name)

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

  // Reccomended to have 0.5in margin on all sides
  set page(
    margin: (
      top: 0.3in,
      bottom: 0.3in,
      left: 0.4in,
      right: 0.5in,
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

  // Name will be aligned left, bold and big
  show heading.where(level: 1): it => [
    #set align(author.position)
    #set text(
      weight: 700,
      size: author.font-size,
    )
    #pad(it.body)
  ]

  // Small caps for section titles
  show heading.where(level: 2): it => [
    #pad(top: 0pt, bottom: -10pt, [#smallcaps(it.body)])
    #line(length: 100%, stroke: 1pt)
  ]

  // Header

  header(
    config: header-info,
    author: author,
    font-size: style.font-size,
  )

  // Main body.
  set par(justify: true)
  body
}


