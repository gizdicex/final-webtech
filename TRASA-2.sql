-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Hostiteľ: localhost
-- Čas generovania: Št 17.Máj 2018, 20:56
-- Verzia serveru: 5.7.21-0ubuntu0.16.04.1
-- Verzia PHP: 7.0.28-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáza: `Final`
--

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `TRASA`
--

CREATE TABLE `TRASA` (
  `id` int(11) NOT NULL,
  `Start` varchar(300) CHARACTER SET utf8 COLLATE utf8_slovak_ci NOT NULL,
  `End` varchar(300) CHARACTER SET utf8 COLLATE utf8_slovak_ci NOT NULL,
  `Vzdialenost` float NOT NULL,
  `Mode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sťahujem dáta pre tabuľku `TRASA`
--

INSERT INTO `TRASA` (`id`, `Start`, `End`, `Vzdialenost`, `Mode`) VALUES
(40, 'Bratislava, Slovensko', 'Nitra, Slovensko', 83320, 0),
(41, 'Bratislava, Slovensko', 'Nitra, Slovensko', 83320, 0),
(42, 'Staré Grunty, Karlova Ves, Slovensko', 'Klokočina, Nitra, Slovensko', 84104, 0),
(43, 'Rewolucji 1905 roku, Lodž, Poľsko', 'FDSBG Engineering Services Pvt. Ltd, Cunningham Road, Vasanth Nagar, Bangalúr, Karnátaka, India', 8179140, 0),
(44, 'bratislavad', 'Nitra, AS, Nitra, Slovensko', 84201, 0),
(45, 'bratislavad', 'Nitra, AS, Nitra, Slovensko', 84201, 0),
(46, 'Bratislava, Slovensko', 'B-F, S V Road, Kandivali Police Line, Jai Bhim Sanjay Nagar, Kandivali West, Bombaj, Maháráštra, India', 7579010, 0),
(47, 'BranchC-214, Vikas PuriNew Delhi(110018)Delhi(DEL)Tel : 011-25507444/011-25507555, Vikas Marg, Defence Enclave, Shahdara, Delhi, Dillí, India', 'Breda, Holandsko', 7477720, 0),
(48, 'Nitra, Slovensko', 'Bratislava, Slovensko', 83323, 0),
(49, 'Brémy, Nemecko', 'Treviso, Province of Treviso, Taliansko', 1064950, 0),
(50, 'Brémy, Nemecko', 'Treviso, Province of Treviso, Taliansko', 1064950, 0),
(51, 'Bratislava, Slovensko', 'Pezinok, Slovensko', 20923, 0),
(52, 'Bratislava, Slovensko', 'Nitra, Slovensko', 83320, 1),
(53, 'Bratislava, Slovensko', 'Nitra, Slovensko', 83320, 1),
(54, 'BranchC-214, Vikas PuriNew Delhi(110018)Delhi(DEL)Tel : 011-25507444/011-25507555, Vikas Marg, Defence Enclave, Shahdara, Delhi, Dillí, India', 'GREEN VILLA (PADINJARE VEEDU),KARICKOM, KOTTARAKARA., State Highway 1, Kottarakkara, Kérala, India', 2566270, 0);

--
-- Kľúče pre exportované tabuľky
--

--
-- Indexy pre tabuľku `TRASA`
--
ALTER TABLE `TRASA`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pre exportované tabuľky
--

--
-- AUTO_INCREMENT pre tabuľku `TRASA`
--
ALTER TABLE `TRASA`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
