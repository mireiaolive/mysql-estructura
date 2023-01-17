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

INSERT INTO `pizzeria`.`comanda` (`comanda_id`, `data_hora`, `delivery`, `quantitat`, `preu`, `repartidor_id`, `client_id`) VALUES (1, '2021-10-23 11:48:13', 'botiga', 1, 10, 1, 1);
INSERT INTO `pizzeria`.`comanda` (`comanda_id`, `data_hora`, `delivery`, `quantitat`, `preu`, `repartidor_id`, `client_id`) VALUES (2, '2021-10-23 11:48:13', 'botiga', 2, 20, 1, 2);
INSERT INTO `pizzeria`.`comanda` (`comanda_id`, `data_hora`, `delivery`, `quantitat`, `preu`, `repartidor_id`, `client_id`) VALUES (3, '2021-10-23 11:48:13', 'botiga', 3, 30, 3, 3);
INSERT INTO `pizzeria`.`comanda` (`comanda_id`, `data_hora`, `delivery`, `quantitat`, `preu`, `repartidor_id`, `client_id`) VALUES (4, '2021-10-23 11:48:13', 'domicili', 1, 10, 3, 4);
INSERT INTO `pizzeria`.`comanda` (`comanda_id`, `data_hora`, `delivery`, `quantitat`, `preu`, `repartidor_id`, `client_id`) VALUES (5, '2021-10-23 11:48:13', 'domicili', 2, 20, 3, 5);
INSERT INTO `pizzeria`.`comanda` (`comanda_id`, `data_hora`, `delivery`, `quantitat`, `preu`, `repartidor_id`, `client_id`) VALUES (6, '2021-10-23 11:48:13', 'domicili', 3, 30, 3, 6);
INSERT INTO `pizzeria`.`comanda` (`comanda_id`, `data_hora`, `delivery`, `quantitat`, `preu`, `repartidor_id`, `client_id`) VALUES (7, '2021-10-23 11:48:13', 'botiga', 3, 30, 4, 7);

INSERT INTO `pizzeria`.`comanda` (`comanda_id`, `data_hora`, `delivery`, `quantitat`, `preu`, `repartidor_id`, `client_id`) VALUES (1, '2021-10-23 11:48:13', 'botiga', 1, 10, 1, 1);
INSERT INTO `pizzeria`.`comanda` (`comanda_id`, `data_hora`, `delivery`, `quantitat`, `preu`, `repartidor_id`, `client_id`) VALUES (2, '2021-10-23 11:48:13', 'botiga', 2, 20, 1, 2);
INSERT INTO `pizzeria`.`comanda` (`comanda_id`, `data_hora`, `delivery`, `quantitat`, `preu`, `repartidor_id`, `client_id`) VALUES (3, '2021-10-23 11:48:13', 'botiga', 3, 30, 3, 3);
INSERT INTO `pizzeria`.`comanda` (`comanda_id`, `data_hora`, `delivery`, `quantitat`, `preu`, `repartidor_id`, `client_id`) VALUES (4, '2021-10-23 11:48:13', 'domicili', 1, 10, 3, 4);
INSERT INTO `pizzeria`.`comanda` (`comanda_id`, `data_hora`, `delivery`, `quantitat`, `preu`, `repartidor_id`, `client_id`) VALUES (5, '2021-10-23 11:48:13', 'domicili', 2, 20, 3, 5);
INSERT INTO `pizzeria`.`comanda` (`comanda_id`, `data_hora`, `delivery`, `quantitat`, `preu`, `repartidor_id`, `client_id`) VALUES (6, '2021-10-23 11:48:13', 'domicili', 3, 30, 3, 6);
INSERT INTO `pizzeria`.`comanda` (`comanda_id`, `data_hora`, `delivery`, `quantitat`, `preu`, `repartidor_id`, `client_id`) VALUES (7, '2021-10-23 11:48:13', 'botiga', 3, 30, 4, 7);
INSERT INTO `pizzeria`.`empleat` (`empleat_id`, `nom`, `cognoms`, `botiga_id`, `telefon`, `repartidor_id`) VALUES (1, 'Gerard', 'Bolaños', 1, '544334567', 1);
INSERT INTO `pizzeria`.`empleat` (`empleat_id`, `nom`, `cognoms`, `botiga_id`, `telefon`, `repartidor_id`) VALUES (2, 'Norberto ', 'Bonet', 2, '666557788', 2);
INSERT INTO `pizzeria`.`empleat` (`empleat_id`, `nom`, `cognoms`, `botiga_id`, `telefon`, `repartidor_id`) VALUES (3, 'Josep ', 'Moron', 3, '654321477', 3);
INSERT INTO `pizzeria`.`empleat` (`empleat_id`, `nom`, `cognoms`, `botiga_id`, `telefon`, `repartidor_id`) VALUES (4, 'Arancha ', 'Coll', 4, '677887766', 4);
INSERT INTO `pizzeria`.`empleat` (`empleat_id`, `nom`, `cognoms`, `botiga_id`, `telefon`, `repartidor_id`) VALUES (5, 'Braulio ', 'Andres', 5, '655443322', 1);
INSERT INTO `pizzeria`.`empleat` (`empleat_id`, `nom`, `cognoms`, `botiga_id`, `telefon`, `repartidor_id`) VALUES (6, 'Dulce ', 'del Pozo', 1, '677889900', 2);
INSERT INTO `pizzeria`.`empleat` (`empleat_id`, `nom`, `cognoms`, `botiga_id`, `telefon`, `repartidor_id`) VALUES (7, 'Kevin ', 'Balaguer', 1, '657478990', 3);
INSERT INTO `pizzeria`.`empleat` (`empleat_id`, `nom`, `cognoms`, `botiga_id`, `telefon`, `repartidor_id`) VALUES (8, 'Georgina', 'Guerra', 3, '677554455', 4);
INSERT INTO `pizzeria`.`empleat` (`empleat_id`, `nom`, `cognoms`, `botiga_id`, `telefon`, `repartidor_id`) VALUES (9, 'Delfina ', 'Herrera', 2, '655667788', 1);
INSERT INTO `pizzeria`.`empleat` (`empleat_id`, `nom`, `cognoms`, `botiga_id`, `telefon`, `repartidor_id`) VALUES (10, ' Lola ', 'Dueñas ', 5, '657900000', 2);

