-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Loomise aeg: Aprill 22, 2026 kell 12:16 PL
-- Serveri versioon: 10.4.32-MariaDB
-- PHP versioon: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Andmebaas: `logitpe24baas`
--

DELIMITER $$
--
-- Toimingud
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `kustutaidjargi` (IN `kustamisid` INT)   BEGIN
	SELECT * FROM categories;
	DELETE FROM categories WHERE category_id=kustamisid;
	SELECT * FROM categories;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `lisakategooria` (IN `uusKategooria` VARCHAR(20))   BEGIN
	INSERT INTO categories (category_name)
	VALUES (uusKategooria);
	SELECT * FROM categories;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `otsingleht` (IN `taht` CHAR(1))   BEGIN
	SELECT * FROM products WHERE product_name like CONCAT (taht + '%');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `uuendaKategooria` (IN `uuendamisId` INT, IN `uusKategooriaNimi` VARCHAR(20))   BEGIN
	Select * from categories;
    Update categories SET category_name=uusKategooriaNimi
    WHERE category_id=uuendamisId;
    Select * from categories;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_name`) VALUES
(4, NULL),
(3, 'BMW'),
(2, 'ea'),
(1, 'Nike');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`) VALUES
(1, 'toitttt');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `customers`
--

CREATE TABLE `customers` (
  `customer_ID` int(11) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `phone` char(13) DEFAULT NULL,
  `email` varchar(25) NOT NULL,
  `street` varchar(25) DEFAULT NULL,
  `City` varchar(25) DEFAULT NULL,
  `state` varchar(25) DEFAULT NULL,
  `zip_code` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `order_status` varchar(10) DEFAULT NULL CHECK (`order_status` = 'tehtud' or `order_status` = 'tegematta'),
  `order_date` date DEFAULT NULL,
  `required_date` date NOT NULL,
  `shipped_date` date DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `order_items`
--

CREATE TABLE `order_items` (
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quanity` int(11) DEFAULT NULL,
  `list_price` decimal(5,2) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(25) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `model_year` int(11) DEFAULT NULL,
  `list_price` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `brand_id`, `category_id`, `model_year`, `list_price`) VALUES
(1, 'Laud', 2, 2, 2025, 130.00);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `staff`
--

CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(25) DEFAULT NULL,
  `phone` char(5) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `manager_id` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `stocks`
--

CREATE TABLE `stocks` (
  `store_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quanity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `stores`
--

CREATE TABLE `stores` (
  `store_id` int(11) NOT NULL,
  `store_name` varchar(25) NOT NULL,
  `phone` char(13) DEFAULT NULL,
  `email` varchar(25) NOT NULL,
  `street` varchar(25) DEFAULT NULL,
  `City` varchar(25) DEFAULT NULL,
  `state` varchar(25) DEFAULT NULL,
  `zip_code` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`),
  ADD UNIQUE KEY `brand_name` (`brand_name`);

--
-- Indeksid tabelile `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Indeksid tabelile `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_ID`);

--
-- Indeksid tabelile `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indeksid tabelile `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_id`,`item_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indeksid tabelile `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `product_name` (`product_name`);

--
-- Indeksid tabelile `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indeksid tabelile `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`store_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indeksid tabelile `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`store_id`);

--
-- AUTO_INCREMENT tõmmistatud tabelitele
--

--
-- AUTO_INCREMENT tabelile `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT tabelile `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT tabelile `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT tabelile `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT tabelile `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT tabelile `staff`
--
ALTER TABLE `staff`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT tabelile `stores`
--
ALTER TABLE `stores`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tõmmistatud tabelite piirangud
--

--
-- Piirangud tabelile `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_ID`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`);

--
-- Piirangud tabelile `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Piirangud tabelile `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`);

--
-- Piirangud tabelile `stocks`
--
ALTER TABLE `stocks`
  ADD CONSTRAINT `stocks_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`),
  ADD CONSTRAINT `stocks_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
