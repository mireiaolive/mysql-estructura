CREATE SCHEMA IF NOT EXISTS `youtube` DEFAULT CHARACTER SET utf8;

-- create table usuari --
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

-- create table video --
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

-- create table subscriure --
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

-- create table canal --
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

-- create table comentari --
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

-- create table etiqueta --
CREATE TABLE IF NOT EXISTS `youtube`.`etiqueta` (
  `etiqueta_id` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  PRIMARY KEY (`etiqueta_id`))
ENGINE = InnoDB;

-- create table LikesDislikes --
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

-- create table LikesDislikesComentari --
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

-- create table playlist --
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

-- create table etiqueta_video --
CREATE TABLE IF NOT EXISTS `youtube`.`etiqueta_video` (
  `etiqueta_id` INT NULL COMMENT '',
  `video_id` INT NULL COMMENT '',
  INDEX `FK_video_ev_idx` (`video_id` ASC)  COMMENT '',
  INDEX `FK_etiqueta_ev_idx` (`etiqueta_id` ASC)  COMMENT '',
  CONSTRAINT `FK_video_ev`
    FOREIGN KEY (`video_id`)
    REFERENCES `youtube`.`video` (`video_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_etiqueta_ev`
    FOREIGN KEY (`etiqueta_id`)
    REFERENCES `youtube`.`etiqueta` (`etiqueta_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- create data to canal --
INSERT INTO `youtube`.`canal` (`canal_id`, `nom`, `descripcio`, `publicacio`, `usuari_id`) VALUES (1, 'Hits de los 80', 'Las 100 mejores canciones de los 80 ?? Eurythmics - Sweet Dreams (Are made of this) (1983) ?? Yazz - The only way is up (1988) ', '2022-01-12', 1);
INSERT INTO `youtube`.`canal` (`canal_id`, `nom`, `descripcio`, `publicacio`, `usuari_id`) VALUES (2, 'Yoga', 'Los mejores canales de Youtube para hacer yoga: Xuan Lan yoga. Si consigui?? ense??arle a hacer asanas a las triunfitos qu?? no conseguir?? contigo', '2022-01-14', 2);
INSERT INTO `youtube`.`canal` (`canal_id`, `nom`, `descripcio`, `publicacio`, `usuari_id`) VALUES (3, 'Cocina', 'Las mejores recetas y video recetas de cocina, cocineros y programas de televisi??n .', '2022-08-12', 3);
INSERT INTO `youtube`.`canal` (`canal_id`, `nom`, `descripcio`, `publicacio`, `usuari_id`) VALUES (4, 'Arte', 'ARTE en espa??ol - Gratis, en espa??ol, una selecci??n del canal cultural europeo ARTE ?? Andr?? Malraux ?? Highlights ?? Grandes vidas, grandes obras ?? L??neas torcidas.', '2022-11-12', 4);
INSERT INTO `youtube`.`canal` (`canal_id`, `nom`, `descripcio`, `publicacio`, `usuari_id`) VALUES (5, 'Cine', 'No te pierdas el cine de estreno directo de la sala de cine a tu casa en Movistar Estrenos y los canales dedicados en exclusiva al cine de todos los g??nero.', '2022-01-30', 5);
INSERT INTO `youtube`.`canal` (`canal_id`, `nom`, `descripcio`, `publicacio`, `usuari_id`) VALUES (6, 'Teatro', 'Entradas de espect??culos y teatro en Madrid desde 12???: danza, m??sica cl??sica, ??pera, teatro, zarzuela y m??s de 80 espect??culos diferentes cada a??o.', '2022-05-12', 6);
INSERT INTO `youtube`.`canal` (`canal_id`, `nom`, `descripcio`, `publicacio`, `usuari_id`) VALUES (7, 'Aprende ingles', 'Principiantes ?? Speak English With Mr. Duncan ?? Easy English ?? BBC Learning English ?? Jennifer ESL.', '2022-06-12', 6);

-- create data to comentari --
INSERT INTO `youtube`.`comentari` (`comentari_id`, `text`, `publicacio`, `usuari_id`, `video_id`) VALUES (2, 'que pena, me das tu telefono?', '2023-01-02 09:04:10', 2, 2);
INSERT INTO `youtube`.`comentari` (`comentari_id`, `text`, `publicacio`, `usuari_id`, `video_id`) VALUES (3, 'el mejor de los videos', '2022-12-09 09:04:19', 3, 3);
INSERT INTO `youtube`.`comentari` (`comentari_id`, `text`, `publicacio`, `usuari_id`, `video_id`) VALUES (4, 'no me gusto demasiado', '2023-01-06 09:04:32', 4, 4);
INSERT INTO `youtube`.`comentari` (`comentari_id`, `text`, `publicacio`, `usuari_id`, `video_id`) VALUES (5, 'menuda master class', '2023-01-11 09:04:42', 5, 5);
INSERT INTO `youtube`.`comentari` (`comentari_id`, `text`, `publicacio`, `usuari_id`, `video_id`) VALUES (6, 'on repeat toda la semana!', '2023-01-04 09:04:47', 6, 6);

-- create data to etiqueta --
INSERT INTO `youtube`.`etiqueta` (`etiqueta_id`, `nom`) VALUES (1, 'musica');
INSERT INTO `youtube`.`etiqueta` (`etiqueta_id`, `nom`) VALUES (2, 'cine');
INSERT INTO `youtube`.`etiqueta` (`etiqueta_id`, `nom`) VALUES (3, 'arte');
INSERT INTO `youtube`.`etiqueta` (`etiqueta_id`, `nom`) VALUES (4, 'deporte');
INSERT INTO `youtube`.`etiqueta` (`etiqueta_id`, `nom`) VALUES (5, 'fotografia');
INSERT INTO `youtube`.`etiqueta` (`etiqueta_id`, `nom`) VALUES (6, 'vacaciones');
INSERT INTO `youtube`.`etiqueta` (`etiqueta_id`, `nom`) VALUES (7, 'documental');
INSERT INTO `youtube`.`etiqueta` (`etiqueta_id`, `nom`) VALUES (8, 'historia');
INSERT INTO `youtube`.`etiqueta` (`etiqueta_id`, `nom`) VALUES (9, 'michael jackson');
INSERT INTO `youtube`.`etiqueta` (`etiqueta_id`, `nom`) VALUES (10, 'queen');

-- create data to LikesDislikes --
INSERT INTO `youtube`.`LikesDislikes` (`usuari_id`, `video_id`, `data_hora`, `isLike`) VALUES (1, 1, '2023-01-11 09:08:48', true);
INSERT INTO `youtube`.`LikesDislikes` (`usuari_id`, `video_id`, `data_hora`, `isLike`) VALUES (2, 2, '2022-11-10 09:09:51', true);
INSERT INTO `youtube`.`LikesDislikes` (`usuari_id`, `video_id`, `data_hora`, `isLike`) VALUES (3, 3, '2023-01-04 09:09:46', true);
INSERT INTO `youtube`.`LikesDislikes` (`usuari_id`, `video_id`, `data_hora`, `isLike`) VALUES (4, 4, '2022-12-14 09:09:40', false);
INSERT INTO `youtube`.`LikesDislikes` (`usuari_id`, `video_id`, `data_hora`, `isLike`) VALUES (5, 5, '2023-01-03 09:09:34', false);
INSERT INTO `youtube`.`LikesDislikes` (`usuari_id`, `video_id`, `data_hora`, `isLike`) VALUES (6, 6, '2022-12-14 09:09:29', true);
INSERT INTO `youtube`.`LikesDislikes` (`usuari_id`, `video_id`, `data_hora`, `isLike`) VALUES (7, 7, '2022-12-07 09:09:22', true);
INSERT INTO `youtube`.`LikesDislikes` (`usuari_id`, `video_id`, `data_hora`, `isLike`) VALUES (8, 8, '2022-11-17 09:09:15', true);
INSERT INTO `youtube`.`LikesDislikes` (`usuari_id`, `video_id`, `data_hora`, `isLike`) VALUES (9, 9, '2023-01-12 09:09:10', true);
INSERT INTO `youtube`.`LikesDislikes` (`usuari_id`, `video_id`, `data_hora`, `isLike`) VALUES (10, 10, '2023-01-22 09:09:02', true);

-- create data to LikesDislikesComentari --
INSERT INTO `youtube`.`LikesDislikesComentari` (`usuari_id`, `comentari_id`, `data_hora`, `isLike`) VALUES (1, 1, '2023-01-04 09:12:42', true);
INSERT INTO `youtube`.`LikesDislikesComentari` (`usuari_id`, `comentari_id`, `data_hora`, `isLike`) VALUES (1, 2, '2023-01-20 09:12:53', true);
INSERT INTO `youtube`.`LikesDislikesComentari` (`usuari_id`, `comentari_id`, `data_hora`, `isLike`) VALUES (2, 3, '2023-01-28 09:13:00', true);
INSERT INTO `youtube`.`LikesDislikesComentari` (`usuari_id`, `comentari_id`, `data_hora`, `isLike`) VALUES (3, 4, '2023-01-29 09:13:07', true);
INSERT INTO `youtube`.`LikesDislikesComentari` (`usuari_id`, `comentari_id`, `data_hora`, `isLike`) VALUES (4, 5, '2023-01-31 09:13:14', true);
INSERT INTO `youtube`.`LikesDislikesComentari` (`usuari_id`, `comentari_id`, `data_hora`, `isLike`) VALUES (5, 6, '2023-01-29 09:13:21', true);
INSERT INTO `youtube`.`LikesDislikesComentari` (`usuari_id`, `comentari_id`, `data_hora`, `isLike`) VALUES (2, 3, '2023-01-28 09:13:00', true);

-- create data to playlist --
INSERT INTO `youtube`.`playlist` (`playlist_id`, `nom`, `data_creacio`, `estat`, `usuari_id`) VALUES (1, 'Olimpiadas', '2023-01-19', 'privat', 1);
INSERT INTO `youtube`.`playlist` (`playlist_id`, `nom`, `data_creacio`, `estat`, `usuari_id`) VALUES (2, 'Oscars', '2023-01-17', 'public', 2);
INSERT INTO `youtube`.`playlist` (`playlist_id`, `nom`, `data_creacio`, `estat`, `usuari_id`) VALUES (3, 'Humor amarillo', '2023-01-01', 'privat', 3);
INSERT INTO `youtube`.`playlist` (`playlist_id`, `nom`, `data_creacio`, `estat`, `usuari_id`) VALUES (4, 'Mejores momentos del tenis', '2023-01-09', 'public', 4);
INSERT INTO `youtube`.`playlist` (`playlist_id`, `nom`, `data_creacio`, `estat`, `usuari_id`) VALUES (5, 'Julio Iglesias', '2023-01-11', 'privat', 5);

-- create data to subscriure --
INSERT INTO `youtube`.`subscriure` (`subscriure_id`, `canal_id`, `usuari_id`) VALUES (1, 1, 1);
INSERT INTO `youtube`.`subscriure` (`subscriure_id`, `canal_id`, `usuari_id`) VALUES (2, 2, 2);
INSERT INTO `youtube`.`subscriure` (`subscriure_id`, `canal_id`, `usuari_id`) VALUES (3, 3, 3);
INSERT INTO `youtube`.`subscriure` (`subscriure_id`, `canal_id`, `usuari_id`) VALUES (4, 4, 4);
INSERT INTO `youtube`.`subscriure` (`subscriure_id`, `canal_id`, `usuari_id`) VALUES (5, 5, 5);
INSERT INTO `youtube`.`subscriure` (`subscriure_id`, `canal_id`, `usuari_id`) VALUES (6, 6, 6);
INSERT INTO `youtube`.`subscriure` (`subscriure_id`, `canal_id`, `usuari_id`) VALUES (7, 7, 7);

-- create data to usuari --
INSERT INTO `youtube`.`usuari` (`usuari_id`, `email`, `password`, `nom`, `bday`, `sexe`, `pais`, `codi_postal`) VALUES (1, 'a.a@hotmail.com', '645^ZsDXMG2O', 'Adela Arjona', '1980-02-02', 'dona', 'Espanya', '08995');
INSERT INTO `youtube`.`usuari` (`usuari_id`, `email`, `password`, `nom`, `bday`, `sexe`, `pais`, `codi_postal`) VALUES (2, 'a.alvir@hotmail.com', '6fbR9LBGVu&S@fKB', '??lvaro Vegas ', '1982-02-01', 'home', 'Espanya', '08996');
INSERT INTO `youtube`.`usuari` (`usuari_id`, `email`, `password`, `nom`, `bday`, `sexe`, `pais`, `codi_postal`) VALUES (3, 'a.mayo@hotmail.com', '8ogH%k354jpeEJwv', 'Andres Mayo ', '1999-04-02', 'home', 'Espanya', '09445');
INSERT INTO `youtube`.`usuari` (`usuari_id`, `email`, `password`, `nom`, `bday`, `sexe`, `pais`, `codi_postal`) VALUES (4, 'marialuisa.a@hotmail.com', 'Fw4v#j6E7q3d%njD', 'Maria-Luisa Casta??eda ', '1985-06-02', 'dona', 'Uruguay', '04456');
INSERT INTO `youtube`.`usuari` (`usuari_id`, `email`, `password`, `nom`, `bday`, `sexe`, `pais`, `codi_postal`) VALUES (5, 'sebastian.a@hotmail.com', '5%GgL6L!FNwc6RK9', 'Sebastiana Vergara ', '1999-02-09', 'home', 'Argentina', '00045');
INSERT INTO `youtube`.`usuari` (`usuari_id`, `email`, `password`, `nom`, `bday`, `sexe`, `pais`, `codi_postal`) VALUES (6, 'arancha.a@hotmail.com', '!onUpRsfREFGLU9%', 'Arancha Figueroa ', '2000-02-02', 'dona', 'Islas Baleares', '03445');
INSERT INTO `youtube`.`usuari` (`usuari_id`, `email`, `password`, `nom`, `bday`, `sexe`, `pais`, `codi_postal`) VALUES (7, 'adela.a@hotmail.com', 'vPKYd!FJAFxm5$zG', 'Adela Barroso ', '1989-03-02', 'dona', 'Venezuela', '09556');
INSERT INTO `youtube`.`usuari` (`usuari_id`, `email`, `password`, `nom`, `bday`, `sexe`, `pais`, `codi_postal`) VALUES (8, 'sheila@hotmail.com', 'v%@rYS!HHZFV9BX%', 'Sheila Camacho ', '1981-02-20', 'dona', 'Espanya', '08006');
INSERT INTO `youtube`.`usuari` (`usuari_id`, `email`, `password`, `nom`, `bday`, `sexe`, `pais`, `codi_postal`) VALUES (9, 'dina.peralititass@hotmail.com', 'c$jB88uXSka5y%74', 'Dina Peralta', '1987-09-10', 'dona', 'Chile', '08774');
INSERT INTO `youtube`.`usuari` (`usuari_id`, `email`, `password`, `nom`, `bday`, `sexe`, `pais`, `codi_postal`) VALUES (10, 'adelita45@hotmail.com', 'vPKYd!FJAFxm5$zG', 'Adela Barroso ', '1989-03-02', 'dona', 'Venezuela', '08980');


-- create data to video --
INSERT INTO `youtube`.`video` (`video_id`, `titol`, `descripcio`, `grandaria`, `nom`, `durada`, `reproduciones`, `likes`, `dislikes`, `estat`, `etiqueta_id`, `publicacio`, `usuari_id`) VALUES (1, 'Michael Jackson', 'Michael Joseph Jackson (Gary, Indiana, 29 de agosto de 1958-Los ??ngeles, 25 de junio de 2009)??? fue un cantante, compositor.', '8K', '1.mp4', '05:55', 40, 30, 1, 'ocult', 1, '2023-01-18 09:49:43', 1);
INSERT INTO `youtube`.`video` (`video_id`, `titol`, `descripcio`, `grandaria`, `nom`, `durada`, `reproduciones`, `likes`, `dislikes`, `estat`, `etiqueta_id`, `publicacio`, `usuari_id`) VALUES (2, 'Final Roland Garros', 'La final masculina de Roland Garros 2022 se celebrar?? el domingo 5 de junio en la pista Philippe Chatrier de Par??s.', '2K', '2.mp4', '04:35', 50, 23, 5, 'public', 2, '2023-01-18 09:49:43', 2);
INSERT INTO `youtube`.`video` (`video_id`, `titol`, `descripcio`, `grandaria`, `nom`, `durada`, `reproduciones`, `likes`, `dislikes`, `estat`, `etiqueta_id`, `publicacio`, `usuari_id`) VALUES (3, 'Marta haciendo el pino', 'marta del pino. @delpinoprensa. hago prensa, leo y no me importa tener raz??n mardepinos@gmail.com. Buenos Aires, Argentina Joined May 2012.', '4K', '3.mp4', '00:59', 230, 44, 3, 'privat', 1, '2023-01-18 09:49:43', 3);
INSERT INTO `youtube`.`video` (`video_id`, `titol`, `descripcio`, `grandaria`, `nom`, `durada`, `reproduciones`, `likes`, `dislikes`, `estat`, `etiqueta_id`, `publicacio`, `usuari_id`) VALUES (4, 'Hello from the moon', 'Listen to Hello from the Moon on Spotify. Pat Buchanan ?? Song ?? 2020.', '2K', '4.mp4', '05:45', 33445, 50, 4, 'public', 1, '2023-01-18 09:49:43', 4);
INSERT INTO `youtube`.`video` (`video_id`, `titol`, `descripcio`, `grandaria`, `nom`, `durada`, `reproduciones`, `likes`, `dislikes`, `estat`, `etiqueta_id`, `publicacio`, `usuari_id`) VALUES (5, 'Billie Holiday las quiero ya', 'Billie Holiday - All Of You (Letras y canci??n para escuchar) - I love the look(s) of you, (and) the lure of you / The sweet of you, and the pure of yo..', '2K', '5.mp4', '02:45', 567, 22, 5, 'public', 4, '2023-01-18 09:49:43', 5);
INSERT INTO `youtube`.`video` (`video_id`, `titol`, `descripcio`, `grandaria`, `nom`, `durada`, `reproduciones`, `likes`, `dislikes`, `estat`, `etiqueta_id`, `publicacio`, `usuari_id`) VALUES (6, 'Patti Smith', 'Patricia Lee ??Patti?? Smith es una cantante, artista visual y escritora estadounidense. Apodada habitualmente ??la madrina del punk??, ??? Smith salt?? a la fama durante.', '8K', '6.mp4', '05:74', 123, 2234, 7, 'public', 3, '2023-01-18 09:49:43', 6);
INSERT INTO `youtube`.`video` (`video_id`, `titol`, `descripcio`, `grandaria`, `nom`, `durada`, `reproduciones`, `likes`, `dislikes`, `estat`, `etiqueta_id`, `publicacio`, `usuari_id`) VALUES (7, 'Geroge Michael boyfriend', 'enny Goss was Michael\'s partner for 13 years. Although not together at the time of the singer\'s death in 2016, he had always maintained that Michael had financially supported him.', '4K', '7.mp4', '05:77', 111, 44, 0, 'public', 1, '2023-01-18 09:49:43', 7);
INSERT INTO `youtube`.`video` (`video_id`, `titol`, `descripcio`, `grandaria`, `nom`, `durada`, `reproduciones`, `likes`, `dislikes`, `estat`, `etiqueta_id`, `publicacio`, `usuari_id`) VALUES (8, 'Tina Turner', 'Anna Mae Bullock (Brownsville, Tennessee; 26 de noviembre de 1939), m??s conocida como Tina Turner, es una cantante, compositora, bailarina, actriz.', '8K', '8.mp4', '02:55', 678, 67, 1, 'privat', 2, '2023-01-18 09:49:43', 8);
INSERT INTO `youtube`.`video` (`video_id`, `titol`, `descripcio`, `grandaria`, `nom`, `durada`, `reproduciones`, `likes`, `dislikes`, `estat`, `etiqueta_id`, `publicacio`, `usuari_id`) VALUES (9, 'Swimming in Hawai', 'Hawaii doesn\'t just boast swimming spots right off its sunny shores: a number of baths and pools are spread across the islands.', '4K', '9.mp4', '05:99', 899, 88, 2, 'ocult', 2, '2023-01-18 09:49:43', 9);
INSERT INTO `youtube`.`video` (`video_id`, `titol`, `descripcio`, `grandaria`, `nom`, `durada`, `reproduciones`, `likes`, `dislikes`, `estat`, `etiqueta_id`, `publicacio`, `usuari_id`) VALUES (10, 'El coche fantastico', 'Knight Rider (conocida como El coche fant??stico en Espa??a, El auto incre??ble en M??xico y El auto fant??stico en el resto de Hispanoam??rica) fue una serie.', '4K', '10.mp4', '09:55', 23456, 98, 3, 'privat', 3, '2023-01-18 09:49:43', 10);

-- create data to etiqueta-video --
INSERT INTO `youtube`.`etiqueta_video` (`etiqueta_id`, `video_id`) VALUES (1, 1);
INSERT INTO `youtube`.`etiqueta_video` (`etiqueta_id`, `video_id`) VALUES (2, 2);
INSERT INTO `youtube`.`etiqueta_video` (`etiqueta_id`, `video_id`) VALUES (3, 3);
INSERT INTO `youtube`.`etiqueta_video` (`etiqueta_id`, `video_id`) VALUES (4, 4);
INSERT INTO `youtube`.`etiqueta_video` (`etiqueta_id`, `video_id`) VALUES (5, 5);