--@block reset
DROP DATABASE mylido;

CREATE DATABASE mylido;
-- Create Tables
USE mylido;

CREATE TABLE Clienti (
  ID_Cliente INT PRIMARY KEY AUTO_INCREMENT,
  Nome VARCHAR(20) NOT NULL,
  Cognome VARCHAR(20) NOT NULL
);

CREATE TABLE Servizi (
    ID_Servizio INT PRIMARY KEY AUTO_INCREMENT,
    Tipo ENUM('ombrellone', 'lettino', 'cabina', 'pedalò'),
    Quantità_Tipo INT NOT NULL DEFAULT '1',
    Prezzo DECIMAL(6, 2) NOT NULL
);

CREATE TABLE Prenotazione_Servizi (
  ID_Prenotazione INT NOT NULL,
  ID_Servizio INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (ID_Prenotazione, ID_Servizio),
  FOREIGN KEY (ID_Servizio) REFERENCES Servizi(ID_Servizio)
);

CREATE TABLE Prenotazioni (
  ID_Prenotazione INT PRIMARY KEY AUTO_INCREMENT,
  ID_Cliente INT NOT NULL,
  Data_Prenotazione DATE NOT NULL,
  N_Ingressi INT NOT NULL DEFAULT 1,
  Periodo ENUM('giornaliero', 'settimanale', 'quindicinale', 'mensile', 'stagionale') NOT NULL,
  Costo DECIMAL(6, 2) NOT NULL,
  FOREIGN KEY (ID_Prenotazione) REFERENCES Prenotazione_Servizi(ID_Prenotazione),
  FOREIGN KEY (ID_Cliente) REFERENCES Clienti(ID_Cliente)
);

CREATE TABLE Pagamenti (
  ID_Pagamento INT PRIMARY KEY AUTO_INCREMENT,
  ID_Prenotazione INT NOT NULL,
  Data_Pagamento DATE NOT NULL,
  Importo DECIMAL(6, 2) NOT NULL,
  Metodo_Pagamento VARCHAR(50),
  FOREIGN KEY (ID_Prenotazione) REFERENCES Prenotazioni(ID_Prenotazione)
);

CREATE TABLE Prezzi (
  Tipo ENUM('ombrellone', 'lettino', 'cabina', 'pedalò', 'giornaliero', 'settimanale', 'quindicinale', 'mensile', 'stagionale', 'ingresso') PRIMARY KEY,
  Prezzo DECIMAL(5, 2) NOT NULL
);

CREATE TABLE Ombrelloni (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  Prenotato BOOLEAN NOT NULL DEFAULT FALSE,
  ID_Servizio INT,
  FOREIGN KEY (ID_Servizio) REFERENCES Servizi(ID_Servizio)
);

CREATE TABLE Cabine (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  Prenotato BOOLEAN NOT NULL DEFAULT FALSE,
  ID_Servizio INT,
  FOREIGN KEY (ID_Servizio) REFERENCES Servizi(ID_Servizio)
);

CREATE TABLE Pedalò (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  Prenotato BOOLEAN NOT NULL DEFAULT FALSE,
  ID_Servizio INT,
  FOREIGN KEY (ID_Servizio) REFERENCES Servizi(ID_Servizio)
);

CREATE TABLE Lettini (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  Prenotato BOOLEAN NOT NULL DEFAULT FALSE,
  ID_Servizio INT,
  FOREIGN KEY (ID_Servizio) REFERENCES Servizi(ID_Servizio)
);

-- Insert

