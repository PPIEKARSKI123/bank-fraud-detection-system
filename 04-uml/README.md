# Analiza systemowa (UML) – Moduł Autoryzacji i Bezpieczeństwa

Folder zawiera modele architektoniczne i strukturalne opracowane w notacji **UML**. Przedstawiają one proces logowania do bankowości elektronicznej z perspektywy systemowej, począwszy od wymagań wysokopoziomowych, aż po szczegółową komunikację sieciową (REST API) i hermetyzację danych. Główny nacisk położono na weryfikację dwuetapową (2FA) oraz prewencję fraudową.

## 🔗 Zawartość

| Plik | Opis | Kluczowe reguły / mechanizmy |
| :--- | :--- | :--- |
| `01-use-case.md` | **Diagram Przypadków Użycia:** <br>Definiuje granice systemu, głównych aktorów oraz dostępne metody uwierzytelniania. | **Zależności UML:**<br>• `<<include>>` (wymuszone 2FA)<br>• `<<extend>>` (rozszerzenia dla blokady i wyboru metody SMS/PUSH) |
| `02-activity-diagram.md` | **Diagram Aktywności:** <br>Wizualizuje algorytmiczny przepływ sterowania, pętle decyzyjne oraz ścieżki alternatywne (wyjątki). | **Security Rules:**<br>• Fail-Fast (natychmiastowa blokada)<br>• Limit błędnych prób (max 5)<br>• Session Timeout (3 min) |
| `03-class-diagram.md` | **Diagram Klas:** <br>Przedstawia statyczny model domeny, strukturyzację danych oraz relacje między obiektami. | **Paradygmaty:**<br>• SRP (Separacja profilu bezpieczeństwa od danych usera)<br>• Hermetyzacja (passwordHash) |
| `04-sequence-diagram.md` | **Diagram Sekwencji:** <br>Modeluje wymianę komunikatów w czasie między frontendem, API i systemami zewnętrznymi. | **Architektura API:**<br>• Wywołania REST (`POST`)<br>• Self-calls (wewnętrzna weryfikacja)<br>• Generowanie kodów OTP |

## 🔗 Notacja i konwencje

* **Standard i Podejście:** Diagramy opracowano w standardzie UML. Zastosowano podejście analityczne *Top-Down* (od ogółu biznesowego do szczegółu implementacyjnego), aby zachować spójność logiczną całego modułu.
* **Aktorzy i Systemy:** Na diagramach Use Case i Sequence wyraźnie oddzielono użytkownika końcowego od zewnętrznych systemów infrastrukturalnych, stosując stereotyp `<<system>>` (np. dla Bramki SMS).
* **Tory (Swimlanes):** Na diagramie aktywności zastosowano podział na tory (Użytkownik / System bankowy), precyzyjnie rozdzielając akcje wykonywane na urządzeniu klienta od logiki przetwarzanej na serwerze banku.
* **Bramki i Warunki (Guards):** Ścieżki decyzyjne na diagramach aktywności i sekwencji oznaczono jasnymi warunkami w nawiasach kwadratowych (np. `[proby>5]`, `[isDigitalBankingBlocked = True]`), które stanowią bezpośrednie wytyczne do napisania logiki warunkowej w kodzie.
* **Komunikacja i API:** Na diagramie sekwencji zastosowano konwencję nazewnictwa charakterystyczną dla architektury Client-Server i protokołu HTTP, modelując wywołania do konkretnych endpointów (np. `POST /api/auth/login`).

## 🔗 Cel folderu

Zadaniem tej sekcji jest pokazanie płynnego przejścia od abstrakcyjnych wymagań biznesowych (logowanie i bezpieczeństwo) do gotowego projektu architektonicznego. Diagramy te stanowią bezpośrednią wytyczną dla zespołów backendowych do zaprojektowania kontraktów API, struktury bazy danych oraz implementacji mechanizmów bezpieczeństwa.
