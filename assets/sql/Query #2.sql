-- Eliminazione tabella prodotti
DROP TABLE IF EXISTS prodotti;
-- Eliminazione tabella categoria
DROP TABLE IF EXISTS categoria;

CREATE TABLE IF NOT EXISTS users (
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

-- INSERT INTO users (email, password, first_name, last_name, birthday, city, province, phone, accept_marketing, indirizzo, nciv, doorbell, floor, cap, country, gender)
-- VALUES
-- ('mario.rossi@email.it', '$2y$10$hash1', 'Mario', 'Rossi', '1990-05-10', 'Roma', 'RM', '3331234567', 1, 'Via Roma', '10', 'Rossi', '2', '00100', 'Italia', 'm'),
-- ('giulia.bianchi@email.it', '$2y$10$hash2', 'Giulia', 'Bianchi', '1985-08-22', 'Milano', 'MI', '3339876543', 0, 'Via Milano', '22', 'Bianchi', '3', '20100', 'Italia', 'f'),
-- ('luca.verdi@email.it', '$2y$10$hash3', 'Luca', 'Verdi', '1992-12-01', 'Napoli', 'NA', '3335554444', 1, 'Via Napoli', '5', 'Verdi', '1', '80100', 'Italia', 'm'),
-- ('anna.neri@email.it', '$2y$10$hash4', 'Anna', 'Neri', '1998-03-15', 'Torino', 'TO', '3332223333', 0, 'Via Torino', '8', 'Neri', '4', '10100', 'Italia', 'f'),
-- ('paolo.blu@email.it', '$2y$10$hash5', 'Paolo', 'Blu', '1980-11-30', 'Firenze', 'FI', '3336667777', 1, 'Via Firenze', '12', 'Blu', '5', '50100', 'Italia', 'm');
CREATE TABLE IF NOT EXISTS categoria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descrizione TEXT DEFAULT 'Nessuna descrizione disponibile.',
    immagine VARCHAR(255) DEFAULT 'default.png',
    prodotti VARCHAR(255) DEFAULT '0',
    burger BOOLEAN DEFAULT FALSE,
    chips BOOLEAN DEFAULT FALSE,
    drink BOOLEAN DEFAULT FALSE
);
CREATE TABLE IF NOT EXISTS prodotti (
    id INT AUTO_INCREMENT PRIMARY KEY,
    categoria INT,
    immagine VARCHAR(255) DEFAULT 'default.png',
    nome VARCHAR(255) DEFAULT 'Sconosciuto',
    descrizione TEXT DEFAULT 'Nessuna descrizione disponibile.',
    prezzo DECIMAL(6,2) DEFAULT 0.00,
    bestseller BOOLEAN DEFAULT FALSE,
    burger BOOLEAN DEFAULT FALSE,
    chips BOOLEAN DEFAULT FALSE,
    drink BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (categoria) REFERENCES categoria(id)
);
-- Tabella carrelli (un carrello per utente)
CREATE TABLE IF NOT EXISTS carrelli (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    totale DECIMAL(8,2) DEFAULT 0.00,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Tabella prodotti nel carrello
CREATE TABLE IF NOT EXISTS carrello_prodotti (
    id INT AUTO_INCREMENT PRIMARY KEY,
    carrello_id INT NOT NULL,
    prodotto_id INT NOT NULL,
    nome VARCHAR(255),
    descrizione TEXT,
    prezzo DECIMAL(6,2),
    quantita INT DEFAULT 1,
    FOREIGN KEY (carrello_id) REFERENCES carrelli(id),
    FOREIGN KEY (prodotto_id) REFERENCES prodotti(id)
);

-- Tabella ordini
CREATE TABLE IF NOT EXISTS ordini (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    data TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    totale DECIMAL(8,2) NOT NULL,
    note TEXT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    phone VARCHAR(30),
    consegna VARCHAR(30),
    pagamento VARCHAR(30),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Tabella prodotti ordinati
CREATE TABLE IF NOT EXISTS ordini_prodotti (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ordine_id INT NOT NULL,
    prodotto_id INT NOT NULL,
    nome VARCHAR(255),
    prezzo DECIMAL(6,2),
    quantita INT,
    FOREIGN KEY (ordine_id) REFERENCES ordini(id),
    FOREIGN KEY (prodotto_id) REFERENCES prodotti(id)
);

INSERT INTO categoria (nome, descrizione, immagine, prodotti, burger, chips, drink)
VALUES
('PER INIZIARE', 'Come fai a non farti tentare? I migliori prodotti fritti in olio di semi di girasole Altoleico', 'Classiche.jpg', 9, FALSE, FALSE, FALSE),
('MALU PROMO MENU''', 'MENU COMPLETO BURGER CONTORNO E BEVANDA''', 'Classico.jpeg', 14, TRUE, TRUE, TRUE),
('MALU BURGER (SOLO PANINO)', 'Piccolo = 100gr / Medio = 180gr / Malu = Tutto doppio', 'Pistacchioso.jpeg', 16, TRUE, FALSE, FALSE),
('MALU LIGHT', 'Insalate Hamburger Veg. Piatti Leggeri ma dal Gusto Malu', 'MaluLight.jpeg', 5, FALSE, FALSE, FALSE),
('DA BERE', '', 'DaBere.jpeg', 13, FALSE, FALSE, TRUE),
('DOLCI', 'Per finire in bellezza una Cena Malu', 'Dolci.jpg', 1, FALSE, FALSE, FALSE);

INSERT INTO prodotti (categoria, immagine, nome, descrizione, prezzo, bestseller, burger, chips, drink) VALUES
(1, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=50579&image=anelli+di+cipolla.png&w=256&h=256&crop=1', 'ANELLI DI CIPOLLA SPECIAL', 'Anelli di Cipolla pastellati alla birra', 3.40, FALSE, FALSE, TRUE, FALSE),
(1, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=50578&image=patatine+fritte.png&w=256&h=256&crop=1', 'PATATINE CLASSICHE', 'Patatine Fritte (Really Crunch Lambweston)', 2.00, FALSE, FALSE, TRUE, FALSE),
(1, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=101070&image=amerimalu.png&w=448&h=448&crop=1', 'AMERICANE', 'Patatine Fritte*, Würstel e Salsa Cheddar', 4.90, FALSE, FALSE, TRUE, FALSE),
(1, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=52552&image=formaggio+e+bacon.png&w=448&h=448&crop=1', 'FORMAGGIO E BACON', 'Patatine Lambweston*, Salsa Cheddar e Bacon croccante', 4.90, FALSE, FALSE, TRUE, FALSE),
(1, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=52551&image=formaggio.png&w=448&h=448&crop=1', 'PATATINE AL FORMAGGIO', 'Patatine Lambweston*, Salsa Cheddar', 4.40, FALSE, FALSE, TRUE, FALSE),
(1, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=209860&image=pulled+pork.png&w=448&h=448&crop=1', 'AMERICAN PULLED PORK', 'Patate Lambweston*, American Pulled Pork, Salsa Barbecue e Salsa Cheddar', 4.90, FALSE, FALSE, TRUE, FALSE),
(1, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=52553&image=mortazza.png&w=448&h=448&crop=1', 'PISTACCHIO E MORTADELLA', 'Patatine Lambweston*, Mortadella, Salsa al Pistacchio e granella di Pistacchio', 4.90, FALSE, FALSE, TRUE, FALSE),
(1, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=50580&image=crocchette+patate.png&w=448&h=448&crop=1', 'CROCCHETTE DI PATATE', 'Crocchette di Patate', 2.50, FALSE, FALSE, TRUE, FALSE),
(1, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=50581&image=nuggets.png&w=448&h=448&crop=1', 'NUGGETS DI POLLO (BIRBE)', 'Birbe di pollo croccanti', 4.40, FALSE, FALSE, FALSE, FALSE),
(2, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=226630&image=cheese+cheese+bacon.png&w=448&h=448&crop=1', 'CHEESE CHEESE BACON BACON MENÙ', 'Pane fresco Artigianale / Hamburger di Manzo (Macina Maluburger) / Doppio Formaggio Fritto* / Doppio Bacon / Baconjam (marmellata di bacon)', 11.90, FALSE, TRUE, TRUE, TRUE),
(2, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=199966&image=pugliese.png&w=448&h=448&crop=1', 'PUGLIESE MENÙ', 'Pane fresco Artigianale / Hamburger di Manzo (Macina Maluburger) / Pomodorino Fresco / Bacon / Burrata / Pesto di Pistacchio', 9.50, FALSE, TRUE, FALSE, FALSE),
(2, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=215583&image=furiaaa.png&w=448&h=448&crop=1', 'FURIA MENÙ', 'Pane Artigianale / Hamburger di Cavallo macina Malu / Formaggio cheddar / Salsa X / Bacon / Funghi / Cipolla caramellata / Anelli di cipolla', 10.00, FALSE, TRUE, FALSE, FALSE),
(2, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=177687&image=pistacchiosooo.png&w=448&h=448&crop=1', 'PISTACCHIOSO MENÙ', 'Pane fresco Artigianale, Hamburger di Manzo (Macina Maluburger), Pesto di Pistacchio e Pomodorino / Scaglie Di Grana / Mortadella', 9.50, FALSE, TRUE, FALSE, TRUE),
(2, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=121216&image=crea+il+panino.png&w=448&h=448&crop=1', 'CREA IL TUO BURGER MENÙ', 'Pane fresco Artigianale, Hamburger a Scelta 100% Carne macina Maluburger, Salse a Scelta', 8.50, FALSE, TRUE, FALSE, FALSE),
(2, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=50399&image=peppa.png&w=448&h=448&crop=1', 'CLASSICO MENÙ', 'Pane Artigianale / Hamburger a Scelta / Formaggio cheddar / Lattuga / Pomodoro / Salsa a scelta', 9.50, FALSE, TRUE, FALSE, TRUE),
(2, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=50399&image=peppa.png&w=448&h=448&crop=1', 'PEPPA MENÙ', 'Pane Artigianale / Hamburger di Manzo (Macina Maluburger) / Formaggio cheddar / Lattuga / Pomodoro / Bacon croccante / Salsa Malu', 9.50, FALSE, TRUE, FALSE, FALSE),
(2, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=96126&image=croccante.png&w=448&h=448&crop=1', 'CROCCANTE MENÙ', 'Pane Artigianale / Sovracoscia di Pollo croccante Malu / Salsa cheddar / Lattuga / Pomodoro / Salsa barbecue / Colata di Salsa Cheddar / Bacon croccante sopra il panino', 11.90, FALSE, TRUE, FALSE, FALSE),
(2, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=96127&image=malucavallo.png&w=448&h=448&crop=1', 'MALU CAVALLO MENÙ', 'Pane Artigianale / Hamburger 100% Cavallo macina Maluburger / Formaggio cheddar / Bacon croccante / Rucola / Cipolla caramellata / Salsa Malu', 9.50, FALSE, TRUE, FALSE, TRUE),
(2, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=124078&image=gabbiano.png&w=448&h=448&crop=1', 'POVERO GABBIANO MENÙ', 'Pane Artigianale / Hamburger di Manzo (Macina Maluburger) / Lattuga / Doppio formaggio cheddar / Bacon croccante / Cipolla croccante fatta in casa', 9.90, FALSE, TRUE, FALSE, FALSE),
(2, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=96123&image=crispy.png&w=448&h=448&crop=1', 'MALU CRISPY MENÙ', 'Pane Artigianale / Hamburger di Manzo (Macina Maluburger) / Formaggio cheddar / Doppio Bacon croccante / Chips patate fritte* / Salsa Malu 2.0', 9.90, TRUE, TRUE, TRUE, FALSE),
(2, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=96128&image=delicatissimo.png&w=448&h=448&crop=1', 'DELICATISSIMO MENÙ', 'Pane Artigianale / Hamburger di Cavallo (Macina Maluburger) / Crema di Philadelphia / Formaggio fritto* / Bacon croccante / Cipolla caramellata...', 11.90, TRUE, TRUE, FALSE, TRUE),
(2, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=96125&image=all+in.png&w=448&h=448&crop=1', 'ALL IN MENÙ', 'Pane Artigianale / Sovracoscia di Pollo croccante Maluburger / Formaggio svizzero / Bacon croccante / Anelli di cipolla Pastellati* / Cipolla piastrata...', 11.90, FALSE, TRUE, FALSE, TRUE),
(2, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=201635&image=pulled+pork+burger.png&w=448&h=448&crop=1', 'PULLED PORK (CLASSICO)', 'Pane fresco Artigianale / Sfilacci di suino cotto a bassa temperatura sfilacciato / Cipolla Croccante / Formaggio Cheddar / Bacon croccante / Salsa SweetMalu', 10.50, TRUE, TRUE, FALSE, FALSE),
(3, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=226630&image=cheese+cheese+bacon.png&w=448&h=448&crop=1', 'CHEESE CHEESE BACON BACON', 'Pane fresco Artigianale / Hamburger di Manzo (Macina Maluburger) / Doppio Formaggio Fritto* / Doppio Bacon / Baconjam (marmellata di bacon)', 9.40, FALSE, TRUE, FALSE, FALSE),
(3, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=199966&image=pugliese.png&w=448&h=448&crop=1', 'PUGLIESE', 'Pane fresco Artigianale / Hamburger di Manzo Macina Maluburger / Pomodorino Fresco / Bacon / Burrata / Pesto di Pistacchio', 7.90, FALSE, TRUE, FALSE, FALSE),
(3, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=215583&image=furiaaa.png&w=448&h=448&crop=1', 'FURIA', 'Pane Artigianale / Hamburger di Cavallo macina Malu / Formaggio cheddar / Salsa X / Bacon / Funghi / Cipolla caramellata / Anelli di cipolla', 7.00, FALSE, TRUE, FALSE, FALSE),
(3, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=177687&image=pistacchiosooo.png&w=448&h=448&crop=1', 'PISTACCHIOSO', 'Pane fresco Artigianale, Hamburger di Manzo (Macina Maluburger), Pesto di Pistacchio e Pomodorino / Scaglie Di Grana / Mortadella', 7.50, FALSE, TRUE, FALSE, FALSE),
(3, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=121216&image=crea+il+panino.png&w=448&h=448&crop=1', 'CREA IL TUO PANINO', 'Crea il tuo panino potendo scegliere tra infinite combinazioni di sapori! (Clicca per gli ingredienti e le modifiche)', 5.50, FALSE, TRUE, FALSE, FALSE),
(3, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=50399&image=peppa.png&w=448&h=448&crop=1', 'CLASSICO', 'Pane fresco Artigianale / Hamburger a Scelta (Macina Maluburger) / Lattuga Pomodoro / Formaggio Cheddar / Salsa a scelta', 6.50, FALSE, TRUE, FALSE, FALSE),
(3, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=96126&image=croccante.png&w=448&h=448&crop=1', 'IL CROCCANTE', 'Pane fresco Artigianale / Sovracoscia di Pollo Croccante Maluburger / Lattuga / Pomodoro / Salsa Malu 2.0', 6.50, FALSE, FALSE, FALSE, FALSE),
(3, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=96127&image=malucavallo.png&w=448&h=448&crop=1', 'MALU CAVALLO', 'Pane fresco Artigianale / Hamburger di Cavallo macina Maluburger / Formaggio cheddar / Lattuga / Pomodoro / Bacon croccante / Rucola / Cipolla caramellata / Salsa Malu', 6.50, FALSE, TRUE, FALSE, FALSE),
(3, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=50399&image=peppa.png&w=448&h=448&crop=1', 'PEPPA ERA POCCA', 'Pane fresco Artigianale / Hamburger di Manzo (Macina Maluburger) / Formaggio cheddar / Lattuga / Bacon croccante / Salsa Malu (base maionese e prezzemolo)', 6.50, FALSE, TRUE, FALSE, FALSE),
(3, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=124078&image=gabbiano.png&w=448&h=448&crop=1', 'POVERO GABBIANO', 'Pane fresco Artigianale / Hamburger di Manzo (Macina Maluburger) / Lattuga / Doppio formaggi o cheddar / Bacon croccante / Cipolla croccante fatta in casa / Salsa...', 6.90, FALSE, TRUE, FALSE, FALSE),
(3, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=96123&image=crispy.png&w=448&h=448&crop=1', 'MALU CRISPY', 'Pane fresco Artigianale / Hamburger di Manzo (Macina Maluburger) / Doppio formaggio cheddar / Doppio Bacon croccante / Chips patate fritte* / Salsa Malu 2.0', 6.90, TRUE, TRUE, TRUE, FALSE),
(3, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=96128&image=delicatissimo.png&w=448&h=448&crop=1', 'DELICATISSIMO', 'Pane Artigianale / Hamburger 100% Cavallo macina Maluburger / Crema di Philadelphia e pistacchio / Formaggio fritto* / Doppio bacon croccante / Cipolla caramellata...', 8.90, TRUE, TRUE, FALSE, FALSE),
(3, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=96125&image=all+in.png&w=448&h=448&crop=1', 'ALL IN', 'Pane Artigianale / Sovracoscia di Pollo croccante Maluburger / Formaggio svizzero / Bacon croccante / Anelli di cipolla Pastellati* / Cipolla piastrata...', 8.90, FALSE, FALSE, FALSE, FALSE),
(3, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=201635&image=pulled+pork+burger.png&w=448&h=448&crop=1', 'PULLED PORK (CLASSICO)', 'Pane fresco Artigianale / Sfilacci di suino cotto a bassa temperatura speziato / Cipolla Croccante / Formaggio Cheddar / Bacon croccante / Salsa SweetMALU', 7.50, TRUE, TRUE, FALSE, FALSE),
(4, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=133528&image=caesar.png&w=448&h=448&crop=1', 'MALU CAESAR', 'Lattuga, Pollo Croccante, Scaglie di Grana, Mais, Salsa Malu, Semi di Chia', 8.20, FALSE, FALSE, FALSE, FALSE),
(4, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=50402&image=salad+burger.png&w=448&h=448&crop=1', 'MALU SALAD', 'Lattuga, Pomodoro Ciliegino, Mais, Carote, Patate al Forno, Crostini di Pane', 5.90, FALSE, FALSE, FALSE, FALSE),
(4, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=50403&image=grill.jpg&w=256&h=256&crop=1', 'CAESAR SALAD', 'Hamburger di Pollo alla piastra, Lattuga Iceberg, Carote alla Julienne, Mais, Scaglie di Grana, Crostini di Pane, Salsa Malu', 7.40, FALSE, FALSE, FALSE, FALSE),
(5, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=195710&image=IMG_7319.jpeg&w=448&h=448&crop=1', 'MONSTER ENERGY', '', 2.50, FALSE, FALSE, FALSE, TRUE),
(5, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=50414&image=classiccokeglassbottle.png&w=448&h=448&crop=1', 'Coca Cola', '', 2.50, FALSE, FALSE, FALSE, TRUE),
(5, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=50415&image=external-content.duckduckgo.com.jpg&w=448&h=448&crop=1', 'Coca Zero 33cl', '', 2.50, FALSE, FALSE, FALSE, TRUE),
(5, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=50417&image=fantaorangeglassbottle330ml.png&w=256&h=256&crop=1', 'Fanta 33cl', '', 2.50, FALSE, FALSE, FALSE, TRUE),
(5, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=106939&image=spriteglassbottle330ml.png&w=256&h=256&crop=1', 'Sprite 33cl', '', 2.50, FALSE, FALSE, FALSE, TRUE),
(5, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=106939&image=spriteglassbottle330ml.png&w=256&h=256&crop=1', 'Sprite 33cl', '', 2.50, FALSE, FALSE, FALSE, TRUE),
(5, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=50420&image=lilia.jpg&w=256&h=256&crop=1', 'Acqua Naturale', '', 1.00, FALSE, FALSE, FALSE, TRUE),
(5, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=50422&image=sveva.jpg&w=256&h=256&crop=1', 'Acqua Leggermente Frizzante', '', 1.00, FALSE, FALSE, FALSE, TRUE),
(5, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=76009&image=0085554_ferrero-estathe-pesca-33cl-confezione-da-24-barattoli-lattina_780.jpeg&w=256&h=256&crop=1', 'The al Limone 33cl', '', 2.00, FALSE, FALSE, FALSE, TRUE),
(5, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=76011&image=estath-limone-lattina-33-cl-spesa-online_0000033284-1000x1000.jpg&w=256&h=256&crop=1', 'Leffe Rouge', '', 3.50, FALSE, FALSE, FALSE, TRUE),
(5, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=186584&image=IMG_7062.png&w=256&h=256&crop=1', 'Ichnusa non filtrata', '', 3.50, FALSE, FALSE, FALSE, TRUE),
(5, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=170715&image=heineken_650ml_1024x1024.png&w=256&h=256&crop=1', 'Heineken 33cl', '', 3.00, FALSE, FALSE, FALSE, TRUE),
(5, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=170716&image=l_61015.png&w=256&h=256&crop=1', 'Messina Cristalli di Sale 33cl', '', 3.50, FALSE, FALSE, FALSE, TRUE),
(5, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=170717&image=tennent%27s_w448_h448_cp.png&w=256&h=256&crop=1', 'Super Tennent''s 33cl', '', 3.50, FALSE, FALSE, FALSE, TRUE),
(6, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=197151&image=nutellaaa.png&w=448&h=448&crop=1', 'Piadina alla Nutella', '', 1.00, FALSE, FALSE, FALSE, FALSE);



