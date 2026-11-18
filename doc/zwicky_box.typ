#let zwicky_box() = {
  set text(font: "Arial", size: 10pt, bottom-edge: "descender", top-edge: "cap-height")
  set par(justify: true, leading: .5em)   // 1.5 line spacing

  table(
    columns: 7,
    fill: (x,y) => if x == 0 or y == 0 { color.gray.lighten(70%) } else {color.white },
    align: center + horizon,
  )[
    #align(right)[Wirkprinzip]
    #align(left)[Funktion]
  ][1][2][3][4][5][6][#table.cell(rowspan: 2)[Sensor\ (Messwert aufnehmen)]][#table.cell(rowspan: 2)[Piezoelement]][#table.cell(rowspan: 2)[druckempfindliche Folie als\ Widerstand]][#table.cell(colspan: 4)[Feder / Gummisohle \ (Hilfsgröße: mechanische Verformung)]][
    Potentiometer][Induktiver Sensor][Kapazitiver Sensor][DMS][
  Messwert\ umformen][Spannungsteiler][Viertelbrücke][Halbbrücke][Vollbrücke][][][
  Messwert\ wandeln][ADC\ separates Bauteil][ADC\ separater Microcontroller][ADC\ interner Raspberry][][][][
  Signal\ verarbeiten][reine Linearisierung][maschinelles Lernen][Spektrografische Analyse][][][][
  Unterstützung umsetzen][Kraftregelung pneumatisches Exoskelett][Umrechnung für nur elektrisches Exoskelett][][][][]
}
