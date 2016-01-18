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
Es wurde zunächst überlegt welche Klassen und Methoden implementiert werden müssen, nachdem diese realisiert wurden und im späteren Verlauf Abhängigkeiten entstanden, wurden diese agil hinzugefügt. Sollte eine Klasse oder Methode zu groß geworden sein, wurden diese durch Refactoring in dafür sinnvolle kleinere Klassen und Methoden ausgelagert. Wenn neue Elemente implementiert wurden, wurde danach oder dabei immer direkt getestet, somit konnten wir große Fehlprogrammierungen effektiv vermeiden.

Am Ende des Projekts wurde noch ein großes Refactoring durchgeführt 
um dem Code eine gute Leserlichkeit zu verleihen. Dabei wurden unter 
anderem Klassen und Methoden ausgelagert um die Architektur zu 
verbessern und intuitiver zu gestalten. Des Weiteren wurden Tests 
durchgeführt um letzte Logikfehler zu beseitigen und die 
Speichereffizienz so wie die Performance zu steigern. Dabei bedienten 
wir uns unter anderem der Tools „Inspect Code“ un dem 
Ressourcenmonitor, welche in Android Studio integriert sind.

### Problembetrachtung

#### doppelter Intent
Der Fehler der das größte Fehlverhalten verursachte und leider auch 
nicht durch das Analysieren von Exceptions zu beseitigen war, weil er 
zum Teil der logischen Natur entsprang, war jener einer ungenutzten 
implementierten Technologie im Intent-Filter „IsoDep.class.getName()“. Er wies folgendes Verhalten auf: Wann immer ein NFC Medium an das Gerät gehalten, bzw. ein Beam vorgang gestartet wurde, startete die App automatisch immer neu. Erst durch das Entfernen aus dem Intent-Filter, konnte dieser Fehler behoben werden.

#### Zugriff auf das secure element  
Zur Kommunikation mit Bezahlterminals und Zugangssystemen verfügen 
Android Smartphones über ein secure element innerhalb des NFC-Chips. 
In diesem secure element sind IDs und Schlüssel einiger 
sicherheitskritischer Anwendungen gespeichert, weshalb der direkte 
Zugriff darauf (via API o.ä.) nicht möglich ist. Es kann nur die 
Route zum und vom secure element angesprochen werden, d.h. die Daten 
werden z.B. von der App bereitgestellt und das secure element 
stellt die Sicherheitsfunktion bereit.

#### Kartenemulation 
Zur Emulation von Karten kann auch das secure element verwendet werden, 
hierbei ist jedoch zwischen den unterschiedlichen NFC-Chips zu 
unterscheiden, da diese nicht jeden Kartentyp emulieren können.Zur 
Unterscheidung der NFC-Lesegeräte werden diese intern mit einer Typ-ID 
versehen und im Android-System entsprechend geroutet.  
Dieses Routing verhindert auch den weiteren Einsatz der 
Kartenemulation. Das Hauptproblem hierbei ist das statische Routing der 
AID (application ID, z.B. des Lesegerätes) auf spezielle Apps. Wenn es zu 
der AID des Lesegerätes keine im System registrierte App gibt, dann 
kommt der initiale Handshake zwischen emulierter Karte und Lesegerät 
nicht zustande .
Der Großteil der Hersteller verwendet eigene AIDs und stellt diese 
meist nicht zur Verfügung, weiterhin werden diese AIDs vom Android-System zwar 
registriert, aber sind nicht ohne erheblichen Aufwand (Änderung der 
Berechtigungsdatei mit root-Rechten...) auszulesen. Folglich wäre es 
notwendig gewesen, die App auf mehrere AIDs zu registrieren. Für die 
anfängliche Idee, die HfTL-Zugangskarte zu emulieren, hätte selbst 
die Kenntnis der AID nicht ausgereicht, da diese ein secure element 
beinhaltet und dieses von der HCE nicht abgedeckt werden kann.  
Ein weiteres Problem hinsichtlich der HCE ist auch eine mangelnde 
Testumgebung, für realistische Tests wäre die Anschaffung eines 
NFC-Lesegerätes unumgänglich gewesen, da der in Android integrierte 
NFC-Lesemodus zu generisch ist und sich nicht auf spezielle AIDs 
beschränkt.  
Angenommen, die AID steht zur Verfügung, dann kann eine Verbindung der 
emulierten Karte zum Lesegerät aufgebaut werden und der Datentransfer beginnt. Im Anschluss ist ein weiteres Problem zu erwarten, da das Lesegerät eine APDU (Application Protocol Data Unit) an die emulierte Karte schickt und von dieser eine valide APDU response erwartet. An dieser Stelle wäre erneut die Manipulation einer validen Verbindung nötig gewesen um die korrekte APDU response auszulesen.  
In Anbetracht dieser technischen Einschränkungen haben wir uns gegen die Implementierung der Kartenemulation entschieden.


## Entwicklungsmodell
Zur Umsetzung der Entwicklung wurde von Anfang an auf das verteilte Versionskontrollsystem git gesetzt.
Ungetestete Funktionen wurden in Branches entwickelt und erst bei voller Funktion in den dadurch
stabil gehaltenen Master integriert ("merged"). Falls dieser Master doch einen fehlerhaften Zustand aufwies, so
ließ sich dieser problemlos aufgrund der Commit-Beschreibungen auf einen funktionierenden Stand zurücksetzen.
Um dies zu vermeiden erfolgte das Hochladen ("Commit & Push") in den Master erst nach vorherigem Testen der App.

Als technische Umsetzung wurde der git-Hosting-Dienst GitHub genutzt. Dort wurde eine Organisation erstellt die wiederum 
mehrere git-Verzeichnisse ("Repositories") beinhaltet. So wurden von 
Anfang an die App und die Dokumentation in unterschiedlichen
Verzeichnissen versioniert.  
Weiterhin wurde die bei GitHub integrierte Ticketverwaltung zur Projektsteuerung und Behebung von Fehlern eingesetzt.
Jedes Fehlerticket (Tag: "bug") enthält eine Beschreibung des Fehlers und kann einem Bearbeiter zugewiesen werden. 
Zusätzlich wurden noch Verbesserungsvorschläge als Ticket erfasst (Tag: "enhancement") und die Tickets verschiedenen
Meilensteinen zugeordnet um eine bessere Terminierung zu erreichen.
