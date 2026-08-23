#import "../helpers.typ": generic-two-by-two

#let work(
  title: "",
  tech-stack: "",
  dates: "",
  company: "",
  modality: "",
  location: "",
  body,
) = {
  generic-two-by-two(
    top-left: strong(company),
    top-right: dates,
    bottom-left: {
      [
        #emph(title)
        #if stack != "" [
          | #emph(tech-stack)
        ]
      ]
    },
    bottom-right: [
      #modality $dash.em$ #location
    ],
  )
  body
}