INSERT INTO `pizzeria`.`repartidor` (`repartidor_id`, `nom`, `data_hora`) VALUES (1, 'Flora Gordo', '2023-01-12 11:32:13');
INSERT INTO `pizzeria`.`repartidor` (`repartidor_id`, `nom`, `data_hora`) VALUES (2, 'Juan Plaza ', '2023-01-14 11:32:13');
INSERT INTO `pizzeria`.`repartidor` (`repartidor_id`, `nom`, `data_hora`) VALUES (3, ' Modesto Fernandez ', '2023-01-15 11:32:13');
INSERT INTO `pizzeria`.`repartidor` (`repartidor_id`, `nom`, `data_hora`) VALUES (4, ' Zohra da Silva ', '2023-01-13 11:32:13');

INSERT INTO `pizzeria`.`pizza` (`pizza_id`, `nom`) VALUES (1, 'Margarita');
INSERT INTO `pizzeria`.`pizza` (`pizza_id`, `nom`) VALUES (2, 'Napolitana');
INSERT INTO `pizzeria`.`pizza` (`pizza_id`, `nom`) VALUES (3, 'Marinara ');
INSERT INTO `pizzeria`.`pizza` (`pizza_id`, `nom`) VALUES (4, 'Sfincione');
INSERT INTO `pizzeria`.`pizza` (`pizza_id`, `nom`) VALUES (5, 'Fugazza');
INSERT INTO `pizzeria`.`pizza` (`pizza_id`, `nom`) VALUES (6, 'Chicago');
INSERT INTO `pizzeria`.`pizza` (`pizza_id`, `nom`) VALUES (7, 'New York');
INSERT INTO `pizzeria`.`pizza` (`pizza_id`, `nom`) VALUES (8, 'Flammkuchen');
INSERT INTO `pizzeria`.`pizza` (`pizza_id`, `nom`) VALUES (9, 'Cuatro Quesos ');
INSERT INTO `pizzeria`.`pizza` (`pizza_id`, `nom`) VALUES (10, 'Cuatro Estaciones ');