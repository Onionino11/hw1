-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versione server:              10.4.32-MariaDB - mariadb.org binary distribution
-- S.O. server:                  Win64
-- HeidiSQL Versione:            12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dump dei dati della tabella malu.carrelli: ~3 rows (circa)
INSERT INTO `carrelli` (`id`, `user_id`, `created_at`, `totale`) VALUES
	(1, 9, '2025-05-31 16:03:01', 0.00),
	(2, 6, '2025-05-31 16:07:39', 2.50),
	(3, 1, '2025-05-31 16:53:54', 0.00);

-- Dump dei dati della tabella malu.carrello_prodotti: ~1 rows (circa)
INSERT INTO `carrello_prodotti` (`id`, `carrello_id`, `prodotto_id`, `nome`, `descrizione`, `prezzo`, `quantita`) VALUES
	(8, 2, 41, 'MONSTER ENERGY', 'Nessuna descrizione disponibile.', 2.50, 1);

-- Dump dei dati della tabella malu.categoria: ~6 rows (circa)
INSERT INTO `categoria` (`id`, `nome`, `descrizione`, `immagine`, `prodotti`, `burger`, `chips`, `drink`) VALUES
	(1, 'PER INIZIARE', 'Come fai a non farti tentare? I migliori prodotti fritti in olio di semi di girasole Altoleico', 'Classiche.jpg', '9', 0, 0, 0),
	(2, 'MALU PROMO MENU\'', 'MENU COMPLETO BURGER CONTORNO E BEVANDA\'', 'Classico.jpeg', '14', 1, 1, 1),
	(3, 'MALU BURGER (SOLO PANINO)', 'Piccolo = 100gr / Medio = 180gr / Malu = Tutto doppio', 'Pistacchioso.jpeg', '16', 1, 0, 0),
	(4, 'MALU LIGHT', 'Insalate Hamburger Veg. Piatti Leggeri ma dal Gusto Malu', 'MaluLight.jpeg', '5', 0, 0, 0),
	(5, 'DA BERE', '', 'DaBere.jpeg', '13', 0, 0, 1),
	(6, 'DOLCI', 'Per finire in bellezza una Cena Malu', 'Dolci.jpg', '1', 0, 0, 0);

-- Dump dei dati della tabella malu.ordini: ~3 rows (circa)
INSERT INTO `ordini` (`id`, `user_id`, `data`, `totale`, `note`, `first_name`, `last_name`, `phone`, `consegna`, `pagamento`) VALUES
	(1, 9, '2025-05-31 16:41:30', 8.80, 'grty', 'Antonino', 'Cipolla', '3473058965', 'tavolo', 'contanti'),
	(2, 9, '2025-05-31 16:44:04', 8.80, 'grty', 'Antonino', 'Cipolla', '3473058965', 'tavolo', 'contanti'),
	(3, 9, '2025-05-31 16:49:31', 56.90, '.oiuhgffghj', 'qwertyu', 'yughj', '342324254664', 'domicilio', 'carta'),
	(4, 1, '2025-05-31 16:54:33', 69.10, 'no', 'werty', 'dtrhdghjk', '1234567', 'tavolo', 'carta');

-- Dump dei dati della tabella malu.ordini_prodotti: ~7 rows (circa)
INSERT INTO `ordini_prodotti` (`id`, `ordine_id`, `prodotto_id`, `nome`, `prezzo`, `quantita`) VALUES
	(1, 2, 1, 'ANELLI DI CIPOLLA SPECIAL', 3.40, 2),
	(2, 2, 2, 'PATATINE CLASSICHE', 2.00, 1),
	(3, 3, 24, 'CHEESE CHEESE BACON BACON', 9.40, 1),
	(4, 3, 13, 'PISTACCHIOSO MENÙ', 9.50, 5),
	(5, 4, 46, 'Sprite 33cl', 2.50, 7),
	(6, 4, 55, 'Piadina alla Nutella', 1.00, 4),
	(7, 4, 10, 'CHEESE CHEESE BACON BACON MENÙ', 11.90, 4);

