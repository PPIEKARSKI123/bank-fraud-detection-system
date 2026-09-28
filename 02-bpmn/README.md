# Procesy biznesowe (BPMN) – Detekcja Fraudów

Folder zawiera modele procesów biznesowych opracowane w notacji **BPMN 2.0**. 
Przedstawiają one ścieżkę obsługi klienta zgłaszającego nieautoryzowane transakcje z perspektywy I linii wsparcia (infolinii), począwszy od wykrycia podejrzanej aktywności, aż do momentu prawidłowego zarejestrowania sprawy w bazie danych i wydania nowej karty.

## Zawartość

| Plik | Opis | Główne bramki / reguły biznesowe |
| :--- | :--- | :--- |
| `01-Fraud-Kartowy.png` | **Proces Główny:** Koordynuje całą ścieżkę obsługi. Rozpoczyna się od automatycznego zablokowania podejrzanej transakcji i kontaktu klienta z infolinią. Obejmuje blokady dostępów, wywoływanie podprocesów weryfikacyjnych oraz wysłanie formularza. | BR-01 – blokada prewencyjna transakcji<br>BR-02 – wymagana weryfikacja tożsamości |
| `02-Weryfikacja-Klienta.png` | **Podproces:** Weryfikacja tożsamości dzwoniącego. | BR-03 – uwierzytelnianie 2FA (ankieta + kod SMS) |
| `03-Weryfikacja-Transakcji.png` | **Podproces:** Iteracyjny przegląd historii operacji kartowych. | BR-04 – izolacja i zapis nieautoryzowanych transakcji |
| `04-Weryfikacja-Przelewow.png` | **Podproces:** Przegląd zleconych przelewów. | BR-05 – anulowanie tylko przelewów oczekujących |

## Notacja i konwencje
* Diagramy opracowano w standardzie **BPMN 2.0**.
* **Struktura hierarchiczna:** Zastosowano podział na proces główny (Main Process) oraz zagnieżdżone podprocesy (Sub-processes) w celu zarządzania złożonością logiki i zachowania czytelności.
* **Baseny i Tory (Pools & Swimlanes):**
  * *Klient* – przedstawiony jako zwinięty basen (Black-box), z którym system komunikuje się wyłącznie z zewnątrz.
  * *Bank* – basen podzielony na tory: *System Fraudowy* oraz *Infolinia (Konsultant)*, precyzyjnie rozdzielający zadania manualne od systemowych.
* **Zdarzenia (Events):** Zastosowano kodyfikację kolorystyczną dla zwiększenia czytelności – m.in. zdarzenia pośrednie komunikacyjne oznaczone na zielono (np. wysłanie/odbiór SMS).
* **Bramki logiczne (Gateways):** Użyto bramek wykluczających (XOR) do ścieżek decyzyjnych oraz bramek równoległych (AND - krzyżyk) do obsługi zadań realizowanych w tym samym czasie (np. zadawanie pytań klientowi przy jednoczesnej weryfikacji przelewów).
* **Dane i Artefakty:** Wykorzystano obiekty danych (Data Objects) dla dokumentów (np. notatka) oraz magazyny danych (Data Stores) do wizualizacji operacji odczytu/zapisu informacji w bazie (np. Baza zgłoszeń fraudowych, Baza danych osobowych).
* **Komunikacja:** Interakcje między niezależnymi uczestnikami (Bank <-> Klient) przedstawiono za pomocą przepływów komunikatów (Message Flows – przerywane linie).

## Cel folderu
Zadaniem tej sekcji jest pokazanie płynnego przejścia od problemu biznesowego do algorytmicznej logiki systemu. Diagramy te stanowią bezpośrednią wytyczną dla architektów i programistów do zaprojektowania fizycznej, relacyjnej bazy danych (dostępnej w folderze `03-database`).
