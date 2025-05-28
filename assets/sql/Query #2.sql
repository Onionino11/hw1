CREATE TABLE utenti (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    birthday DATE NOT NULL,
    city VARCHAR(100) NOT NULL,
    province VARCHAR(100) NOT NULL,
    phone VARCHAR(30) NOT NULL,
    accept_marketing INT DEFAULT 0,
    indirizzo VARCHAR(255),
    nciv VARCHAR(20),
    doorbell VARCHAR(100),
    floor VARCHAR(20),
    cap VARCHAR(20),
    country VARCHAR(100),
    gender VARCHAR(10),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO utenti (email, password, first_name, last_name, birthday, city, province, phone, accept_marketing, indirizzo, nciv, doorbell, floor, cap, country, gender)
VALUES
('mario.rossi@email.it', '$2y$10$hash1', 'Mario', 'Rossi', '1990-05-10', 'Roma', 'RM', '3331234567', 1, 'Via Roma', '10', 'Rossi', '2', '00100', 'Italia', 'm'),
('giulia.bianchi@email.it', '$2y$10$hash2', 'Giulia', 'Bianchi', '1985-08-22', 'Milano', 'MI', '3339876543', 0, 'Via Milano', '22', 'Bianchi', '3', '20100', 'Italia', 'f'),
('luca.verdi@email.it', '$2y$10$hash3', 'Luca', 'Verdi', '1992-12-01', 'Napoli', 'NA', '3335554444', 1, 'Via Napoli', '5', 'Verdi', '1', '80100', 'Italia', 'm'),
('anna.neri@email.it', '$2y$10$hash4', 'Anna', 'Neri', '1998-03-15', 'Torino', 'TO', '3332223333', 0, 'Via Torino', '8', 'Neri', '4', '10100', 'Italia', 'f'),
('paolo.blu@email.it', '$2y$10$hash5', 'Paolo', 'Blu', '1980-11-30', 'Firenze', 'FI', '3336667777', 1, 'Via Firenze', '12', 'Blu', '5', '50100', 'Italia', 'm');
CREATE TABLE prodotti (
    id INT AUTO_INCREMENT PRIMARY KEY,
    categoria VARCHAR(100) DEFAULT '0',
    immagine VARCHAR(255) DEFAULT 'default.png',
    nome VARCHAR(255) DEFAULT 'Sconosciuto',
    descrizione TEXT DEFAULT 'Nessuna descrizione disponibile.',
    prodotti VARCHAR(255) DEFAULT '0',
    prezzo DECIMAL(6,2) DEFAULT 0.00,
    bestseller BOOLEAN DEFAULT FALSE,
    burger BOOLEAN DEFAULT FALSE,
    chips BOOLEAN DEFAULT FALSE,
    drink BOOLEAN DEFAULT FALSE
);