-- O1
INSERT INTO Clienti (Nome, Cognome)
VALUES ('Mario', 'Rossi'),
('Emanuele', 'Ferrari'),
('Gemma', 'Gentile'),
('Giancarlo', 'Martini'),
('Gaspare', 'Conti'),
('Amelia', 'Caruso'),
('Giulio', 'Poli'),
('Antonio', 'Bernardi'),
('Fabio', 'Villa'),
('Loredana', 'Carbone'),
('Irene', 'Caruso'),
('Clara', 'Massimo'),
('Emilio', 'Farina'),
('Alessio', 'Bianco'),
('Danilo', 'Galli'),
('Bernardo', 'Lauricella'),
('Alice', 'Guerra'),
('Daniela', 'Sala'),
('Giancarlo', 'Ferrari'),
('Alessio', 'Valentini'),
('Gennaro', 'Coppola'),
('Lino', 'Conte'),
('Carlotta', 'Angelo'),
('Carlo', 'Rocca'),
('Fabio', 'Moretti'),
('Aurora', 'Lombardo'),
('Elio', 'Pellegrini'),
('Leo', 'Lombardi Lombardi'),
('Luciana', 'Greco'),
('Alfonso', 'Lombardo'),
('Giancarlo', 'Leone'),
('Amedeo', 'Mariani'),
('Danilo', 'Longo'),
('Filippo', 'Caruso'),
('Lino', 'Pasquale'),
('Emilio', 'Marchetti'),
('Ennio', 'Pellegrini'),
('Debora', 'Mariani'),
('Gemma', 'Greco'),
('Emilio', 'De Luca'),
('Luisa', 'De Luca'),
('Enzo', 'Barbieri'),
('Filippo', 'Mariani'),
('Cristina', 'Lauricella'),
('Cosimo', 'Rizzo'),
('Daniele', 'De Luca'),
('Fabrizio', 'Ferrari'),
('Giulio', 'Mauro'),
('Carola', 'Giorgi'),
('Claudia', 'Greco'),
('Anna', 'Pasquale'),
('Daniele', 'Palumbo'),
('Filippo', 'Riva'),
('Antonio', 'Galli'),
('Daniele', 'Marini'),
('Bernardo', 'Cattaneo'),
('Loredana', 'Rossi'),
('Luciana', 'Coppola'),
('Bernardo', 'Gentile'),
('Amelia', 'Soc'),
('Giorgia', 'Costa'),
('Carmen', 'Gallo'),
('Giancarlo', 'Soc'),
('Bartolomeo', 'Russo'),
('Alfonso', 'Rinaldi'),
('Leandro', 'Monti'),
('Ciro', 'Villa'),
('Federica', 'Ferrara'),
('Giuseppe', 'Martini'),
('Antonio', 'Monti'),
('Beatrice', 'Mario'),
('Beatrice', 'Neri'),
('Domenico', 'Salvatore'),
('Carlotta', 'Rinaldi'),
('Beatrice', 'Conte'),
('Bartolomeo', 'Pellegrini'),
('Flavio', 'Rinaldi'),
('Ennio', 'Russo'),
('Bruno', 'Palma'),
('Francesco', 'Longo'),
('Fabrizio', 'Salvatore'),
('Luisa', 'Carbone'),
('Elena', 'Bruno'),
('Fabiano', 'Bianco'),
('Alberto', 'Fratelli'),
('Egidio', 'Colombo'),
('Daniela', 'Riva'),
('Giulia', 'Moro'),
('Corrado', 'Marini'),
('Carlo', 'Massimo'),
('Luisa', 'Riva'),
('Enrico', 'Lombardi Lombardi'),
('Francesco', 'Pellegrino'),
('Cosimo', 'Grassi'),
('Giacomo', 'Leone'),
('Fedele', 'Bianchi'),
('Alfonso', 'Barbieri'),
('Alessia', 'Martino'),
('Giorgia', 'Ferri'),
('Fabiano', 'Rocca'),
('Carlo', 'Michele'),
('Diego', 'Valentini'),
('Cesare', 'Morelli'),
('Diego', 'Marino'),
('Francesca', 'Mancini'),
('Giacomo', 'Re'),
('Letizia', 'Amato'),
('Biagio', 'Rinaldi'),
('Boris', 'Silvestri'),
('Caterina', 'Messina'),
('Gennaro', 'Palumbo'),
('Dario', 'Soc'),
('Carola', 'Leo'),
('Casimiro', 'Rossi'),
('Lucia', 'De Luca'),
('Leo', 'Carbone'),
('Amelia', 'Longo'),
('Emilio', 'Conte'),
('Elio', 'Sala'),
('Lucia', 'Leone'),
('Daniele', 'Bruno'),
('Lino', 'Fontana'),
('Felice', 'Leo'),
('Alessandro', 'Marini'),
('Debora', 'Palma'),
('Angela', 'Mazza'),
('Alice', 'Ferrari'),
('Lino', 'Angelo'),
('Giovanni', 'Farina'),
('Federica', 'Santoro'),
('Denise', 'Russo'),
('Lucia', 'Ricci'),
('Ennio', 'Longo'),
('Luisa', 'Messina'),
('Alfio', 'Mazza'),
('Emanuele', 'Giorgi'),
('Federica', 'Longo'),
('Daniela', 'Conte'),
('Giancarlo', 'Fiore'),
('Enzo', 'Vitale'),
('Loredana', 'Palumbo'),
('Gennaro', 'Rinaldi'),
('Boris', 'Paola'),
('Alberto', 'Marini'),
('Lucia', 'Marchi'),
('Loredana', 'Pellegrino'),
('Beatrice', 'Coppola'),
('Francesco', 'Rizzi'),
('Daniela', 'Pellegrino'),
('Carmelo', 'Moretti');

-- O9
INSERT INTO Prezzi (Tipo, Prezzo)
VALUES
('lettino', 6),
('ombrellone', 10),
('cabina', 20),
('pedalò', 12),
('ingresso', 5),
('giornaliero', 1),
('settimanale', 6),
('quindicinale', 12),
('mensile', 23),
('stagionale', 60);

-- O8
INSERT INTO Ombrelloni (Prenotato, ID_Servizio)
VALUES (DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL);

INSERT INTO Cabine (Prenotato, ID_Servizio)
VALUES (DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL);

INSERT INTO Pedalò (Prenotato, ID_Servizio)
VALUES (DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL);

INSERT INTO Lettini (Prenotato, ID_Servizio)
VALUES (DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL),
(DEFAULT, NULL);

-- T2
CREATE TRIGGER T2 BEFORE INSERT ON Servizi
FOR EACH ROW
BEGIN
    DECLARE disponibili INT;
    IF NEW.Tipo = 'ombrellone' THEN
        SELECT COUNT(*) INTO disponibili FROM Ombrelloni WHERE Prenotato = FALSE;
    ELSEIF NEW.Tipo = 'lettino' THEN
        SELECT COUNT(*) INTO disponibili FROM Lettini WHERE Prenotato = FALSE;
    ELSEIF NEW.Tipo = 'cabina' THEN
        SELECT COUNT(*) INTO disponibili FROM Cabine WHERE Prenotato = FALSE;
    ELSEIF NEW.Tipo = 'pedalò' THEN
        SELECT COUNT(*) INTO disponibili FROM Pedalò WHERE Prenotato = FALSE;
    END IF;
    IF disponibili < NEW.Quantità_Tipo THEN
        DELETE FROM Prenotazione_Servizi WHERE ID_Servizio = NEW.ID_Servizio;
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Non ci sono abbastanza servizi disponibili per soddisfare la richiesta';
    END IF;
END;

-- T3
CREATE TRIGGER T3 BEFORE INSERT ON Servizi
FOR EACH ROW
BEGIN
    DECLARE prezzo_unitario DECIMAL(5, 2);
    SELECT Prezzo INTO prezzo_unitario FROM Prezzi WHERE Tipo = NEW.Tipo;
    SET NEW.Prezzo = prezzo_unitario * NEW.Quantità_Tipo;
END;

