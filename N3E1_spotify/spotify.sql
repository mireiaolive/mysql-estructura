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

INSERT INTO `spotify`.`artistes_relacionats` (`artista_id_a`, `artista_id_b`) VALUES (1, 1);
INSERT INTO `spotify`.`artistes_relacionats` (`artista_id_a`, `artista_id_b`) VALUES (2, 2);
INSERT INTO `spotify`.`artistes_relacionats` (`artista_id_a`, `artista_id_b`) VALUES (3, 3);
INSERT INTO `spotify`.`artistes_relacionats` (`artista_id_a`, `artista_id_b`) VALUES (4, 4);
INSERT INTO `spotify`.`artistes_relacionats` (`artista_id_a`, `artista_id_b`) VALUES (5, 5);
INSERT INTO `spotify`.`artistes_relacionats` (`artista_id_a`, `artista_id_b`) VALUES (6, 6);
INSERT INTO `spotify`.`artistes_relacionats` (`artista_id_a`, `artista_id_b`) VALUES (7, 7);

INSERT INTO `spotify`.`canco` (`canco_id`, `add_data`, `free_id`, `premium_id`, `album_id`) VALUES (1, '2023-01-12', 1, 1, 1);
INSERT INTO `spotify`.`canco` (`canco_id`, `add_data`, `free_id`, `premium_id`, `album_id`) VALUES (2, '2023-01-18', 2, 2, 2);
INSERT INTO `spotify`.`canco` (`canco_id`, `add_data`, `free_id`, `premium_id`, `album_id`) VALUES (3, '2023-01-24', 3, 3, 3);
INSERT INTO `spotify`.`canco` (`canco_id`, `add_data`, `free_id`, `premium_id`, `album_id`) VALUES (4, '2022-12-15', 4, 4, 4);
INSERT INTO `spotify`.`canco` (`canco_id`, `add_data`, `free_id`, `premium_id`, `album_id`) VALUES (5, '2023-01-02', 5, 5, 5);
INSERT INTO `spotify`.`canco` (`canco_id`, `add_data`, `free_id`, `premium_id`, `album_id`) VALUES (6, '2023-01-06', 6, 6, 6);
INSERT INTO `spotify`.`canco` (`canco_id`, `add_data`, `free_id`, `premium_id`, `album_id`) VALUES (7, '2022-12-15', 7, 7, 7);
INSERT INTO `spotify`.`canco` (`canco_id`, `add_data`, `free_id`, `premium_id`, `album_id`) VALUES (8, '2022-12-06', 8, 8, 8);
INSERT INTO `spotify`.`canco` (`canco_id`, `add_data`, `free_id`, `premium_id`, `album_id`) VALUES (9, '2023-01-02', 9, 9, 9);
INSERT INTO `spotify`.`canco` (`canco_id`, `add_data`, `free_id`, `premium_id`, `album_id`) VALUES (10, '2022-12-14', 10, 10, 10);

INSERT INTO `spotify`.`credit` (`credit_id`, `num_targeta`, `caducitat`, `codi_seguretat`, `n_ordre`, `data_ordre`, `total`) VALUES (1, 3334567, '2026-01-10', '321', 1, '2023-01-14', '40');
INSERT INTO `spotify`.`credit` (`credit_id`, `num_targeta`, `caducitat`, `codi_seguretat`, `n_ordre`, `data_ordre`, `total`) VALUES (2, 6556789, '2028-01-14', '345', 2, '2023-01-12', '30');
INSERT INTO `spotify`.`credit` (`credit_id`, `num_targeta`, `caducitat`, `codi_seguretat`, `n_ordre`, `data_ordre`, `total`) VALUES (3, 7223478, '2029-01-20', '456', 3, '2023-01-11', '40');
INSERT INTO `spotify`.`credit` (`credit_id`, `num_targeta`, `caducitat`, `codi_seguretat`, `n_ordre`, `data_ordre`, `total`) VALUES (4, 8667789, '2030-01-13', '123', 4, '2023-01-10', '10');
INSERT INTO `spotify`.`credit` (`credit_id`, `num_targeta`, `caducitat`, `codi_seguretat`, `n_ordre`, `data_ordre`, `total`) VALUES (5, 6666787, '2024-11-10', '234', 5, '2023-01-09', '40');

