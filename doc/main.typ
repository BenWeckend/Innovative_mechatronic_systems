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
  tables_outlined: true,
  //references: "../doc/references.bib"
)



= Planen
== Situation analysieren
In vielen Berufsfeldern führen Menschen körperlich anspruchsvolle Arbeiten aus, bei welchen sie teilweise durch Mechatronische System, wie zum Beispiel Exoskelette, unterstützt werden können. Dabei besteht einerseits die Frage, wie mechanische Aktuatoren geeignet am/ beziehungsweise um den Menschen angeordnet werden. Andererseits stellt sich die Frage, wie die Aktuatoren angesteuert werden müssen um tatsächlich eine Unterstützung des Menschen in seinen Aufgaben zu bewerkstelligen, ohne als Einschränkung oder Behinderung wahrgenommen zu werden.

Die uns im Rahmen des Moduls vorgestellten Exoskelette verfügen über verschiedene Modi zur Kraftunterstützung: Der erste Modus ist jener welche eine konstante Unterstützungskraft aufbringt. Dies ist selbstverständlich der einzige Modus für ein passives Exoskelett. Bei dem aktiven Exoskelett kann die Höhe dieser Unterstützungskraft noch vom Nutzer eingestellt werden, die Bedienung hierfür benötigt jedoch eine \"freie Hand\" und kann daher schlecht inmitten bestimmter Arbeitsschritte erfolgen. Die anderen Modi passen ihre Unterstützung an basierend auf Messungen der Winkelstellung in den einzelnen Gelenken. So kann zum Beispiel eine Aufwärtsbewegung erkannt werden zur Hilfe beim Anheben von schweren Objekten, beziehungsweise das Gegenteil zum Absenken.

Die Herausforderung ist hierbei immer ein recht schwacher Bezug zur tatsächlich auftretenden Belastung im System, die während der Ausführung konkreter Aufgaben häufig wechselt. So kann beispielsweise der konstante Modus eine sinnvolle Unterstützung liefern in dem Moment in dem eine schwere Kiste angehoben wird, sobald die Kiste nun aber oben auf dem Regal abgestellt wurde ist die Unterstützung nicht mehr notwendig und der Nutzer muss nun dagegen ankämpfen.

Es lässt sich die Vermutung anstellen, dass für dieses Problem noch Verbesserungspotential besteht, wobei wir einen Ansatz betrachten wollen, der mit einem zusätzlichen Sensorsystem anstrebt die Gewichtskraft des Systems aus Mensch, Exoskelett und Objekt zu ermitteln und die Unterstützungskraft entsprechend anzupassen. Gelingt die Umsetzung des Ansatzes, so sind noch weitere Vorteile denkbar die sich als Ziele formulieren lassen.

#pagebreak(weak: true)  // temporary

== Ziele formulieren
- *intuitivere Unterstützung:*\
  Die Kraft der Unterstützung durch das Exoskelett besitzt einen stärkeren Bezug zur momentan vorliegenden Gewichtsbelastung des Systems. 
  - Der Nutzer muss die Unterstützungskraft nicht selbstständig einstellen oder zwischen verschiedenen Modi umschalten.
  - Der Nutzer hat weniger das Gefühl gegen das Exoskelett \"ankämpfen\" zu müssen

- *Energie sparen:*\
  Indem das Exoskelett nur die dem Gewicht entsprechende Kraft aufbringt kann eventuell eine Überkompensation vermieden und Energie gespart werden.

- *besserer Nutzungskomfort:*\
  Durch die effizientere Nutzung der Energie muss eventuell bei dem pneumatischen Exoskelett die Pumpe seltener angeschalten werden, was Lärm reduzieren kann. Auch müsste der Akku seltener / kürzer aufgeladen werden für die gleiche Nutzungsdauer.

== Anforderungsliste



= Konzipieren
== Lösungsalternativen suchen
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
  Unterstützung umsetzen][Kraftregelung pneumatisches Exoskelett][Umrechnung für nur elektrisches Exoskelett][][][][]
  ,
  caption: "Morphologischer Kasten"
)

== Lösung auswählen
+ druckempfindliche Folie
+ Spannungsteiler
+ ADC interner Raspberry
+ Spektrografische Analyse
+ rein elektrisches Exoskelett



== $->$ Wirk-/Funktionsstruktur


= Entwerfen
$->$ maßstäblicher Entwurf

= Ausarbeiten
$->$ Ausführungsunterlagen
