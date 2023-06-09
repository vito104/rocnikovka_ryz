CREATE DATABASE ryz;
use ryz;

CREATE TABLE vyrobce(
    id_vyrobce INT PRIMARY KEY AUTO_INCREMENT,
    nazev VARCHAR(50) NOT NULL UNIQUE
);
INSERT INTO vyrobce(nazev) VALUES
("Shell"),
("Verva"),
("Agro Žamberk"),
("České Dráhy"),
("Milion+"),
("ZD Horní Dolní"),
("OMW"),
("Mol"),
("Slovnaft"),
("RegioJet");

CREATE TABLE kvalita_paliva(
    id_kvality INT PRIMARY KEY AUTO_INCREMENT,
    nazev_kvality VARCHAR(50) NOT NULL UNIQUE
);
INSERT INTO kvalita_paliva(nazev_kvality) VALUES
("100"),
("98"),
("95"),
("90"),
("100 + AB"),
("98 + AB"),
("95 + AB"),
("90 + AB"),
("S olovem"),
("S hodně olovem");

CREATE TABLE palivo(
    id_paliva INT PRIMARY KEY AUTO_INCREMENT,
    nazev_paliva VARCHAR(50) NOT NULL UNIQUE
);
INSERT INTO palivo(nazev_paliva) VALUES
("Nafa"),
("Benzin"),
("Dřevo bukové"),
("Dřevo dubové"),
("Dřevo bříza"),
("Dřevo topol"),
("Černé uhlí"),
("Hnědé uhlí"),
("Dřevěnné uhlí"),
("Plyn");


CREATE TABLE vyrobce_palivo(
    id_vyrobce_palivo INT PRIMARY KEY AUTO_INCREMENT,
    id_vyrobce INT NOT NULL,
    id_kvality INT,
    ekologicke BOOLEAN NOT NULL,
    id_paliva INT NOT NULL,
    cena_za_m3 FLOAT NOT NULL,
    CONSTRAINT fK_vyrobce FOREIGN KEY (id_vyrobce) REFERENCES vyrobce(id_vyrobce),
    CONSTRAINT fK_kvalita FOREIGN KEY (id_kvality) REFERENCES kvalita_paliva(id_kvality),
    CONSTRAINT fK_palivo FOREIGN KEY (id_paliva) REFERENCES palivo(id_paliva),
    CONSTRAINT unikatnost_paliva UNIQUE (id_paliva, id_vyrobce, id_kvality)
);
INSERT INTO vyrobce_palivo(id_paliva, id_vyrobce, id_kvality, ekologicke, cena_za_m3) VALUES
("5", "1", "1", TRUE, "1.00"),
("2", "2", "1", TRUE, "43.00"),
("10", "6", "1", TRUE, "50.00"),
("1", "9", "10", FALSE, "10.00"),
("7", "6", "1", TRUE, "1.00"),
("7", "8", "10", FALSE, "10.00"),
("9", "3", "1", FALSE, "50.00"),
("3", "6", "1", TRUE, "10.00"),
("10", "9", "1", TRUE, "12.00"),
("3", "3", "1", FALSE, "15.00");
 
CREATE TABLE lode(
    id_lode INT PRIMARY KEY AUTO_INCREMENT,
    nazev_lode VARCHAR(50) NOT NULL UNIQUE,
    kapacita_nadrze FLOAT NOT NULL,
    id_vyrobce_palivo INT NOT NULL,
    CONSTRAINT fk_paliva FOREIGN KEY(id_vyrobce_palivo) REFERENCES vyrobce_palivo(id_vyrobce_palivo)
);
INSERT INTO lode(nazev_lode, kapacita_nadrze, id_vyrobce_palivo) VALUES
("Jarmila", "100", 4),
("Bohuna", "1500", 2),
("Samo", "200", 10),
("Josef", "1800", 4),
("Petr", "150", 6),
("Miloš", "2600", 9),
("Jaroslav", "30", 1),
("František", "5000", 2),
("Marcel", "300", 3),
("Tereza", "100", 4);
 
CREATE TABLE mesto(
    id_mesto INT PRIMARY KEY AUTO_INCREMENT,
    nazev VARCHAR(50) NOT NULL
);
 INSERT INTO mesto(nazev) VALUES
("Ústí nad Orlicí"),
("Pardubice"),
("Praha"),
("Brno"),
("Ostrava"),
("Hamburk"),
("Folkstone"),
("Calais"),
("Split"),
("Soluň"),
("Jaroslavl");

CREATE TABLE pristav(
    id_pristavu INT PRIMARY KEY AUTO_INCREMENT,
    nazev VARCHAR(50) NOT NULL UNIQUE,
    id_mesto INT NOT NULL UNIQUE,
    CONSTRAINT fk_mesto FOREIGN KEY(id_mesto) REFERENCES mesto(id_mesto)
);
 INSERT INTO pristav(nazev,id_mesto) VALUES
