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
wir uns unter anderem der Tools „Inspect Code“ und dem
Ressourcenmonitor, welche in Android Studio integriert sind.

### technische Besonderheiten
Im Verlauf der Entwicklung gab es einige technische Besonderheiten zu beachten. 
Einen guten Überblick dazu bietet ein Blick in die **AndroidManifest.xml**

	<?xml version="1.0" encoding="utf-8"?>
	<manifest xmlns:android="http://schemas.android.com/apk/res/android"
		package="com.ag.mk.nfccardreadwrite">
		
Hier werden alle benötigten Berechtigungen der App aufgelistet. Einige Berechtigungen haben sich erst im Verlauf der Entwicklung ergeben,
beispielsweise CALL_PHONE und VIBRATE.

		<uses-permission android:name="android.permission.NFC" />
		<uses-permission android:name="android.permission.READ_CONTACTS" />
		<uses-permission android:name="android.permission.WRITE_CONTACTS" />
		<uses-permission android:name="android.permission.VIBRATE" />
		<uses-permission android:name="android.permission.CALL_PHONE" />

Hier erhält die App Zugriff auf den NFC-Chip.

		<uses-feature
			android:name="android.hardware.nfc"
			android:required="false" />

		<application
			android:allowBackup="true"
			android:icon="@mipmap/tagger_logo"
			android:label="@string/app_name"
			android:supportsRtl="true"
			android:theme="@style/AppTheme" >
			<activity android:name=".activity.MainActivity" >
				<intent-filter>
					<action android:name="android.intent.action.MAIN" />

					<category android:name="android.intent.category.LAUNCHER" />
				</intent-filter>
				<intent-filter>
					<action android:name="android.nfc.action.NDEF_DISCOVERED" />

					<category android:name="android.intent.category.DEFAULT" />
					
Zum Schreiben von NDEF-Daten müssen die Daten auf dem Chip mit einem speziellen MIME-Typ gespeichert werden. So können Kontaktdaten mit dem Standard-vCard MIME-Typ geschrieben werden und das Android 
System verwaltet automatisch die damit registrierten Anwendungen, so würde sich in diesem Fall jede mit vCard registrierte App öffnen lassen, z.B. die Android Kontakte-App.

Wir haben uns bewusst gegen einen generischen MIME-Typ entschieden und stattdessen unseren eigenen gebaut, nämlich application/vnd.com.ag.mk.nfccardreadwrite.beam.
Ein praktischer Nebeneffekt ist die auf einigen Geräten existierende Verknüpfung unbekannter MIME-Typen mit dem Google PlayStore. Hierbei ist es möglich, die App nur durch 
Auflegen auf eine NFC-Karte aus dem PlayStore herunterzuladen, da nur diese den von uns defninierten MIME-Typ unterstützt.

					<data android:mimeType="application/vnd.com.ag.mk.nfccardreadwrite.beam" />
				</intent-filter>
				<intent-filter>
					<action android:name="android.nfc.action.TECH_DISCOVERED" />
					<action android:name="android.nfc.action.TAG_DISCOVERED" />

					<category android:name="android.intent.category.DEFAULT" />
				</intent-filter>

				<meta-data
					android:name="android.nfc.action.TECH_DISCOVERED"
					android:resource="@xml/tech" />
			</activity>
			<activity android:name=".activity.CreateVCardActivity" >
				<intent-filter>
					<action android:name="android.intent.action.SEND" />

					<category android:name="android.intent.category.DEFAULT" />
				</intent-filter>

Eine weitere Besonderheit ist das systemweite Eintragen der App als Empfänger für geteilte Kontakte.
Dazu wird die App auf den zu empfangenden MIME-Typ, hier für das Standard vCard-Format, registriert und kann nun
den vCard-senden-Intent des Systems empfangen.

				<!-- Hier wird die App für den Kontakte-teilen Button registriert. -->
				<intent-filter>
					<action android:name="android.intent.action.SEND" />

					<category android:name="android.intent.category.DEFAULT" />

					<data android:mimeType="text/x-vcard" />
				</intent-filter>
			</activity>
			<!-- ATTENTION: This was auto-generated to add Google Play services to your project for
				 App Indexing.  See https://g.co/AppIndexing/AndroidStudio for more information. -->
			<meta-data
				android:name="com.google.android.gms.version"
				android:value="@integer/google_play_services_version" />

		</application>

	</manifest>
	
Natürlich wäre es ohne weiteres möglich gewesen, unsere App auf den generischen vCard-MIME-Typ zu registrieren, intern handelt es sich um die gleiche Datenstruktur. Allerdings haben wir uns an dieser Stelle für den "exklusiveren" Weg entschieden.


## Dokumentation
Für die Dokumentation unserer Arbeit haben wir verschiedene Teilautomatische Open Source Lösungen verwendet. Zum Erstellen der Java Dokumentation haben wir Doxygen genutzt.
Zum Erstellen der UML Diagramme plantuml, welches die Möglichkeit bietet, UML Diagramme mittels einfacher Textbeschreibung automatisiert zu erstellen.
Beide Tools bieten unter anderem LaTeX Dokumente als Ausgabeformat, welche wir als Basis für unsere Dokumentation verwendeten.

## Problembetrachtung

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
