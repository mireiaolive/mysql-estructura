CREATE SCHEMA IF NOT EXISTS `pizzeria` DEFAULT CHARACTER SET utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`botiga` (
  `botiga_id` INT NOT NULL,
  `carrer` VARCHAR(45) NULL,
  `numero` VARCHAR(45) NULL,
  `codi_postal` VARCHAR(45) NULL,
  `localitat` VARCHAR(45) NULL,
  `provincia` VARCHAR(45) NULL,
  PRIMARY KEY (`botiga_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `pizzeria`.`empleat` (
  `empleat_id` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  `cognoms` VARCHAR(45) NULL,
  `botiga_id` INT NULL,
  `telefon` VARCHAR(45) NULL,
  PRIMARY KEY (`empleat_id`),
  INDEX `botiga_id_idx` (`botiga_id` ASC),
  CONSTRAINT `botiga_id`
    FOREIGN KEY (`botiga_id`)
    REFERENCES `pizzeria`.`botiga` (`botiga_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `pizzeria`.`comanda` (
  `comanda_id` INT NOT NULL,
  `data_hora` DATETIME NULL,
  `delivery` SET('botiga', 'domicili') NULL,
  `quantitat` INT NULL,
  `preu` FLOAT NULL,
  `repartidor_id` INT NULL,
  `client_id` INT NULL,
  PRIMARY KEY (`comanda_id`),
  INDEX `cuiner_repartidor_id_idx` (`repartidor_id` ASC),
  INDEX `client_id_idx` (`client_id` ASC),
  CONSTRAINT `repartidorid`
    FOREIGN KEY (`repartidor_id`)
    REFERENCES `pizzeria`.`repartidor` (`repartidor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `client_id`
    FOREIGN KEY (`client_id`)
    REFERENCES `pizzeria`.`client` (`client_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `pizzeria`.`pizza` (
  `pizza_id` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  PRIMARY KEY (`pizza_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `pizzeria`.`producte` (
  `producte_id` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  `descripcio` VARCHAR(45) NULL,
  `imatge` VARCHAR(45) NULL,
  `preu` FLOAT NULL,
  `pizza_id` INT NULL,
  PRIMARY KEY (`producte_id`),
  INDEX `pizza_id_idx` (`pizza_id` ASC),
  CONSTRAINT `pizza_id`
    FOREIGN KEY (`pizza_id`)
    REFERENCES `pizzeria`.`pizza` (`pizza_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `pizzeria`.`repartidor` (
  `repartidor_id` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  `data_hora` DATETIME NULL,
  PRIMARY KEY (`repartidor_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `pizzeria`.`client` (
  `client_id` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  `cognoms` VARCHAR(45) NULL,
  `carrer` VARCHAR(45) NULL,
  `codi_postal` VARCHAR(45) NULL,
  `provincia` VARCHAR(45) NULL,
  `telefon` VARCHAR(45) NULL,
  PRIMARY KEY (`client_id`))
ENGINE = InnoDB;

INSERT INTO `pizzeria`.`botiga` (`botiga_id`, `carrer`, `numero`, `codi_postal`, `localitat`, `provincia`) VALUES (1, ' Karl Marx, Plaça de', '1', '08005', 'Barcelona', 'Barcelona');
INSERT INTO `pizzeria`.`botiga` (`botiga_id`, `carrer`, `numero`, `codi_postal`, `localitat`, `provincia`) VALUES (2, 'Laberint, Carrer del', '34', '08991', 'Martorell', 'Barcelona');
INSERT INTO `pizzeria`.`botiga` (`botiga_id`, `carrer`, `numero`, `codi_postal`, `localitat`, `provincia`) VALUES (3, 'Lázaro Cárdenas, Carrer de', '33', '08775', 'Platja D\'Aro', 'Girona');
INSERT INTO `pizzeria`.`botiga` (`botiga_id`, `carrer`, `numero`, `codi_postal`, `localitat`, `provincia`) VALUES (4, 'Lesseps, Plaça de', '1', '09885', 'Cambrils', 'Tarragona');
INSERT INTO `pizzeria`.`botiga` (`botiga_id`, `carrer`, `numero`, `codi_postal`, `localitat`, `provincia`) VALUES (5, 'Rajoler, Carrer del', '5', '09877', 'Mollerussa', 'Lleida');

INSERT INTO `pizzeria`.`client` (`client_id`, `nom`, `cognoms`, `carrer`, `codi_postal`, `provincia`, `telefon`) VALUES (1, 'Roman ', 'Navarrete', 'Rambla, La', '08996', 'Barcelona', '655443387');
INSERT INTO `pizzeria`.`client` (`client_id`, `nom`, `cognoms`, `carrer`, `codi_postal`, `provincia`, `telefon`) VALUES (2, 'Noa', 'Villena', 'Laietana, Via ', '54336', 'Girona', '566887790');
INSERT INTO `pizzeria`.`client` (`client_id`, `nom`, `cognoms`, `carrer`, `codi_postal`, `provincia`, `telefon`) VALUES (3, 'Uxia ', 'Martínez', 'Lírica, Carrer de la', '07665', 'Girona', '633478559');
INSERT INTO `pizzeria`.`client` (`client_id`, `nom`, `cognoms`, `carrer`, `codi_postal`, `provincia`, `telefon`) VALUES (4, ' Michael ', 'Pinilla ', 'Jaén, Carrer de', '09887', 'Barcelona', '655447890');
INSERT INTO `pizzeria`.`client` (`client_id`, `nom`, `cognoms`, `carrer`, `codi_postal`, `provincia`, `telefon`) VALUES (5, ' Soraya ', 'Mir ', ' Xipre, Carrer de', '02334', 'Lleida', '622345699');
INSERT INTO `pizzeria`.`client` (`client_id`, `nom`, `cognoms`, `carrer`, `codi_postal`, `provincia`, `telefon`) VALUES (6, 'Asuncion ', 'Alcantara', 'León, Passatge de', '01876', 'Barcelona', '640998776');
INSERT INTO `pizzeria`.`client` (`client_id`, `nom`, `cognoms`, `carrer`, `codi_postal`, `provincia`, `telefon`) VALUES (7, 'Maria ', 'Pallares ', 'apineria, Carrer de la', '08714', 'Barcelona', '633221543');
INSERT INTO `pizzeria`.`client` (`client_id`, `nom`, `cognoms`, `carrer`, `codi_postal`, `provincia`, `telefon`) VALUES (8, 'Markel ', 'Rodrigues ', 'Olesa, Carrer d\'', '01234', 'Barcelona', '644557889');
INSERT INTO `pizzeria`.`client` (`client_id`, `nom`, `cognoms`, `carrer`, `codi_postal`, `provincia`, `telefon`) VALUES (9, 'Marcela ', 'Torregrosa', 'Nau, Carrer de la', '07763', 'Tarragona', '666645337');
INSERT INTO `pizzeria`.`client` (`client_id`, `nom`, `cognoms`, `carrer`, `codi_postal`, `provincia`, `telefon`) VALUES (10, 'Mari ', 'Toledano ', 'Nínive, Carrer de', '01234', 'tarragona', '699885463');


