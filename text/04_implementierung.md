# Implementierung
## Vorgehensweise

### Extreme Programming
Das Team arbeitete mit den agilen Methoden des „Extreme 
Programming“ (XP). Die Entscheidung zur Anwendung dieser Methode ist 
hauptsächlich durch den Projekttypen und die zu Projektbeginn zur 
Verfügung stehenden Informationen bedingt.
Da es sich um ein prototypisches Programmierprojekt handelt, war der 
Aufwand zur Implementierung einiger Funktionalitäten schwer 
abzuschätzen. Weiterhin war unser "Kunde", Professor Schemmert, sehr 
gut verfügbar und auch in seinen Anforderungen flexibel.
Voraussetzung für die erfolgreiche Durchführung des XP waren der 
Einsatz einer verteilten Versionsverwaltung (siehe nächster 
Abschnitt), kontinuierliches Testen auf unterschiedlichen Geräten 
sowie eine teilautomatisch generierte Dokumentation.

Natürlich konnte nicht jede Technik genau nach diesem Modell angewandt 
werden, so waren beispielsweise „Stand Up Meetings“ nicht täglich 
sondern nur wöchentlich möglich. Das Durchführen von „Unit 
Tests“ war ebenfalls zeitlich nicht realisierbar, zukünftig könnten 
diese aber durch den Einsatz von "Continuous Integration" abgedeckt 
werden. Jedoch hat die XP-Technik des Pair-Programming immer wieder 
geholfen, Fehler, Lösungen und Code-Optimierungen schnell zu finden 
und zu realisieren. Auch der gegenseitige Wissenszuwachs, der in einem 
Hochschulprojekt mit im Vordergrund stehen sollte, war dadurch sehr 
groß.

### programmiertechnisches Vorgehen
Das Team ist programmiertechnisch folgendermaßen vorgegangen:
Es wurde zunächst überlegt welche Klassen und Methoden implementiert 
werden müssen, nachdem diese realisiert wurden und im späteren Verlauf Abhängigkeiten entstanden, wurden diese agil hinzugefügt. Sollte eine Klasse oder Methode zu groß geworden sein, wurden diese durch Refactoring in dafür sinnvolle kleinere Klassen und Methoden ausgelagert. Wenn neue Elemente implementiert wurden, wurde danach oder dabei immer direkt getestet, somit konnten wir große Fehlprogrammierungen effektiv vermeiden.

Am Ende des Projekts wurde noch ein großes Refactoring durchgeführt 
um dem Code eine gute Leserlichkeit zu verleihen. Dabei wurden unter 
anderem Klassen und Methoden ausgelagert um die Architektur zu 
verbessern und intuitiver zu gestalten. Des Weiteren wurden Tests 
durchgeführt um letzte Logikfehler zu beseitigen und die 
Speichereffizienz so wie die Performance zu steigern. Dabei bedienten 
wir uns unter anderem der Tools „Inspect Code“ un dem 
Ressourcenmonitor, welche in Android Studio integriert sind.

### Probleme
Der Fehler der das größte Fehlverhalten verursachte und leider auch 
nicht durch das Analysieren von Exceptions zu beseitigen war, weil er 
zum Teil der logischen Natur entsprang, war jener einer ungenutzten 
implementierten Technologie im Intent-Filter „IsoDep.class.getName()“. Er wies folgendes Verhalten auf: Wann immer ein NFC Medium an das Gerät gehalten, bzw. ein Beam vorgang gestartet wurde, startete die App automatisch immer neu. Erst durch das Entfernen aus dem Intent-Filter, konnte dieser Fehler behoben werden.

## Entwicklungsmodell
Zur Umsetzung der Entwicklung wurde von Anfang an auf das verteilte Versionskontrollsystem git gesetzt.
Ungetestete Funktionen wurden in Branches entwickelt und erst bei voller Funktion in den dadurch
stabil gehaltenen Master integriert ("merged"). Falls dieser Master doch einen fehlerhaften Zustand aufwies, so
ließ sich dieser problemlos aufgrund der Commit-Beschreibungen auf einen funktionierenden Stand zurücksetzen.
Um dies zu vermeiden erfolgte das Hochladen ("Commit & Push") in den Master erst nach vorherigem Testen der App.

Als technische Umsetzung wurde der git-Hosting-Dienst GitHub genutzt. Dort wurde eine Organisation erstellt die wiederum 
mehrere git-Verzeichnisse ("Repositories") beinhaltet. So wurden von Anfang an die App und die Dokumentatint in unterschiedlichen
Verzeichnissen versioniert.  
Weiterhin wurde die bei GitHub integrierte Ticketverwaltung zur Projektsteuerung und Behebung von Fehlern eingesetzt.
Jedes Fehlerticket (Tag: "bug") enthält eine Beschreibung des Fehlers und kann einem Bearbeiter zugewiesen werden. 
Zusätzlich wurden noch Verbesserungsvorschläge als Ticket erfasst (Tag: "enhancement") und die Tickets verschiedenen
Meilensteinen zugeordnet um eine bessere Terminierung zu erreichen.
