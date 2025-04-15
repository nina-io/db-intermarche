/*
PROJET S104 Création BD, IUT d'Orsay
TIKKENT Sara, SCHOELLHAMMER Nina
2024-2025
*/

------------------------------ SCRIPT D'INTERROGATION -----------------------------------

-- Nina
-- 1. Listez le nom des produits qui sont des légumes
SELECT nomProd, typeProd
FROM Produit
WHERE typeProd LIKE 'légume%';

-- 2. Donnez la liste des commandes qui ont été faites en 2024 dans l’ordre décroissant
SELECT dateCmd
FROM Commande
WHERE dateCmd>'2023-12-31'
AND dateCmd<'2025-01-01'
ORDER BY idCmd DESC;

-- 3. Donnez la quantité totale de produits qui ont été commandés en 2023
SELECT SUM(qteCmd)*SUM(quantite) AS qteTotale
FROM Produit p
INNER JOIN Commande c ON p.idCmd=c.idCmd
WHERE dateCmd>'2022-12-31'
AND dateCmd<'2024-01-01'
;

-- 4. Donnez la moyenne des coûts des commandes ayant été faites en 2022
SELECT AVG(montantCmd) AS moyenneCoût
FROM Commande
WHERE dateCmd>'2021-12-31'
AND dateCmd<'2023-01-01'
;

-- 5. Donnez la liste des commandes venant du fournisseur AgriAura dans l’ordre décroissant
SELECT idCmd
FROM Commande c
INNER JOIN Fournisseur f ON c.idFourn=f.idFourn
WHERE nomFourn='AgriAura'
ORDER BY idCmd DESC;

-- 6. Donnez la liste nominative des fournisseurs qui ont fourni des légume-racine
SELECT nomFourn
FROM Fournisseur f
INNER JOIN Commande c ON f.idFourn=c.idFourn
INNER JOIN Produit p ON c.idCmd=p.idCmd
WHERE typeProd='légume-racine'
ORDER BY nomFourn;

-- 7. Donnez, pour chaque fournisseur, le nombre d'adresses de facturation de toutes ses commandes
SELECT COUNT(adrFact) AS nbAdr, frn.idFourn
FROM Fournisseur frn
INNER JOIN Facture fa ON frn.idFourn=fa.idFourn
GROUP BY frn.idFourn;

-- 8. Donnez pour chaque magasin, la moyenne des prix des produits qu'il a commandé
SELECT m.idMag, mailMag, AVG(prixProd) AS moyPrixProd
FROM Produit P
INNER JOIN Commande C ON P.idCmd=C.idCmd
INNER JOIN Magasin M ON C.idMag=M.idMag
GROUP BY m.idMag, mailMag;

-- 9. Lister les fournisseurs ayant livré des produits avec une durée de vie moyenne (dateExpiration - dateRecolte) supérieure à deux ans.
SELECT DISTINCT nomFourn -- DISTINCT pcq un fournisseur peut avoir plusieurs produits avec une durée de vie moyenne supérieure à 2 ans
FROM Fournisseur f
INNER JOIN Commande c ON f.idFourn=c.idFourn
INNER JOIN Produit p ON c.idCmd=p.idCmd
WHERE julianday(dateExpiration)-julianday(dateRecolte)>730
ORDER BY nomFourn;

-- 10. Donner le nombre total de produits pour chaque période de l'année.
SELECT COUNT(*) AS nbProduit, nomPeriode
FROM Produit pr
INNER JOIN Periode pe ON pr.idPeriode=pe.idPeriode
GROUP BY nomPeriode;

-- Sara
--1 afficher la quantité de chaque produit present en stock et dont la date d'expiration est superierur à 01-02-2023
SELECT nomProd, qteCmd
FROM Produit P
INNER JOIN Commande C ON C.idCmd=P.idCmd
INNER JOIN Stock S ON S.idProd=P.idProd
WHERE dateExpiration >'01-02-2023'
ORDER BY qteCmd;

--2 calcule le nombre de produit présent dans le stock de chaque magasin  
SELECT M.idMag, P.nomProd, SUM(P.quantite) AS NombreProduits
FROM Produit P
INNER JOIN Stock S ON S.idProd = P.idProd
INNER JOIN Magasin M ON M.idMag = S.idMag
GROUP BY P.nomProd
ORDER BY M.idMag ASC;

--3 Calculer combien de magasins sont associés à chaque fournisseur
SELECT F.nomFourn, COUNT(DISTINCT M.idMag) AS NombreMagasins
FROM Fournisseur F
INNER JOIN Facture Fac ON F.idFourn = Fac.idFourn
INNER JOIN Magasin M ON Fac.idMag = M.idMag
GROUP BY F.nomFourn
ORDER BY NombreMagasins ASC;

--4 compter la somme des factures de chaque fournisseur
SELECT F.nomFourn, SUM(FA.idFact) AS NBRFACTURE
FROM Fournisseur F
INNER JOIN FACTURE FA ON F.idFourn = FA.idFourn
GROUP BY F.nomFourn
ORDER BY NBRFACTURE ASC;

--5 recherche du fournisseur qui a fournit un produit précis
SELECT F.idFourn, nomFourn
FROM Fournisseur F
INNER JOIN Commande C ON C.idFourn = F.idFourn
INNER JOIN Produit P ON P.idCmd = C.idCmd
WHERE P.nomProd = 'Pommes Fuji croquantes';

--6 donner le nomcet la somme de produit present en stock dont la date d'expiration a ete depasser 
SELECT P.nomProd, SUM(quantite) AS SOMME_PRESENTE
FROM Produit P
INNER JOIN Stock S ON P.idProd = S.idProd
WHERE P.dateExpiration < CURRENT_DATE
GROUP BY P.nomProd;

--7 affiche le nom de  produits en stock (non expirés et arrivés avant aujourd'hui) 
SELECT P.nomProd, COUNT(S.idProd)AS TOTAL_PAR_PRODUIT
FROM Produit P
INNER JOIN Commande C ON P.idCmd = C.idCmd
INNER JOIN Stock S ON S.idProd = P.idProd
WHERE dateExpiration >  CURRENT_DATE
AND dateArriv < CURRENT_DATE
GROUP BY P.nomProd
ORDER BY TOTAL_PAR_PRODUIT DESC;

--8 selectionner les produits commandée mais non livrés ( il n'y en a pas)
SELECT P.nomProd, S.dateArriv, SUM(P.quantite) AS QuantiteCommandee
FROM Produit P
INNER JOIN Commande C ON P.idCmd = C.idCmd
INNER JOIN Stock S ON S.idProd = P.idProd 
WHERE S.dateArriv IS NULL
GROUP BY P.nomProd, S.dateArriv
ORDER BY P.nomProd ASC;

--9 calculer la quantite produite par Periode
SELECT nomProd,nomPeriode
FROM Produit P
INNER JOIN  Periode Pe ON Pe.idPeriode=P.idPeriode
GROUP BY nomPeriode
ORDER BY nomProd ASC;

--10 Calcule de la quantité moyenne de produits livrés par commande pour chaque magasin.
SELECT C. idCmd, M.idMag, ROUND(AVG(P.quantite)) AS quantiteMoyenne
FROM Commande C
INNER JOIN Produit P ON C.idCmd = P.idCmd
INNER JOIN Magasin M ON C.idMag = M.idMag
GROUP BY M.idMag
ORDER BY M.idMag;