-- O4
INSERT INTO Servizi (Tipo, Quantità_Tipo)
VALUES
('pedalò', 2),
('lettino', 4),
('cabina', 2),
('cabina', 1),
('pedalò', 1),
('cabina', 1),
('ombrellone', 2),
('lettino', 3),
('cabina', 1),
('ombrellone', 1),
('ombrellone', 2),
('ombrellone', 2),
('cabina', 1),
('pedalò', 2),
('lettino', 4),
('ombrellone', 1),
('lettino', 3),
('ombrellone', 2),
('cabina', 1),
('pedalò', 1),
('cabina', 2),
('pedalò', 2),
('lettino', 3),
('lettino', 1),
('pedalò', 1),
('cabina', 2),
('lettino', 3),
('pedalò', 1),
('cabina', 2),
('lettino', 4),
('pedalò', 1),
('lettino', 4),
('pedalò', 2),
('cabina', 2),
('cabina', 1),
('pedalò', 1),
('ombrellone', 1),
('ombrellone', 1),
('lettino', 2),
('cabina', 2),
('ombrellone', 1),
('cabina', 1),
('cabina', 1),
('ombrellone', 2),
('ombrellone', 1),
('cabina', 2),
('cabina', 2),
('ombrellone', 2),
('ombrellone', 1),
('cabina', 1),
('cabina', 2),
('ombrellone', 1),
('lettino', 4),
('lettino', 4),
('cabina', 2),
('lettino', 2),
('ombrellone', 1),
('cabina', 1),
('ombrellone', 2),
('lettino', 4),
('ombrellone', 2),
('ombrellone', 1),
('cabina', 1),
('cabina', 2),
('ombrellone', 1),
('ombrellone', 2),
('cabina', 2),
('ombrellone', 2),
('lettino', 1),
('lettino', 4),
('cabina', 1),
('ombrellone', 1),
('lettino', 1),
('ombrellone', 1),
('cabina', 2),
('cabina', 2),
('lettino', 1),
('ombrellone', 1),
('cabina', 1),
('cabina', 2),
('lettino', 3),
('ombrellone', 1),
('cabina', 1),
('lettino', 1),
('cabina', 2),
('cabina', 2),
('lettino', 2),
('ombrellone', 2),
('cabina', 1),
('ombrellone', 2),
('lettino', 2),
('cabina', 1),
('lettino', 1),
('ombrellone', 1),
('ombrellone', 1),
('cabina', 1),
('ombrellone', 1),
('lettino', 3),
('lettino', 4),
('ombrellone', 1),
('ombrellone', 1),
('ombrellone', 1),
('cabina', 1),
('ombrellone', 1),
('cabina', 2),
('lettino', 4),
('cabina', 1),
('ombrellone', 1),
('lettino', 1),
('lettino', 2),
('cabina', 1),
('ombrellone', 1),
('cabina', 1),
('ombrellone', 1),
('cabina', 2),
('ombrellone', 2),
('cabina', 1),
('ombrellone', 1),
('ombrellone', 2),
('ombrellone', 2),
('cabina', 2),
('cabina', 1),
('lettino', 4),
('ombrellone', 2),
('lettino', 3),
('cabina', 2),
('cabina', 2),
('cabina', 2),
('lettino', 1),
('lettino', 3),
('ombrellone', 1),
('ombrellone', 2),
('cabina', 1),
('lettino', 4),
('lettino', 2),
('cabina', 2),
('lettino', 3),
('cabina', 1),
('lettino', 3),
('cabina', 1),
('ombrellone', 2),
('ombrellone', 1),
('lettino', 2),
('cabina', 1),
('cabina', 1),
('ombrellone', 1),
('lettino', 4),
('lettino', 3),
('cabina', 1),
('ombrellone', 1),
('ombrellone', 1),
('cabina', 1),
('cabina', 1),
('ombrellone', 1),
('cabina', 1),
('ombrellone', 2),
('lettino', 1),
('cabina', 1),
('ombrellone', 1),
('lettino', 1),
('cabina', 1),
('ombrellone', 2),
('lettino', 2),
('ombrellone', 2),
('lettino', 1),
('ombrellone', 2),
('lettino', 1),
('cabina', 2),
('cabina', 2),
('ombrellone', 1),
('lettino', 4),
('lettino', 4),
('cabina', 1),
('ombrellone', 2),
('ombrellone', 2),
('lettino', 3),
('cabina', 1),
('lettino', 1),
('lettino', 4),
('ombrellone', 2),
('ombrellone', 2),
('lettino', 2),
('ombrellone', 1),
('cabina', 2),
('lettino', 1),
('cabina', 1),
('lettino', 2),
('lettino', 3),
('lettino', 2),
('ombrellone', 2),
('cabina', 2),
('ombrellone', 1),
('ombrellone', 2),
('cabina', 2),
('lettino', 4),
('cabina', 2),
('ombrellone', 2),
('lettino', 2),
('ombrellone', 1),
('cabina', 2),
('cabina', 1),
('ombrellone', 1),
('cabina', 1),
('ombrellone', 1),
('cabina', 1),
('cabina', 2),
('lettino', 3),
('ombrellone', 2),
('cabina', 2),
('lettino', 1),
('lettino', 3),
('ombrellone', 2),
('cabina', 2),
('lettino', 3),
('ombrellone', 1),
('lettino', 1),
('ombrellone', 2),
('cabina', 2),
('cabina', 1),
('ombrellone', 1),
('lettino', 3),
('ombrellone', 1),
('lettino', 1),
('ombrellone', 2),
('lettino', 1),
('ombrellone', 1),
('cabina', 2),
('cabina', 1),
('lettino', 3),
('ombrellone', 2),
('ombrellone', 2),
('lettino', 3),
('lettino', 1),
('cabina', 2),
('lettino', 1),
('lettino', 4),
('cabina', 2),
('lettino', 3),
('cabina', 2),
('ombrellone', 2),
('lettino', 2),
('ombrellone', 1),
('cabina', 2),
('cabina', 1),
('lettino', 1),
('cabina', 1),
('ombrellone', 1),
('lettino', 3),
('ombrellone', 1),
('cabina', 1),
('cabina', 2),
('ombrellone', 2),
('lettino', 4),
('cabina', 1),
('ombrellone', 1),
('ombrellone', 1),
('cabina', 2),
('lettino', 3),
('ombrellone', 1),
('lettino', 4),
('cabina', 1),
('cabina', 1),
('ombrellone', 2),
('lettino', 4),
('lettino', 3),
('cabina', 2),
('lettino', 2),
('cabina', 2),
('lettino', 4),
('ombrellone', 2),
('lettino', 1),
('ombrellone', 1),
('cabina', 2),
('ombrellone', 2),
('cabina', 1),
('cabina', 2),
('lettino', 3),
('ombrellone', 2),
('cabina', 2),
('cabina', 1),
('cabina', 2),
('ombrellone', 2),
('cabina', 2),
('lettino', 1),
('ombrellone', 1),
('lettino', 4),
('ombrellone', 2),
('lettino', 3),
('ombrellone', 1),
('ombrellone', 2),
('cabina', 1),
('ombrellone', 2),
('lettino', 3),
('cabina', 1),
('lettino', 3),
('ombrellone', 1),
('cabina', 2),
('cabina', 2),
('ombrellone', 1),
('lettino', 4),
('cabina', 2),
('cabina', 1),
('lettino', 4),
('ombrellone', 2),
('ombrellone', 2),
('ombrellone', 1),
('lettino', 1),
('ombrellone', 1),
('cabina', 1),
('ombrellone', 2),
('cabina', 2),
('lettino', 2),
('ombrellone', 2),
('cabina', 2),
('ombrellone', 1),
('lettino', 3),
('lettino', 4),
('ombrellone', 1);

