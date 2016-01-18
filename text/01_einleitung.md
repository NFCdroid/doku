# Einleitung
Im Rahmen unseres Studiums der Wirtschaftsinformatik haben wir uns im 5. Semester für die Profilierung Mobile Applikationen entschieden. Hauptbestandteil und auch prüfungsrelevant für das Modul ist das eigenständige Planen und Implementieren einer Android App.
Nach einer kurzen Einführung in die Android Programmierung durch Herrn Professor Schemmert lag es an den Studierenden sich für eines der vorgeschlagenen Projekte oder den Entwurf eines eigenen Projektes zu entscheiden.
Wir haben uns dazu entschieden, eine von uns vorgeschlagene NFC App zu programmieren. Diese wurde nach einer kurzen Rücksprache mit Herrn Professor Schemmert genehmigt.
Wir werden das gesamte Projekt gemäß unserer in vorherigen Semestern erlernten Methoden planen und mit den erlernten Mitteln des Moduls Software-Engineering an die Implementierung herangehen.

Im Folgenden soll unsere Herangehensweise, aufgetretene Schwierigkeiten und weitere Informationen aufgezeigt werden.


## Motivation
Auf der Suche nach einer App mit praktischem Mehrwert und interessantem Inhalt haben wir uns für eine NFC App entschieden.
Nachdem die anfängliche Idee eines Klonens der HfTL Card, um ein Handy als Zugangsmedium zu den Räumen nutzen zu können, sich bald als unrealistisch herausstellte, haben wir uns entschieden eine VisitenkartenApp für NFC Karten zu schreiben.
Aufgrund der Preisentwicklung und umweltschonenden Eigenschaften von elektronischen Visitenkarten scheint ein "baldiges" Ersetzen der klassischen Visitenkarte aus Papier realistisch.
Zudem werden Kontakte heute in der Regel digital gespeichert und verwaltet was ein analoges Austauschen von Daten redundant macht.


## Technische Einordnung
NFC, kurz für "Near Field Communication", ist eine auf RFID ("radio-frequency identification") basierende Technologie zur kontaktlosen Datenübertragung. Hierbei können die Daten auch "passiv" vorliegen, d.h. der NFC-Chip beinhaltet keine eigene Stromversorgung und wird erst durch ein "aktives" Lesegerät ausgelesen. Die Übertragung erfolgt per Funk innerhalb eines Frequenzbereichs 13,56 MHz, hierbei ist eine maximale Datenübertragungsrate von 424 kBit/s möglich, bei einer Reichweite von maximal 10 cm.  
Haupteinsatzbereiche sind kontaktloses Bezahlen und Zugangskontrolle, jeweils unter Einsatz eines verschlüsselten Datenbereiches, auf den der Zugriff mittels Challenge-Response-Verfahren erfolgt. Als Datenaustauschformat kommt meist NDEF (NFC data exchange format) zum Einsatz.
Weitere Informationen zur Spezifikation von NFC-Karten können der ISO 7816 entnommen werden.

Seit 2008 gibt es erste NFC-fähige Mobiltelefone. Ein großer Teil der aktuellen Android-Smartphones verfügt über einen integrierten NFC-Chip. Dieser beinhaltet bereits eigene Verschlüsselungscodes, stellt seine Funktionalität aber auch per Android API zur Verfügung. Zusätzlich zu der zuvor beschriebenen aktiv-passiv-Kopplung wurde mit "Android Beam" auch eine aktiv-aktiv-Kopplung zwischen zwei Android-Geräten eingeführt.

Laut offizieller Android Entwicklungsdokumentation werden drei verschiedene NFC-Modi bereitgestellt:
* Lesen/Schreiben von NDEF-Daten eines NFC-Chips (seit Android 2.3)
* Beamen von Daten zu anderen Androidgeräten mittels Android Beam (seit Android 4.0)
* Emulation eines NFC-Chips ("Host-based Card Emulation", seit Android 4.4)
Im Rahmen dieser Projektarbeit war die Implementierung aller drei genannten NFC-Technologien geplant, jedoch konnten wir nur das Lesen und Beamen umsetzen, da es bei der NFC-Chip-Emulation zu unerwarteten  Problemen kam (siehe Problembetrachtung).  
Zu Testzwecken wurden wiederbeschreibbare NFC-Karten mit dem Chip NTAG 216 und 888 Byte Speicher beschafft. Als Test- und Entwicklungsgeräte dienten zwei Samsung Galaxy S5 (Android 5.1 und 6.0) sowie ein Samsung Galaxy S3 (Android 4.3).
