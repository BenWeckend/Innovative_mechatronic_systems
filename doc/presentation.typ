#import "/TUBAF_typst_template/tubaf_template.typ" as tubaf
#import "zwicky_box.typ": zwicky_box


///////////
// colors
///////////

#let uni = tubaf.colors.Uniblau
#let navy = tubaf.colors.Dunkelblau
#let tint = rgb("#EDF5FA")
#let light = rgb("#F7F9FC")
#let edge = rgb("#D2DFEA")
#let dark = rgb("#253C52")
#let muted = rgb("#506879")
#let warm = rgb("#F8F1DE")



////////////
// helpers  
//////////// 

#let card(title, body, bg: white, height: auto) = block(
  width: 100%, height: height, fill: bg,
  stroke: (paint: edge, thickness: 0.8pt), radius: 5pt,
  inset: (x: 16pt, y: 14pt),
)[
  #text(size: 17pt, weight: "bold", fill: navy)[#title]
  #v(7pt)
  #text(size: 13.8pt, fill: dark)[#body]
]

#let mini(label, description, bg: tint) = block(
  width: 100%, fill: bg, radius: 4pt, inset: (x: 13pt, y: 10pt),
)[
  #text(size: 13pt, weight: "bold", fill: navy)[#label]
  #v(5pt)
  #text(size: 12.5pt, fill: dark)[#description]
]

#let strip(body, bg: tint) = block(
  width: 100%, fill: bg,
  stroke: (left: 4pt + uni),
  inset: (x: 16pt, y: 12pt),
)[
  #text(size: 14.5pt, fill: dark)[#body]
]

#let layer(label, color) = block(
  width: 100%, fill: color, radius: 3pt,
  inset: (x: 13pt, y: 6pt), below: 2mm
)[#text(size: 13pt, weight: "semibold", fill: navy)[#label]]

#let flow-item(n, title, detail, bg: light) = block(
  width: 100%, height: 40mm, fill: bg, radius: 5pt,
  stroke: (paint: edge, thickness: 0.8pt), inset: 11pt,
)[#align(top)[
  #text(size: 12pt, weight: "bold", fill: uni)[#n] \
  #text(size: 16pt, weight: "bold", fill: navy)[#title]
  #v(0pt)
  #text(size: 11.8pt, fill: dark)[#detail]
]]



/////////////
// template  
/////////////

#show: tubaf.presentation.with(
  title: "Exoskelette: Gewichtssensitive Kraftunterstützung",
  subtitle: "Projektidee: drucksensitive Sohlen als zusätzliche
Informationsquelle für die Regelung",
  author: "Martin Werner & Ben Weckend",
  bottom-text: [Konzeption Innovativer Mechatronischer Systeme · Konzeptvorstellung\ Ben Weckend & Martin Werner],
  lang: "de",
)



////////////
// content  
//////////// 

// Problemstellung 1
= Was fehlt bisherigen Unterstützungsmodi?

#grid(
  columns: (1fr, 1fr, 1fr), column-gutter: 9mm,
  [#card("Konstante Kraft", [
    Die Unterstützung bleibt bestehen, auch dann, wenn ein zuvor getragenes Objekt bereits abgelegt wurde.
  ], height: 73mm)],
  [#card("Bewegung erkennen", [
    Gelenkwinkel zeigen, _wie_ sich der Mensch bewegt, aber nicht unmittelbar, _welche Zusatzlast_ er trägt.
  ], height: 73mm)],
  [#card("Manuell umschalten", [
    Die Wahl einer Unterstützungsstufe während der Arbeit erfordert Aufmerksamkeit und gegebenenfalls eine freie Hand.
  ], height: 73mm)],
)

#strip([*Problem:* Die Unterstützungsstärke ist nur schwach mit der tatsächlich auftretenden Belastung gekoppelt.])


// Problemstellung 2
= Wie soll die Unterstützung reagieren?

#align(center)[#image("images/signal.svg", width: 100%, height: 60mm, fit: "contain")]
#grid(
  columns: (1fr, 1fr, 1fr), column-gutter: 8mm,
  [#mini("Ohne Objekt", [Geringe bzw. keine zusätzliche Lastunterstützung.])],
  [#mini("Objekt aufgenommen", [Höhere Unterstützung, solange die Zusatzlast anliegt.])],
  [#mini("Objekt abgestellt", [Kraftunterstützung wird wieder reduziert.])],
)
#text(size: 12pt, fill: muted)[Schematischer Signalverlauf: noch keine Messdaten. Dynamische Einflüsse müssen experimentell untersucht werden.]


// abgeleitete Ziele
= Unser Ziel: Hilfe nur dann, wenn sie benötigt wird

#grid(
  columns: (1fr, 1fr, 1fr), column-gutter: 9mm,
  [#card("Intuitiv", [
    Die Kraftunterstützung soll sich ohne manuelles Nachregeln an wechselnde Aufgaben anpassen.
  ], bg: tint, height: 60mm)],
  [#card("Energieeffizient", [
    Unnötige oder zu hohe Unterstützung soll vermieden werden. Das könnte den Energieverbrauch senken.
  ], bg: tint, height: 60mm)],
  [#card("Komfortabel", [
    Weniger Gegenarbeiten gegen das Exoskelett; bei pneumatischem Antrieb eventuell weniger Pumpengeräusche.
  ], bg: tint, height: 60mm)],
)

#strip([*Leitidee:* Zusätzliche Gewichtsbelastung erfassen und als weitere Eingangsgröße der Regelung verwenden.], bg: warm)