("Kozlov", "1"),
("Altona", "6"),
("Europort", "8"),
("Amsterdam", "3"),
("Polabiny", "2"),
("Pod Petrovem", "4"),
("Trajektna luka Split", "9"),
("Bazaly", "5"),
("Thesaloniki port", "10"),
("Folkstone port", "7"),
("Přístav Jaroslavl", "11");

CREATE TABLE dok(
    id_doku INT PRIMARY KEY AUTO_INCREMENT,
    id_pristavu INT NOT NULL,
    nazev_doku VARCHAR(20) NOT NULL UNIQUE,
    CONSTRAINT fk_pristav FOREIGN KEY (id_pristavu) REFERENCES pristav(id_pristavu)
);
INSERT INTO dok(nazev_doku, id_pristavu) VALUES 
("Dok Petra Tupce", 1),
("Haubtdock", 2),
("P1", 8),
("Marina", 7),
("Doka", 9),
("First dock", 10),
("City dock", 3),
("Přístaviště", 4),
("Dok Petra Sýkory", 5),
("Petrovský dok", 6);
 
CREATE TABLE lode_doky(
    id_lode_doky INT PRIMARY KEY AUTO_INCREMENT,
    id_lode INT NOT NULL,
    id_doku INT NOT NULL,
    datum DATE NOT NULL,
    CONSTRAINT fk_lode FOREIGN KEY (id_lode) REFERENCES lode(id_lode),
    CONSTRAINT fk_doku FOREIGN KEY (id_doku) REFERENCES dok(id_doku),
    CONSTRAINT unikatnost_zastavky UNIQUE (id_lode, id_doku, datum)
);
 INSERT INTO lode_doky(id_lode, id_doku, datum) VALUES
("1", "1","2023-03-02"),
("1", "2","2023-05-03"),
("1", "8","2023-05-04"),
("2", "9","2023-03-02"),
("5", "9","2023-05-03"),
("2", "9","2023-05-04"),
("8", "4","2023-02-02"),
("10", "1","2021-12-28"),
("3", "5","2023-05-07"),
("6", "9","2022-09-23"),
("1", "6","2023-02-07");

CREATE TABLE osoby(
    id_osoby INT PRIMARY KEY AUTO_INCREMENT,
    jmeno VARCHAR(50) NOT NULL,
    prijmeni VARCHAR(50) NOT NULL
);
INSERT INTO osoby(Jmeno, Prijmeni) VALUES
("Jan", "Petr"),
("Dominik", "Citta"),
("Matěj", "Kratejl"),
("Tomáš", "Soukup"),
("Iva", "Peterková"),
("Josef", "Rak"),
("František", "Zabiják"),
("Karel", "Janeček"),
("Miloš", "Vencl"),
("Nicolaus", "Bigmore");
 
CREATE TABLE role(
    id_role INT PRIMARY KEY AUTO_INCREMENT,
    nazev VARCHAR(50) NOT NULL UNIQUE
);

 INSERT INTO role(nazev) VALUES
("Kapitán"),
("Topič"),
("Cokapitán"),
("Cestující"),
("Cestující+"),
("Cestující++"),
("Cestující dítě"),
("Diplomat"),
("Cestující žena"),
("Bezpečnostní služba");

CREATE TABLE osoby_role(
    id_osoby_role INT PRIMARY KEY AUTO_INCREMENT,
    id_role INT NOT NULL,
    id_osoby INT NOT NULL,
    CONSTRAINT fk_role FOREIGN KEY (id_role) REFERENCES role(id_role),
    CONSTRAINT fk_osoby FOREIGN KEY (id_osoby) REFERENCES osoby(id_osoby),
    CONSTRAINT unikatnost_osoby UNIQUE (id_role, id_osoby)
);

INSERT INTO osoby_role(id_osoby, id_role) VALUES
("1", "1"),
("1", "10"),
("4", "5"),
("10", "8"),
("6", "3"),
("9", "6"),
("5", "9"),
("7", "6"),
("3", "2"),
("2", "4");


CREATE TABLE osoby_lode(
    id_osoby_lode INT PRIMARY KEY AUTO_INCREMENT,
    id_lode INT NOT NULL,
    id_osoby_role INT NOT NULL,
    CONSTRAINT fk_lodky FOREIGN KEY (id_lode) REFERENCES lode(id_lode),
	CONSTRAINT fk_osoby_role FOREIGN KEY (id_osoby_role) REFERENCES osoby_role(id_osoby_role)
);

INSERT INTO osoby_lode(id_osoby_role, id_lode) VALUES
(1, 2),
(6, 3),
(2, 1),
(9, 8),
(4, 3),
(2, 5),
(8, 5),
(8, 10),
(6, 9),
(1, 6);
