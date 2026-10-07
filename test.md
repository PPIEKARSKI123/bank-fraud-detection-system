'''mermaid
sequenceDiagram
    autonumber
    actor U as Użytkownik
    participant App as Aplikacja Bankowa
    participant API as API Autoryzacji
    participant SMS as <<system>><br/>Bramka SMS

    U->>App: Podaj login i hasło
    App->>API: POST /api/auth/login
    
    rect rgb(240, 240, 240)
    API->>API: checkSecurityStatus()
    end

    alt [isDigitalBankingBlocked = True]
        API-->>App: 403 Forbidden (Dostęp zablokowany)
        App-->>U: Wyświetl komunikat o blokadzie
    else [isDigitalBankingBlocked = False]
        API->>API: generateCode()
        API->>SMS: POST /api/sms/send
        SMS-->>API: 200 OK (Wysłano)
        API-->>App: 202 Accepted (Wymaga 2FA)
        App-->>U: Wyświetl ekran wpisywania kodu
        
        U->>App: Wpisz kod SMS
        App->>API: POST /api/auth/verify (input)
        
        rect rgb(240, 240, 240)
        API->>API: verifyCode(input)
        API->>API: createSession()
        end
        
        API-->>App: 200 OK (Token JWT)
        App-->>U: Przejdź do pulpitu
    end
    '''