INSERT INTO Prenotazione_Servizi (ID_Prenotazione)
VALUES
(1),
(1),
(1),
(2),
(3),
(3),
(4),
(4),
(5),
(5),
(6),
(7),
(7),
(7),
(8),
(8),
(9),
(9),
(9),
(10),
(11),
(11),
(11),
(12),
(13),
(14),
(15),
(15),
(15),
(16),
(16),
(17),
(18),
(18),
(19),
(19),
(19),
(20),
(20),
(20),
(21),
(21),
(22),
(23),
(24),
(24),
(25),
(25),
(26),
(26),
(27),
(28),
(28),
(29),
(30),
(30),
(30),
(31),
(31),
(31),
(32),
(33),
(33),
(34),
(35),
(36),
(36),
(37),
(37),
(38),
(39),
(40),
(40),
(41),
(41),
(42),
(42),
(42),
(43),
(44),
(45),
(45),
(45),
(46),
(46),
(47),
(48),
(49),
(50),
(51),
(51),
(52),
(52),
(53),
(54),
(54),
(55),
(55),
(56),
(57),
(58),
(59),
(60),
(60),
(61),
(61),
(62),
(62),
(62),
(63),
(63),
(63),
(64),
(65),
(66),
(66),
(67),
(67),
(68),
(69),
(70),
(71),
(71),
(72),
(72),
(72),
(73),
(74),
(75),
(76),
(76),
(77),
(78),
(78),
(79),
(79),
(80),
(81),
(81),
(82),
(82),
(83),
(83),
(83),
(84),
(85),
(86),
(87),
(87),
(87),
(88),
(88),
(89),
(90),
(91),
(92),
(92),
(92),
(93),
(93),
(93),
(94),
(95),
(95),
(96),
(97),
(98),
(98),
(99),
(99),
(99),
(100),
(101),
(101),
(102),
(103),
(104),
(105),
(106),
(106),
(107),
(107),
(108),
(108),
(108),
(109),
(109),
(110),
(111),
(111),
(111),
(112),
(113),
(113),
(113),
(114),
(114),
(115),
(115),
(115),
(116),
(116),
(117),
(117),
(118),
(119),
(119),
(119),
(120),
(120),
(121),
(121),
(121),
(122),
(123),
(124),
(124),
(124),
(125),
(125),
(126),
(126),
(127),
(128),
(129),
(129),
(130),
(131),
(131),
(131),
(132),
(132),
(133),
(133),
(134),
(135),
(135),
(136),
(136),
(136),
(137),
(137),
(137),
(138),
(139),
(139),
(139),
(140),
(141),
(141),
(142),
(142),
(142),
(143),
(144),
(145),
(146),
(146),
(147),
(147),
(147),
(148),
(148),
(149),
(150),
(151),
(152),
(152),
(153),
(153),
(154),
(154),
(154),
(155),
(155),
(156),
(157),
(157),
(158),
(159),
(160),
(160),
(161),
(161),
(162),
(162),
(163),
(164),
(164),
(165),
(165),
(166),
(167),
(167),
(168),
(168),
(168),
(169),
(169),
(170),
(171),
(172),
(172),
(173),
(174),
(175),
(176),
(177),
(178),
(178),
(179),
(179),
(179),
(180),
(180),
(181),
(182),
(182);

-- T1
CREATE TRIGGER T1 BEFORE INSERT ON Prenotazioni
FOR EACH ROW
BEGIN
    DECLARE cliente_count INT;
    SELECT COUNT(*) INTO cliente_count FROM Clienti WHERE ID_Cliente = NEW.ID_Cliente;
    IF cliente_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Il cliente specificato nella prenotazione non esiste.';
    END IF;
END;

-- T4
CREATE TRIGGER T4 BEFORE INSERT ON Prenotazioni
FOR EACH ROW
BEGIN
    DECLARE prezzo_servizi DECIMAL(6, 2);
    DECLARE prezzo_ingresso DECIMAL(5, 2);
    DECLARE prezzo_periodo DECIMAL(5, 2);
    SELECT 
    SUM(s.prezzo) INTO prezzo_servizi FROM Prenotazione_Servizi ps JOIN Servizi s ON ps.ID_Servizio = s.ID_Servizio
    GROUP BY ps.ID_Prenotazione HAVING ps.ID_Prenotazione = NEW.ID_Prenotazione;
    SELECT Prezzo INTO prezzo_ingresso FROM Prezzi WHERE Tipo = 'ingresso';
    SELECT Prezzo INTO prezzo_periodo FROM Prezzi WHERE Tipo = NEW.Periodo;
    
    SET NEW.Costo = (prezzo_servizi + prezzo_ingresso * NEW.N_Ingressi) * prezzo_periodo;
