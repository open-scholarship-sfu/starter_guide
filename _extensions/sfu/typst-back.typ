#let sfu-red = cmyk(0%, 85%, 72%, 35%)
#let sfu-light-red = cmyk(0%, 97%, 75%, 20%)
#let sfu-light-gray = cmyk(0%, 0%, 0%, 4%)
#let sfu-gray = cmyk(7%, 2%, 0%, 65%)
#let sfu-dark = cmyk(0%, 0%, 0%, 100%)

// #import "@preview/markly:0.4.0"

// #let markly-context = markly.setup(
//   stock-width:5.5in,
//   stock-height:8.5in,

//   bleed: 0.125in,
//   content-width: 4in,
//   content-height:3in,
// )

// #show: markly.page-setup.with(markly-context)

#let back-page(body) = {
  set page(
    paper: "us-letter", // replace it with correct size of 5.5in x 8.5in
    fill: sfu-red,
    margin: (top: 1.5in, rest: 2in),
    numbering: none,
  )
  place(bottom + center,
  grid(
    columns: (50%, 50%),
    rows: (auto),
    gutter: 30pt, 
    row-gutter: 50pt,
    align: horizon,
    grid.cell(
      colspan: 2,
        text("The Open Scholarship Initiative is supported by:", size: 13pt, fill: sfu-light-gray, bottom-edge: "descender", weight: "bold"),  
    ),
    grid.cell(
      colspan: 1,
      image("../../assets/logo/SFU_horizontal_black.png", width: 100%),
    ),
    grid.cell(
      colspan: 1,
      image("../../assets/logo/TOSI-Rev_TOSI-Logo-Eng-v2 White.png", width: 100%),
    ),
))

}

#show: body => back-page(
  body
)