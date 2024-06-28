-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 05/06/2024 às 09:33
-- Versão do servidor: 8.3.0
-- Versão do PHP: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_dm_2024`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `administrador`
--

DROP TABLE IF EXISTS `administrador`;
CREATE TABLE IF NOT EXISTS `administrador` (
  `id` int NOT NULL DEFAULT '0',
  `tipo` enum('adminstrador') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nome` varchar(50) NOT NULL,
  `senha` varchar(20) NOT NULL,
  `data de criacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `administrador`
--

INSERT INTO `administrador` (`id`, `tipo`, `nome`, `senha`, `data de criacao`) VALUES
(1, 'adminstrador', 'renato gaspar', '12345678', '2024-05-13 03:48:41'),
(2, 'adminstrador', 'renato gaspar administrador', '12345678', '2024-05-13 03:49:27'),
(3, '', 'renato gaspar gestor', '12345678', '2024-05-13 03:49:27');

-- --------------------------------------------------------

--
-- Estrutura para tabela `gestor`
--

DROP TABLE IF EXISTS `gestor`;
CREATE TABLE IF NOT EXISTS `gestor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` enum('adminstrador','gestor','turista') NOT NULL,
  `nome` varchar(50) NOT NULL,
  `senha` varchar(20) NOT NULL,
  `data de criacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`nome`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `hotel`
--

DROP TABLE IF EXISTS `hotel`;
CREATE TABLE IF NOT EXISTS `hotel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `classificacao` enum('1','2','3','4','5','') NOT NULL,
  `servicos` text NOT NULL,
  `quartos` int NOT NULL,
  `data de criacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `localizacao`
--

DROP TABLE IF EXISTS `localizacao`;
CREATE TABLE IF NOT EXISTS `localizacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `descricao` text NOT NULL,
  `coordenadas geograficas` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pontos turisticos`
--

DROP TABLE IF EXISTS `pontos turisticos`;
CREATE TABLE IF NOT EXISTS `pontos turisticos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `localizacao` int NOT NULL,
  `estado` varchar(50) NOT NULL,
  `gastronomia` text NOT NULL,
  `lingua` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `quarto`
--

DROP TABLE IF EXISTS `quarto`;
CREATE TABLE IF NOT EXISTS `quarto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hotel` int NOT NULL,
  `disponibilidade` enum('Disponivel','Reservado','Ocupado','') NOT NULL,
  `numero` int NOT NULL,
  `andar` int NOT NULL,
  `camas` int NOT NULL,
  `tipo` varchar(65) NOT NULL,
  `facilidades` varchar(65) NOT NULL,
  `valor` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `reservas`
--

DROP TABLE IF EXISTS `reservas`;
CREATE TABLE IF NOT EXISTS `reservas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quarto` int NOT NULL,
  `hospede` int NOT NULL,
  `inicio` datetime NOT NULL,
  `fim` datetime NOT NULL,
  `situacao` enum('Disponível','Reservado','Ocupado','') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `turista`
--

DROP TABLE IF EXISTS `turista`;
CREATE TABLE IF NOT EXISTS `turista` (
  `id` int NOT NULL DEFAULT '0',
  `tipo` enum('turista') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nome` varchar(50) NOT NULL,
  `senha` varchar(20) NOT NULL,
  `data de criacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `turista`
--

INSERT INTO `turista` (`id`, `tipo`, `nome`, `senha`, `data de criacao`) VALUES
(1, '', 'renato gaspar', '12345678', '2024-05-13 03:48:41'),
(2, '', 'renato gaspar administrador', '12345678', '2024-05-13 03:49:27'),
(3, '', 'renato gaspar gestor', '12345678', '2024-05-13 03:49:27');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
