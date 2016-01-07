# DOKU

Hier wird die Dokumentation gepflegt.

## TODO
- [ ] Einführung/Motivation -> @zottelbeyer
- [ ] technische Einordnung
- [ ] Anforderungen erstellen (Anwendungsfälle, nicht-funktionale Anforderungen),[SMART](https://de.wikipedia.org/wiki/SMART_(Projektmanagement) ->  @zottelbeyer
- [ ] Überblick über Ablauf der Implementierung (Extreme Programming, Einsatz von GitHub-Issues) -> @ohli
- [ ] Anwenderdoku (=Nutzerhandbuch) erstellen -> @zottelbeyer
- [x] Klassendoku erstellen -> @ohli
- [x] UML-Diagramme erstellen -> @ohli
- [x] Projektbericht erstellen (Gantt etc., siehe project-mgmt) -> @ohli
- [x] GitHub-Bericht rauskloppen (doku/gitstats) -> @ohli
- [ ] Links zu Source und App
- [ ] Fehler- und Problembetrachtung -> @ohli @MarkoKle
- [x] Auflistung der Arbeitsanteile (siehe Klassendoku / Projektplan)
- [ ] Präsentation vorbereiten

----

**Bedeutung der Unterordner:**
### Doxygen - automatische Quellcodedokumentation

Zum Erstellen der automatischen Dokumentation (als html und latex) sind folgende Programme nötig:
* Doxygen
* pdflatex
* GraphViz (wird von Doxygen und PlantUML verwendet)
* make

**HowTo:**

1. Doxyfile checken
2. cd "doxygen-Ordner der Doku"
3. doxygen ./Doxyfile
4. Nun sollten im Ordner doxygen zwei weitere Ordner sein, **html** und **latex**
  1. html enthält eine Website der Doku, ruft die index.html auf
  2. im latex-ordner 'make' ausführen, fehler checken
  3. Dort sollte nun eine refman.tex sowie refman.pdf zu finden sein
5. Zusätzliche Dokumentation wird automatisch aus dem Unterordner text eingefügt.

Die Formalitäten dann am Ende.

### text - Fließtext als Markdown-Dateien
Hier liegen alle weiteren Dokutexte als einfache Textdatei in Markdown-Syntax vor (ja, Latex geht auch, ist hier aber übertrieben).  
Doxygen erkennt hierbei automatisch die Hierarchie, also einfach Überschriftenklasse mittels '#' bestimmen und ggf. die labelids in {} dahinter setzen, siehe auch:
[doxygen-Markdown-Doku](http://www.stack.nl/~dimitri/doxygen/manual/markdown.html) und  [Markdown-Doku](http://daringfireball.net/projects/markdown/syntax)


### UML - mittels PlantUML erstellte UML-Diagramme
Hier liegen die Diagramme als .puml-Dateien im Textformat vor, die Syntax richtet sich nach UML-Standard 2
Praktisch ist das PlantUML-Plugin für Android Studio ("PlantUML integration").
