# Wizja Projektu – System Obsługi Fraudów Bankowych

## Problem biznesowy
W obliczu rosnącej liczby oszustw finansowych (np. phishing), banki potrzebują szybkich i niezawodnych mechanizmów reagowania. Rozproszone systemy i brak centralnego widoku sprawiają, że proces przyjmowania zgłoszeń na infolinii jest czasochłonny. Wydłużony czas reakcji na nieautoryzowane transakcje kartowe lub przelewy zwiększa ryzyko bezpowrotnej utraty środków klienta.

## Cel projektu
Zaprojektowanie ustandaryzowanego modułu (modelu procesowego oraz struktury bazy danych), który pozwoli konsultantom infolinii na błyskawiczną rejestrację i powiązanie oszustw finansowych w jedno spójne zgłoszenie dochodzeniowe (Fraud Ticket). System ma stanowić centralny punkt informacji dla Departamentu Bezpieczeństwa (Back-office).

## Główni interesariusze (Aktorzy)
* **Klient Banku** – ofiara oszustwa (np. kradzież danych karty, przejęcie konta), inicjuje kontakt z bankiem.
* **Konsultant Infolinii (I linia wsparcia)** – przeprowadza ankietę weryfikacyjną, identyfikuje lewe transakcje/przelewy i otwiera zgłoszenie.
* **Departament Bezpieczeństwa (Back-office)** – analitycy weryfikujący zgłoszenie, podejmujący ostateczną decyzję (np. Chargeback, zwrot środków lub odrzucenie roszczenia).

## Wartość dla biznesu i klienta
* **Skrócenie czasu obsługi (SLA):** Szybsze przyjmowanie zgłoszeń dzięki połączeniu danych klienta, kart i przelewów w jednej relacyjnej bazie danych.
* **Zgodność z regulacjami (Compliance):** Pełne dostosowanie do standardu bezpieczeństwa PCI DSS (brak przechowywania kodów CVV, odpowiednie typy danych).
* **Bezpieczeństwo i transparentność:** Standaryzacja statusów zgłoszeń (od `Open` do `Closed`), ułatwiająca monitorowanie postępów w śledztwach.

## Zakres funkcjonalny (MVP)
Wersja podstawowa systemu (MVP) obejmuje:
1. Rejestrację zgłoszeń powiązanych z maksymalnie jedną transakcją kartową i/lub jednym przelewem bankowym.
2. Możliwość dodawania szczegółowej notatki z wywiadu z klientem.
3. Automatyczne nadawanie statusów dla nowych spraw dochodzeniowych.
