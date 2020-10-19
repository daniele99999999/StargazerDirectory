
# StargazerDirectory

## Descrizione
Questa è una soluzione proposta per una CodeChallenge riguardante un app che mostri una lista di stargazers di un repository, ovvero la lista degli utenti che lo hanno inserito tra i preferiti. L’app deve permettere all’utente di digitare owner e nome del repository e deve quindi mostrare la lista (comprensiva di avatar e username) degli utenti che lo hanno inserito tra i preferiti.
Le api da utilizzare sono quelle pubbliche di GitHub, la cui documentazione è reperibile a questo indirizzo: https://developer.github.com/v3/activity/starring/#list-stargazers

questi i requirements:
1. Struttura e pulizia del codice
2. Non devono esserci comportamenti anomali (es. crash)
e questi bonus:
3. unit tests

La struttura scelta prevede una architettura MVP + Coordinator + Dependency Container.
Sono presenti UnitTest per i vari componenti contenente logica.
E' stata implementata la paginazione per la navigazione all'interno dei risultati.
Per la gestione delle dipendenze è stato utilizzato CocoaPods

## Architettura
L'app è molto semplice. le schermate sono due
- interfaccia di inserimento owner e repository
- lista degli stargazers

Il Coordinator è responsabile per la navigazione.
Ogni schermata prevede la suddivisione tipica dell'architettura MVP con Presenter e ViewController.
Non essendo prevista persistenza, l’accesso ai dati è gestito semplicemente tramite un layer di api il quale contiene la logica che gestisce il network. 
I vari componenti sono indipendenti e progettati tramite protocols e dependency injection, in modo da assicurare la testabilità della logica tramite mock ad ogni livello.
Il progetto è suddiviso in Feature (strutturare come framework), in modo da offrire riutilizzabilità e rendere indipendente il codice di ogni feature.  Vista la semplicità dell'applicazione in esame, le feature sono soltanto 2:
- directory: flusso navigazione form + lista
- common: contiene protocolli, servizi e modelli
E' anche stato utilizzato un Dependency Container, per centralizzare e distribuire i vari componenti alle varie feature dell'app.

## Note
In assenza di requirements specifici, il validatore inserito per gestire gli input controlla solo la presenza del valore (owner e repository entrambi obbligatori) e l'assenza di whitespaces. Il validatore è cmq strutturato per gestire un numero di regole a piacere. 

## Requisiti
Target SDK 11.4. 
Sviluppato su Xcode 11.3.
CocoaPods 1.9,3

## Installazione
E' sufficiente clonare il repository, posizionarsi nella cartella dove risulta presente il podfile, ed eseguire da terminale `pod install`

## Author

Daniele99999999

## Licenza
PokemonDirectory è disponibile con la licenza MIT. Vedere il file LICENSE per maggiori informazioni
