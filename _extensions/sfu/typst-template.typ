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

#let article(
  title: none,
  subtitle: none,
  authors: none,
  date: none,
  abstract: none,
  abstract-title: none,
  cols: 1,
  margin: (x: 1.25in, y: 1.25in),
  paper: "us-letter",
  lang: "en",
  font: "Inter 18pt",
  region: "US",
  size: 16pt,
  title-size: 4em,
  subtitle-size: 2em,
  heading-font: "Yrsa",
  heading-family: "Yrsa",
  heading-weight: "bold",
  heading-style: "normal",
  heading-color: sfu-red,
  heading-line-height: 0.65em,
  sectionnumbering: none,
  pagenumbering: "1",
  toc: false,
  toc_title: none,
  toc_depth: none,
  toc_indent: 1.5em,
  doc,
) = {
  set page(
    paper: paper,
    margin: margin,
    numbering: pagenumbering,
  )
  set par(justify: true, leading: 1.2em, spacing: 2em)
  set text(lang: lang,
           font: font,
           size: 15pt,
           region: region,
           fill: sfu-gray,
           bottom-edge: 0.65em
          )
  set heading(numbering: sectionnumbering)
  show heading.where(level: 1): it => text(fill: heading-color, it)
  if title != none {
    align(center)[#block(inset: 2em)[
      #set par(leading: heading-line-height)
      #if (heading-family != none or heading-weight != "bold" or heading-style != "normal"
           or heading-color != black) {
        set text(font: heading-family, weight: heading-weight, style: heading-style, fill: heading-color)
        text(size: title-size)[#title]
        if subtitle != none {
          parbreak()
          text(size: subtitle-size)[#subtitle]
        }
      } else {
        text(weight: "bold", size: title-size, fill: heading-color)[#title]
        if subtitle != none {
          parbreak()
          text(weight: "bold", size: subtitle-size, fill: heading-color)[#subtitle]
        } 
      }
    ]]
  }

  if authors != none {
    let count = authors.len()
    let ncols = calc.min(count, 3)
    grid(
      columns: (1fr,) * ncols,
      row-gutter: 1.5em,
      ..authors.map(author =>
          align(center)[
            #author.name \
            #author.affiliation \
            #author.email
          ]
      )
    )
  }

  if date != none {
    align(center)[#block(inset: 1em)[
      #date
    ]]
  }

  if abstract != none {
    block(inset: 2em)[
    #text(weight: "semibold")[#abstract-title] #h(1em) #abstract
    ]
  }

  if toc {
    let title = if toc_title == none {
      auto
    } else {
      toc_title
    }
    block(above: 0em, below: 2em)[
    #outline(
      title: toc_title,
      depth: toc_depth,
      indent: toc_indent
    );
    ]
  }

  if cols == 1 {
    doc
  } else {
    columns(cols, doc)
  }
}

#set table(
  inset: 6pt,
  stroke: none
)

#import "@preview/cheq:0.3.0": checklist

#show heading.where(level: 1): set block(below: 1.5em)
#show heading.where(level: 3): set text(weight: "medium")
#show line: set block(below: 2.5em)

