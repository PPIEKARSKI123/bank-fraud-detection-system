# User Stories

Poniższy dokument zawiera przypadki użycia **UC-02 (Logowanie użytkownika i 2FA)** na mniejsze, niezależne historyjki użytkownika.
Obejmują one zarówno ścieżkę sukcesu (Happy Path), jak i rygorystyczne ścieżki wyjątków (Edge Cases) związane z bezpieczeństwem.

---

## Story 1: Prawidłowe logowanie z 2FA oraz podstawowa obsługa błędów
**Jako** Klient Banku,
**chcę** uwierzytelnić się za pomocą kodu SMS lub powiadomienia PUSH po wpisaniu hasła,
**aby** bezpiecznie dostać się na moje konto.

**Kryteria Akceptacji:**
1. Po podaniu poprawnych danych logowania, system wysyła jednorazowy kod OTP (SMS) lub powiadomienie PUSH (w zależności od preferencji klienta).
2. **[Ścieżka błędu]:** W przypadku podania błędnego hasła lub niewłaściwego kodu 2FA, system natychmiast wyświetla komunikat o błędzie i uniemożliwia zalogowanie.
3. **Session Timeout:** Czas ważności wygenerowanego kodu wynosi dokładnie 3 minuty. Po upływie tego czasu proces wygasa i wymaga ponownego rozpoczęcia procedury logowania.

---

## Story 2: Zabezpieczenie przed atakiem Brute-Force (Tymczasowa Blokada)
**Jako** Administrator Systemu,
**chcę** aby aplikacja blokowała dostęp po serii nieudanych prób logowania,
**aby** chronić konta klientów przed atakami słownikowymi i przejęciem.

**Kryteria Akceptacji:**
1. System zlicza każdą nieudaną próbę podania hasła lub kodu 2FA.
2. **[Ścieżka błędu]:** Po dokładnie 5 błędnych próbach z rzędu, system odcina dostęp do kanałów cyfrowych i wyświetla komunikat: *"Konto zostało tymczasowo zablokowane ze względów bezpieczeństwa"*.
3. **Reset:** Po udanym logowaniu przed osiągnięciem limitu, licznik błędnych prób jest automatycznie resetowany do zera.

---

## Story 3: Wdrożenie mechanizmu Fail-Fast (Prewencja Fraudowa)
**Jako** Specjalista ds. Cyberbezpieczeństwa,
**chcę** aby system od razu odrzucał żądania logowania z oflagowanych kont,
**aby** zapobiec dalszym nadużyciom i nie obciążać infrastruktury wysyłką kodów SMS.

**Kryteria Akceptacji:**
1. Natychmiast po otrzymaniu żądania, przed sprawdzeniem poprawności hasła, system weryfikuje status konta klienta w głównej bazie bezpieczeństwa.
2. **[Ścieżka błędu]:** Jeśli konto posiada aktywną flagę `[digital_banking_blocked]`, system natychmiast przerywa proces logowania.
3. W przypadku nałożonej blokady system kategorycznie NIE generuje i NIE wysyła wiadomości SMS, oszczędzając zasoby serwera.