// Lösungsansatz
= Grundidee: Differenz der Sohlenbelastung auswerten

#grid(
  columns: (1fr, 0.09fr, 1fr, 0.09fr, 1fr),
  column-gutter: 2mm,
  align: horizon,
  [#flow-item("01", "Referenz", [
    Druckverteilung von Mensch + Exoskelett ohne Objekt erfassen.
  ])],
  [#align(center)[#text(size: 28pt, fill: uni)[→]]],
  [#flow-item("02", "Laständerung", [
    Drucksignale bei zusätzlichem Objekt mit der Referenz vergleichen.
  ], bg: tint)],
  [#align(center)[#text(size: 28pt, fill: uni)[→]]],
  [#flow-item("03", "Unterstützung", [
    Aus der geschätzten Last einen bedarfsgerechten Kraftsollwert ableiten.
  ])],
)

#grid(
  columns: (1fr, 1fr), column-gutter: 9mm,
  [#mini("Einfacher Versuch", [Im Stand ist eine zusätzliche Last eher erkennbar als bei dynamischen Bewegungen.])],
  [#mini("Zentrale Schwierigkeit", [Schritte, Beschleunigung und Gewichtsverlagerung verändern die Bodendrucksignale.], bg: warm)],
)
#v(5mm)
#text(size: 12.2pt, fill: muted)[Wichtig: Bodenreaktionskraft ist nicht unmittelbar identisch mit dem Gewicht des getragenen Objekts.]


// Konzeption 1
= Morphologischer Kasten
#{
  set table(inset: (y: 3mm))
  zwicky_box()
}

= Morphologischer Kasten
#{
  set table(inset: (y: 3mm))
  
  show table.cell: it => {
    if (it.x == 2 and it.y == 1) or (
        it.x == 1 and it.y == 3) or (
        it.x == 2 and it.y == 4) or (
        it.x == 3 and it.y == 5) or (
        it.x == 2 and it.y == 6) {
      text(weight: "bold", style: "italic", fill: red.darken(20%))[#it]
    } else { it }
  }

  zwicky_box()
}


// Konzeption 2
= Aufbau: drucksensitive Untersohle

#grid(
  columns: (2fr, 3fr), column-gutter: 15mm,
  align(center)[
    #text(size: 16pt, weight: "bold", fill: navy)[Materialkonzept\ (von oben nach unten)]
    #v(1fr)
    #layer("Starre Trägerschicht", rgb("#ECF2F6"))
    #layer("Kupferfolie · obere Elektrode", rgb("#CDE3F3"))
    #layer("Velostat / Linqstat · drucksensitive Folie", rgb("#A9CEE7"))
    #layer("Kupferfolie · untere Elektrode", rgb("#CDE3F3"))
    #layer("Schützende Abschlussschicht", rgb("#ECF2F6"))
    #v(1fr)
    #text(size: 13pt, fill: dark)[*Alternative:* Einzelne FSR-Drucksensoren statt einer großflächigen Folienmatrix.]
    #v(1cm)
  ],
  align(center)[
    #image("images/exo_sole.svg", width: 100%, fit: "contain")
  ],
)

#grid(
  columns: (1.0fr, 1.03fr), column-gutter: 12mm,
  [
    #align(center)[#image("images/Kupfer.jpg", width: 100%, height: 91mm, fit: "contain")]
  ],
  [
    #align(center)[#image("images/Velostat.jpg", width: 100%, height: 91mm, fit: "contain")]
  ],
)


// Konzeption 3
= Vom Sensor zur Kraftvorgabe

#grid(
  columns: (1fr, 1fr, 1fr, 1fr), column-gutter: 6mm,
  [#flow-item("01", "Druck", [
    Änderung des elektrischen Widerstands
  ])],
  [#flow-item("02", "Messung", [
    Spannungsteiler und A/D-Wandlung
  ])],
  [#flow-item("03", "Auswertung", [
    Kalibrieren, Filtern, Zusatzlast schätzen
  ], bg: tint)],
  [#flow-item("04", "Regelung", [
    Unterstützung anpassen
  ])],
)
#v(9mm)
#grid(
  columns: (1fr, 1fr), column-gutter: 9mm,
  [#card("Mögliche Hardware", [
    Arduino Nano / Nucleo für Messwerterfassung, Raspberry Pi für höhere Auswertung und ggf. CAN zur Kommunikation.
  ], height: 50mm)],
  [#card("Zusätzliche Messgrößen", [
    Gelenkwinkel und ggf. IMU helfen, Stehen, Gehen und Heben zu unterscheiden.
  ], height: 50mm)],
)
#v(5mm)


// Ausblick Entwurf / Umsetzung
= Nächste _Schritte_
#grid(
  columns: (1fr, 1fr, 1fr), column-gutter: 9mm,
  [#card("1 · Sensor prüfen", [
    Ein Exemplar des Sensor mit Velostat-Folie bauen und testen. 
  ], height: 50mm)],
  [#card("2 · Sohle integrieren", [
    Messzonen festlegen, Elektronik anbinden und mit bekannten Zusatzlasten kalibrieren.
  ], height: 50mm)],
  [#card("3 · Im Einsatz testen", [
    Heben, Tragen, Gehen und Ablegen messen; Zusatzlast von Bewegungseinflüssen trennen.
  ], height: 50mm)],
)
#v(5mm)
#strip([*Fazit:* Eine einfache, fußnahe Sensorergänzung könnte eine spürbar bedarfsgerechtere Exoskelett-Unterstützung ermöglichen.])