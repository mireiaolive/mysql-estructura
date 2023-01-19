CREATE SCHEMA IF NOT EXISTS `spotify` DEFAULT CHARACTER SET utf8;

SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE IF NOT EXISTS `spotify`.`album` (
  `album_id` INT NOT NULL,
  `titol` VARCHAR(45) NULL,
  `publicacio` DATETIME NULL,
  `imatge` VARCHAR(45) NULL,
  PRIMARY KEY (`album_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `spotify`.`artista` (
  `artista_id` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  `imatge` VARCHAR(45) NULL,
  `artista_id_a` INT NULL,
  `artista_id_b` INT NULL,
  PRIMARY KEY (`artista_id`),
  INDEX `FK_artista_a_idx` (`artista_id_a` ASC),
  INDEX `FK_artista_b_idx` (`artista_id_b` ASC),
  CONSTRAINT `FK_artista_a`
    FOREIGN KEY (`artista_id_a`)
    REFERENCES `spotify`.`artistes_relacionats` (`artista_id_a`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_artista_b`
    FOREIGN KEY (`artista_id_b`)
    REFERENCES `spotify`.`artistes_relacionats` (`artista_id_a`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `spotify`.`artistes_relacionats` (
  `artista_id_a` INT NOT NULL,
  `artista_id_b` INT NULL,
  PRIMARY KEY (`artista_id_a`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `spotify`.`canco` (
  `canco_id` INT NOT NULL,
  `add_data` DATE NULL,
  `free_id` INT NULL,
  `premium_id` INT NULL,
  `album_id` INT NULL,
  PRIMARY KEY (`canco_id`),
  INDEX `FK_free_idx` (`free_id` ASC),
  INDEX `FK_premium_idx` (`premium_id` ASC),
  INDEX `FK_album_idx` (`album_id` ASC),
  CONSTRAINT `FK_free`
    FOREIGN KEY (`free_id`)
    REFERENCES `spotify`.`free` (`free_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_premium`
    FOREIGN KEY (`premium_id`)
    REFERENCES `spotify`.`premium` (`premium_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_album`
    FOREIGN KEY (`album_id`)
    REFERENCES `spotify`.`album` (`album_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `spotify`.`credit` (
  `credit_id` INT NOT NULL,
  `num_targeta` INT NULL,
  `caducitat` DATE NULL,
  `codi_seguretat` VARCHAR(10) NULL,
  `n_ordre` INT NULL,
  `data_ordre` DATE NULL,
  `total` VARCHAR(45) NULL,
  PRIMARY KEY (`credit_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `spotify`.`favorit` (
  `favorit_id` INT NOT NULL,
  `album_id` INT NULL,
  `free_id` INT NULL,
  `premium_id` INT NULL,
  PRIMARY KEY (`favorit_id`),
  INDEX `FK_album_idx` (`album_id` ASC),
  INDEX `FK_free_idx` (`free_id` ASC),
  INDEX `FK_premium_idx` (`premium_id` ASC),
  CONSTRAINT `FK_premium_2`
    FOREIGN KEY (`premium_id`)
    REFERENCES `spotify`.`premium` (`premium_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_free_2`
    FOREIGN KEY (`free_id`)
    REFERENCES `spotify`.`free` (`free_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_album_2`
    FOREIGN KEY (`album_id`)
    REFERENCES `spotify`.`album` (`album_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `spotify`.`follow` (
  `free_id` INT NULL,
  `premium_id` INT NULL,
  `artista_id` INT NULL,
  INDEX `FK_premium_idx` (`premium_id` ASC),
  INDEX `FK_artista_idx` (`artista_id` ASC),
  INDEX `FK_free_idx` (`free_id` ASC),
  CONSTRAINT `FK_premium_3`
    FOREIGN KEY (`premium_id`)
    REFERENCES `spotify`.`premium` (`premium_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_artista_3`
    FOREIGN KEY (`artista_id`)
    REFERENCES `spotify`.`artista` (`artista_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_free_3`
    FOREIGN KEY (`free_id`)
    REFERENCES `spotify`.`free` (`free_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `spotify`.`free` (
  `free_id` INT NOT NULL,
  `email` VARCHAR(45) NULL,
  `nom` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `bday` DATE NULL COMMENT '',
  `sexe` ENUM('home', 'dona') NULL,
  `pais` VARCHAR(45) NULL,
  `codi_postal` VARCHAR(45) NULL,
  PRIMARY KEY (`free_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `spotify`.`paypal` (
  `paypal_id` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  `n_ordre` INT NULL,
  `data_ordre` DATE NULL,
  `total` VARCHAR(45) NULL,
  PRIMARY KEY (`paypal_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `spotify`.`playlist` (
  `playlist_id` INT NOT NULL,
  `titol` VARCHAR(45) NULL,
  `n_songs` INT NULL,
  `data_creacio` DATE NULL,
  `canco_id` INT NULL,
  PRIMARY KEY (`playlist_id`),
  INDEX `FK_canco_idx` (`canco_id` ASC),
  CONSTRAINT `FK_canco`
    FOREIGN KEY (`canco_id`)
    REFERENCES `spotify`.`canco` (`canco_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `spotify`.`premium` (
  `premium_id` INT NOT NULL,
  `free_id` INT NULL,
  `data_inici` DATE NULL,
  `data_renovacio` DATE NULL,
  `pagament` ENUM('credit', 'paypal') NULL,
  `credit_id` INT NULL,
  `paypal_id` INT NULL,
  PRIMARY KEY (`premium_id`),
  INDEX `FK_free_id` (`free_id` ASC),
  INDEX `FK_credit_id` (`credit_id` ASC),
  INDEX `FK_paypal_id` (`paypal_id` ASC),
  CONSTRAINT `FK_free_4`
    FOREIGN KEY (`free_id`)
    REFERENCES `spotify`.`free` (`free_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_credit`
    FOREIGN KEY (`credit_id`)
    REFERENCES `spotify`.`credit` (`credit_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_paypal`
    FOREIGN KEY (`paypal_id`)
    REFERENCES `spotify`.`paypal` (`paypal_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `spotify`.`album` (`album_id`, `titol`, `publicacio`, `imatge`) VALUES (1, 'The Best of Jazz', '2023-01-17 09:08:45', '1,jpg');
INSERT INTO `spotify`.`album` (`album_id`, `titol`, `publicacio`, `imatge`) VALUES (2, 'Deportes tv1', '2023-01-21 09:08:45', '2.jpg');
INSERT INTO `spotify`.`album` (`album_id`, `titol`, `publicacio`, `imatge`) VALUES (3, 'Pasteles', '2023-01-20 09:08:45', '3.jpg');
INSERT INTO `spotify`.`album` (`album_id`, `titol`, `publicacio`, `imatge`) VALUES (4, 'Psicologia', '2023-01-20 09:08:45', '4.jpg');
INSERT INTO `spotify`.`album` (`album_id`, `titol`, `publicacio`, `imatge`) VALUES (5, 'Padel tecnicas', '2023-01-20 09:08:45', '5.jpg');
INSERT INTO `spotify`.`album` (`album_id`, `titol`, `publicacio`, `imatge`) VALUES (6, 'Meditacion', '2023-01-20 09:08:45', '6.jpg');
INSERT INTO `spotify`.`album` (`album_id`, `titol`, `publicacio`, `imatge`) VALUES (7, 'Yoga', '2023-01-20 09:08:45', '7.jpg');
INSERT INTO `spotify`.`album` (`album_id`, `titol`, `publicacio`, `imatge`) VALUES (8, 'The Best of Bob Marley', '2023-01-20 09:08:45', '8.jpg');
INSERT INTO `spotify`.`album` (`album_id`, `titol`, `publicacio`, `imatge`) VALUES (9, 'Goles Liga 92', '2023-01-20 09:08:45', '9.jpg');
INSERT INTO `spotify`.`album` (`album_id`, `titol`, `publicacio`, `imatge`) VALUES (10, 'Discotecas Barcelona', '2023-01-20 09:08:45', '10.jpg');

INSERT INTO `spotify`.`artista` (`artista_id`, `nom`, `imatge`, `artista_id_a`, `artista_id_b`) VALUES (1, 'Michael Jackson', 'mi.jpg', 1, 1);
INSERT INTO `spotify`.`artista` (`artista_id`, `nom`, `imatge`, `artista_id_a`, `artista_id_b`) VALUES (2, 'George Michael', 'ge.jpg', 2, 2);
INSERT INTO `spotify`.`artista` (`artista_id`, `nom`, `imatge`, `artista_id_a`, `artista_id_b`) VALUES (3, 'Prince', 'pr.jpg', 3, 3);
INSERT INTO `spotify`.`artista` (`artista_id`, `nom`, `imatge`, `artista_id_a`, `artista_id_b`) VALUES (4, 'Henrry Mancini', 'he.jpg', 4, 4);
INSERT INTO `spotify`.`artista` (`artista_id`, `nom`, `imatge`, `artista_id_a`, `artista_id_b`) VALUES (5, 'Herb Alpert', 'herb.jpg', 5, 5);
INSERT INTO `spotify`.`artista` (`artista_id`, `nom`, `imatge`, `artista_id_a`, `artista_id_b`) VALUES (6, 'Tina Turner', 'ti.jpg', 6, 6);
INSERT INTO `spotify`.`artista` (`artista_id`, `nom`, `imatge`, `artista_id_a`, `artista_id_b`) VALUES (7, 'Bananarama', 'ba.jpg', 7, 7);

SET FOREIGN_KEY_CHECKS=0;


