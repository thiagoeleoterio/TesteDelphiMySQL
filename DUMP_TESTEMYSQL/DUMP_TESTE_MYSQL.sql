-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.35 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para teste_delphi_mysql
CREATE DATABASE IF NOT EXISTS `teste_delphi_mysql` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `teste_delphi_mysql`;

-- Copiando estrutura para tabela teste_delphi_mysql.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `uf` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela teste_delphi_mysql.cliente: ~49 rows (aproximadamente)
INSERT INTO `cliente` (`id_cliente`, `nome`, `cidade`, `uf`) VALUES
	(1, 'João Silva', 'São Paulo', 'SP'),
	(2, 'Maria Oliveira', 'Rio de Janeiro', 'RJ'),
	(3, 'Carlos Santos', 'Belo Horizonte', 'MG'),
	(4, 'Fernanda Lima', 'Porto Alegre', 'RS'),
	(5, 'Ricardo Rocha', 'Salvador', 'BA'),
	(6, 'Juliana Oliveira', 'Recife', 'PE'),
	(7, 'Luiz Mendes', 'Fortaleza', 'CE'),
	(8, 'Amanda Costa', 'Brasília', 'DF'),
	(9, 'Diego Pereira', 'Curitiba', 'PR'),
	(10, 'Cristiane Almeida', 'Manaus', 'AM'),
	(11, 'Gabriel Souza', 'Belém', 'PA'),
	(12, 'Isabela Martins', 'Vitória', 'ES'),
	(13, 'Eduardo Lima', 'Florianópolis', 'SC'),
	(14, 'Ana Cardoso', 'Natal', 'RN'),
	(15, 'Felipe Santos', 'João Pessoa', 'PB'),
	(16, 'Patrícia Silva', 'Campo Grande', 'MS'),
	(17, 'Roberto Oliveira', 'Cuiabá', 'MT'),
	(18, 'Clara Fernandes', 'Teresina', 'PI'),
	(19, 'Fábio Rocha', 'Porto Velho', 'RO'),
	(20, 'Camila Mendes', 'Aracaju', 'SE'),
	(21, 'Lucas Alves', 'Tocantins', 'TO'),
	(22, 'Raquel Costa', 'Palmas', 'TO'),
	(23, 'Vitor Lima', 'Boa Vista', 'RR'),
	(24, 'Carolina Santos', 'Rio Branco', 'AC'),
	(25, 'Alexandre Pereira', 'Macapá', 'AP'),
	(26, 'Priscila Lima', 'São Luís', 'MA'),
	(27, 'Marcos Rocha', 'São José', 'SC'),
	(28, 'Larissa Oliveira', 'Santo André', 'SP'),
	(29, 'Jorge Mendes', 'Niterói', 'RJ'),
	(30, 'Beatriz Almeida', 'Serra', 'ES'),
	(31, 'Thiago Costa', 'Campinas', 'SP'),
	(32, 'Marina Souza', 'Guarulhos', 'SP'),
	(33, 'Rafael Lima', 'Osasco', 'SP'),
	(34, 'Aline Santos', 'São Bernardo do Campo', 'SP'),
	(35, 'André Oliveira', 'São José dos Campos', 'SP'),
	(36, 'Fernanda Rocha', 'Ribeirão Preto', 'SP'),
	(37, 'Pedro Mendes', 'Sorocaba', 'SP'),
	(38, 'Mariana Almeida', 'Mauá', 'SP'),
	(39, 'Gustavo Costa', 'Santos', 'SP'),
	(40, 'Vanessa Lima', 'Diadema', 'SP'),
	(41, 'Rafaela Santos', 'Jundiaí', 'SP'),
	(42, 'Luciano Oliveira', 'Piracicaba', 'SP'),
	(43, 'Tatiane Rocha', 'Carapicuíba', 'SP'),
	(44, 'Douglas Lima', 'Bauru', 'SP'),
	(45, 'Carla Alves', 'Itaquaquecetuba', 'SP'),
	(46, 'Henrique Mendes', 'São Vicente', 'SP'),
	(47, 'Simone Costa', 'Franca', 'SP'),
	(48, 'Wagner Lima', 'Praia Grande', 'SP'),
	(49, 'Renata Rocha', 'Guarujá', 'SP');

