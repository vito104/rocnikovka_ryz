CREATE DATABASE ryz;
use ryz;

CREATE TABLE vyrobce(
    id_vyrobce INT PRIMARY KEY AUTO_INCREMENT,
    nazev VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE kvalita_paliva(
    id_kvality INT PRIMARY KEY AUTO_INCREMENT,
    nazev VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE palivo(
    id_paliva INT PRIMARY KEY AUTO_INCREMENT,
    nazev_paliva INT NOT NULL UNIQUE
);

CREATE TABLE vyrobce_palivo(
    id_vyrobce_palivo INT PRIMARY KEY AUTO_INCREMENT,
    id_vyrobce INT NOT NULL,
    id_kvality INT NOT NULL,
    ekologicke BOOL NOT NULL,
    id_paliva INT NOT NULL,
    cena_za_m3 FLOAT NOT NULL,
    CONSTRAINT fK_vyrobce FOREIGN KEY (id_vyrobce) REFERENCES vyrobce(id_vyrobce),
    CONSTRAINT fK_kvalita FOREIGN KEY (id_kvality) REFERENCES kvalita_paliva(id_kvality),
    CONSTRAINT fK_palivo FOREIGN KEY (id_paliva) REFERENCES palivo(id_paliva),
    CONSTRAINT unikatnost_paliva UNIQUE (id_paliva, id_vyrobce, id_kvality)
);

CREATE TABLE lode(
    id_lode INT PRIMARY KEY AUTO_INCREMENT,
    nazev VARCHAR(50) NOT NULL UNIQUE,
    kapacita_nadrze FLOAT NOT NULL,
    id_vyrobce_palivo INT NOT NULL,
    CONSTRAINT fk_paliva FOREIGN KEY(id_vyrobce_palivo) REFERENCES vyrobce_palivo(id_vyrobce_palivo)
);

CREATE TABLE mesto(
    id_mesto INT PRIMARY KEY AUTO_INCREMENT,
    nazev VARCHAR(50) NOT NULL
);

CREATE TABLE pristav(
    id_pristavu INT PRIMARY KEY AUTO_INCREMENT,
    nazev VARCHAR(50) NOT NULL UNIQUE,
    id_mesto INT NOT NULL UNIQUE,
    CONSTRAINT fk_mesto FOREIGN KEY(id_mesto) REFERENCES mesto(id_mesto)
);

CREATE TABLE dok(
    id_doku INT PRIMARY KEY AUTO_INCREMENT,
    id_pristavu INT NOT NULL,
    nazev_doku VARCHAR(20) NOT NULL UNIQUE,
    CONSTRAINT fk_pristav FOREIGN KEY (id_pristavu) REFERENCES pristav(id_pristavu)
);

CREATE TABLE lode_doky(
    id_lode_doky INT PRIMARY KEY AUTO_INCREMENT,
    id_lode INT NOT NULL,
    id_doku INT NOT NULL,
    datum DATE NOT NULL,
    CONSTRAINT fk_lode FOREIGN KEY (id_lode) REFERENCES lode(id_lode),
    CONSTRAINT fk_doku FOREIGN KEY (id_doku) REFERENCES dok(id_doku),
    CONSTRAINT unikatnost_zastavky UNIQUE (id_lode, id_doku, datum)
);

CREATE TABLE osoby(
    id_osoby INT PRIMARY KEY AUTO_INCREMENT,
    jmeno VARCHAR(50) NOT NULL,
    prijmeni VARCHAR(50) NOT NULL
);

CREATE TABLE role(
    id_role INT PRIMARY KEY AUTO_INCREMENT,
    nazev VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE osoba_role(
    id_osoby_role INT PRIMARY KEY AUTO_INCREMENT,
    id_role INT NOT NULL,
    id_osoby INT NOT NULL,
    CONSTRAINT fk_role FOREIGN KEY (id_role) REFERENCES role(id_role),
    CONSTRAINT fk_osoby FOREIGN KEY (id_osoby) REFERENCES osoby(id_osoby),
    CONSTRAINT unikatnost_osoby UNIQUE (id_role, id_osoby)
);

CREATE TABLE osoby_lode(
    id_osoby_lode INT PRIMARY KEY AUTO_INCREMENT,
    id_lode INT NOT NULL,
    id_osoby_role INT NOT NULL,
    CONSTRAINT fk_lodky FOREIGN KEY (id_lode) REFERENCES lode(id_lode),
    CONSTRAINT fk_osoby_lode FOREIGN KEY(id_osoby_role) REFERENCES osoba_role(id_osoby_role)
);