END;

-- T5
CREATE TRIGGER T5 BEFORE INSERT ON Pagamenti
FOR EACH ROW
BEGIN
    DECLARE costo_prenotazione DECIMAL(6, 2);
    SELECT Costo INTO costo_prenotazione FROM Prenotazioni WHERE ID_Prenotazione = NEW.ID_Prenotazione;
    SET NEW.Importo = costo_prenotazione;
END;

-- O2
INSERT INTO Prenotazioni (ID_Prenotazione, ID_Cliente, Data_Prenotazione, N_Ingressi, Periodo)
VALUES 
(1, 1, '2023-07-21', 2, 'settimanale'),
(2, 2, '2021-06-10', 1, 'giornaliero'),
(3, 3, '2017-08-21', 2, 'stagionale'),
(4, 4, '2013-06-30', 5, 'stagionale'),
(5, 5, '2016-06-10', 2, 'giornaliero'),
(6, 6, '2019-06-12', 5, 'settimanale'),
(7, 6, '2019-07-12', 2, 'mensile'),
(8, 7, '2015-07-12', 4, 'mensile'),
(9, 7, '2018-07-17', 4, 'giornaliero'),
(10, 8, '2018-07-10', 4, 'quindicinale'),
(11, 9, '2019-07-10', 4, 'stagionale'),
(12, 10, '2014-06-02', 4, 'quindicinale'),
(13, 11, '2013-08-30', 1, 'settimanale'),
(14, 12, '2020-07-07', 4, 'mensile'),
(15, 12, '2022-06-21', 2, 'quindicinale'),
(16, 13, '2023-08-28', 1, 'giornaliero'),
(17, 14, '2016-07-08', 3, 'quindicinale'),
(18, 14, '2017-08-15', 4, 'giornaliero'),
(19, 15, '2017-07-29', 1, 'settimanale'),
(20, 16, '2019-06-06', 1, 'stagionale'),
(21, 17, '2017-06-22', 1, 'mensile'),
(22, 18, '2020-07-22', 2, 'settimanale'),
(23, 19, '2020-08-19', 3, 'mensile'),
(24, 19, '2022-06-13', 1, 'settimanale'),
(25, 20, '2019-07-16', 5, 'giornaliero'),
(26, 21, '2023-08-09', 5, 'settimanale'),
(27, 21, '2023-06-01', 2, 'mensile'),
(28, 22, '2016-06-01', 2, 'settimanale'),
(29, 22, '2017-08-25', 1, 'quindicinale'),
(30, 23, '2021-08-13', 1, 'settimanale'),
(31, 24, '2018-07-24', 3, 'mensile'),
(32, 25, '2020-06-15', 2, 'settimanale'),
(33, 26, '2019-08-01', 3, 'mensile'),
(34, 26, '2019-07-09', 5, 'settimanale'),
(35, 27, '2018-08-01', 4, 'quindicinale'),
(36, 28, '2021-06-21', 5, 'mensile'),
(37, 29, '2023-08-02', 2, 'giornaliero'),
(38, 29, '2014-06-15', 4, 'settimanale'),
(39, 30, '2019-08-08', 2, 'mensile'),
(40, 31, '2013-07-10', 2, 'mensile'),
(41, 32, '2015-07-10', 3, 'quindicinale'),
(42, 33, '2017-06-28', 5, 'mensile'),
(43, 33, '2020-06-20', 4, 'mensile'),
(44, 34, '2019-07-10', 5, 'mensile'),
(45, 35, '2019-06-17', 2, 'stagionale'),
(46, 36, '2016-08-01', 1, 'settimanale'),
(47, 36, '2018-08-09', 2, 'mensile'),
(48, 37, '2013-07-14', 3, 'giornaliero'),
(49, 37, '2018-06-21', 2, 'mensile'),
(50, 38, '2016-08-11', 1, 'settimanale'),
(51, 38, '2022-06-26', 1, 'stagionale'),
(52, 39, '2021-08-25', 1, 'settimanale'),
(53, 40, '2023-08-09', 1, 'stagionale'),
(54, 41, '2022-07-26', 3, 'mensile'),
(55, 42, '2017-08-01', 1, 'quindicinale'),
(56, 43, '2014-06-25', 2, 'quindicinale'),
(57, 44, '2015-07-15', 1, 'quindicinale'),
(58, 45, '2021-08-23', 3, 'settimanale'),
(59, 46, '2021-06-21', 1, 'quindicinale'),
(60, 47, '2018-07-23', 1, 'settimanale'),
(61, 48, '2023-08-30', 1, 'quindicinale'),
(62, 49, '2017-08-13', 1, 'giornaliero'),
(63, 50, '2016-06-10', 1, 'mensile'),
(64, 50, '2013-06-07', 2, 'quindicinale'),
(65, 51, '2021-07-14', 2, 'quindicinale'),
(66, 52, '2014-08-14', 4, 'stagionale'),
(67, 53, '2014-08-16', 5, 'giornaliero'),
(68, 54, '2017-08-21', 1, 'stagionale'),
(69, 55, '2018-08-13', 2, 'mensile'),
(70, 56, '2016-06-19', 5, 'stagionale'),
(71, 57, '2021-08-13', 1, 'giornaliero'),
(72, 58, '2016-07-17', 3, 'stagionale'),
(73, 59, '2018-08-23', 4, 'settimanale'),
(74, 60, '2021-06-30', 2, 'giornaliero'),
(75, 60, '2013-06-14', 1, 'quindicinale'),
(76, 61, '2021-08-23', 1, 'quindicinale'),
(77, 62, '2013-06-09', 2, 'quindicinale'),
(78, 63, '2013-06-12', 2, 'giornaliero'),
(79, 64, '2013-08-13', 1, 'mensile'),
(80, 65, '2022-06-09', 5, 'mensile'),
(81, 66, '2014-07-24', 4, 'mensile'),
(82, 66, '2022-07-11', 5, 'mensile'),
(83, 67, '2019-08-29', 3, 'quindicinale'),
(84, 68, '2016-07-23', 1, 'quindicinale'),
(85, 68, '2017-08-04', 1, 'stagionale'),
(86, 69, '2022-06-01', 4, 'stagionale'),
(87, 70, '2018-06-09', 1, 'quindicinale'),
(88, 71, '2015-06-06', 1, 'stagionale'),
(89, 72, '2021-07-30', 1, 'stagionale'),
(90, 73, '2020-06-03', 4, 'giornaliero'),
(91, 74, '2023-08-31', 5, 'quindicinale'),
(92, 75, '2022-07-12', 2, 'mensile'),
(93, 76, '2023-06-27', 1, 'quindicinale'),
(94, 77, '2017-08-15', 3, 'mensile'),
(95, 78, '2015-06-22', 4, 'stagionale'),
(96, 79, '2016-08-28', 4, 'mensile'),
(97, 79, '2021-06-03', 5, 'settimanale'),
(98, 80, '2018-06-23', 5, 'stagionale'),
(99, 81, '2022-07-12', 3, 'quindicinale'),
(100, 82, '2020-08-22', 2, 'quindicinale'),
(101, 83, '2018-06-29', 3, 'settimanale'),
(102, 84, '2021-07-08', 3, 'quindicinale'),
(103, 84, '2017-07-14', 2, 'mensile'),
(104, 85, '2022-08-09', 5, 'mensile'),
(105, 86, '2016-06-05', 2, 'mensile'),
(106, 87, '2015-08-12', 4, 'stagionale'),
(107, 87, '2022-08-03', 1, 'mensile'),
(108, 88, '2022-08-30', 2, 'giornaliero'),
(109, 88, '2019-08-06', 4, 'stagionale'),
(110, 89, '2022-07-09', 4, 'settimanale'),
(111, 90, '2019-08-19', 4, 'settimanale'),
(112, 91, '2013-07-11', 5, 'giornaliero'),
(113, 91, '2022-06-18', 2, 'mensile'),
(114, 92, '2019-07-25', 1, 'quindicinale'),
(115, 93, '2023-06-16', 3, 'quindicinale'),
(116, 94, '2019-06-18', 5, 'quindicinale'),
(117, 95, '2016-08-23', 3, 'mensile'),
(118, 96, '2017-06-14', 4, 'settimanale'),
(119, 97, '2013-06-29', 1, 'giornaliero'),
(120, 97, '2013-08-28', 5, 'mensile'),
(121, 98, '2013-06-01', 5, 'giornaliero'),
(122, 99, '2019-07-15', 3, 'quindicinale'),
(123, 100, '2014-07-05', 3, 'settimanale'),
(124, 101, '2019-07-07', 4, 'settimanale'),
(125, 102, '2020-06-06', 5, 'quindicinale'),
(126, 103, '2021-07-26', 5, 'stagionale'),
(127, 104, '2013-08-04', 1, 'mensile'),
(128, 105, '2018-07-13', 2, 'giornaliero'),
(129, 106, '2015-07-16', 1, 'settimanale'),
(130, 107, '2016-07-19', 1, 'mensile'),
(131, 108, '2021-07-11', 3, 'quindicinale'),
(132, 109, '2018-07-31', 4, 'stagionale'),
(133, 110, '2017-08-12', 1, 'giornaliero'),
(134, 110, '2017-07-16', 2, 'stagionale'),
(135, 111, '2023-08-29', 4, 'giornaliero'),
(136, 112, '2020-07-27', 4, 'giornaliero'),
(137, 113, '2016-08-29', 5, 'giornaliero'),
(138, 114, '2022-08-14', 1, 'mensile'),
(139, 115, '2022-08-06', 2, 'quindicinale'),
(140, 115, '2019-07-24', 4, 'mensile'),
(141, 116, '2018-07-29', 3, 'settimanale'),
(142, 117, '2013-06-23', 1, 'quindicinale'),
(143, 117, '2020-08-09', 3, 'stagionale'),
(144, 118, '2014-08-09', 5, 'giornaliero'),
(145, 119, '2020-08-11', 2, 'giornaliero'),
(146, 119, '2013-08-17', 3, 'stagionale'),
(147, 120, '2022-07-22', 5, 'giornaliero'),
(148, 121, '2016-07-13', 2, 'quindicinale'),
(149, 122, '2018-06-26', 4, 'stagionale'),
(150, 123, '2020-06-21', 1, 'giornaliero'),
(151, 124, '2015-08-30', 3, 'stagionale'),
(152, 124, '2014-07-14', 3, 'giornaliero'),
(153, 125, '2016-07-09', 1, 'mensile'),
(154, 126, '2015-06-13', 3, 'settimanale'),
(155, 127, '2014-08-23', 4, 'mensile'),
(156, 128, '2015-08-15', 2, 'settimanale'),
(157, 129, '2013-08-18', 1, 'settimanale'),
(158, 129, '2013-08-10', 2, 'settimanale'),
(159, 130, '2015-06-23', 1, 'quindicinale'),
(160, 130, '2014-07-03', 1, 'stagionale'),
(161, 131, '2023-08-13', 2, 'quindicinale'),
(162, 132, '2018-08-08', 3, 'settimanale'),
(163, 133, '2023-07-21', 4, 'settimanale'),
(164, 133, '2023-08-25', 5, 'giornaliero'),
(165, 134, '2019-06-14', 5, 'stagionale'),
(166, 135, '2021-07-20', 5, 'mensile'),
(167, 136, '2021-06-28', 3, 'mensile'),
(168, 137, '2020-07-20', 5, 'settimanale'),
(169, 138, '2017-07-29', 3, 'settimanale'),
(170, 139, '2015-08-14', 3, 'giornaliero'),
(171, 140, '2015-08-12', 1, 'quindicinale'),
(172, 141, '2017-06-13', 5, 'quindicinale'),
(173, 142, '2017-07-01', 1, 'giornaliero'),
(174, 143, '2023-08-12', 2, 'mensile'),
(175, 144, '2017-08-17', 3, 'giornaliero'),
(176, 145, '2021-07-16', 5, 'quindicinale'),
(177, 145, '2019-06-15', 2, 'stagionale'),
(178, 146, '2023-08-24', 2, 'settimanale'),
(179, 146, '2017-06-11', 1, 'quindicinale'),
(180, 147, '2016-06-23', 1, 'settimanale'),
(181, 148, '2022-08-06', 1, 'settimanale'),
(182, 149, '2019-07-11', 3, 'stagionale');

