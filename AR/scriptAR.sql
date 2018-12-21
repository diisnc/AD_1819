-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema areaRet
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema areaRet
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `areaRet` DEFAULT CHARACTER SET utf8 ;
USE `areaRet` ;

-- -----------------------------------------------------
-- Table `areaRet`.`AR_Cleanup_Encomendas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `areaRet`.`AR_Cleanup_Encomendas` (
  `idOrder` INT NULL,
  `produto` INT NULL,
  `fornecedor` INT NULL,
  `expedidor` INT NULL,
  `funcionario` INT NULL,
  `cliente` INT NULL,
  `dataPedido` INT NULL,
  `dataPagamento` INT NULL,
  `dataEnvio` INT NULL,
  `quantidade` DECIMAL NULL,
  `precoTotal` DECIMAL NULL,
  `precoUnidade` DECIMAL NULL,
  `precoEnvio` DECIMAL NULL,
  `desconto` DOUBLE NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `areaRet`.`AR_Cleanup_Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `areaRet`.`AR_Cleanup_Produto` (
  `idProduto` INT NULL,
  `nome` VARCHAR(50) NULL,
  `quantidadeUnidade` VARCHAR(50) NULL,
  `categoria` VARCHAR(50) NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `areaRet`.`AR_Cleanup_Expedidor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `areaRet`.`AR_Cleanup_Expedidor` (
  `idExpedidor` INT NULL,
  `empresa` VARCHAR(50) NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `areaRet`.`AR_Cleanup_Data`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `areaRet`.`AR_Cleanup_Data` (
  `idData` INT NULL,
  `data` VARCHAR(45) NULL,
  `diaSemana` VARCHAR(45) NULL,
  `dia` VARCHAR(45) NULL,
  `mes` VARCHAR(45) NULL,
  `ano` VARCHAR(45) NULL,
  `trimestre` VARCHAR(45) NULL,
  `semestre` VARCHAR(45) NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `areaRet`.`AR_Cleanup_Fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `areaRet`.`AR_Cleanup_Fornecedor` (
  `idFornecedor` INT NULL,
  `empresa` VARCHAR(50) NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `areaRet`.`AR_Cleanup_Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `areaRet`.`AR_Cleanup_Cliente` (
  `idCliente` INT NULL,
  `nome` VARCHAR(100) NULL,
  `empresa` VARCHAR(50) NULL,
  `cidade` VARCHAR(50) NULL,
  `estado` VARCHAR(50) NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `areaRet`.`AR_Cleanup_Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `areaRet`.`AR_Cleanup_Funcionario` (
  `idFuncionario` INT NULL,
  `nome` VARCHAR(100) NULL,
  `cargo` VARCHAR(50) NULL,
  `cidade` VARCHAR(50) NULL)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
