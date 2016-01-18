# Software Engineering

## Usecase Diagramm
Zu Beginn des Projektes ist es wichtig, Klarheit über die benötigten Funktionalitäten zu schaffen. State-of-the-art ist hier das Erstellen eines Usecase-Diagramms um die für den Nutzer möglichen Usecases (=Anwendungsfälle) zu erfassen und die Programmierung darauf auszurichten.  
Hierbei ist insbesondere die Interaktion zwischen den Nutzern hervorzuheben. Beide nutzen die selbe App und sind in der Lage, Inhalte über Android Beam auszutauschen.
\latexonly
\graphicspath{ {../../UML/} }

\begin{figure}
\includegraphics[width=\textwidth]{general_usecase.png}
\caption{Usecasediagramm}
\end{figure}
\endlatexonly


## Activity Diagramm
Zu Beginn der Implementierung ist es wichtig, sich ausgehend vom Usecase Diagramm Klarheit über den logischen Aufbau der App zu machen, hier ist ein Aktivitätsdiagramm bestens geeignet.
Hier werden auf übersichtliche Weise alle möglichen Bedienpfade der App aufgezeigt. Auch die innere Struktur der App ist entsprechend strukturiert.

\latexonly
\begin{figure}
\includegraphics[width=\textwidth]{general_activity.png}
\caption{Aktivitätsdiagramm}
\end{figure}
\endlatexonly

## Klassendiagramm
Nachdem die App auf die Bedienpfade abgestimmt wurde, ist es gute Praxis, die Funktionen logisch in verschiedene Klassen zu teilen. Anfangs wurde der Großteil in der Main Activity implementiert. Im Rahmen mehrerer Refactorings wurden immer mehr Funktionen in Klassen ausgelagert und diese in der Main Activity referenziert.
Das zum Ende entstandene Klassendiagramm versucht die Abhängigkeit der Klassen untereinander aufzuzeigen.

\latexonly
\begin{figure}
\includegraphics[width=\textwidth]{general_class.png}
\caption{Klassendiagramm}
\end{figure}
\endlatexonly
