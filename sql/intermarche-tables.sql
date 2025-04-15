/*
PROJET S104 Création BD, IUT d'Orsay
TIKKENT Sara, SCHOELLHAMMER Nina
2024-2025
*/

------------------------------ SCRIPT CRÉATION ----------------------------

DROP TABLE IF EXISTS Stock;
DROP TABLE IF EXISTS Produit;
DROP TABLE IF EXISTS Commande;
DROP TABLE IF EXISTS Periode;
DROP TABLE IF EXISTS Facture;
DROP TABLE IF EXISTS Magasin;
DROP TABLE IF EXISTS Fournisseur;

CREATE TABLE Commande (
	idCmd INTEGER,
	dateCmd TEXT,
	qteCmd INTEGER,
	montantCmd INTEGER,
	idMag INTEGER,
	idFourn INTEGER,
	PRIMARY KEY(idCmd),
	FOREIGN KEY (idMag) REFERENCES Magasin (idMag),
	FOREIGN KEY (idFourn) REFERENCES Fournisseur(idFourn)
);

CREATE TABLE Fournisseur (
	idFourn	INTEGER,
	nomFourn	TEXT,
	adresseFourn	TEXT,
	telFourn	INTEGER,
	PRIMARY KEY(idFourn)
);

CREATE TABLE Facture (
	idFact INTEGER,
	idFourn	INTEGER,
	idMag	INTEGER,
	adrFact	TEXT,
	dateFact	TEXT,
	PRIMARY KEY(idFact, idFourn, idMag),
	FOREIGN KEY (idFourn) REFERENCES Fournisseur
	FOREIGN KEY (idMag) REFERENCES Magasin
);

CREATE TABLE Magasin (
	idMag	INTEGER,
	adresseMag	TEXT,
	telMag	INTEGER,
	mailMag	INTEGER,
	PRIMARY KEY(idMag)
);

CREATE TABLE Periode (
	idPeriode	INTEGER,
	nomPeriode	INTEGER,
	tempMoy	INTEGER,
	conditionsMoy	INTEGER,
	debutPeriode	INTEGER,
	finPeriode	INTEGER,
	PRIMARY KEY(idPeriode)
);

CREATE TABLE Produit (
	idProd	INTEGER,
	nomProd	TEXT,
	typeProd	TEXT,
	dateRecolte	TEXT,
	dateExpiration	TEXT,
	prixProd	REAL,
	quantite	INTEGER,
	idCmd INTEGER,
	idPeriode INTEGER,
	PRIMARY KEY(idProd),
	FOREIGN KEY (idCmd) REFERENCES Commande(idCmd),
	FOREIGN KEY (idPeriode) REFERENCES Periode(idPeriode)
);

CREATE TABLE Stock (
	idMag	INTEGER,
	idProd	INTEGER,
	dateArriv	TEXT,
	PRIMARY KEY(idMag,idProd)
	FOREIGN KEY (idMag) REFERENCES Magasin,
	FOREIGN KEY (idProd) REFERENCES Produit
);