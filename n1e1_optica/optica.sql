CREATE SCHEMA IF NOT EXISTS `optica` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS `optica`.`proveidor` (
  `proveidor_id` INT NOT NULL COMMENT '',
  `nom` VARCHAR(45) NULL COMMENT '',
  `carrer` VARCHAR(15) NULL COMMENT '',
  `numero` VARCHAR(15) NULL COMMENT '',
  `pis` VARCHAR(15) NULL COMMENT '',
  `porta` VARCHAR(45) NULL COMMENT '',
  `ciutat` VARCHAR(45) NULL COMMENT '',
  `codi_postal` VARCHAR(15) NULL COMMENT '',
  `pais` VARCHAR(45) NULL COMMENT '',
  `telefon` VARCHAR(45) NULL COMMENT '',
  `fax` VARCHAR(45) NULL COMMENT '',
  `nif` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`proveidor_id`)  COMMENT '')
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `optica`.`marca` (
  `marca_id` INT NOT NULL COMMENT '',
  `nom` VARCHAR(45) NULL COMMENT '',
  `proveidor_id` INT NULL COMMENT '',
  PRIMARY KEY (`marca_id`)  COMMENT '',
  INDEX `proveidor_id_idx` (`proveidor_id` ASC)  COMMENT '',
  CONSTRAINT `proveidor_id`
    FOREIGN KEY (`proveidor_id`)
    REFERENCES `optica`.`proveidor` (`proveidor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `optica`.`client` (
  `client_id` INT NOT NULL COMMENT '',
  `nom` VARCHAR(45) NULL COMMENT '',
  `carrer` VARCHAR(15) NULL COMMENT '',
  `numero` VARCHAR(15) NULL COMMENT '',
  `pis` VARCHAR(45) NULL COMMENT '',
  `porta` VARCHAR(45) NULL COMMENT '',
  `codi_postal` VARCHAR(15) NULL COMMENT '',
  `pais` VARCHAR(45) NULL COMMENT '',
  `telefono` VARCHAR(45) NULL COMMENT '',
  `email` VARCHAR(200) NULL COMMENT '',
  `data_registre` DATETIME NULL COMMENT '',
  `client_recomanat_id` INT NULL COMMENT '',
  PRIMARY KEY (`client_id`)  COMMENT '')
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `optica`.`empleat` (
  `empleat_id` INT NOT NULL COMMENT '',
  `nom` VARCHAR(45) NULL COMMENT '',
  `email` VARCHAR(200) NULL COMMENT '',
  `data_registre` DATETIME NULL COMMENT '',
  PRIMARY KEY (`empleat_id`)  COMMENT '')
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `optica`.`ulleres` (
  `ulleres_id` INT NOT NULL COMMENT '',
  `marca_id` INT NULL COMMENT '',
  `graduacio_l` DECIMAL(3,2) NULL COMMENT '',
  `graduacio_r` DECIMAL(3,2) NULL COMMENT '',
  `muntura` SET('flotant', 'pasta', 'metalica') NULL COMMENT '',
  `muntura_color` VARCHAR(45) NULL COMMENT '',
  `vidre_color_l` VARCHAR(45) NULL COMMENT '',
  `vidre_color_r` VARCHAR(45) NULL COMMENT '',
  `preu` FLOAT NULL COMMENT '',
  `client_id` INT NULL COMMENT '',
  `empleat_id` INT NULL COMMENT '',
  PRIMARY KEY (`ulleres_id`)  COMMENT '',
  INDEX `marca_id_idx` (`marca_id` ASC)  COMMENT '',
  INDEX `client_id_idx` (`client_id` ASC)  COMMENT '',
  INDEX `empleat_id_idx` (`empleat_id` ASC)  COMMENT '',
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


INSERT INTO `optica`.`proveidor` (`proveidor_id`, `nom`, `carrer`, `numero`, `pis`, `porta`, `ciutat`, `codi_postal`, `pais`, `telefon`, `fax`, `nif`) VALUES (1, 'Alco Distribuciones', 'Pocomaco', '14', '1', '1', 'A Coruña', '15190', 'Espanya', '981131600', '981283279', 'Y1234567Z');
INSERT INTO `optica`.`proveidor` (`proveidor_id`, `nom`, `carrer`, `numero`, `pis`, `porta`, `ciutat`, `codi_postal`, `pais`, `telefon`, `fax`, `nif`) VALUES (2, 'Bauba Style', 'Lloret de mar', '33', '1', '1', 'Girona', '17310', 'Espanya', '670058259', '670058259', 'N1234567Z');
INSERT INTO `optica`.`proveidor` (`proveidor_id`, `nom`, `carrer`, `numero`, `pis`, `porta`, `ciutat`, `codi_postal`, `pais`, `telefon`, `fax`, `nif`) VALUES (3, 'Prosun', 'Pallars ', '73', '1', '1', 'Barcelona', '08018', 'España', '644058259', '644058290', 'U1234567P');
INSERT INTO `optica`.`proveidor` (`proveidor_id`, `nom`, `carrer`, `numero`, `pis`, `porta`, `ciutat`, `codi_postal`, `pais`, `telefon`, `fax`, `nif`) VALUES (4, 'Next Round', 'Guixeres', '4', '1', '1', 'Badalona', '08915', 'España', '688974433', '688974433', 'P1234567P');
INSERT INTO `optica`.`proveidor` (`proveidor_id`, `nom`, `carrer`, `numero`, `pis`, `porta`, `ciutat`, `codi_postal`, `pais`, `telefon`, `fax`, `nif`) VALUES (5, 'MarOla Export', 'Azaleas', '247', '3', '1', 'Asturias', '33203', 'Espanya', '654332299', '654332299', 'T1234567Z');


INSERT INTO `optica`.`empleat` (`empleat_id`, `nom`, `email`, `data_registre`) VALUES (1, 'Marta Sanchez', 'm.sanchez@gmail.com', '2023-01-18 12:00:00');
INSERT INTO `optica`.`empleat` (`empleat_id`, `nom`, `email`, `data_registre`) VALUES (2, 'Fran Perez', 'f.perez@hotmail.com', '2023-01-02 18:16:02');
INSERT INTO `optica`.`empleat` (`empleat_id`, `nom`, `email`, `data_registre`) VALUES (3, 'Aina Marti', 'a.marti@hotmail.com', '2023-01-08 10:17:02');
INSERT INTO `optica`.`empleat` (`empleat_id`, `nom`, `email`, `data_registre`) VALUES (4, 'Nuria Prades', 'n.prades@gmail.com', '2023-01-06 12:17:02');
INSERT INTO `optica`.`empleat` (`empleat_id`, `nom`, `email`, `data_registre`) VALUES (5, 'Sergi Pamies', 's.pamies@hotmail.com', '2023-01-09 13:17:02');
INSERT INTO `optica`.`empleat` (`empleat_id`, `nom`, `email`, `data_registre`) VALUES (6, 'Olga Fuentes', 'o.fuentes@gmail.com', '2023-01-15 11:17:02');