INSERT INTO `spotify`.`favorit` (`favorit_id`, `album_id`, `free_id`, `premium_id`) VALUES (1, 1, 1, 1);
INSERT INTO `spotify`.`favorit` (`favorit_id`, `album_id`, `free_id`, `premium_id`) VALUES (2, 2, 2, 2);
INSERT INTO `spotify`.`favorit` (`favorit_id`, `album_id`, `free_id`, `premium_id`) VALUES (3, 3, 3, 3);
INSERT INTO `spotify`.`favorit` (`favorit_id`, `album_id`, `free_id`, `premium_id`) VALUES (4, 4, 4, 4);
INSERT INTO `spotify`.`favorit` (`favorit_id`, `album_id`, `free_id`, `premium_id`) VALUES (5, 5, 5, 5);
INSERT INTO `spotify`.`favorit` (`favorit_id`, `album_id`, `free_id`, `premium_id`) VALUES (6, 6, 6, 6);
INSERT INTO `spotify`.`favorit` (`favorit_id`, `album_id`, `free_id`, `premium_id`) VALUES (7, 7, 7, 7);

INSERT INTO `spotify`.`follow` (`free_id`, `premium_id`, `artista_id`) VALUES (1, 1, 1);
INSERT INTO `spotify`.`follow` (`free_id`, `premium_id`, `artista_id`) VALUES (2, 2, 1);
INSERT INTO `spotify`.`follow` (`free_id`, `premium_id`, `artista_id`) VALUES (3, 3, 1);
INSERT INTO `spotify`.`follow` (`free_id`, `premium_id`, `artista_id`) VALUES (4, 4, 1);
INSERT INTO `spotify`.`follow` (`free_id`, `premium_id`, `artista_id`) VALUES (5, 5, 2);
INSERT INTO `spotify`.`follow` (`free_id`, `premium_id`, `artista_id`) VALUES (6, 6, 2);
INSERT INTO `spotify`.`follow` (`free_id`, `premium_id`, `artista_id`) VALUES (7, 7, 3);
INSERT INTO `spotify`.`follow` (`free_id`, `premium_id`, `artista_id`) VALUES (8, 8, 3);
INSERT INTO `spotify`.`follow` (`free_id`, `premium_id`, `artista_id`) VALUES (9, 9, 3);
INSERT INTO `spotify`.`follow` (`free_id`, `premium_id`, `artista_id`) VALUES (10, 10, 3);

INSERT INTO `spotify`.`free` (`free_id`, `email`, `nom`, `password`, `bday`, `sexe`, `pais`, `codi_postal`) VALUES (1, 'e.caner89@hotmail.com', 'Elena Cañizares', 'qwFKGSFx^2e#eM95', '1988-01-11', 'dona', 'Espanya', '08980');
INSERT INTO `spotify`.`free` (`free_id`, `email`, `nom`, `password`, `bday`, `sexe`, `pais`, `codi_postal`) VALUES (2, 'aroonarce@hotmail.com', 'Aaron Arce ', 'bVW7378tPzDb#j26', '1990-01-11', 'home', 'Chile', '08980');
INSERT INTO `spotify`.`free` (`free_id`, `email`, `nom`, `password`, `bday`, `sexe`, `pais`, `codi_postal`) VALUES (3, 'andressouad@hotmail.com', 'Souad Andres', 'uECUxH5T3g^6uy23', '1991-08-11', 'home', 'Uruguay', '08581');
INSERT INTO `spotify`.`free` (`free_id`, `email`, `nom`, `password`, `bday`, `sexe`, `pais`, `codi_postal`) VALUES (4, 'andressouad@hotmail.com', 'Javier Mora', '#Bk4FgjiKd%hGGYp', '1981-09-11', 'home', 'Espanya', '08980');
INSERT INTO `spotify`.`free` (`free_id`, `email`, `nom`, `password`, `bday`, `sexe`, `pais`, `codi_postal`) VALUES (5, 'jimena@hotmail.com', 'Jimena Moro', 'f3%a%tZ9%5y9$F4j', '1985-12-11', 'home', 'Espanya', '08780');
INSERT INTO `spotify`.`free` (`free_id`, `email`, `nom`, `password`, `bday`, `sexe`, `pais`, `codi_postal`) VALUES (6, 'mirenalcaraz@hotmail.com', 'Miren Alcaraz', '&mL%2jLaHx2XnP6v', '1983-01-20', 'dona', 'Espanya', '08231');

