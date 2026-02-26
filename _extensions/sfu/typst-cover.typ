#let sfu-red = cmyk(0%, 85%, 72%, 35%)
#let sfu-light-red = cmyk(0%, 97%, 75%, 20%)
#let sfu-light-gray = cmyk(0%, 0%, 0%, 4%)
#let sfu-gray = cmyk(7%, 2%, 0%, 65%)
#let sfu-dark = cmyk(0%, 0%, 0%, 100%)

// #import "@preview/markly:0.4.0"

// #let markly-context = markly.setup(
//   stock-width:5.5in,
//   stock-height:8.5in,

//   bleed: 0.125in
// )

// #show: markly.page-setup.with(markly-context)

#let title-page(title:[], authors: [], body) = {
  set page(
    paper: "us-letter", // replace it with correct size of 5.5in x 8.5in
    // width: 5.5in,
    // height: 8.5in,
    fill: sfu-red,
    margin: (top: 1.5in, rest: 2in),
    numbering: none,
    background: place(top + center, float: true, dx: 0mm,
      figure(image("../../assets/sky.jpg", fit: "stretch", height: 53%, width: 100%),)
    )
  )
  place(top + left, float: true, dx: -55mm,
    figure(image("../../assets/logo/sfu-logo.png", width: 2in),)
  )
  
  align(horizon + left)[
    #set par(leading: 2em)
    #text(font: "Inter 18pt", fill: sfu-light-gray, size: 45pt, weight: "bold", title)\
    #v(2em)
    #text(font: "Yrsa", size: 20pt, fill: sfu-light-gray, style: "italic", authors)
  ]
  
  body
}

#let license-page(body) = {
  set page(paper: "us-letter", fill: white, margin: (top: 1.5in, rest: 2in),
    numbering: "1",
    background: none
  )
  figure(placement: top,
  image("../../assets/logo/sfu-logo.png", width: 1.5in),)
  set text(font: "Inter 18pt", size: 14pt, fill: sfu-gray)  
  
  "© [2026] [Simon Fraser University - Open Scholarship Initiative].

This work is licensed under a Creative Commons Attribution 4.0 International License (CC BY 4.0). You are free to share and adapt this work for any purpose, even commercially, provided you give appropriate credit, indicate if changes were made, and do not imply the author’s endorsement. For full license details, see \nhttps://creativecommons.org/licenses/by/4.0/."
v(5em)
set align(center)
set text(font: "Inter 18pt", style: "italic", size: 14pt, fill: sfu-gray)
"The Open Scholarship Initiative appreciates and recognizes the contribution of its community champions to this product. Thank you! ♥️"
pagebreak()
v(5em)
set align(top + left)
  set text(font: "Inter 18pt", style: "normal", size: 14pt, fill: sfu-gray)  
  "This booklet belongs to:"
v(1em)
line(length: 100%)
pagebreak()
  set page(fill: none, margin: auto)
  align(horizon, outline(indent: auto))
  
  body
}


#show: body => title-page(
  title: [#highlight(fill: sfu-red, bottom-edge: "descender", top-edge: "ascender", extent: 10pt)[Open \ Scholarship \ Starter Plan]],
  authors: [SFU Open Scholarship Initiative],
  body
)

#show: body => license-page(
  body
)