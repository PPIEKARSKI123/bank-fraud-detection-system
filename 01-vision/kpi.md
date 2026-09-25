# Kluczowe Wskaźniki Efektywności (KPI) – System Obsługi Fraudów

Dokument definiuje metryki, które pozwolą bankowi ocenić, czy nowy system skutecznie optymalizuje proces przyjmowania zgłoszeń i chroni środki klientów.

| ID | Nazwa wskaźnika | Opis | Cel wdrożenia systemu |
| :--- | :--- | :--- | :--- |
| **KPI-01** | AHT (Average Handling Time) | Średni czas obsługi zgłoszenia przez konsultanta infolinii powinien spaść poniżej **4 minut** (dzięki centralizacji danych w jednym formularzu). | Wydajność procesu |
| **KPI-02** | FTR (First Time Right) | Odsetek zgłoszeń fraudowych poprawnie wypełnionych i przekazanych do Back-office za pierwszym razem powinien wynosić **> 95%**. | Jakość danych |
| **KPI-03** | SLA (Service Level Agreement) | Czas od utworzenia zgłoszenia (status `Open`) do podjęcia go przez analityka bezpieczeństwa (status `In Progress`) nie przekracza **2 godzin**. | Ochrona środków |
| **KPI-04** | Zgodność PCI DSS | **100%** tabel bazodanowych przechowujących dane kart zachowuje standard bezpieczeństwa (szyfrowanie, odpowiednie typowanie DECIMAL, brak CVV). | Bezpieczeństwo IT |
