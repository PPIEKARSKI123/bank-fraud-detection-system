# User Stories

Poniższy dokument zawiera przypadki użycia głównego procesu biznesowego (opracowanego w notacji BPMN 2.0) na zwinne historyjki użytkownika. Wymagania te opisują system z perspektywy pracownika pierwszej linii wsparcia (Konsultanta Infolinii) oraz integracji z Systemem Fraudowym.

---

## Story 1: Weryfikacja tożsamości dzwoniącego (Uwierzytelnianie 2FA)
**Jako** Konsultant Infolinii,
**chcę** mieć możliwość uruchomienia systemowej ankiety weryfikacyjnej oraz wysłania klientowi kodu SMS,
**aby** potwierdzić jego tożsamość przed omówieniem jakichkolwiek szczegółów transakcji.

**Kryteria Akceptacji:**
1. Konsultant ma w systemie przycisk inicjujący proces weryfikacji tożsamości.
2. System wyświetla na ekranie konsultanta pulę losowych pytań autoryzacyjnych (ankieta bezpieczeństwa) oraz wysyła jednorazowy kod SMS na powiązany numer klienta.
3. **[Ścieżka błędu]:** Jeżeli klient nie przejdzie pozytywnie ankiety lub poda błędny kod SMS, system blokuje podgląd danych i nakazuje konsultantowi natychmiastowe zakończenie połączenia.

---

## Story 2: Przegląd historii operacji kartowych
**Jako** Konsultant Infolinii,
**chcę** wspólnie z klientem przeglądać listę ostatnich transakcji kartowych i oznaczać je pojedynczo jako "Autoryzowane" lub "Nieautoryzowane",
**aby** precyzyjnie zidentyfikować zakres oszustwa (fraudu).

**Kryteria Akceptacji:**
1. System wyświetla chronologiczną listę transakcji z podziałem na kwotę, datę, walutę oraz nazwę merchanta (usługodawcy).
2. Przy każdej transakcji znajduje się interfejs (np. Checkbox/Switch) pozwalający oflagować ją jako podejrzaną.
3. Każde oflagowanie transakcji powoduje automatyczne dodanie jej do wirtualnego koszyka (formularza zgłoszeniowego), zliczając łączną kwotę roszczenia.

---

## Story 3: Przegląd historii przelewów
**Jako** Konsultant Infolinii,
**chcę** wspólnie z klientem przeglądać listę ostatnich przelewów i oznaczać je pojedynczo jako "Autoryzowane" lub "Nieautoryzowane",
**aby** precyzyjnie zidentyfikować zakres oszustwa (fraudu).

**Kryteria Akceptacji:**
1. System wyświetla chronologiczną listę przelewów z podziałem na kwotę, datę, walutę, tytuł, IBAN nadawcy oraz odbiorcy.
2. Przy każdym przelewie znajduje się interfejs (np. Checkbox/Switch) pozwalający oflagować go jako podejrzanego.
3. Każde oflagowanie przelewu powoduje automatyczne dodanie go do wirtualnego koszyka (formularza zgłoszeniowego), zliczając łączną kwotę roszczenia.
4. System pozwala na anulowanie przelewu przez konsultanta, jeśli jego status jest jeszcze "oczekujący".

---

## Story 4: Izolacja zagrożenia i rejestracja zgłoszenia
**Jako** Konsultant Infolinii,
**chcę** za pomocą jednego kliknięcia ostatecznie zastrzec skompromitowaną kartę i wysłać gotowy formularz zgłoszeniowy do bazy danych oraz klienta,
**aby** zatrzymać kradzież środków i umożliwić klientowi próbę odzyskania środków.

**Kryteria Akceptacji:**
1. Po zatwierdzeniu wyselekcjonowanych transakcji, system zmienia status karty debetowej/kredytowej na „Zastrzeżona” ze skutkiem natychmiastowym.
2. Formularz zgłoszeniowy (Ticket) zostaje zapisany w bazie PostgreSQL z unikalnym identyfikatorem (ID Zgłoszenia).
3. **[Ścieżka błędu]:** W przypadku braku połączenia z główną bazą danych, system zapisuje zgłoszenie lokalnie, nadaje mu status "Oczekujące na synchronizację" i ponawia próbę wysyłki, aby nie utracić danych wprowadzonych przez konsultanta.
