# System Detekcji i Obsługi Fraudów Bankowych (Case Study)

Ten projekt to kompleksowa symulacja pracy Analityka Biznesowo-Systemowego. 
Przedstawia architekturę modułu odpowiedzialnego za wykrywanie oraz obsługę zgłoszeń oszustw finansowych (fraudów) dotyczących kart debetowych oraz kredytowych na infolinii bankowej – od zamodelowania procesu biznesowego, aż po projekt relacyjnej bazy danych.

## Cel projektu
Zaprojektowanie systemu, który umożliwia konsultantom szybką rejestrację zgłoszeń o nieautoryzowanych transakcjach kartowych oraz powiązanych z nimi podejrzanych przelewach, przy jednoczesnym zachowaniu najwyższych standardów bezpieczeństwa danych (PCI DSS).

## Architektura rozwiązania
Projekt łączy perspektywę biznesową i techniczną:
1. **Warstwa Biznesowa (BPMN 2.0):** Przepływ procesu obsługi klienta (od weryfikacji tożsamości po analizę lewych transakcji).
2. **Warstwa Danych (PostgreSQL):** Znormalizowana relacyjna baza danych obsługująca zgłoszenia (Tickets), transakcje kartowe i przelewy.

## Struktura repozytorium
* `01-vision` - Wizja projektu, cele, KPI i słowniczek pojęć.
* `02-bpmn` - Diagramy procesów end-to-end.
* `03-database` - Skrypty SQL (DDL/DML), słownik pojęć oraz diagram ERD.