INSERT INTO `spotify`.`paypal` (`paypal_id`, `nom`, `n_ordre`, `data_ordre`, `total`) VALUES (1, 'Celia', 1, '1', '40');
INSERT INTO `spotify`.`paypal` (`paypal_id`, `nom`, `n_ordre`, `data_ordre`, `total`) VALUES (2, 'Jessica', 2, '2', '60');
INSERT INTO `spotify`.`paypal` (`paypal_id`, `nom`, `n_ordre`, `data_ordre`, `total`) VALUES (3, 'Sonia', 3, '3', '50');
INSERT INTO `spotify`.`paypal` (`paypal_id`, `nom`, `n_ordre`, `data_ordre`, `total`) VALUES (4, 'Pol', 4, '4', '70');
INSERT INTO `spotify`.`paypal` (`paypal_id`, `nom`, `n_ordre`, `data_ordre`, `total`) VALUES (5, 'Josep', 5, '5', '34');
INSERT INTO `spotify`.`paypal` (`paypal_id`, `nom`, `n_ordre`, `data_ordre`, `total`) VALUES (6, 'Carles', 6, '6', '20');

INSERT INTO `spotify`.`playlist` (`playlist_id`, `titol`, `n_songs`, `data_creacio`, `canco_id`) VALUES (1, 'Hits 80', 2, '2023-01-04', 1);
INSERT INTO `spotify`.`playlist` (`playlist_id`, `titol`, `n_songs`, `data_creacio`, `canco_id`) VALUES (2, 'Hits 90', 3, '2023-01-10', 2);
INSERT INTO `spotify`.`playlist` (`playlist_id`, `titol`, `n_songs`, `data_creacio`, `canco_id`) VALUES (3, 'Hits techno', 4, '2023-01-02', 3);
INSERT INTO `spotify`.`playlist` (`playlist_id`, `titol`, `n_songs`, `data_creacio`, `canco_id`) VALUES (4, 'Deporte en Tanzania', 6, '2023-01-17', 4);
INSERT INTO `spotify`.`playlist` (`playlist_id`, `titol`, `n_songs`, `data_creacio`, `canco_id`) VALUES (5, 'Hits 70', 4, '2023-01-11', 5);

INSERT INTO `spotify`.`premium` (`premium_id`, `free_id`, `data_inici`, `data_renovacio`, `pagament`, `credit_id`, `paypal_id`) VALUES (1, 1, '2023-01-04', '2024-01-04', 'credit', 1, 1);
INSERT INTO `spotify`.`premium` (`premium_id`, `free_id`, `data_inici`, `data_renovacio`, `pagament`, `credit_id`, `paypal_id`) VALUES (2, 2, '2020-01-04', '2024-01-04', 'paypal', 2, 2);
INSERT INTO `spotify`.`premium` (`premium_id`, `free_id`, `data_inici`, `data_renovacio`, `pagament`, `credit_id`, `paypal_id`) VALUES (3, 3, '2022-01-04', '2024-01-04', 'paypal', 3, 3);
INSERT INTO `spotify`.`premium` (`premium_id`, `free_id`, `data_inici`, `data_renovacio`, `pagament`, `credit_id`, `paypal_id`) VALUES (4, 4, '2020-01-10', '2024-01-04', 'credit', 4, 4);
INSERT INTO `spotify`.`premium` (`premium_id`, `free_id`, `data_inici`, `data_renovacio`, `pagament`, `credit_id`, `paypal_id`) VALUES (5, 5, '2023-01-14', '2024-01-04', 'credit', 5, 5);
INSERT INTO `spotify`.`premium` (`premium_id`, `free_id`, `data_inici`, `data_renovacio`, `pagament`, `credit_id`, `paypal_id`) VALUES (6, 6, '2022-01-04', '2024-01-04', 'credit', 6, 6);
INSERT INTO `spotify`.`premium` (`premium_id`, `free_id`, `data_inici`, `data_renovacio`, `pagament`, `credit_id`, `paypal_id`) VALUES (7, 7, '2023-05-11', '2024-01-04', 'credit', 7, 7);
INSERT INTO `spotify`.`premium` (`premium_id`, `free_id`, `data_inici`, `data_renovacio`, `pagament`, `credit_id`, `paypal_id`) VALUES (8, 8, '2021-03-04', '2024-01-04', 'paypal', 8, 8);

SET FOREIGN_KEY_CHECKS=0;

