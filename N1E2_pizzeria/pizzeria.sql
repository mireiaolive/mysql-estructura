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



