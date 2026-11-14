#import "../TUBAF_typst_template/tubaf_template.typ" as tubaf

#show: tubaf.report.with(
  type: "Belegarbeit",
  subtitle: "Konzeption Innovativer Mechatronischer Systeme",
  title: "Entwicklung eines Gewichtskraftssensors zur Verbesserung der dynamischen Kraftunterstützung eines Exoskeletts",
  authors: ((
    name: "Ben Weckend",
    studentID: "67551",
  ),(
    name: "Martin Werner",
    studentID: "67641"
  )),
  supervisors: ((
    title: "Univ.-Prof. Dr.-Ing.",
    name: "Robert Weidner",
  ),),
  examiners: ((
    title: "Univ.-Prof. Dr.-Ing.",
    name: "Robert Weidner",
  ),),
  lang: "de",
  decl_authenticity: false,
  images_outlined: true,
  tables_outlined: false,
  //references: "../doc/references.bib"
)

= Planen
- Situation analysieren
- Ziele formulieren
$->$ Anforderungsliste

= Konzipieren
- Lösungsalternativen suchen
- Lösung auswählen
$->$ Wirk-/Funktionsstruktur

Morphologischer Kasten

#figure(
  table(
    columns: 7,
    fill: (x,y) => if x == 0 or y == 0 { color.gray.lighten(70%) } else {color.white },
    align: center + horizon,
  )[
    #align(right)[Wirkprinzip]
    #align(left)[Funktion]
  ][1][2][3][4][5][6][#table.cell(rowspan: 2)[Sensor\ (Messwert\ aufnehmen)]][#table.cell(rowspan: 2)[Piezoelement]][#table.cell(rowspan: 2)[druckempfindliche Folie als Widerstand]][#table.cell(colspan: 4)[Feder / Gummisohle \ (Hilfsgröße: mechanische Verformung)]][
    Potentiometer][Induktiver Sensor][Kapazitiver Sensor][DMS][
  Messwert\ umformen][Spannungsteiler][Viertelbrücke][Halbbrücke][Vollbrücke][][][
  Messwert\ wandeln][ADC\ separates Bauteil][ADC separater Microcontroller][ADC\ interner Raspberry][][][][
  Signal\ verarbeiten][reine Linearisierung][maschinelles Lernen][Spektrografische Analyse][][][][
  Unterstützung umsetzen][Kraftregelung pneumatisches Exoskelett][Umrechnung für elektrisches Exoskelett][][][][]
  ,
  caption: "Morphologischer Kasten"
)

= Entwerfen
$->$ maßstäblicher Entwurf

= Ausarbeiten
$->$ Ausführungsunterlagen
