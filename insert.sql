INSERT INTO dok(nazev_doku, id_pristavu) VALUES 
("Dok Petra Tupce", 2),
("Haubt", 3),
("P1", 9),
("Marina", 8),
("Doka", 10),
("First dock", 12),
("City dock", 4),
("Přístaviště", 5),
("Dok Petra Sýkory", 6),
("Petrovský dok", 7);


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

INSERT INTO lode(nazev_lode, kapacita_nadrze, ID_paliva) VALUES
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


INSERT INTO lode_doky(id_lode, id_doku, datum) VALUES
("5", "4","2023-03-02"),
("5", "5","2023-05-03"),
("5", "11","2023-05-04"),
("10", "12","2023-03-02"),
("11", "12","2023-05-03"),
("10", "12","2023-05-04"),
("14", "7","2023-02-02"),
("16", "11","2021-12-28"),
("8", "8","2023-05-07"),
("12", "12","2022-09-23"),
("5", "9","2023-02-07");


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


INSERT INTO osoby_lode(id_osoby, id_lode) VALUES
("1", "7"),
("6", "8"),
("12", "10"),
("9", "14"),
("4", "8"),
("2", "11"),
("8", "11"),
("8", "16"),
("6", "15"),
("11", "12");


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


INSERT INTO pristav(nazev,id_mesta) VALUES
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
("Přístav Jaroslavlt", "11");


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


INSERT INTO vyrobce(jmeno_vyrobce) VALUES
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


INSERT INTO vyrobce_palivo(id_paliva, id_vyrobce, id_kvality, ekologické, cena_za_m3) VALUES
("5", "1", "", TRUE, "1.00"),
("2", "2", "1", TRUE, "43.00"),
("11", "6", "", TRUE, "50.00"),
("1", "9", "11", FALSE, "10.00"),
("7", "6", "", TRUE, "1.00"),
("7", "8", "11", FALSE, "10.00"),
("10", "3", "", FALSE, "50.00"),
("3", "6", "", TRUE, "10.00"),
("11", "9", "", TRUE, "12.00"),
("3", "3", "", FALSE, "15.00");