-- Dump dei dati della tabella malu.prodotti: ~55 rows (circa)
INSERT INTO `prodotti` (`id`, `categoria`, `immagine`, `nome`, `descrizione`, `prezzo`, `bestseller`, `burger`, `chips`, `drink`) VALUES
	(1, 1, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=50579&image=anelli+di+cipolla.png&w=256&h=256&crop=1', 'ANELLI DI CIPOLLA SPECIAL', 'Anelli di Cipolla pastellati alla birra', 3.40, 0, 0, 1, 0),
	(2, 1, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=50578&image=patatine+fritte.png&w=256&h=256&crop=1', 'PATATINE CLASSICHE', 'Patatine Fritte (Really Crunch Lambweston)', 2.00, 0, 0, 1, 0),
	(3, 1, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=101070&image=amerimalu.png&w=448&h=448&crop=1', 'AMERICANE', 'Patatine Fritte*, Würstel e Salsa Cheddar', 4.90, 0, 0, 1, 0),
	(4, 1, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=52552&image=formaggio+e+bacon.png&w=448&h=448&crop=1', 'FORMAGGIO E BACON', 'Patatine Lambweston*, Salsa Cheddar e Bacon croccante', 4.90, 0, 0, 1, 0),
	(5, 1, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=52551&image=formaggio.png&w=448&h=448&crop=1', 'PATATINE AL FORMAGGIO', 'Patatine Lambweston*, Salsa Cheddar', 4.40, 0, 0, 1, 0),
	(6, 1, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=209860&image=pulled+pork.png&w=448&h=448&crop=1', 'AMERICAN PULLED PORK', 'Patate Lambweston*, American Pulled Pork, Salsa Barbecue e Salsa Cheddar', 4.90, 0, 0, 1, 0),
	(7, 1, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=52553&image=mortazza.png&w=448&h=448&crop=1', 'PISTACCHIO E MORTADELLA', 'Patatine Lambweston*, Mortadella, Salsa al Pistacchio e granella di Pistacchio', 4.90, 0, 0, 1, 0),
	(8, 1, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=50580&image=crocchette+patate.png&w=448&h=448&crop=1', 'CROCCHETTE DI PATATE', 'Crocchette di Patate', 2.50, 0, 0, 1, 0),
	(9, 1, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=50581&image=nuggets.png&w=448&h=448&crop=1', 'NUGGETS DI POLLO (BIRBE)', 'Birbe di pollo croccanti', 4.40, 0, 0, 0, 0),
	(10, 2, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=226630&image=cheese+cheese+bacon.png&w=448&h=448&crop=1', 'CHEESE CHEESE BACON BACON MENÙ', 'Pane fresco Artigianale / Hamburger di Manzo (Macina Maluburger) / Doppio Formaggio Fritto* / Doppio Bacon / Baconjam (marmellata di bacon)', 11.90, 0, 1, 1, 1),
	(11, 2, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=199966&image=pugliese.png&w=448&h=448&crop=1', 'PUGLIESE MENÙ', 'Pane fresco Artigianale / Hamburger di Manzo (Macina Maluburger) / Pomodorino Fresco / Bacon / Burrata / Pesto di Pistacchio', 9.50, 0, 1, 0, 0),
	(12, 2, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=215583&image=furiaaa.png&w=448&h=448&crop=1', 'FURIA MENÙ', 'Pane Artigianale / Hamburger di Cavallo macina Malu / Formaggio cheddar / Salsa X / Bacon / Funghi / Cipolla caramellata / Anelli di cipolla', 10.00, 0, 1, 0, 0),
	(13, 2, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=177687&image=pistacchiosooo.png&w=448&h=448&crop=1', 'PISTACCHIOSO MENÙ', 'Pane fresco Artigianale, Hamburger di Manzo (Macina Maluburger), Pesto di Pistacchio e Pomodorino / Scaglie Di Grana / Mortadella', 9.50, 0, 1, 0, 1),
	(14, 2, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=121216&image=crea+il+panino.png&w=448&h=448&crop=1', 'CREA IL TUO BURGER MENÙ', 'Pane fresco Artigianale, Hamburger a Scelta 100% Carne macina Maluburger, Salse a Scelta', 8.50, 0, 1, 0, 0),
	(15, 2, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=50399&image=peppa.png&w=448&h=448&crop=1', 'CLASSICO MENÙ', 'Pane Artigianale / Hamburger a Scelta / Formaggio cheddar / Lattuga / Pomodoro / Salsa a scelta', 9.50, 0, 1, 0, 1),
	(16, 2, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=50399&image=peppa.png&w=448&h=448&crop=1', 'PEPPA MENÙ', 'Pane Artigianale / Hamburger di Manzo (Macina Maluburger) / Formaggio cheddar / Lattuga / Pomodoro / Bacon croccante / Salsa Malu', 9.50, 0, 1, 0, 0),
	(17, 2, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=96126&image=croccante.png&w=448&h=448&crop=1', 'CROCCANTE MENÙ', 'Pane Artigianale / Sovracoscia di Pollo croccante Malu / Salsa cheddar / Lattuga / Pomodoro / Salsa barbecue / Colata di Salsa Cheddar / Bacon croccante sopra il panino', 11.90, 0, 1, 0, 0),
	(18, 2, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=96127&image=malucavallo.png&w=448&h=448&crop=1', 'MALU CAVALLO MENÙ', 'Pane Artigianale / Hamburger 100% Cavallo macina Maluburger / Formaggio cheddar / Bacon croccante / Rucola / Cipolla caramellata / Salsa Malu', 9.50, 0, 1, 0, 1),
	(19, 2, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=124078&image=gabbiano.png&w=448&h=448&crop=1', 'POVERO GABBIANO MENÙ', 'Pane Artigianale / Hamburger di Manzo (Macina Maluburger) / Lattuga / Doppio formaggio cheddar / Bacon croccante / Cipolla croccante fatta in casa', 9.90, 0, 1, 0, 0),
	(20, 2, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=96123&image=crispy.png&w=448&h=448&crop=1', 'MALU CRISPY MENÙ', 'Pane Artigianale / Hamburger di Manzo (Macina Maluburger) / Formaggio cheddar / Doppio Bacon croccante / Chips patate fritte* / Salsa Malu 2.0', 9.90, 1, 1, 1, 0),
	(21, 2, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=96128&image=delicatissimo.png&w=448&h=448&crop=1', 'DELICATISSIMO MENÙ', 'Pane Artigianale / Hamburger di Cavallo (Macina Maluburger) / Crema di Philadelphia / Formaggio fritto* / Bacon croccante / Cipolla caramellata...', 11.90, 1, 1, 0, 1),
	(22, 2, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=96125&image=all+in.png&w=448&h=448&crop=1', 'ALL IN MENÙ', 'Pane Artigianale / Sovracoscia di Pollo croccante Maluburger / Formaggio svizzero / Bacon croccante / Anelli di cipolla Pastellati* / Cipolla piastrata...', 11.90, 0, 1, 0, 1),
	(23, 2, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=201635&image=pulled+pork+burger.png&w=448&h=448&crop=1', 'PULLED PORK (CLASSICO)', 'Pane fresco Artigianale / Sfilacci di suino cotto a bassa temperatura sfilacciato / Cipolla Croccante / Formaggio Cheddar / Bacon croccante / Salsa SweetMalu', 10.50, 1, 1, 0, 0),
	(24, 3, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=226630&image=cheese+cheese+bacon.png&w=448&h=448&crop=1', 'CHEESE CHEESE BACON BACON', 'Pane fresco Artigianale / Hamburger di Manzo (Macina Maluburger) / Doppio Formaggio Fritto* / Doppio Bacon / Baconjam (marmellata di bacon)', 9.40, 0, 1, 0, 0),
	(25, 3, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=199966&image=pugliese.png&w=448&h=448&crop=1', 'PUGLIESE', 'Pane fresco Artigianale / Hamburger di Manzo Macina Maluburger / Pomodorino Fresco / Bacon / Burrata / Pesto di Pistacchio', 7.90, 0, 1, 0, 0),
	(26, 3, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=215583&image=furiaaa.png&w=448&h=448&crop=1', 'FURIA', 'Pane Artigianale / Hamburger di Cavallo macina Malu / Formaggio cheddar / Salsa X / Bacon / Funghi / Cipolla caramellata / Anelli di cipolla', 7.00, 0, 1, 0, 0),
	(27, 3, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=177687&image=pistacchiosooo.png&w=448&h=448&crop=1', 'PISTACCHIOSO', 'Pane fresco Artigianale, Hamburger di Manzo (Macina Maluburger), Pesto di Pistacchio e Pomodorino / Scaglie Di Grana / Mortadella', 7.50, 0, 1, 0, 0),
	(28, 3, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=121216&image=crea+il+panino.png&w=448&h=448&crop=1', 'CREA IL TUO PANINO', 'Crea il tuo panino potendo scegliere tra infinite combinazioni di sapori! (Clicca per gli ingredienti e le modifiche)', 5.50, 0, 1, 0, 0),
	(29, 3, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=50399&image=peppa.png&w=448&h=448&crop=1', 'CLASSICO', 'Pane fresco Artigianale / Hamburger a Scelta (Macina Maluburger) / Lattuga Pomodoro / Formaggio Cheddar / Salsa a scelta', 6.50, 0, 1, 0, 0),
	(30, 3, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=96126&image=croccante.png&w=448&h=448&crop=1', 'IL CROCCANTE', 'Pane fresco Artigianale / Sovracoscia di Pollo Croccante Maluburger / Lattuga / Pomodoro / Salsa Malu 2.0', 6.50, 0, 0, 0, 0),
	(31, 3, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=96127&image=malucavallo.png&w=448&h=448&crop=1', 'MALU CAVALLO', 'Pane fresco Artigianale / Hamburger di Cavallo macina Maluburger / Formaggio cheddar / Lattuga / Pomodoro / Bacon croccante / Rucola / Cipolla caramellata / Salsa Malu', 6.50, 0, 1, 0, 0),
	(32, 3, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=50399&image=peppa.png&w=448&h=448&crop=1', 'PEPPA ERA POCCA', 'Pane fresco Artigianale / Hamburger di Manzo (Macina Maluburger) / Formaggio cheddar / Lattuga / Bacon croccante / Salsa Malu (base maionese e prezzemolo)', 6.50, 0, 1, 0, 0),
	(33, 3, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=124078&image=gabbiano.png&w=448&h=448&crop=1', 'POVERO GABBIANO', 'Pane fresco Artigianale / Hamburger di Manzo (Macina Maluburger) / Lattuga / Doppio formaggi o cheddar / Bacon croccante / Cipolla croccante fatta in casa / Salsa...', 6.90, 0, 1, 0, 0),
	(34, 3, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=96123&image=crispy.png&w=448&h=448&crop=1', 'MALU CRISPY', 'Pane fresco Artigianale / Hamburger di Manzo (Macina Maluburger) / Doppio formaggio cheddar / Doppio Bacon croccante / Chips patate fritte* / Salsa Malu 2.0', 6.90, 1, 1, 1, 0),
	(35, 3, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=96128&image=delicatissimo.png&w=448&h=448&crop=1', 'DELICATISSIMO', 'Pane Artigianale / Hamburger 100% Cavallo macina Maluburger / Crema di Philadelphia e pistacchio / Formaggio fritto* / Doppio bacon croccante / Cipolla caramellata...', 8.90, 1, 1, 0, 0),
	(36, 3, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=96125&image=all+in.png&w=448&h=448&crop=1', 'ALL IN', 'Pane Artigianale / Sovracoscia di Pollo croccante Maluburger / Formaggio svizzero / Bacon croccante / Anelli di cipolla Pastellati* / Cipolla piastrata...', 8.90, 0, 0, 0, 0),
	(37, 3, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=201635&image=pulled+pork+burger.png&w=448&h=448&crop=1', 'PULLED PORK (CLASSICO)', 'Pane fresco Artigianale / Sfilacci di suino cotto a bassa temperatura speziato / Cipolla Croccante / Formaggio Cheddar / Bacon croccante / Salsa SweetMALU', 7.50, 1, 1, 0, 0),
	(38, 4, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=133528&image=caesar.png&w=448&h=448&crop=1', 'MALU CAESAR', 'Lattuga, Pollo Croccante, Scaglie di Grana, Mais, Salsa Malu, Semi di Chia', 8.20, 0, 0, 0, 0),
	(39, 4, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=50402&image=salad+burger.png&w=448&h=448&crop=1', 'MALU SALAD', 'Lattuga, Pomodoro Ciliegino, Mais, Carote, Patate al Forno, Crostini di Pane', 5.90, 0, 0, 0, 0),
	(40, 4, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=50403&image=grill.jpg&w=256&h=256&crop=1', 'CAESAR SALAD', 'Hamburger di Pollo alla piastra, Lattuga Iceberg, Carote alla Julienne, Mais, Scaglie di Grana, Crostini di Pane, Salsa Malu', 7.40, 0, 0, 0, 0),
	(41, 5, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=195710&image=IMG_7319.jpeg&w=448&h=448&crop=1', 'MONSTER ENERGY', '', 2.50, 0, 0, 0, 1),
	(42, 5, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=50414&image=classiccokeglassbottle.png&w=448&h=448&crop=1', 'Coca Cola', '', 2.50, 0, 0, 0, 1),
	(43, 5, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=50415&image=external-content.duckduckgo.com.jpg&w=448&h=448&crop=1', 'Coca Zero 33cl', '', 2.50, 0, 0, 0, 1),
	(44, 5, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=50417&image=fantaorangeglassbottle330ml.png&w=256&h=256&crop=1', 'Fanta 33cl', '', 2.50, 0, 0, 0, 1),
	(45, 5, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=106939&image=spriteglassbottle330ml.png&w=256&h=256&crop=1', 'Sprite 33cl', '', 2.50, 0, 0, 0, 1),
	(46, 5, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=106939&image=spriteglassbottle330ml.png&w=256&h=256&crop=1', 'Sprite 33cl', '', 2.50, 0, 0, 0, 1),
	(47, 5, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=50420&image=lilia.jpg&w=256&h=256&crop=1', 'Acqua Naturale', '', 1.00, 0, 0, 0, 1),
	(48, 5, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=50422&image=sveva.jpg&w=256&h=256&crop=1', 'Acqua Leggermente Frizzante', '', 1.00, 0, 0, 0, 1),
	(49, 5, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=76009&image=0085554_ferrero-estathe-pesca-33cl-confezione-da-24-barattoli-lattina_780.jpeg&w=256&h=256&crop=1', 'The al Limone 33cl', '', 2.00, 0, 0, 0, 1),
	(50, 5, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=76011&image=estath-limone-lattina-33-cl-spesa-online_0000033284-1000x1000.jpg&w=256&h=256&crop=1', 'Leffe Rouge', '', 3.50, 0, 0, 0, 1),
	(51, 5, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=186584&image=IMG_7062.png&w=256&h=256&crop=1', 'Ichnusa non filtrata', '', 3.50, 0, 0, 0, 1),
	(52, 5, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=170715&image=heineken_650ml_1024x1024.png&w=256&h=256&crop=1', 'Heineken 33cl', '', 3.00, 0, 0, 0, 1),
	(53, 5, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=170716&image=l_61015.png&w=256&h=256&crop=1', 'Messina Cristalli di Sale 33cl', '', 3.50, 0, 0, 0, 1),
	(54, 5, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=170717&image=tennent%27s_w448_h448_cp.png&w=256&h=256&crop=1', 'Super Tennent\'s 33cl', '', 3.50, 0, 0, 0, 1),
	(55, 6, 'https://static.xmenu.it/api/img/resize?entity=product&entity_id=197151&image=nutellaaa.png&w=448&h=448&crop=1', 'Piadina alla Nutella', '', 1.00, 0, 0, 0, 0);

-- Dump dei dati della tabella malu.users: ~7 rows (circa)
INSERT INTO `users` (`id`, `email`, `password`, `first_name`, `last_name`, `birthday`, `city`, `province`, `phone`, `accept_marketing`, `zip`, `indirizzo`, `nciv`, `doorbell`, `floor`, `cap`, `country`, `gender`, `created_at`) VALUES
	(1, 'mario.rossi@email.it', '$2y$10$hasH1', 'Mario', 'Rossi', '1990-05-10', 'Roma', 'RM', '3331234567', 1, NULL, 'Via Roma', '10', 'Rossi', '2', '00100', 'Italia', 'm', '2025-05-28 07:42:39'),
	(2, 'giulia.bianchi@email.it', '$2y$10$hash2', 'Giulia', 'Bianchi', '1985-08-22', 'Milano', 'MI', '3339876543', 0, NULL, 'Via Milano', '22', 'Bianchi', '3', '20100', 'Italia', 'f', '2025-05-28 07:42:39'),
	(3, 'luca.verdi@email.it', '$2y$10$hash3', 'Luca', 'Verdi', '1992-12-01', 'Napoli', 'NA', '3335554444', 1, NULL, 'Via Napoli', '5', 'Verdi', '1', '80100', 'Italia', 'm', '2025-05-28 07:42:39'),
	(4, 'anna.neri@email.it', '$2y$10$hash4', 'Anna', 'Neri', '1998-03-15', 'Torino', 'TO', '3332223333', 0, NULL, 'Via Torino', '8', 'Neri', '4', '10100', 'Italia', 'f', '2025-05-28 07:42:39'),
	(5, 'paolo.blu@email.it', '$2y$10$hash5', 'Paolo', 'Blu', '1980-11-30', 'Firenze', 'FI', '3336667777', 1, NULL, 'Via Firenze', '12', 'Blu', '5', '50100', 'Italia', 'm', '2025-05-28 07:42:39'),
	(6, 'antoninocipollac@gmail.com', 'Passw0rd.', 'Antonino', 'Cipolla', '2025-05-08', 'PATERNÒ', 'CT', '3473058965', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-05-28 12:44:48'),
	(7, 'marco@gmail.com', 'Passw0rd-', 'Marco', 'Cognome', '2025-05-10', 'Londra', 'GB', '123456789', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-05-28 12:54:11'),
	(8, 'Prova@gmail.com', 'Passw0rd*', 'qwertqwert', 'qwer', '2025-05-23', 'sdfghjk', 'ccvbnm', 'sdfghjklò', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-05-28 13:56:30'),
	(9, 'wdtrtfyguihou@ghhhggh.po', '1234Cs/8', 'afsdfdgf', 'gnhreyhn ', '2344-04-23', 'dgfgfnghmhh', 'RT', '123456787654', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-05-31 12:36:04');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
