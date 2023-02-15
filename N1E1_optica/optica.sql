CREATE SCHEMA IF NOT EXISTS `optica` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

-- create table proveidor --
CREATE TABLE IF NOT EXISTS `optica`.`proveidor` (
  `proveidor_id` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  `carrer` VARCHAR(15) NULL,
  `numero` VARCHAR(15) NULL,
  `pis` VARCHAR(15) NULL,
  `porta` VARCHAR(45) NULL,
  `ciutat` VARCHAR(45) NULL,
  `codi_postal` VARCHAR(15) NULL,
  `pais` VARCHAR(45) NULL,
  `telefon` VARCHAR(45) NULL,
  `fax` VARCHAR(45) NULL,
  `nif` VARCHAR(45) NULL,
  PRIMARY KEY (`proveidor_id`))
ENGINE = InnoDB;

-- create table marca --
CREATE TABLE IF NOT EXISTS `optica`.`marca` (
  `marca_id` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  `proveidor_id` INT NULL,
  PRIMARY KEY (`marca_id`),
  INDEX `proveidor_id_idx` (`proveidor_id` ASC),
  CONSTRAINT `proveidor_id`
    FOREIGN KEY (`proveidor_id`)
    REFERENCES `optica`.`proveidor` (`proveidor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- create table client --
CREATE TABLE IF NOT EXISTS `optica`.`client` (
  `client_id` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  `carrer` VARCHAR(15) NULL,
  `numero` VARCHAR(15) NULL,
  `pis` VARCHAR(45) NULL,
  `porta` VARCHAR(45) NULL,
  `codi_postal` VARCHAR(15) NULL,
  `pais` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NULL,
  `email` VARCHAR(200) NULL,
  `data_registre` DATETIME NULL,
  `client_recomanat_id` INT NULL,
  PRIMARY KEY (`client_id`),
  INDEX `client_recomanat_id_idx` (`client_recomanat_id` ASC),
  CONSTRAINT `client_recomanat_id`
    FOREIGN KEY (`client_recomanat_id`)
    REFERENCES `optica`.`client` (`client_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB

-- create table empleat --
CREATE TABLE IF NOT EXISTS `optica`.`empleat` (
  `empleat_id` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  `email` VARCHAR(200) NULL,
  `data_registre` DATETIME NULL,
  PRIMARY KEY (`empleat_id`))
ENGINE = InnoDB;

-- create table ulleres --
CREATE TABLE IF NOT EXISTS `optica`.`ulleres` (
  `ulleres_id` INT NOT NULL,
  `marca_id` INT NULL,
  `graduacio_l` DECIMAL(3,2) NULL,
  `graduacio_r` DECIMAL(3,2) NULL,
  `muntura` SET('flotant', 'pasta', 'metalica') NULL,
  `muntura_color` VARCHAR(45) NULL,
  `vidre_color_l` VARCHAR(45) NULL,
  `vidre_color_r` VARCHAR(45) NULL,
  `preu` FLOAT NULL,
  `client_id` INT NULL,
  `empleat_id` INT NULL,
  PRIMARY KEY (`ulleres_id`),
  INDEX `marca_id_idx` (`marca_id` ASC),
  INDEX `client_id_idx` (`client_id` ASC),
  INDEX `empleat_id_idx` (`empleat_id` ASC),
  CONSTRAINT `marca_id`
    FOREIGN KEY (`marca_id`)
    REFERENCES `optica`.`marca` (`marca_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `client_id`
    FOREIGN KEY (`client_id`)
    REFERENCES `optica`.`client` (`client_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `empleat_id`
    FOREIGN KEY (`empleat_id`)
    REFERENCES `optica`.`empleat` (`empleat_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- insert data to client --
INSERT INTO `optica`.`client` (`client_id`, `nom`, `carrer`, `numero`, `pis`, `porta`, `codi_postal`, `pais`, `telefono`, `email`, `data_registre`) VALUES (1, 'Marta Romero', 'Agla', '15', '1', '3', '08002', 'Espanya', '655743320', 'm.romero@gmail.com', '2023-01-01 17:17:02');
INSERT INTO `optica`.`client` (`client_id`, `nom`, `carrer`, `numero`, `pis`, `porta`, `codi_postal`, `pais`, `telefono`, `email`, `data_registre`) VALUES (2, 'Sergi Garcia', 'Alexandre ', '2', '3', '4', '08024 ', 'Espanya', '655734435', 's.garcia@gmail.com', '2023-01-02 18:56:30');
INSERT INTO `optica`.`client` (`client_id`, `nom`, `carrer`, `numero`, `pis`, `porta`, `codi_postal`, `pais`, `telefono`, `email`, `data_registre`) VALUES (3, 'Francisco Lopez', 'Ametllers', '3', '2', '4', '08006', 'Espanya', '678993324', 'f.lopez@hotmail.com', '2023-01-03 14:56:30');
INSERT INTO `optica`.`client` (`client_id`, `nom`, `carrer`, `numero`, `pis`, `porta`, `codi_postal`, `pais`, `telefono`, `email`, `data_registre`) VALUES (4, 'Mariana Sanchez', 'Odissea', '5', '4', '1', '08004', 'Espanya', '644786645', 'm.sanchez@gmail.com', '2023-01-05 13:20:30');
INSERT INTO `optica`.`client` (`client_id`, `nom`, `carrer`, `numero`, `pis`, `porta`, `codi_postal`, `pais`, `telefono`, `email`, `data_registre`) VALUES (5, 'Tomas Batlleve', 'Rectoret', '3', '2', '1', '08007', 'Espanya', '622885460', 't.batlleve@hotmail.com', '2023-01-04 12:56:30');
INSERT INTO `optica`.`client` (`client_id`, `nom`, `carrer`, `numero`, `pis`, `porta`, `codi_postal`, `pais`, `telefono`, `email`, `data_registre`) VALUES (6, 'Joan Gili', 'Lepant', '23', '2', '1', '08980', 'Espanya', '650884322', 'j.gili@gmail.com', '2023-01-03 18:17:02');
INSERT INTO `optica`.`client` (`client_id`, `nom`, `carrer`, `numero`, `pis`, `porta`, `codi_postal`, `pais`, `telefono`, `email`, `data_registre`) VALUES (7, 'Moritz Fernandez', 'Jaume Cabrera', '55', '3', '1', '08004', 'Espanya', '677870322', 'm.fernandez@hotmail.com', '2023-01-03 18:50:02');
INSERT INTO `optica`.`client` (`client_id`, `nom`, `carrer`, `numero`, `pis`, `porta`, `codi_postal`, `pais`, `telefono`, `email`, `data_registre`) VALUES (8, 'Sara Besnard', 'Tapioles', '120', '4', '3', '08001', 'Espanya', '612344554', 's.besnard@gmail.com', '2023-01-06 10:17:02');
INSERT INTO `optica`.`client` (`client_id`, `nom`, `carrer`, `numero`, `pis`, `porta`, `codi_postal`, `pais`, `telefono`, `email`, `data_registre`) VALUES (9, 'Joanthan Perez', 'Madrona Prat', '1', '1', '1', '08004', 'Espanya', '644832255', 'j.perez@hotmail.com', '2023-01-07 12:23:02');
INSERT INTO `optica`.`client` (`client_id`, `nom`, `carrer`, `numero`, `pis`, `porta`, `codi_postal`, `pais`, `telefono`, `email`, `data_registre`) VALUES (10, 'Montse Garriga', 'Sagunt', '33', '1', '3', '08980', 'Espanya', '936662345', 'm.garriga@gmail.com', '2023-01-08 11:17:02');

-- insert data to proveidor --
INSERT INTO `optica`.`proveidor` (`proveidor_id`, `nom`, `carrer`, `numero`, `pis`, `porta`, `ciutat`, `codi_postal`, `pais`, `telefon`, `fax`, `nif`) VALUES (1, 'Alco Distribuciones', 'Pocomaco', '14', '1', '1', 'A Coruña', '15190', 'Espanya', '981131600', '981283279', 'Y1234567Z');
INSERT INTO `optica`.`proveidor` (`proveidor_id`, `nom`, `carrer`, `numero`, `pis`, `porta`, `ciutat`, `codi_postal`, `pais`, `telefon`, `fax`, `nif`) VALUES (2, 'Bauba Style', 'Lloret de mar', '33', '1', '1', 'Girona', '17310', 'Espanya', '670058259', '670058259', 'N1234567Z');
INSERT INTO `optica`.`proveidor` (`proveidor_id`, `nom`, `carrer`, `numero`, `pis`, `porta`, `ciutat`, `codi_postal`, `pais`, `telefon`, `fax`, `nif`) VALUES (3, 'Prosun', 'Pallars ', '73', '1', '1', 'Barcelona', '08018', 'España', '644058259', '644058290', 'U1234567P');
INSERT INTO `optica`.`proveidor` (`proveidor_id`, `nom`, `carrer`, `numero`, `pis`, `porta`, `ciutat`, `codi_postal`, `pais`, `telefon`, `fax`, `nif`) VALUES (4, 'Next Round', 'Guixeres', '4', '1', '1', 'Badalona', '08915', 'España', '688974433', '688974433', 'P1234567P');
INSERT INTO `optica`.`proveidor` (`proveidor_id`, `nom`, `carrer`, `numero`, `pis`, `porta`, `ciutat`, `codi_postal`, `pais`, `telefon`, `fax`, `nif`) VALUES (5, 'MarOla Export', 'Azaleas', '247', '3', '1', 'Asturias', '33203', 'Espanya', '654332299', '654332299', 'T1234567Z');

-- insert data to empleat --
INSERT INTO `optica`.`empleat` (`empleat_id`, `nom`, `email`, `data_registre`) VALUES (1, 'Marta Sanchez', 'm.sanchez@gmail.com', '2023-01-18 12:00:00');
INSERT INTO `optica`.`empleat` (`empleat_id`, `nom`, `email`, `data_registre`) VALUES (2, 'Fran Perez', 'f.perez@hotmail.com', '2023-01-02 18:16:02');
INSERT INTO `optica`.`empleat` (`empleat_id`, `nom`, `email`, `data_registre`) VALUES (3, 'Aina Marti', 'a.marti@hotmail.com', '2023-01-08 10:17:02');
INSERT INTO `optica`.`empleat` (`empleat_id`, `nom`, `email`, `data_registre`) VALUES (4, 'Nuria Prades', 'n.prades@gmail.com', '2023-01-06 12:17:02');
INSERT INTO `optica`.`empleat` (`empleat_id`, `nom`, `email`, `data_registre`) VALUES (5, 'Sergi Pamies', 's.pamies@hotmail.com', '2023-01-09 13:17:02');
INSERT INTO `optica`.`empleat` (`empleat_id`, `nom`, `email`, `data_registre`) VALUES (6, 'Olga Fuentes', 'o.fuentes@gmail.com', '2023-01-15 11:17:02');

-- insert data to marca --
INSERT INTO `optica`.`marca` (`marca_id`, `nom`, `proveidor_id`) VALUES (1, 'Ray-Ban', 1);
INSERT INTO `optica`.`marca` (`marca_id`, `nom`, `proveidor_id`) VALUES (2, 'Oakley', 1);
INSERT INTO `optica`.`marca` (`marca_id`, `nom`, `proveidor_id`) VALUES (3, 'Polaroid', 4);
INSERT INTO `optica`.`marca` (`marca_id`, `nom`, `proveidor_id`) VALUES (4, 'Arnette', 1);
INSERT INTO `optica`.`marca` (`marca_id`, `nom`, `proveidor_id`) VALUES (5, 'Tous', 2);

-- insert data to ulleres --
INSERT INTO `optica`.`ulleres` (`ulleres_id`, `marca_id`, `graduacio_l`, `graduacio_r`, `muntura`, `muntura_color`, `vidre_color_l`, `vidre_color_r`, `preu`, `client_id`, `empleat_id`) VALUES (1, 1, 1.25, 0.25, 'pasta', 'transparente', 'transparente', 'transparente', 70, 1, 2);
INSERT INTO `optica`.`ulleres` (`ulleres_id`, `marca_id`, `graduacio_l`, `graduacio_r`, `muntura`, `muntura_color`, `vidre_color_l`, `vidre_color_r`, `preu`, `client_id`, `empleat_id`) VALUES (2, 1, 1, 1, 'flotant', 'negra', 'transparente', 'transparente', 100, 2, 2);
INSERT INTO `optica`.`ulleres` (`ulleres_id`, `marca_id`, `graduacio_l`, `graduacio_r`, `muntura`, `muntura_color`, `vidre_color_l`, `vidre_color_r`, `preu`, `client_id`, `empleat_id`) VALUES (3, 4, 0.25, 0.50, 'pasta', 'marron', 'transparente', 'transparente', 150, 3, 2);
INSERT INTO `optica`.`ulleres` (`ulleres_id`, `marca_id`, `graduacio_l`, `graduacio_r`, `muntura`, `muntura_color`, `vidre_color_l`, `vidre_color_r`, `preu`, `client_id`, `empleat_id`) VALUES (4, 3, 1.25, 3, 'pasta', 'marron', 'transparente', 'transparente', 200, 4, 1);
INSERT INTO `optica`.`ulleres` (`ulleres_id`, `marca_id`, `graduacio_l`, `graduacio_r`, `muntura`, `muntura_color`, `vidre_color_l`, `vidre_color_r`, `preu`, `client_id`, `empleat_id`) VALUES (5, 2, 2, 1, 'pasta', 'amarilla', 'transparente', 'transparente', 250, 5, 1);

-- Llista el total de compres d’un client/a --
SELECT * FROM `optica`.`ulleres` WHERE `client_id` = 1 ORDER BY `ulleres_id` LIMIT 300 OFFSET 0;

-- Llista les diferents ulleres que ha venut un empleat durant un any --
SELECT * FROM `optica`.`ulleres` WHERE `empleat_id` = 1 ORDER BY `ulleres_id` LIMIT 300 OFFSET 0;

-- Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica --
SELECT proveidor.nom 
FROM proveidor
LEFT JOIN marca USING (proveidor_id)
LEFT JOIN ulleres USING (marca_id)
GROUP BY nom


