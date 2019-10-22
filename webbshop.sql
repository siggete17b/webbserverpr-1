-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Värd: 127.0.0.1
-- Tid vid skapande: 22 okt 2019 kl 10:33
-- Serverversion: 10.4.6-MariaDB
-- PHP-version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databas: `webbshop`
--

-- --------------------------------------------------------

--
-- Tabellstruktur `kunder`
--

CREATE TABLE `kunder` (
  `kundID` int(10) UNSIGNED NOT NULL,
  `anvnamn` varchar(20) COLLATE utf8_swedish_ci NOT NULL,
  `förnamn` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `efternamn` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `adress` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `postnummer` int(10) NOT NULL,
  `postadress` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `telefon` varchar(10) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur `order`
--

CREATE TABLE `order` (
  `orderID` int(10) UNSIGNED NOT NULL,
  `produktID` int(10) UNSIGNED NOT NULL,
  `antal` int(5) NOT NULL,
  `kundID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur `produkter`
--

CREATE TABLE `produkter` (
  `produktID` int(10) UNSIGNED NOT NULL,
  `namn` varchar(20) COLLATE utf8_swedish_ci NOT NULL,
  `beskrivning` varchar(200) COLLATE utf8_swedish_ci NOT NULL,
  `pris` int(50) NOT NULL,
  `bild` varchar(200) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur `users`
--

CREATE TABLE `users` (
  `anvnamn` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `email` varchar(150) COLLATE utf8_swedish_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `status` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Index för dumpade tabeller
--

--
-- Index för tabell `kunder`
--
ALTER TABLE `kunder`
  ADD PRIMARY KEY (`kundID`),
  ADD KEY `anvnamn` (`anvnamn`);

--
-- Index för tabell `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `produktID` (`produktID`),
  ADD KEY `kundID` (`kundID`);

--
-- Index för tabell `produkter`
--
ALTER TABLE `produkter`
  ADD PRIMARY KEY (`produktID`);

--
-- Index för tabell `users`
--
ALTER TABLE `users`
  ADD UNIQUE KEY `anvnamn` (`anvnamn`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `anvnamn_2` (`anvnamn`),
  ADD UNIQUE KEY `anvnamn_3` (`anvnamn`);

--
-- AUTO_INCREMENT för dumpade tabeller
--

--
-- AUTO_INCREMENT för tabell `kunder`
--
ALTER TABLE `kunder`
  MODIFY `kundID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT för tabell `order`
--
ALTER TABLE `order`
  MODIFY `orderID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT för tabell `produkter`
--
ALTER TABLE `produkter`
  MODIFY `produktID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restriktioner för dumpade tabeller
--

--
-- Restriktioner för tabell `kunder`
--
ALTER TABLE `kunder`
  ADD CONSTRAINT `kunder_ibfk_1` FOREIGN KEY (`anvnamn`) REFERENCES `users` (`anvnamn`) ON UPDATE CASCADE;

--
-- Restriktioner för tabell `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`produktID`) REFERENCES `produkter` (`produktID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`kundID`) REFERENCES `kunder` (`kundID`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
