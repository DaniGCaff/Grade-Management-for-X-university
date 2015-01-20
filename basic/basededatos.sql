SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `competencias` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `competencias` ;

-- -----------------------------------------------------
-- Table `competencias`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `competencias`.`usuario` (
  `idusuario` INT NOT NULL,
  PRIMARY KEY (`idusuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `competencias`.`centro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `competencias`.`centro` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `localizacion` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `competencias`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `competencias`.`usuario` (
  `idusuario` INT NOT NULL,
  PRIMARY KEY (`idusuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `competencias`.`alumno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `competencias`.`alumno` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `centro_idcentro` INT NOT NULL,
  `usuario_idusuario` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_alumno_centro1_idx` (`centro_idcentro` ASC),
  INDEX `fk_alumno_usuario1_idx` (`usuario_idusuario` ASC),
  CONSTRAINT `fk_alumno_centro1`
    FOREIGN KEY (`centro_idcentro`)
    REFERENCES `competencias`.`centro` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_alumno_usuario1`
    FOREIGN KEY (`usuario_idusuario`)
    REFERENCES `competencias`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `competencias`.`pdi`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `competencias`.`pdi` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `centro_idcentro` INT NOT NULL,
  `usuario_idusuario` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pdi_centro1_idx` (`centro_idcentro` ASC),
  INDEX `fk_pdi_usuario_especial1_idx` (`usuario_idusuario` ASC),
  CONSTRAINT `fk_pdi_centro1`
    FOREIGN KEY (`centro_idcentro`)
    REFERENCES `competencias`.`centro` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pdi_usuario_especial1`
    FOREIGN KEY (`usuario_idusuario`)
    REFERENCES `competencias`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `competencias`.`pas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `competencias`.`pas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `centro_idcentro` INT NOT NULL,
  `usuario_idusuario` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pas_centro_idx` (`centro_idcentro` ASC),
  INDEX `fk_pas_usuario_especial1_idx` (`usuario_idusuario` ASC),
  CONSTRAINT `fk_pas_centro`
    FOREIGN KEY (`centro_idcentro`)
    REFERENCES `competencias`.`centro` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pas_usuario_especial1`
    FOREIGN KEY (`usuario_idusuario`)
    REFERENCES `competencias`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `competencias`.`grado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `competencias`.`grado` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `centro_idcentro` INT NOT NULL,
  `nombre_grado` VARCHAR(45) NULL,
  `plan_estudio` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_grado_centro1_idx` (`centro_idcentro` ASC),
  CONSTRAINT `fk_grado_centro1`
    FOREIGN KEY (`centro_idcentro`)
    REFERENCES `competencias`.`centro` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `competencias`.`asignatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `competencias`.`asignatura` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `grado_idgrado` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_asignatura_grado1_idx` (`grado_idgrado` ASC),
  CONSTRAINT `fk_asignatura_grado1`
    FOREIGN KEY (`grado_idgrado`)
    REFERENCES `competencias`.`grado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `competencias`.`competencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `competencias`.`competencia` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `descripcion` LONGTEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `competencias`.`calificacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `competencias`.`calificacion` (
  `alumno_idalumno` INT NOT NULL,
  `competencia_idcompetencia` INT NOT NULL,
  `nota` INT NULL,
  INDEX `fk_alumno_has_competencia_competencia1_idx` (`competencia_idcompetencia` ASC),
  INDEX `fk_alumno_has_competencia_alumno1_idx` (`alumno_idalumno` ASC),
  CONSTRAINT `fk_alumno_has_competencia_alumno1`
    FOREIGN KEY (`alumno_idalumno`)
    REFERENCES `competencias`.`alumno` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_alumno_has_competencia_competencia1`
    FOREIGN KEY (`competencia_idcompetencia`)
    REFERENCES `competencias`.`competencia` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `competencias`.`asignatura_has_competencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `competencias`.`asignatura_has_competencia` (
  `asignatura_idasignatura` INT NOT NULL,
  `competencia_idcompetencia` INT NOT NULL,
  INDEX `fk_asignatura_has_competencia_competencia1_idx` (`competencia_idcompetencia` ASC),
  INDEX `fk_asignatura_has_competencia_asignatura1_idx` (`asignatura_idasignatura` ASC),
  CONSTRAINT `fk_asignatura_has_competencia_asignatura1`
    FOREIGN KEY (`asignatura_idasignatura`)
    REFERENCES `competencias`.`asignatura` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_asignatura_has_competencia_competencia1`
    FOREIGN KEY (`competencia_idcompetencia`)
    REFERENCES `competencias`.`competencia` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `competencias`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `competencias`.`usuario` (
  `idusuario` INT NOT NULL,
  PRIMARY KEY (`idusuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `competencias`.`grado_has_alumno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `competencias`.`grado_has_alumno` (
  `grado_idgrado` INT NOT NULL,
  `alumno_idalumno` INT NOT NULL,
  INDEX `fk_grado_has_alumno_alumno1_idx` (`alumno_idalumno` ASC),
  INDEX `fk_grado_has_alumno_grado1_idx` (`grado_idgrado` ASC),
  CONSTRAINT `fk_grado_has_alumno_grado1`
    FOREIGN KEY (`grado_idgrado`)
    REFERENCES `competencias`.`grado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_grado_has_alumno_alumno1`
    FOREIGN KEY (`alumno_idalumno`)
    REFERENCES `competencias`.`alumno` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
