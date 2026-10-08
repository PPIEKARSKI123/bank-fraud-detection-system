# 🏦 System Autoryzacji Bankowej (Anti-Fraud & 2FA)

Projekt przedstawia kompleksową analizę systemową i obiektową modułu bezpiecznego logowania do bankowości elektronicznej. 

Celem projektu jest udokumentowanie architektury procesu autoryzacji z uwzględnieniem rygorystycznych reguł bezpieczeństwa, takich jak weryfikacja dwuetapowa (2FA), zarządzanie sesją oraz mechanizmy prewencji fraudowej (Fail-Fast).

## 📌 Kluczowe założenia biznesowe i techniczne

Projekt został zaprojektowany w oparciu o architekturę **Client-Server** z wykorzystaniem komunikacji **REST API** (protokół HTTP). Zaimplementowano w nim następujące reguły:
* **Prewencja Fraudowa (Fail-Fast):** Natychmiastowa blokada żądań logowania dla kont oflagowanych w systemie bezpieczeństwa.
* **Ochrona Brute-Force:** Automatyczna blokada dostępu po przekroczeniu limitu 5 nieudanych prób logowania.
* **Kody OTP (One-Time Password):** Krótki czas życia (Time-to-Live) drugiego składnika autoryzacji (maksymalnie 3 minuty na wprowadzenie kodu).
* **Zasada Pojedynczej Odpowiedzialności (SRP):** Logika użytkownika, sesji oraz profilu bezpieczeństwa zostały odseparowane na poziomie modelu domenowego.

## 📂 Struktura dokumentacji (Diagramy UML)

Dokumentacja została podzielona na cztery etapy, od ujęcia wysokopoziomowego (biznesowego) po szczegóły implementacyjne (techniczne). Kliknij w poniższe linki, aby przejść do szczegółowych analiz:

1. [**Diagram Przypadków Użycia (Use Case Diagram)**](./docs/01-use-case.md) - *Definicja aktorów i granic systemu autoryzacji.*
2. [**Diagram Aktywności (Activity Diagram)**](./docs/02-activity-diagram.md) - *Przepływ procesu, ścieżki alternatywne i obsługa wyjątków.*
3. [**Diagram Klas (Class Diagram)**](./docs/03-class-diagram.md) - *Struktura obiektowa, kardynalność i hermetyzacja danych.*
4. [**Diagram Sekwencji (Sequence Diagram)**](./docs/04-sequence-diagram.md) - *Komunikacja sieciowa, wywołania API i zarządzanie sesją w czasie.*

> **Uwaga:** Ścieżki do plików zakładają, że diagramy i ich opisy znajdują się w folderze `/docs`.

## 🛠 Wykorzystane narzędzia i standardy
* **Notacja:** UML 2.5
* **Narzędzie do modelowania:** draw.io
* **Paradygmaty:** Analiza obiektowa (OOA), REST, Client-Server Architecture
