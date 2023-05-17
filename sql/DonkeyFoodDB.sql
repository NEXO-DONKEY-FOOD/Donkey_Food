-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema DonkeyFoodDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema DonkeyFoodDB
-- -----------------------------------------------------


CREATE SCHEMA IF NOT EXISTS `DonkeyFoodDB` DEFAULT CHARACTER SET utf8 ;
USE `DonkeyFoodDB` ;

-- -----------------------------------------------------
-- Table `DonkeyFoodDB`.`Dueño`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DonkeyFoodDB`.`Dueño` (
  `idDño` INT NOT NULL AUTO_INCREMENT,
  `NomDñp` VARCHAR(45) NOT NULL,
  `APatDño` VARCHAR(45) NOT NULL,
  `AMatDño` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDño`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DonkeyFoodDB`.`Cafeteria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DonkeyFoodDB`.`Cafeteria` (
  `idCaf` INT NOT NULL AUTO_INCREMENT,
  `NomCaf` VARCHAR(100) NOT NULL,
  `Dueño_idDño` INT NOT NULL,
  PRIMARY KEY (`idCaf`),
  INDEX `fk_Cafeteria_Dueño1_idx` (`Dueño_idDño` ASC) VISIBLE,
  CONSTRAINT `fk_Cafeteria_Dueño1`
    FOREIGN KEY (`Dueño_idDño`)
    REFERENCES `DonkeyFoodDB`.`Dueño` (`idDño`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DonkeyFoodDB`.`Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DonkeyFoodDB`.`Empleado` (
  `idEmp` INT NOT NULL AUTO_INCREMENT,
  `NomEmp` VARCHAR(45) NOT NULL,
  `PassEmp` VARCHAR(45) NOT NULL,
  `CodEmp` VARCHAR(45) NOT NULL,
  `CorrEmp` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEmp`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DonkeyFoodDB`.`Caf_Emp`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DonkeyFoodDB`.`Caf_Emp` (
  `idCaf_Emp` INT NOT NULL AUTO_INCREMENT,
  `Cafeteria_idCaf` INT NOT NULL,
  `Empleado_idEmp` INT NOT NULL,
  PRIMARY KEY (`idCaf_Emp`),
  INDEX `fk_Caf_Emp_Cafeteria_idx` (`Cafeteria_idCaf` ASC) VISIBLE,
  INDEX `fk_Caf_Emp_Empleado1_idx` (`Empleado_idEmp` ASC) VISIBLE,
  CONSTRAINT `fk_Caf_Emp_Cafeteria`
    FOREIGN KEY (`Cafeteria_idCaf`)
    REFERENCES `DonkeyFoodDB`.`Cafeteria` (`idCaf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Caf_Emp_Empleado1`
    FOREIGN KEY (`Empleado_idEmp`)
    REFERENCES `DonkeyFoodDB`.`Empleado` (`idEmp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DonkeyFoodDB`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DonkeyFoodDB`.`Cliente` (
  `idClient` INT NOT NULL AUTO_INCREMENT,
  `AliClient` VARCHAR(45) NOT NULL,
  `CorrClient` VARCHAR(100) NOT NULL,
  `PassClient` VARCHAR(45) NOT NULL,
  `UrlClient` VARCHAR(200) NULL,
  PRIMARY KEY (`idClient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DonkeyFoodDB`.`Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DonkeyFoodDB`.`Producto` (
  `idProd` INT NOT NULL AUTO_INCREMENT,
  `NomProd` VARCHAR(100) NOT NULL,
  `Cafeteria_idCaf` INT NOT NULL,
  PRIMARY KEY (`idProd`),
  INDEX `fk_Producto_Cafeteria1_idx` (`Cafeteria_idCaf` ASC) VISIBLE,
  CONSTRAINT `fk_Producto_Cafeteria1`
    FOREIGN KEY (`Cafeteria_idCaf`)
    REFERENCES `DonkeyFoodDB`.`Cafeteria` (`idCaf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DonkeyFoodDB`.`Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DonkeyFoodDB`.`Pedido` (
  `idPed` INT NOT NULL AUTO_INCREMENT,
  `TotPed` INT NOT NULL,
  `FecIniPed` DATE NOT NULL,
  `FecFinPed` DATE NOT NULL,
  `Cliente_idClient` INT NOT NULL,
  `Cafeteria_idCaf` INT NOT NULL,
  PRIMARY KEY (`idPed`),
  INDEX `fk_Pedido_Usuario1_idx` (`Cliente_idClient` ASC) VISIBLE,
  INDEX `fk_Pedido_Cafeteria1_idx` (`Cafeteria_idCaf` ASC) VISIBLE,
  CONSTRAINT `fk_Pedido_Usuario1`
    FOREIGN KEY (`Cliente_idClient`)
    REFERENCES `DonkeyFoodDB`.`Cliente` (`idClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Cafeteria1`
    FOREIGN KEY (`Cafeteria_idCaf`)
    REFERENCES `DonkeyFoodDB`.`Cafeteria` (`idCaf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DonkeyFoodDB`.`DetalProd`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DonkeyFoodDB`.`DetalProd` (
  `idDetalProd` INT NOT NULL AUTO_INCREMENT,
  `Producto_idProd` INT NOT NULL,
  `TipoProd` VARCHAR(45) NOT NULL,
  `CantProd` INT NOT NULL,
  `TamañoProd` VARCHAR(45) NOT NULL,
  `DesProd` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idDetalProd`),
  INDEX `fk_DetalProd_Producto1_idx` (`Producto_idProd` ASC) VISIBLE,
  CONSTRAINT `fk_DetalProd_Producto1`
    FOREIGN KEY (`Producto_idProd`)
    REFERENCES `DonkeyFoodDB`.`Producto` (`idProd`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DonkeyFoodDB`.`Complemento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DonkeyFoodDB`.`Complemento` (
  `idComp` INT NOT NULL AUTO_INCREMENT,
  `NomComp` VARCHAR(45) NOT NULL,
  `CantComp` VARCHAR(45) NULL,
  PRIMARY KEY (`idComp`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DonkeyFoodDB`.`ListCompPed`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DonkeyFoodDB`.`ListCompPed` (
  `idListCompPed` INT NOT NULL AUTO_INCREMENT,
  `Complemento_idComp` INT NOT NULL,
  PRIMARY KEY (`idListCompPed`),
  INDEX `fk_ListCompPed_Complemento1_idx` (`Complemento_idComp` ASC) VISIBLE,
  CONSTRAINT `fk_ListCompPed_Complemento1`
    FOREIGN KEY (`Complemento_idComp`)
    REFERENCES `DonkeyFoodDB`.`Complemento` (`idComp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DonkeyFoodDB`.`ListIdComp`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DonkeyFoodDB`.`ListIdComp` (
  `idListIdComp` INT NOT NULL AUTO_INCREMENT,
  `ListCompPed_idListCompPed` INT NOT NULL,
  PRIMARY KEY (`idListIdComp`),
  INDEX `fk_ListIdComp_ListCompPed1_idx` (`ListCompPed_idListCompPed` ASC) VISIBLE,
  CONSTRAINT `fk_ListIdComp_ListCompPed1`
    FOREIGN KEY (`ListCompPed_idListCompPed`)
    REFERENCES `DonkeyFoodDB`.`ListCompPed` (`idListCompPed`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DonkeyFoodDB`.`Especificacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DonkeyFoodDB`.`Especificacion` (
  `idEspc` INT NOT NULL AUTO_INCREMENT,
  `ListIdComp_idListIdComp` INT NOT NULL,
  PRIMARY KEY (`idEspc`),
  INDEX `fk_Especificacion_ListIdComp1_idx` (`ListIdComp_idListIdComp` ASC) VISIBLE,
  CONSTRAINT `fk_Especificacion_ListIdComp1`
    FOREIGN KEY (`ListIdComp_idListIdComp`)
    REFERENCES `DonkeyFoodDB`.`ListIdComp` (`idListIdComp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DonkeyFoodDB`.`ListaPed`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DonkeyFoodDB`.`ListaPed` (
  `idListaPed` INT NOT NULL AUTO_INCREMENT,
  `Producto_idProd` INT NOT NULL,
  `DetalProd_id` INT NOT NULL,
  `ListaPedCant` INT NOT NULL,
  `Especificacion_idEspc` INT NOT NULL,
  PRIMARY KEY (`idListaPed`),
  INDEX `fk_ListaPed_DetalProd1_idx` (`DetalProd_id` ASC) VISIBLE,
  INDEX `fk_ListaPed_Producto1_idx` (`Producto_idProd` ASC) VISIBLE,
  INDEX `fk_ListaPed_Especificacion1_idx` (`Especificacion_idEspc` ASC) VISIBLE,
  CONSTRAINT `fk_ListaPed_DetalProd1`
    FOREIGN KEY (`DetalProd_id`)
    REFERENCES `DonkeyFoodDB`.`DetalProd` (`idDetalProd`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ListaPed_Producto1`
    FOREIGN KEY (`Producto_idProd`)
    REFERENCES `DonkeyFoodDB`.`Producto` (`idProd`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ListaPed_Especificacion1`
    FOREIGN KEY (`Especificacion_idEspc`)
    REFERENCES `DonkeyFoodDB`.`Especificacion` (`idEspc`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DonkeyFoodDB`.`ListIdPed_Ped`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DonkeyFoodDB`.`ListIdPed_Ped` (
  `idListIdPed_Ped` INT NOT NULL AUTO_INCREMENT,
  `ListaPed_idListaPed` INT NOT NULL,
  PRIMARY KEY (`idListIdPed_Ped`),
  INDEX `fk_ListIdPed_Ped_ListaPed1_idx` (`ListaPed_idListaPed` ASC) VISIBLE,
  CONSTRAINT `fk_ListIdPed_Ped_ListaPed1`
    FOREIGN KEY (`ListaPed_idListaPed`)
    REFERENCES `DonkeyFoodDB`.`ListaPed` (`idListaPed`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DonkeyFoodDB`.`ListPed_Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DonkeyFoodDB`.`ListPed_Pedido` (
  `idListPed_Pedido` INT NOT NULL AUTO_INCREMENT,
  `Pedido_idPed` INT NOT NULL,
  `ListIdPed_Ped_idListIdPed_Ped` INT NOT NULL,
  PRIMARY KEY (`idListPed_Pedido`),
  INDEX `fk_ListPed_Pedido_Pedido1_idx` (`Pedido_idPed` ASC) VISIBLE,
  INDEX `fk_ListPed_Pedido_ListIdPed_Ped1_idx` (`ListIdPed_Ped_idListIdPed_Ped` ASC) VISIBLE,
  CONSTRAINT `fk_ListPed_Pedido_Pedido1`
    FOREIGN KEY (`Pedido_idPed`)
    REFERENCES `DonkeyFoodDB`.`Pedido` (`idPed`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ListPed_Pedido_ListIdPed_Ped1`
    FOREIGN KEY (`ListIdPed_Ped_idListIdPed_Ped`)
    REFERENCES `DonkeyFoodDB`.`ListIdPed_Ped` (`idListIdPed_Ped`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DonkeyFoodDB`.`Oferta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DonkeyFoodDB`.`Oferta` (
  `idOfer` INT NOT NULL AUTO_INCREMENT,
  `NomOfer` VARCHAR(45) NOT NULL,
  `PorOfer` INT NOT NULL,
  `FecIniOfer` DATE NOT NULL,
  `FecFinOfer` DATE NOT NULL,
  `Producto_idProd` INT NOT NULL,
  PRIMARY KEY (`idOfer`),
  INDEX `fk_Oferta_Producto1_idx` (`Producto_idProd` ASC) VISIBLE,
  CONSTRAINT `fk_Oferta_Producto1`
    FOREIGN KEY (`Producto_idProd`)
    REFERENCES `DonkeyFoodDB`.`Producto` (`idProd`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DonkeyFoodDB`.`BolsaProducto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DonkeyFoodDB`.`BolsaProducto` (
  `Producto` VARCHAR(100) NOT NULL,
  `Precio` INT NOT NULL,
  `Unidades` INT NOT NULL,
  `PrecioFinal` INT NOT NULL,
  PRIMARY KEY (`Producto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DonkeyFoodDB`.`Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DonkeyFoodDB`.`Product` (
  `IdProd` INT NOT NULL AUTO_INCREMENT,
  `NomProd` VARCHAR(100) NOT NULL,
  `DescProd` VARCHAR(100) NOT NULL,
  `UniProd` INT NOT NULL,
  `PreProd` INT NOT NULL,
  PRIMARY KEY (`IdProd`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO PRODUCT(NomProd,DescProd,UniProd,PreProd) VALUES('Pizza','Rica y deliciosa pizza',50,25);
INSERT INTO PRODUCT(NomProd,DescProd,UniProd,PreProd) VALUES('Hamburguesa','Hamburguesa sabrosas de varios tipos',50,35);
INSERT INTO PRODUCT(NomProd,DescProd,UniProd,PreProd) VALUES('Pastes','Ricos y deliciosos psates saldos y dulces',50,22);
INSERT INTO PRODUCT(NomProd,DescProd,UniProd,PreProd) VALUES('Tortas','Ricas y deliciosas tortas listas para llevar y disfrutar',50,25);
INSERT INTO PRODUCT(NomProd,DescProd,UniProd,PreProd) VALUES('Chilaquiles','Unos buenisimos chilaquiles en salsa verde con pollo, crema y queso',50,30);
SELECT count(IdProd) FROM Product;
SELECT * FROM Product;
SELECT * FROM BolsaProducto;
UPDATE Product SET UniProd = (50) WHERE IdProd = 1;

drop database donkeyfooddb;
