# Architektura Bazy Danych (PostgreSQL)

Folder zawiera fizyczny model danych wspierający system obsługi fraudów. Baza została znormalizowana i zoptymalizowana pod kątem szybkiego łączenia danych klienta z jego historią operacji w jednym widoku (zgłoszeniu).

## Zawartość
* `schema.sql` – skrypt DDL definiujący strukturę 5 tabel, typy danych oraz relacje (klucze główne i obce).
* `mock-data.sql` – skrypt DML zawierający przykładowe dane testowe (tzw. mock data) ilustrujące scenariusze fraudowe.

## Struktura tabel
1. **Customers:** Centralna tabela przechowująca dane osobowe i kontaktowe. Posiada flagę `is_digital_banking_blocked` umożliwiającą prewencyjne odcięcie klienta od kanałów cyfrowych.
2. **Cards & Card_Transactions:** Tabele obsługujące moduł kartowy. Rejestrują wydane karty oraz powiązaną z nimi historię płatności (kwoty, waluty, merchant).
3. **Bank_Transfers:** Moduł rozliczeniowy rejestrujący zlecane przelewy krajowe/zagraniczne.
4. **Fraud_Tickets:** Główna encja biznesowa. Łączy identyfikator klienta z podejrzaną transakcją kartową i/lub przelewem wraz z ewentualnym opisem oszustwa.

## Decyzje analityczne i Compliance (PCI DSS)
Projektując strukturę bazy, wzięto pod uwagę rygorystyczne normy bezpieczeństwa sektora bankowego:
* **Brak danych wrażliwych (CVV/CVC):** Zgodnie ze standardem PCI DSS baza nie przechowuje kodów bezpieczeństwa z rewersu karty.
* **Maskowanie PAN (Primary Account Number):** Numer karty płatniczej jest przechowywany w formie zmaskowanej (np. `4111********1234`), co minimalizuje ryzyko w przypadku wycieku danych.
* **Typowanie numeryczne:** Do przechowywania kwot finansowych celowo użyto typu `DECIMAL(10,2)` zamiast `FLOAT`, aby uniknąć błędów zaokrągleń w arytmetyce zmiennoprzecinkowej.
* **Opcjonalność dowodów:** W tabeli `Fraud_Tickets` klucze obce do tabel `Card_Transactions` oraz `Bank_Transfers` pozwalają na elastyczność – zgłoszenie może dotyczyć tylko karty, tylko przelewu, lub obu tych zdarzeń jednocześnie.
