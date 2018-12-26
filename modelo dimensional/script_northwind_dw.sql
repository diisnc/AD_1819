-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema northwind_dw
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema northwind_dw
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `northwind_dw` DEFAULT CHARACTER SET utf8 ;
USE `northwind_dw` ;

-- -----------------------------------------------------
-- Table `northwind_dw`.`DIM_Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `northwind_dw`.`DIM_Funcionario` (
  `idFuncionario` INT NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `cargo` VARCHAR(50) NOT NULL,
  `cidade` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idFuncionario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `northwind_dw`.`DIM_Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `northwind_dw`.`DIM_Produto` (
  `idProduto` INT NOT NULL,
  `nome` VARCHAR(50) NOT NULL,
  `quantidadeUnidade` VARCHAR(50) NOT NULL,
  `categoria` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idProduto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `northwind_dw`.`DIM_Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `northwind_dw`.`DIM_Cliente` (
  `idCliente` INT NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `empresa` VARCHAR(50) NOT NULL,
  `cidade` VARCHAR(50) NOT NULL,
  `estado` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `northwind_dw`.`DIM_Fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `northwind_dw`.`DIM_Fornecedor` (
  `idFornecedor` INT NOT NULL,
  `empresa` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idFornecedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `northwind_dw`.`DIM_Data`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `northwind_dw`.`DIM_Data` (
  `idData` BIGINT NOT NULL,
  `data` VARCHAR(45) NOT NULL,
  `diaSemana` VARCHAR(45) NOT NULL,
  `dia` VARCHAR(45) NOT NULL,
  `mes` VARCHAR(45) NOT NULL,
  `ano` VARCHAR(45) NOT NULL,
  `trimestre` VARCHAR(45) NOT NULL,
  `semestre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idData`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `northwind_dw`.`DIM_Expedidor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `northwind_dw`.`DIM_Expedidor` (
  `idExpedidor` INT NOT NULL,
  `empresa` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idExpedidor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `northwind_dw`.`TF_Encomendas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `northwind_dw`.`TF_Encomendas` (
  `idOrderSK` INT NOT NULL AUTO_INCREMENT,
  `idOrder` INT NOT NULL,
  `produto` INT NOT NULL,
  `fornecedor` INT NOT NULL,
  `expedidor` INT NOT NULL,
  `funcionario` INT NOT NULL,
  `cliente` INT NOT NULL,
  `dataPedido` BIGINT NOT NULL,
  `dataPagamento` BIGINT NOT NULL,
  `dataEnvio` BIGINT NOT NULL,
  `quantidade` DECIMAL(18,4) NOT NULL,
  `precoTotal` DECIMAL(19,4) NOT NULL,
  `precoUnidade` DECIMAL(19,4) NOT NULL,
  `precoEnvio` DECIMAL(19,4) NOT NULL,
  `desconto` DOUBLE NOT NULL,
  PRIMARY KEY (`idOrderSK`),
  INDEX `fk_TF-Orders_DIM-Employee1_idx` (`funcionario` ASC),
  INDEX `fk_TF-Orders_DIM-Product1_idx` (`produto` ASC),
  INDEX `fk_TF-Orders_DIM-Customer1_idx` (`cliente` ASC),
  INDEX `fk_TF-Orders_DIM-Suppliers1_idx` (`fornecedor` ASC),
  INDEX `fk_TF-Encomendas_DIM-Data1_idx` (`dataPedido` ASC),
  INDEX `fk_TF-Encomendas_DIM-Data2_idx` (`dataPagamento` ASC),
  INDEX `fk_TF-Encomendas_DIM-Data3_idx` (`dataEnvio` ASC),
  INDEX `fk_TF-Encomendas_DIM-Expedidor1_idx` (`expedidor` ASC),
  CONSTRAINT `DIM-Funcionario`
    FOREIGN KEY (`funcionario`)
    REFERENCES `northwind_dw`.`DIM_Funcionario` (`idFuncionario`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `DIM-Produto`
    FOREIGN KEY (`produto`)
    REFERENCES `northwind_dw`.`DIM_Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `DIM-Cliente`
    FOREIGN KEY (`cliente`)
    REFERENCES `northwind_dw`.`DIM_Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `DIM-Fornecedor`
    FOREIGN KEY (`fornecedor`)
    REFERENCES `northwind_dw`.`DIM_Fornecedor` (`idFornecedor`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `DIM-Data1`
    FOREIGN KEY (`dataPedido`)
    REFERENCES `northwind_dw`.`DIM_Data` (`idData`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `DIM-Data2`
    FOREIGN KEY (`dataPagamento`)
    REFERENCES `northwind_dw`.`DIM_Data` (`idData`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `DIM-Data3`
    FOREIGN KEY (`dataEnvio`)
    REFERENCES `northwind_dw`.`DIM_Data` (`idData`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `DIM-Expedidor1`
    FOREIGN KEY (`expedidor`)
    REFERENCES `northwind_dw`.`DIM_Expedidor` (`idExpedidor`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;