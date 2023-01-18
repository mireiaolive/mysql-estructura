CREATE SCHEMA IF NOT EXISTS `youtube` DEFAULT CHARACTER SET utf8;

CREATE TABLE IF NOT EXISTS `youtube`.`usuari` (
  `usuari_id` INT NOT NULL,
  `email` VARCHAR(300) NULL,
  `password` VARCHAR(64) NULL,
  `nom` VARCHAR(45) NULL,
  `bday` DATE NULL,
  `sexe` ENUM('home', 'dona') NULL,
  `pais` VARCHAR(100) NULL,
  `codi_postal` VARCHAR(45) NULL,
  PRIMARY KEY (`usuari_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `youtube`.`video` (
  `video_id` INT NOT NULL,
  `titol` VARCHAR(200) NULL,
  `descripcio` VARCHAR(500) NULL,
  `grandaria` LONGTEXT NULL,
  `nom` VARCHAR(45) NULL,
  `durada` VARCHAR(10) NULL,
  `reproduciones` INT NULL,
  `likes` INT NULL,
  `dislikes` INT NULL,
  `estat` ENUM('public', 'ocult', 'privat') NULL,
  `etiqueta_id` INT NULL,
  `publicacio` DATETIME NULL,
  `usuari_id` INT NULL,
  PRIMARY KEY (`video_id`),
  INDEX `etiqueta_id_idx` (`etiqueta_id` ASC),
  INDEX `usuari_id_idx` (`usuari_id` ASC),
  CONSTRAINT `etiqueta_id`
    FOREIGN KEY (`etiqueta_id`)
    REFERENCES `youtube`.`etiqueta` (`etiqueta_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `u_id`
    FOREIGN KEY (`usuari_id`)
    REFERENCES `youtube`.`usuari` (`usuari_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `youtube`.`subscriure` (
  `subscriure_id` INT NOT NULL,
  `canal_id` INT NULL,
  `usuario_id` INT NULL,
  PRIMARY KEY (`subscriure_id`),
  INDEX `canal_id_idx` (`canal_id` ASC),
  INDEX `usuari_id_idx` (`usuario_id` ASC),
  CONSTRAINT `canal_id`
    FOREIGN KEY (`canal_id`)
    REFERENCES `youtube`.`canal` (`canal_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `usuarii_id`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `youtube`.`usuari` (`usuari_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `youtube`.`canal` (
  `canal_id` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  `descripcio` VARCHAR(200) NULL,
  `publicacio` DATE NULL,
  `usuari_id` INT NULL,
  PRIMARY KEY (`canal_id`),
  INDEX `usuari_id_idx` (`usuari_id` ASC),
  CONSTRAINT `usuari_id`
    FOREIGN KEY (`usuari_id`)
    REFERENCES `youtube`.`usuari` (`usuari_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `youtube`.`comentari` (
  `comentari_id` INT NOT NULL,
  `text` VARCHAR(500) NULL,
  `publicacio` DATETIME NULL,
  `usuari_id` INT NULL,
  `video_id` INT NULL,
  PRIMARY KEY (`comentari_id`),
  INDEX `usuari_id_idx` (`usuari_id` ASC),
  INDEX `video_id_idx` (`video_id` ASC),
  CONSTRAINT `us_id`
    FOREIGN KEY (`usuari_id`)
    REFERENCES `youtube`.`usuari` (`usuari_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `video_id`
    FOREIGN KEY (`video_id`)
    REFERENCES `youtube`.`video` (`video_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `youtube`.`etiqueta` (
  `etiqueta_id` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  PRIMARY KEY (`etiqueta_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `youtube`.`LikesDislikes` (
  `usuari_id` INT NULL,
  `video_id` INT NULL,
  `data_hora` DATETIME NULL,
  `isLike` TINYINT(1) NULL,
  INDEX `video_id_idx` (`video_id` ASC),
  CONSTRAINT `usu_id`
    FOREIGN KEY (`usuari_id`)
    REFERENCES `youtube`.`usuari` (`usuari_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `vi_id`
    FOREIGN KEY (`video_id`)
    REFERENCES `youtube`.`video` (`video_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `youtube`.`LikesDislikesComentari` (
  `usuari_id` INT NULL,
  `comentari_id` INT NULL,
  `data_hora` DATETIME NULL,
  `isLike` TINYINT(1) NULL,
  INDEX `comentari_id_idx` (`comentari_id` ASC),
  CONSTRAINT `usua_id`
    FOREIGN KEY (`usuari_id`)
    REFERENCES `youtube`.`usuari` (`usuari_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `comentari_id`
    FOREIGN KEY (`comentari_id`)
    REFERENCES `youtube`.`comentari` (`comentari_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `youtube`.`playlist` (
  `playlist_id` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  `data_creacio` DATE NULL,
  `estat` ENUM('privat', 'public') NULL,
  `usuari_id` INT NULL,
  PRIMARY KEY (`playlist_id`),
  INDEX `usuari_id_idx` (`usuari_id` ASC),
  CONSTRAINT `usuari_num_id`
    FOREIGN KEY (`usuari_id`)
    REFERENCES `youtube`.`usuari` (`usuari_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



