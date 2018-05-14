-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Hostiteľ: localhost
-- Čas generovania: Po 14.Máj 2018, 23:10
-- Verzia serveru: 5.7.21-0ubuntu0.16.04.1
-- Verzia PHP: 7.0.28-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáza: `final_project`
--

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `ARTICLE`
--

CREATE TABLE `ARTICLE` (
  `id` int(11) NOT NULL,
  `heading` varchar(500) COLLATE utf8_unicode_520_ci NOT NULL,
  `text` mediumtext COLLATE utf8_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

--
-- Sťahujem dáta pre tabuľku `ARTICLE`
--

INSERT INTO `ARTICLE` (`id`, `heading`, `text`) VALUES
(1, 'Článok 12345', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).'),
(2, 'Nový článok', 'AAAAAAAAAAAAAAAAAAAAAA'),
(3, 'Ďaľší článok', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `CONFIRM`
--

CREATE TABLE `CONFIRM` (
  `id` int(11) NOT NULL,
  `login` varchar(100) COLLATE utf8_unicode_520_ci NOT NULL,
  `password` varchar(300) COLLATE utf8_unicode_520_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_520_ci NOT NULL,
  `surname` varchar(50) COLLATE utf8_unicode_520_ci NOT NULL,
  `user_key` varchar(300) COLLATE utf8_unicode_520_ci NOT NULL,
  `school` varchar(100) COLLATE utf8_unicode_520_ci DEFAULT NULL,
  `school_addr` varchar(150) COLLATE utf8_unicode_520_ci DEFAULT NULL,
  `street` varchar(100) COLLATE utf8_unicode_520_ci DEFAULT NULL,
  `psc` varchar(10) COLLATE utf8_unicode_520_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `USER`
--

CREATE TABLE `USER` (
  `id` int(11) NOT NULL,
  `login` varchar(100) COLLATE utf8_unicode_520_ci NOT NULL,
  `password` varchar(300) COLLATE utf8_unicode_520_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_520_ci NOT NULL,
  `surname` varchar(50) COLLATE utf8_unicode_520_ci NOT NULL,
  `type` varchar(10) COLLATE utf8_unicode_520_ci NOT NULL,
  `school` varchar(100) COLLATE utf8_unicode_520_ci DEFAULT NULL,
  `school_addr` varchar(150) COLLATE utf8_unicode_520_ci DEFAULT NULL,
  `street` varchar(100) COLLATE utf8_unicode_520_ci DEFAULT NULL,
  `psc` varchar(10) COLLATE utf8_unicode_520_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

--
-- Sťahujem dáta pre tabuľku `USER`
--

INSERT INTO `USER` (`id`, `login`, `password`, `name`, `surname`, `type`, `school`, `school_addr`, `street`, `psc`, `city`) VALUES
(1, 'admin', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'Admin', 'Admin', 'admin', NULL, NULL, NULL, NULL, NULL),
(2, 'filip.konig39@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'Filip', 'Konig', 'basic', NULL, NULL, NULL, NULL, NULL),
(5, 'matej.lovasz@gmail.com', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 'Matej', 'Lovasz', 'basic', NULL, NULL, NULL, NULL, NULL),
(65, 'taiwin.white@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'Eugen', 'Ľaňo', 'basic', 'Gymnázium', 'Einsteinova 35, Bratislava', 'Plynárenská', '83111', 'Bratislava');

--
-- Kľúče pre exportované tabuľky
--

--
-- Indexy pre tabuľku `ARTICLE`
--
ALTER TABLE `ARTICLE`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `CONFIRM`
--
ALTER TABLE `CONFIRM`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `USER`
--
ALTER TABLE `USER`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pre exportované tabuľky
--

--
-- AUTO_INCREMENT pre tabuľku `ARTICLE`
--
ALTER TABLE `ARTICLE`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pre tabuľku `CONFIRM`
--
ALTER TABLE `CONFIRM`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT pre tabuľku `USER`
--
ALTER TABLE `USER`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
