--- Create a Database


CREATE DATABASE cars_management;



--- Create Tables


CREATE TABLE `clients` (
  `NumClient` int NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) NOT NULL,
  `Adresse` varchar(100),
  `Tel` varchar(15),
  `Email` varchar(100) NOT NULL,
  PRIMARY KEY (`NumClient`)
);


CREATE TABLE `voitures` (
  `NumImmatriculation` varchar(10) NOT NULL,
  `marque` varchar(50),
  `modele` varchar(50),
  `annee` int NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`NumImmatriculation`)
);


CREATE TABLE `contracts` (
  `NumContrat` int NOT NULL AUTO_INCREMENT,
  `NumClient` int,
  `StartDate` date,
  `EndDate` date,
  `duration` int,
  `NumImmatriculation` varchar(10),
  PRIMARY KEY (`NumContrat`),
  KEY `NumImmatriculation` (`NumImmatriculation`),
  KEY `NumClient` (`NumClient`),
  CONSTRAINT `contracts_ibfk_1` FOREIGN KEY (`NumImmatriculation`) REFERENCES `voitures` (`NumImmatriculation`),
  CONSTRAINT `contracts_ibfk_2` FOREIGN KEY (`NumClient`) REFERENCES `clients` (`NumClient`)
);



--- Insert Values


INSERT INTO `clients` VALUES 
(1, 'Ahmed Saidi', 'Casablanca, Maroc', '0612345678', 'ahmed.saidi@gmail.com'),
(2, 'Fatima El Amri', 'Rabat, Maroc', '0678901234', 'fatima.elamri@gmail.com'),
(3, 'Anass Boutaib', 'Tinghir, Maroc', '0654896521', 'anass.boutaib@gmail.com');


INSERT INTO `voitures` VALUES 
('1234ABC', 'Toyota', 'Corolla', 2020, 300),
('5678XYZ', 'Renault', 'Clio', 2021, 450);


INSERT INTO `contracts` VALUES 
(1, 1, '2024-01-01', '2024-01-10', 1, '1234ABC'),
(2, 2, '2024-02-01', '2024-02-05', 2, '5678XYZ');



--- Update Rows


UPDATE `clients` SET `Nom` = "Malika El Amri" WHERE `NumClient` = 2;
UPDATE `voitures` SET `annee` = 2022 WHERE `NumImmatriculation` = "1234ABC";



--- Delete Rows


DELETE FROM `clients` WHERE `NumClient` = 4;
DELETE FROM `voitures` WHERE `NumImmatriculation` = '1234ABC';



--- Select


SELECT `Nom`, `Adresse`, `Email` FROM `clients`;
SELECT * FROM `voitures` WHERE `marque` = "Toyota";
SELECT * FROM `contracts` C JOIN `voitures` `V` on `C`.`NumImmatriculation` = `V`.`NumImmatriculation` JOIN `clients` `CL` on `C`.`NumClient` = `CL`.`NumClient`