-- O3
INSERT INTO Pagamenti (ID_Prenotazione, Data_Pagamento, Metodo_Pagamento)
VALUES 
(1, '2023-07-21', 'Carta di Credito'),
(2, '2021-06-10', 'Contanti'),
(3, '2017-08-21', 'Bancomat'),
(4, '2013-06-30', 'Bancomat'),
(5, '2016-06-10', 'Contanti'),
(6, '2019-06-12', 'Carta di Credito'),
(7, '2019-07-12', 'Bancomat'),
(8, '2015-07-12', 'Bancomat'),
(9, '2018-07-17', 'Contanti'),
(10, '2018-07-10', 'Carta di Debito'),
(11, '2019-07-10', 'Bancomat'),
(12, '2014-06-02', 'Carta di Debito'),
(13, '2013-08-30', 'Carta di Credito'),
(14, '2020-07-07', 'Bancomat'),
(15, '2022-06-21', 'Carta di Debito'),
(16, '2023-08-28', 'Contanti'),
(17, '2016-07-08', 'Carta di Debito'),
(18, '2017-08-15', 'Contanti'),
(19, '2017-07-29', 'Carta di Credito'),
(20, '2019-06-06', 'Bancomat'),
(21, '2017-06-22', 'Bancomat'),
(22, '2020-07-22', 'Carta di Credito'),
(23, '2020-08-19', 'Bancomat'),
(24, '2022-06-13', 'Carta di Credito'),
(25, '2019-07-16', 'Contanti'),
(26, '2023-08-09', 'Carta di Credito'),
(27, '2023-06-01', 'Bancomat'),
(28, '2016-06-01', 'Carta di Credito'),
(29, '2017-08-25', 'Carta di Debito'),
(30, '2021-08-13', 'Carta di Credito'),
(31, '2018-07-24', 'Bancomat'),
(32, '2020-06-15', 'Carta di Credito'),
(33, '2019-08-01', 'Bancomat'),
(34, '2019-07-09', 'Carta di Credito'),
(35, '2018-08-01', 'Carta di Debito'),
(36, '2021-06-21', 'Bancomat'),
(37, '2023-08-02', 'Contanti'),
(38, '2014-06-15', 'Carta di Credito'),
(39, '2019-08-08', 'Bancomat'),
(40, '2013-07-10', 'Bancomat'),
(41, '2015-07-10', 'Carta di Debito'),
(42, '2017-06-28', 'Bancomat'),
(43, '2020-06-20', 'Bancomat'),
(44, '2019-07-10', 'Bancomat'),
(45, '2019-06-17', 'Bancomat'),
(46, '2016-08-01', 'Carta di Credito'),
(47, '2018-08-09', 'Bancomat'),
(48, '2013-07-14', 'Contanti'),
(49, '2018-06-21', 'Bancomat'),
(50, '2016-08-11', 'Carta di Credito'),
(51, '2022-06-26', 'Bancomat'),
(52, '2021-08-25', 'Carta di Credito'),
(53, '2023-08-09', 'Bancomat'),
(54, '2022-07-26', 'Bancomat'),
(55, '2017-08-01', 'Carta di Debito'),
(56, '2014-06-25', 'Carta di Debito'),
(57, '2015-07-15', 'Carta di Debito'),
(58, '2021-08-23', 'Carta di Credito'),
(59, '2021-06-21', 'Carta di Debito'),
(60, '2018-07-23', 'Carta di Credito'),
(61, '2023-08-30', 'Carta di Debito'),
(62, '2017-08-13', 'Contanti'),
(63, '2016-06-10', 'Bancomat'),
(64, '2013-06-07', 'Carta di Debito'),
(65, '2021-07-14', 'Carta di Debito'),
(66, '2014-08-14', 'Bancomat'),
(67, '2014-08-16', 'Contanti'),
(68, '2017-08-21', 'Bancomat'),
(69, '2018-08-13', 'Bancomat'),
(70, '2016-06-19', 'Bancomat'),
(71, '2021-08-13', 'Contanti'),
(72, '2016-07-17', 'Bancomat'),
(73, '2018-08-23', 'Carta di Credito'),
(74, '2021-06-30', 'Contanti'),
(75, '2013-06-14', 'Carta di Debito'),
(76, '2021-08-23', 'Carta di Debito'),
(77, '2013-06-09', 'Carta di Debito'),
(78, '2013-06-12', 'Contanti'),
(79, '2013-08-13', 'Bancomat'),
(80, '2022-06-09', 'Bancomat'),
(81, '2014-07-24', 'Bancomat'),
(82, '2022-07-11', 'Bancomat'),
(83, '2019-08-29', 'Carta di Debito'),
(84, '2016-07-23', 'Carta di Debito'),
(85, '2017-08-04', 'Bancomat'),
(86, '2022-06-01', 'Bancomat'),
(87, '2018-06-09', 'Carta di Debito'),
(88, '2015-06-06', 'Bancomat'),
(89, '2021-07-30', 'Bancomat'),
(90, '2020-06-03', 'Contanti'),
(91, '2023-08-31', 'Carta di Debito'),
(92, '2022-07-12', 'Bancomat'),
(93, '2023-06-27', 'Carta di Debito'),
(94, '2017-08-15', 'Bancomat'),
(95, '2015-06-22', 'Bancomat'),
(96, '2016-08-28', 'Bancomat'),
(97, '2021-06-03', 'Carta di Credito'),
(98, '2018-06-23', 'Bancomat'),
(99, '2022-07-12', 'Carta di Debito'),
(100, '2020-08-22', 'Carta di Debito'),
(101, '2018-06-29', 'Carta di Credito'),
(102, '2021-07-08', 'Carta di Debito'),
(103, '2017-07-14', 'Bancomat'),
(104, '2022-08-09', 'Bancomat'),
(105, '2016-06-05', 'Bancomat'),
(106, '2015-08-12', 'Bancomat'),
(107, '2022-08-03', 'Bancomat'),
(108, '2022-08-30', 'Contanti'),
(109, '2019-08-06', 'Bancomat'),
(110, '2022-07-09', 'Carta di Credito'),
(111, '2019-08-19', 'Carta di Credito'),
(112, '2013-07-11', 'Contanti'),
(113, '2022-06-18', 'Bancomat'),
(114, '2019-07-25', 'Carta di Debito'),
(115, '2023-06-16', 'Carta di Debito'),
(116, '2019-06-18', 'Carta di Debito'),
(117, '2016-08-23', 'Bancomat'),
(118, '2017-06-14', 'Carta di Credito'),
(119, '2013-06-29', 'Contanti'),
(120, '2013-08-28', 'Bancomat'),
(121, '2013-06-01', 'Contanti'),
(122, '2019-07-15', 'Carta di Debito'),
(123, '2014-07-05', 'Carta di Credito'),
(124, '2019-07-07', 'Carta di Credito'),
(125, '2020-06-06', 'Carta di Debito'),
(126, '2021-07-26', 'Bancomat'),
(127, '2013-08-04', 'Bancomat'),
(128, '2018-07-13', 'Contanti'),
(129, '2015-07-16', 'Carta di Credito'),
(130, '2016-07-19', 'Bancomat'),
(131, '2021-07-11', 'Carta di Debito'),
(132, '2018-07-31', 'Bancomat'),
(133, '2017-08-12', 'Contanti'),
(134, '2017-07-16', 'Bancomat'),
(135, '2023-08-29', 'Contanti'),
(136, '2020-07-27', 'Contanti'),
(137, '2016-08-29', 'Contanti'),
(138, '2022-08-14', 'Bancomat'),
(139, '2022-08-06', 'Carta di Debito'),
(140, '2019-07-24', 'Bancomat'),
(141, '2018-07-29', 'Carta di Credito'),
(142, '2013-06-23', 'Carta di Debito'),
(143, '2020-08-09', 'Bancomat'),
(144, '2014-08-09', 'Contanti'),
(145, '2020-08-11', 'Contanti'),
(146, '2013-08-17', 'Bancomat'),
(147, '2022-07-22', 'Contanti'),
(148, '2016-07-13', 'Carta di Debito'),
(149, '2018-06-26', 'Bancomat'),
(150, '2020-06-21', 'Contanti'),
(151, '2015-08-30', 'Bancomat'),
(152, '2014-07-14', 'Contanti'),
(153, '2016-07-09', 'Bancomat'),
(154, '2015-06-13', 'Carta di Credito'),
(155, '2014-08-23', 'Bancomat'),
(156, '2015-08-15', 'Carta di Credito'),
(157, '2013-08-18', 'Carta di Credito'),
(158, '2013-08-10', 'Carta di Credito'),
(159, '2015-06-23', 'Carta di Debito'),
(160, '2014-07-03', 'Bancomat'),
(161, '2023-08-13', 'Carta di Debito'),
(162, '2018-08-08', 'Carta di Credito'),
(163, '2023-07-21', 'Carta di Credito'),
(164, '2023-08-25', 'Contanti'),
(165, '2019-06-14', 'Bancomat'),
(166, '2021-07-20', 'Bancomat'),
(167, '2021-06-28', 'Bancomat'),
(168, '2020-07-20', 'Carta di Credito'),
(169, '2017-07-29', 'Carta di Credito'),
(170, '2015-08-14', 'Contanti'),
(171, '2015-08-12', 'Carta di Debito'),
(172, '2017-06-13', 'Carta di Debito'),
(173, '2017-07-01', 'Contanti'),
(174, '2023-08-12', 'Bancomat'),
(175, '2017-08-17', 'Contanti'),
(176, '2021-07-16', 'Carta di Debito'),
(177, '2019-06-15', 'Bancomat'),
(178, '2023-08-24', 'Carta di Credito'),
(179, '2017-06-11', 'Carta di Debito'),
(180, '2016-06-23', 'Carta di Credito'),
(181, '2022-08-06', 'Carta di Credito'),
(182, '2019-07-11', 'Bancomat');

--@block O5
SELECT * FROM Ombrelloni WHERE Prenotato = FALSE
UNION ALL
SELECT * FROM Cabine WHERE Prenotato = FALSE
UNION ALL
SELECT * FROM Pedalò WHERE Prenotato = FALSE
UNION ALL
SELECT * FROM Lettini WHERE Prenotato = FALSE;

--@block O6
SELECT Clienti.ID_Cliente, Nome, Cognome FROM Clienti
JOIN Prenotazioni
ON Clienti.ID_Cliente = Prenotazioni.ID_Cliente
WHERE Periodo = 'stagionale';

--@block O7
SELECT Clienti.ID_Cliente, Nome, Cognome FROM Clienti
JOIN Prenotazioni
ON Clienti.ID_Cliente = Prenotazioni.ID_Cliente
JOIN Prenotazione_servizi
ON Prenotazioni.ID_Prenotazione = Prenotazione_Servizi.ID_Prenotazione
GROUP BY Clienti.ID_Cliente, Nome, Cognome
HAVING COUNT(DISTINCT Prenotazione_Servizi.ID_Servizio) = 4;