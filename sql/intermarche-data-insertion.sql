/*
PROJET S104 Création BD, IUT d'Orsay
TIKKENT Sara, SCHOELLHAMMER Nina
2024-2025
*/

-------------------------- SCRIPT INSERTION (generatedata.com) -------------------------
  
INSERT INTO `Fournisseur` (`idFourn`,`nomFourn`,`adresseFourn`,`telFourn`)
VALUES
  (1,"FreshHarvest","444-4015 Neque St.","07 55 57 87 36"),
  (2,"VeggieVista","711-7719 Aliquam Street","08 50 78 18 07"),
  (3,"GreenGroove","2312 Tristique St.","02 23 91 41 29"),
  (4,"AgriAura","802-7037 Magna, Ave","09 21 64 36 97"),
  (5,"JuicyJunction","Ap #174-7737 A Street","05 45 29 92 87");
  
  
INSERT INTO `Magasin` (`idMag`,`adresseMag`,`telMag`,`mailMag`)
VALUES
  (1,"104-5724 Pellentesque, Rd.","01 03 28 19 54","nulla.ante@outlook.couk"),
  (2,"704-6939 Phasellus St.","09 86 35 50 13","libero@hotmail.couk"),
  (3,"923-1149 Donec Road","04 45 46 61 11","cursus.nunc@outlook.ca"),
  (4,"262-9567 Congue, Av.","04 20 85 24 35","et@yahoo.edu"),
  (5,"Ap #128-990 Est Avenue","01 25 47 63 75","enim.commodo.hendrerit@hotmail.edu");
  
INSERT INTO `Commande` (`idCmd`,`dateCmd`,`qteCmd`,`montantCmd`,`idMag`,idFourn)
VALUES
  (1,"2024-10-25",1476,120379,3,3),
  (2,"2023-02-09",1972,196061,2,3),
  (3,"2023-02-26",9540,180383,2,2),
  (4,"2024-10-02",2318,70870,5,5),
  (5,"2024-10-07",5527,155262,3,4),
  (6,"2024-06-23",2259,56454,5,4),
  (7,"2022-06-06",6153,1140,2,4),
  (8,"2024-12-26",3127,98433,3,2),
  (9,"2017-11-11",2813,122910,5,4),
  (10,"2020-02-12",5944,1986,5,4);
  
INSERT INTO `Facture` (`idFact`,`idFourn`,`idMag`,`adrFact`,`dateFact`)
VALUES
  (1,3,3,"6504 Montes, Rd.","2025-02-15"),
  (2,2,3,"P.O. Box 842, 6469 Hendrerit Av.","2025-01-26"),
  (3,2,2,"Ap #480-1651 Erat Road","2025-09-17"),
  (4,5,5,"1742 Amet Rd.","2025-11-23"),
  (5,3,4,"Ap #810-6819 Euismod Street","2025-02-25"),
  (6,5,4,"3097 Nec, St.","2025-09-21"),
  (7,2,4,"P.O. Box 481, 2190 Enim St.","2025-04-10"),
  (8,3,2,"291-5538 Dapibus Ave","2025-09-22"),
  (9,5,4,"1597 Nibh. Rd.","2024-11-29"),
  (10,5,4,"197-1576 Ullamcorper St.","2024-01-06");
  
INSERT INTO `Periode` (`idPeriode`,`nomPeriode`,`tempMoy`,`conditionsMoy`,`debutPeriode`,`finPeriode`)
VALUES
  (1,"Printemps 2023",13,"humide","2023-03-20","2023-06-20"),
  (2,"Été 2023",22,"sec","21/06/2023","2023-09-22"),
  (3,"Automne 2023",16,"nuageux","2023-09-23","2023-12-20"),
  (4,"Hiver 2023",6,"ensoleillé","2023-12-21","2024-03-20"),
  (5,"Printemps 2024",13,"pluvieux","2024-03-21","2024-06-20");
--débuts de saisons : printemps 20, été 21, automne 23, hiver 21
--conditionsMoy values: humide, sec, nuageux, ensoleillé, pluvieux, enneigé

INSERT INTO `Produit` (`idProd`,`nomProd`,`typeProd`,`dateRecolte`,`dateExpiration`,`prixProd`,quantite,`idCmd`,idPeriode)
VALUES
  (1,"Pommes de terre grenaille","légume-racine","2022-07-12","2024-03-10",22.13,40648,4,1),
  (2,"Raisins blancs sans pépins","fruit-baie","2022-08-27","202408-17",21.70,110127,8,2),
  (3,"Choux-fleurs de Bretagne","légume-fleur","2022-06-16","2024-11-25",8.95,28709,2,3),
  (4,"Tomates anciennes multicolores","fruit-légume","2022-12-01","2023-07-03",17.42,258448,4,4),
  (5,"Oignons doux des Cévennes","légume-bulbe","2022-03-06","2024-05-10",10.72,98725,7,5),
  (6,"Pommes Fuji croquantes","fruit-pomacée","2022-10-14","2024-11-19",8.67,30696,5,4),
  (7,"Poireaux régionaux du nord","légume-tige","2022-09-28","2024-02-15",27.93,54820,2,3),
  (8,"Carottes des sables","légume-racine","2022-10-21","2025-03-20",17.23,256434,9,2),
  (9,"Haricots verts extra-fins","légume-graine","2022-03-16","2025-03-17",17.58,195661,6,1),
  (10,"Laitues romaines","légume-feuille","2022-11-04","2025-10-18",19.59,107570,8,2); 
  
INSERT INTO `Stock` (`idProd`,`idMag`,`dateArriv`)
VALUES
  (1,5,"2025-09-21"),
  (2,2,"2025-04-10"),
  (3,3,"2025-09-22"),
  (4,5,"2024-11-29"),
  (5,5,"2024-01-06"),
  (6,5,"2025-09-21"),
  (7,2,"2025-04-10"),
  (8,3,"2025-09-22"),
  (9,5,"2024-11-29"),
  (10,5,"2024-01-06");
  