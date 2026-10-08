# 2. Diagram Aktywności (Activity Diagram) – Przepływ procesu autoryzacji

Diagram Aktywności wizualizuje krok po kroku przepływ sterowania (Control Flow) podczas procesu logowania. Proces został podzielony na dwa tory decyzyjne (Swimlanes): akcje podejmowane przez „Użytkownika” oraz logikę przetwarzaną przez „System bankowy”. 

Diagram nie tylko obrazuje ścieżkę sukcesu, ale przede wszystkim skupia się na wyjątkach i rygorystycznych regułach bezpieczeństwa, chroniących dostęp do rachunku.

### Ścieżka główna (Happy Path)
1. Użytkownik podaje login i hasło.
2. System bankowy pozytywnie weryfikuje status konta (`[digital_banking_ok]`) oraz poprawność danych uwierzytelniających (`[dane_poprawne]`).
3. Następuje weryfikacja preferowanej metody 2FA i wysyłka kodu (SMS) lub powiadomienia (PUSH).
4. Użytkownik potwierdza logowanie w wymaganym czasie (`[time<=3min]`).
5. Po pozytywnej weryfikacji kodu system zeruje licznik błędnych prób, tworzy sesję i wyświetla główny ekran (Logowanie udane).

### Reguły biznesowe i ścieżki alternatywne (Security Rules)

* **Prewencja Fraudowa (Fail-Fast):**
  Zaraz po otrzymaniu żądania logowania, system sprawdza status bankowości elektronicznej. Jeśli nałożono na nią blokadę operacyjną (`[digital_banking_blocked]`), proces jest natychmiast przerywany bez sprawdzania poprawności hasła.
* **Polityka limitu prób logowania:**
  W przypadku podania błędnych danych (`[dane_bledne]`), system weryfikuje licznik nieudanych prób. 
  * Gdy `[proby<=5]`: Wyświetlany jest standardowy komunikat o błędzie i użytkownik może ponowić próbę.
  * Gdy `[proby>5]`: Następuje automatyczna blokada bankowości elektronicznej, zabezpieczająca konto klienta przed przejęciem.
* **Session Timeout (Kontrola czasu 2FA):**
  Wprowadzono mechanizm weryfikacji czasu odpowiedzi przy wprowadzaniu drugiego składnika. Przekroczenie limitu 3 minut (`[time>3min]`) powoduje unieważnienie procesu ("Session Timeout") i wymusza ponowne rozpoczęcie logowania od zera.
* **Dynamiczny routing 2FA:**
  Proces rozwidla się w zależności od aktywnej metody autoryzacji klienta, płynnie obsługując zarówno starsze kanały (`[SMS_kod]`), jak i nowoczesne (`[powiadomienie_push]`).

### Diagram
![Diagram Aktywności](02-activity-diagram.png)
