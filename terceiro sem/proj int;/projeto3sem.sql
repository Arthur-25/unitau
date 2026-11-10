-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.32-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para projeto3semestre
CREATE DATABASE IF NOT EXISTS `projeto3semestre` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `projeto3semestre`;

-- Copiando estrutura para tabela projeto3semestre.categorias
CREATE TABLE IF NOT EXISTS `categorias` (
  `categoria_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descricao` text DEFAULT NULL,
  PRIMARY KEY (`categoria_id`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela projeto3semestre.doacoes_financeiras
CREATE TABLE IF NOT EXISTS `doacoes_financeiras` (
  `doacao_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `doador_id` int(11) DEFAULT NULL,
  `ong_id` int(11) NOT NULL,
  `data_doacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `valor` decimal(10,2) NOT NULL,
  `forma_pagamento` varchar(50) DEFAULT NULL,
  `observacoes` text DEFAULT NULL,
  PRIMARY KEY (`doacao_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela projeto3semestre.doadores
CREATE TABLE IF NOT EXISTS `doadores` (
  `doador_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `cpf_cnpj` varchar(20) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `data_cadastro` date DEFAULT curdate(),
  PRIMARY KEY (`doador_id`),
  UNIQUE KEY `cpf_cnpj` (`cpf_cnpj`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela projeto3semestre.entradas_estoque
CREATE TABLE IF NOT EXISTS `entradas_estoque` (
  `entrada_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `data_entrada` timestamp NOT NULL DEFAULT current_timestamp(),
  `quantidade` int(11) NOT NULL,
  `doador_id` int(11) DEFAULT NULL,
  `ong_id` int(11) NOT NULL,
  `observacoes` text DEFAULT NULL,
  PRIMARY KEY (`entrada_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela projeto3semestre.itens
CREATE TABLE IF NOT EXISTS `itens` (
  `item_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `descricao` text DEFAULT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `data_cadastro` date DEFAULT curdate(),
  `quantidade` int(11) NOT NULL DEFAULT 0,
  `unidade` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela projeto3semestre.ongs
CREATE TABLE IF NOT EXISTS `ongs` (
  `ong_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `data_cadastro` date DEFAULT curdate(),
  PRIMARY KEY (`ong_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela projeto3semestre.saidas_estoque
CREATE TABLE IF NOT EXISTS `saidas_estoque` (
  `saida_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `data_saida` timestamp NOT NULL DEFAULT current_timestamp(),
  `quantidade` int(11) NOT NULL,
  `beneficiario` varchar(255) DEFAULT NULL,
  `ong_id` int(11) NOT NULL,
  `observacoes` text DEFAULT NULL,
  PRIMARY KEY (`saida_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportação de dados foi desmarcado.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
