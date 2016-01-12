# Implementierung
## Vorgehensweise

Hier kommt was zum Programm von Marko hin.  
Extreme Programming, wöchentliche Sprints.

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