-- Copiando estrutura para tabela teste_delphi_mysql.pedido
CREATE TABLE IF NOT EXISTS `pedido` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `data_emissao` datetime DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  `valor_total` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `idx_cliente_pedido` (`id_cliente`,`id_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela teste_delphi_mysql.pedido: ~8 rows (aproximadamente)
INSERT INTO `pedido` (`id_pedido`, `data_emissao`, `id_cliente`, `valor_total`) VALUES
	(1, '2024-01-09 15:11:59', 10, 1050.00),
	(2, '2024-01-09 15:17:10', 36, 73.62),
	(3, '2024-01-09 15:17:25', 36, 73.62),
	(4, '2024-01-09 15:18:08', 36, 73.62),
	(5, '2024-01-09 15:23:34', 10, 1200.00),
	(6, '2024-01-09 15:23:49', 10, 1200.00),
	(7, '2024-01-09 15:26:10', 10, 300.00),
	(9, '2024-01-09 15:26:55', 10, 1700.00);

-- Copiando estrutura para tabela teste_delphi_mysql.pedido_produtos
CREATE TABLE IF NOT EXISTS `pedido_produtos` (
  `id_pedido_produtos` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int DEFAULT NULL,
  `id_produto` int DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  `valor_unitario` decimal(18,2) DEFAULT NULL,
  `valor_total` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`id_pedido_produtos`),
  KEY `idx_id_pedido` (`id_pedido`),
  KEY `idx_produto_pedido` (`id_produto`,`id_pedido`),
  KEY `idx_id_produto` (`id_produto`),
  CONSTRAINT `FK_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
  CONSTRAINT `FK_produto` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela teste_delphi_mysql.pedido_produtos: ~12 rows (aproximadamente)
INSERT INTO `pedido_produtos` (`id_pedido_produtos`, `id_pedido`, `id_produto`, `quantidade`, `valor_unitario`, `valor_total`) VALUES
	(1, 1, 20, 30, 35.00, 1050.00),
	(2, 2, 10, 3, 15.55, 46.65),
	(3, 2, 20, 3, 8.99, 26.97),
	(4, 3, 10, 3, 15.55, 46.65),
	(5, 3, 20, 3, 8.99, 26.97),
	(6, 4, 10, 3, 15.55, 46.65),
	(7, 4, 20, 3, 8.99, 26.97),
	(8, 5, 20, 30, 40.00, 1200.00),
	(9, 6, 20, 30, 40.00, 1200.00),
	(10, 7, 20, 30, 10.00, 300.00),
	(12, 9, 20, 25, 35.00, 875.00),
	(13, 9, 15, 15, 20.00, 300.00),
	(14, 9, 20, 35, 15.00, 525.00);

-- Copiando estrutura para tabela teste_delphi_mysql.produto
CREATE TABLE IF NOT EXISTS `produto` (
  `id_produto` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) DEFAULT NULL,
  `preco_venda` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela teste_delphi_mysql.produto: ~51 rows (aproximadamente)
INSERT INTO `produto` (`id_produto`, `descricao`, `preco_venda`) VALUES
	(1, 'Notebook Dell Inspiron 15', 3499.99),
	(2, 'Smartphone Samsung Galaxy S21', 2799.00),
	(3, 'Smart TV LG 55" 4K', 2499.50),
	(4, 'Fone de Ouvido Sony WH-1000XM4', 499.99),
	(5, 'Mouse Logitech MX Master 3', 129.95),
	(6, 'Teclado Mecânico Corsair K95 RGB Platinum', 229.99),
	(7, 'Monitor Dell Ultrasharp 27"', 699.00),
	(8, 'Roteador TP-Link Archer C4000', 199.99),
	(9, 'Câmera Mirrorless Sony Alpha A7 III', 1999.00),
	(10, 'Impressora HP LaserJet Pro M404dn', 299.50),
	(11, 'Tablet Apple iPad Air', 649.00),
	(12, 'Console de Video Game Xbox Series X', 499.99),
	(13, 'Câmera de Segurança Wi-Fi TP-Link', 89.99),
	(14, 'SSD Samsung 1TB NVMe', 149.99),
	(15, 'Hub USB-C Anker PowerExpand+', 49.95),
	(16, 'Caixa de Som Bluetooth JBL Charge 4', 129.00),
	(17, 'Placa de Vídeo NVIDIA GeForce RTX 3080', 799.99),
	(18, 'Headset Gamer HyperX Cloud II', 99.99),
	(19, 'Mousepad Corsair MM300', 29.99),
	(20, 'Roteador Mesh Google Nest Wifi', 169.00),
	(21, 'Impressora 3D Creality Ender 3', 249.00),
	(22, 'Mochila para Laptop SwissGear', 79.95),
	(23, 'Webcam Logitech C920 HD Pro', 79.99),
	(24, 'Teclado sem Fio Logitech K780', 79.00),
	(25, 'Monitor Gamer Alienware 34" Curvo', 999.50),
	(26, 'Caixa de Som Inteligente Amazon Echo Dot', 39.99),
	(27, 'Drone DJI Mavic Air 2', 799.00),
	(28, 'Relógio Inteligente Apple Watch SE', 279.00),
	(29, 'Mouse Gamer Razer DeathAdder Elite', 69.99),
	(30, 'Teclado Mecânico Razer BlackWidow Elite', 169.99),
	(31, 'Câmera de Ação GoPro Hero 9', 349.00),
	(32, 'Roteador ASUS RT-AX86U', 249.99),
	(33, 'Monitor Ultrawide LG 34" IPS', 599.00),
	(34, 'Caixa de Som SoundLink Revolve+', 249.95),
	(35, 'Impressora Multifuncional Epson EcoTank', 449.50),
	(36, 'SSD Crucial 500GB SATA', 69.99),
	(37, 'Hub USB Anker 7 Portas', 29.95),
	(38, 'Laptop MSI GS66 Stealth', 1999.00),
	(39, 'Teclado sem Fio Apple Magic Keyboard', 99.00),
	(40, 'Fone de Ouvido Bluetooth Bose QuietComfort', 349.99),
	(41, 'Webcam Microsoft LifeCam HD-3000', 39.99),
	(42, 'Monitor Dell Alienware 27" OLED', 1499.00),
	(43, 'Cadeira Gamer Cougar Armor S Royal', 299.99),
	(44, 'Caixa de Som Bluetooth UE Boom 3', 129.95),
	(45, 'Câmera de Vigilância Xiaomi Mi Home', 59.99),
	(46, 'Placa-Mãe ASUS ROG Strix Z590-E Gaming', 349.00),
	(47, 'Projetor Epson Home Cinema 5050UB', 2499.00),
	(48, 'Microfone Blue Yeti USB', 129.99),
	(49, 'Mouse sem Fio Microsoft Surface Arc', 79.99),
	(50, 'Laptop Lenovo ThinkPad X1 Carbon', 1399.00),
	(51, 'Smartwatch Samsung Galaxy Watch 4', 299.00);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
