-- Tworzenie struktury bazy danych dla Systemu Detekcji Fraudów

CREATE TABLE Customers(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	pesel VARCHAR(11) UNIQUE NOT NULL,
	email VARCHAR(100),
	phone_number VARCHAR(15) NOT NULL,
	is_digital_banking_blocked BOOLEAN DEFAULT FALSE
);

CREATE TABLE Cards(
	card_id SERIAL PRIMARY KEY,
	customer_id INT NOT NULL REFERENCES Customers(customer_id),
	card_number VARCHAR(16) UNIQUE NOT NULL,
	expiration_date VARCHAR(5) NOT NULL,
	card_status VARCHAR(20) DEFAULT 'Active'
);

CREATE TABLE Card_Transactions(
	transaction_id SERIAL PRIMARY KEY,
	card_id INT NOT NULL REFERENCES Cards(card_id),
	transaction_date TIMESTAMP NOT NULL,
	amount DECIMAL(10,2) NOT NULL,
	currency VARCHAR(3) DEFAULT 'PLN' NOT NULL,
	merchant_name VARCHAR(100) NOT NULL,
	transaction_status VARCHAR(25) DEFAULT 'Completed' NOT NULL
);

CREATE TABLE Bank_Transfers(
	transfer_id SERIAL PRIMARY KEY,
	customer_id INT NOT NULL REFERENCES Customers(customer_id),
	transfer_date TIMESTAMP NOT NULL,
	amount DECIMAL(10,2) NOT NULL,
	currency VARCHAR(3) DEFAULT 'PLN' NOT NULL,
	title VARCHAR (100) NOT NULL DEFAULT 'Przelew',
	sender_iban VARCHAR(28) NOT NULL,	
	recipient_iban VARCHAR(28) NOT NULL,
	transfer_status VARCHAR(25) NOT NULL DEFAULT 'Completed'
);

CREATE TABLE Fraud_Tickets(
	ticket_id SERIAL PRIMARY KEY,
	customer_id INT NOT NULL REFERENCES Customers(customer_id),
	transaction_id INT REFERENCES Card_Transactions(transaction_id),
	transfer_id INT REFERENCES Bank_Transfers(transfer_id),
	ticket_status VARCHAR(50) NOT NULL DEFAULT 'Open',
	consultant_note VARCHAR(500) NOT NULL
);
