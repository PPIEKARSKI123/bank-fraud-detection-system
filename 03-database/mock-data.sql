-- Zasilenie bazy przykładowymi danymi (Mock Data) 
-- Pokrywa 3 scenariusze biznesowe: Phishing (karta+przelew), Oszustwo zakupowe (tylko karta) oraz czyste konto.

-- 1. DODANIE KLIENTÓW
INSERT INTO Customers (first_name, last_name, pesel, email, phone_number, is_digital_banking_blocked)
VALUES 
('Jan', 'Kowalski', '90101012345', 'jan.kowalski@gmail.com', '+48123456789', TRUE),
('Anna', 'Nowak', '85052098765', 'anna.nowak@email.pl', '+48987654321', FALSE),
('Piotr', 'Zalewski', '92111155555', 'p.zalewski@domain.com', '+48555444333', FALSE);

-- 2. DODANIE KART (Klient 1 i 2)
INSERT INTO Cards (customer_id, card_number, expiration_date, card_status)
VALUES 
(1, '4111********1234', '12/26', 'Blocked'),
(2, '5355********9876', '08/29', 'Blocked');

-- 3. DODANIE TRANSAKCJI KARTOWYCH (Miks transakcji poprawnych i fraudowych)
INSERT INTO Card_Transactions (card_id, transaction_date, amount, currency, merchant_name, transaction_status)
VALUES 
-- Transakcja fraudowa Jana
(1, '2026-09-22 15:32:00', 159.99, 'PLN', 'Sports Shop', 'Completed'),
-- Prawidłowe transakcje Anny (dla zarysowania historii)
(2, '2026-09-21 08:15:00', 45.50, 'PLN', 'Bakery', 'Completed'),
(2, '2026-09-23 12:00:00', 120.00, 'PLN', 'Gas Station', 'Completed'),
-- Transakcja fraudowa Anny
(2, '2026-09-24 19:45:00', 499.00, 'PLN', 'Electronics Store', 'Completed');

-- 4. DODANIE PRZELEWÓW
INSERT INTO Bank_Transfers (customer_id, transfer_date, amount, currency, title, sender_iban, recipient_iban, transfer_status)
VALUES 
-- Fraudowy przelew Jana
(1, '2026-09-23 10:15:00', 15000.00, 'PLN', 'Zasilenie giełdy Krypto', 'PL95644365000012344321795490', 'PL99102030405060708090000000', 'Completed'),
-- Prawidłowy przelew Piotra (brak fraudu)
(3, '2026-09-25 09:00:00', 2500.00, 'PLN', 'Oplata za wynajem', 'PL12644344556677889900112233', 'PL00998877665544332211009988', 'Completed');

-- 5. UTWORZENIE ZGŁOSZEŃ FRAUDOWYCH (TICKETS)
INSERT INTO Fraud_Tickets (customer_id, transaction_id, transfer_id, ticket_status, consultant_note)
VALUES 
-- Zgłoszenie Jana (Powiązane z transakcją ID:1 oraz przelewem ID:1)
(1, 1, 1, 'In Progress', 'Phishing - Klient otrzymał podejrzany link, gdzie wpisał dane karty oraz logowania.'),
-- Zgłoszenie Anny (Powiązane TYLKO z transakcją ID:4, brak powiązanego przelewu)
(2, 4, NULL, 'Open', 'Oszustwo zakupowe (Purchase Fraud) - Klientka zapłaciła za towar kartą na stronie fałszywego sklepu internetowego.');
