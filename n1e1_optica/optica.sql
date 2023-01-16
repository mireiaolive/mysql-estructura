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
ENGINE = InnoDB



