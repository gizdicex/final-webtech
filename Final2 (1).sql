-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Hostiteľ: localhost
-- Čas generovania: Pi 18.Máj 2018, 22:58
-- Verzia serveru: 5.7.21-0ubuntu0.16.04.1
-- Verzia PHP: 7.0.28-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáza: `Final2`
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

--
-- Sťahujem dáta pre tabuľku `CONFIRM`
--

INSERT INTO `CONFIRM` (`id`, `login`, `password`, `name`, `surname`, `user_key`, `school`, `school_addr`, `street`, `psc`, `city`) VALUES
(20, 'h2287298@nwytg.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'Martin', 'Martiska', '1fb4e8c539f96c4b33e9076e68db9695', 'STUBA', 'Neviem, 56', 'Konska', '654123', 'Potkanovo'),
(21, 'h2287298@nwytg.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'Martin', 'Martiska', '7ef3af8691a9381391208a1092f1dd67', 'STUBA', 'Neviem, 56', 'Konska', '654123', 'Potkanovo'),
(22, 'h2287298@nwytg.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'Martof', 'fdfdnwps', 'a949f1f921b934ee8c32100619bc56cd', 'asd', 'asd', 'asd', 'asd', 'asd');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `POKROKY`
--

CREATE TABLE `POKROKY` (
  `id` int(11) NOT NULL,
  `km` float NOT NULL,
  `den` date DEFAULT NULL,
  `zcas` time DEFAULT NULL,
  `kcas` time DEFAULT NULL,
  `zgps` varchar(100) DEFAULT NULL,
  `kgps` varchar(100) DEFAULT NULL,
  `hodnotenie` int(11) DEFAULT NULL,
  `poznamka` varchar(500) DEFAULT NULL,
  `USER_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sťahujem dáta pre tabuľku `POKROKY`
--

INSERT INTO `POKROKY` (`id`, `km`, `den`, `zcas`, `kcas`, `zgps`, `kgps`, `hodnotenie`, `poznamka`, `USER_ID`) VALUES
(1, 50, '2018-05-17', '00:00:00', '00:00:00', '', '', 3, '', 0),
(2, 34, '2018-05-11', '00:03:00', '03:03:00', '432', '432', 3, '421', 0),
(3, 34, '2018-05-11', '00:03:00', '03:03:00', '432', '432', 3, '421', 0),
(4, 5, '2018-05-11', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(5, 5, '2018-05-11', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(6, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(7, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(8, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(9, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(10, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(11, 342, NULL, NULL, NULL, NULL, NULL, 3, NULL, 1),
(12, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(13, 11111, '2018-05-01', NULL, NULL, NULL, NULL, 2, NULL, 1),
(14, 52, NULL, NULL, NULL, NULL, NULL, 5, NULL, 1);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `TRASA`
--

CREATE TABLE `TRASA` (
  `Trasa_id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `Start` varchar(300) CHARACTER SET utf8 COLLATE utf8_slovak_ci NOT NULL,
  `End` varchar(300) CHARACTER SET utf8 COLLATE utf8_slovak_ci NOT NULL,
  `Vzdialenost` float NOT NULL,
  `Mode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sťahujem dáta pre tabuľku `TRASA`
--

INSERT INTO `TRASA` (`Trasa_id`, `id_user`, `Start`, `End`, `Vzdialenost`, `Mode`) VALUES
(40, 1, 'Bratislava, Slovensko', 'Nitra, Slovensko', 83320, 0),
(41, 2, 'Bratislava, Slovensko', 'Nitra, Slovensko', 83320, 0),
(42, 0, 'Staré Grunty, Karlova Ves, Slovensko', 'Klokočina, Nitra, Slovensko', 84104, 0),
(43, 0, 'Rewolucji 1905 roku, Lodž, Poľsko', 'FDSBG Engineering Services Pvt. Ltd, Cunningham Road, Vasanth Nagar, Bangalúr, Karnátaka, India', 8179140, 0),
(44, 0, 'bratislavad', 'Nitra, AS, Nitra, Slovensko', 84201, 0),
(45, 0, 'bratislavad', 'Nitra, AS, Nitra, Slovensko', 84201, 0),
(46, 0, 'Bratislava, Slovensko', 'B-F, S V Road, Kandivali Police Line, Jai Bhim Sanjay Nagar, Kandivali West, Bombaj, Maháráštra, India', 7579010, 0),
(47, 0, 'BranchC-214, Vikas PuriNew Delhi(110018)Delhi(DEL)Tel : 011-25507444/011-25507555, Vikas Marg, Defence Enclave, Shahdara, Delhi, Dillí, India', 'Breda, Holandsko', 7477720, 0),
(48, 0, 'Nitra, Slovensko', 'Bratislava, Slovensko', 83323, 0),
(49, 0, 'Brémy, Nemecko', 'Treviso, Province of Treviso, Taliansko', 1064950, 0),
(50, 0, 'Brémy, Nemecko', 'Treviso, Province of Treviso, Taliansko', 1064950, 0),
(51, 0, 'Bratislava, Slovensko', 'Pezinok, Slovensko', 20923, 0),
(52, 0, 'Bratislava, Slovensko', 'Nitra, Slovensko', 83320, 1),
(53, 0, 'Bratislava, Slovensko', 'Nitra, Slovensko', 83320, 1),
(54, 0, 'BranchC-214, Vikas PuriNew Delhi(110018)Delhi(DEL)Tel : 011-25507444/011-25507555, Vikas Marg, Defence Enclave, Shahdara, Delhi, Dillí, India', 'GREEN VILLA (PADINJARE VEEDU),KARICKOM, KOTTARAKARA., State Highway 1, Kottarakkara, Kérala, India', 2566270, 0),
(55, 1, 'Bratislava, Slovensko', 'Nitra, Slovensko', 83320, 1),
(56, 1, 'Bratislava, Slovensko', 'Nitra, Slovensko', 83320, 1),
(57, 1, 'Bratislava, Slovensko', 'Košice, Slovensko', 379941, 0),
(58, 1, 'Bratislava, Slovensko', 'Nitra, Slovensko', 83320, 1),
(59, 1, 'Bratislava, Slovensko', 'Nitra, Slovensko', 83320, 0),
(60, 1, 'Bratislava, Slovensko', 'Nitra, Slovensko', 83320, 0),
(61, 2, 'Bratislava, Slovensko', 'Madrid, Španělsko', 2199110, 0),
(62, 5, 'Bratislava, Slovensko', 'Nitra, Slovensko', 83320, 0),
(63, 5, 'Košice, Slovensko', 'Nitra, Slovensko', 298030, 0);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `USER`
--

CREATE TABLE `USER` (
  `User_id` int(11) NOT NULL,
  `login` varchar(100) COLLATE utf8_unicode_520_ci NOT NULL,
  `password` varchar(300) COLLATE utf8_unicode_520_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_520_ci NOT NULL,
  `surname` varchar(50) COLLATE utf8_unicode_520_ci NOT NULL,
  `type` varchar(10) COLLATE utf8_unicode_520_ci NOT NULL,
  `school` varchar(100) COLLATE utf8_unicode_520_ci DEFAULT NULL,
  `school_addr` varchar(150) COLLATE utf8_unicode_520_ci DEFAULT NULL,
  `street` varchar(100) COLLATE utf8_unicode_520_ci DEFAULT NULL,
  `psc` varchar(10) COLLATE utf8_unicode_520_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8_unicode_520_ci DEFAULT NULL,
  `subscribe` int(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

--
-- Sťahujem dáta pre tabuľku `USER`
--

INSERT INTO `USER` (`User_id`, `login`, `password`, `name`, `surname`, `type`, `school`, `school_addr`, `street`, `psc`, `city`, `subscribe`) VALUES
(1, 'admin', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'Admin', 'Admin', 'admin', NULL, NULL, NULL, NULL, NULL, 0),
(2, 'filip.konig39@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'Filip', 'Konig', 'basic', 'Gymnázium', 'Einsteinova 35, Bratislava', 'Plynárenská', '83111', 'Bratislava', 0),
(5, 'matej.lovasz@gmail.com', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 'Matej', 'Lovasz', 'basic', 'Gymnázium', 'Einsteinova 35, Bratislava', 'Plynárenská', '83111', 'Bratislava', 0),
(65, 'taiwin.white@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'Eugen', 'Ľaňo', 'basic', 'Gymnázium', 'Einsteinova 35, Bratislava', 'Plynárenská', '83111', 'Bratislava', 0),
(123, 'email1@gmail.com', 'e65126262d489b4fe21e8f495137df3672dcb349710849a8ed150db883895018', 'Štefan', 'Abrahám', 'basic', 'Gymnázium Martina Kukučína', 'Revúca, V. Clementisa 1166/21, 05001', 'Revúcka Lehota 1', '4918', 'Revúcka Lehota', 0),
(124, 'email2@gmail.com', 'bd8c8ccb7d6d87d25a5fe0c90602d8e7cfe32238642de77a94d844dc95d02939', 'Albert', 'Adamec', 'basic', 'Stredná odborná škola strojnícka', 'Považská Bystrica, Športovcov 341/2, 01749', 'Sládkovičova 1', '1701', 'Považská Bystrica', 0),
(125, 'email3@gmail.com', 'e735c8c51f7eb6730f99675eb3254890de07f98d1c3cf4c19422d278ab0ae9d0', 'Adela', 'Andrášová', 'basic', 'Súkromná stredná odborná škola', 'Poprad, Ul. 29. augusta 4812, 05801', 'Tatranská Lomnica 1', '5960', 'Tatranská Lomnica', 0),
(126, 'email4@gmail.com', '5b162ec8d76a4d768a90a39c508d13a4bd337d3e181fbe02c17bbe8fd1ff6dbe', 'Adrián', 'Baran', 'basic', 'Stredná priemyselná škola elektrotechnická', 'Bratislava-Petržalka, Hálova 16, 85101', 'Bartókova 1', '81102', 'Bratislava', 0),
(127, 'email5@gmail.com', '7fc10b679dab45d5074bf0a31f872c135b19987fbf5c7cc610085b84a8bcaada', 'Eunika', 'Bašková', 'basic', 'Gymnázium arm. gen. Ludvíka Svobodu', 'Humenné, Komenského 4, 06601', 'Partizánska 1', '6601', 'Humenné', 0),
(128, 'email6@gmail.com', 'df26a613b7d884cd3ee2608f666f4bff69ebbc7efb89cc3a547d263363db7cd6', 'Ester', 'Beňová', 'basic', 'Gymnázium Antona Bernoláka', 'Námestovo, Ulica mieru 307/23, 02901', 'Novoť 1', '2955', 'Novoť', 0),
(129, 'email7@gmail.com', '5fab1cbceb5e97cef20284c8785147f3fa7b11ef8375b50cd26a75ef95d33948', 'Ľubomír', 'Bernolák', 'basic', 'Stredná priemyselná škola elektrotechnická', 'Bratislava-Petržalka, Hálova 16, 85101', 'Wolkrova 1', '85101', 'Bratislava - Petržalka', 0),
(130, 'email8@gmail.com', 'a5df6e2b3388b056ed4d131fae5e317107e77a1c0a3f104f24739c4fda0e4d13', 'Norbert', 'Bernolák', 'basic', 'Gymnázium', 'Myjava, Jablonská 5, 90701', 'Poriadie 1', '90622', 'Poriadie', 0),
(131, 'email9@gmail.com', 'b1619d5ddf125a1381800e0818febcd633f84b9a56b1aae323cc137065f44e80', 'Jozef', 'Bilek', 'basic', 'Stredná priemyselná škola', 'Dubnica nad Váhom, Obrancov mieru 343/1, 01841', 'Neporadza 1', '91326', 'Neporadza', 0),
(132, 'email10@gmail.com', 'f6e54d2581cb4f85382ebc59b1f8f5a34a62c282e49248b7731634f255ffae5a', 'Iveta', 'Boreková', 'basic', 'Stredná odborná škola polytechnická', 'Humenné, Štefánikova 1550/20, 06601', 'Puškinova 1', '9303', 'Vranov nad Topľou', 0),
(133, 'email11@gmail.com', '8038b65e2566b9cac4d7fc441bc3e9f2cd80a0376b42bed2dfc937a21ee275f9', 'Enna', 'Bóriková', 'basic', 'Gymnázium', 'Vranov nad Topľou, Dr. C. Daxnera 88/3, 09380', 'Lúčna 1', '9301', 'Vranov nad Topľou', 0),
(134, 'email12@gmail.com', 'c1da739d09944807d9d36b3b4adc1179dcfd2f768eae29edd39fc3914d07122d', 'Natália', 'Cesnaková', 'basic', 'Stredná priemyselná škola elektrotechnická', 'Bratislava-Petržalka, Hálova 16, 85101', 'Hostáď 1', '93036', 'Čečínska Potôň', 0),
(135, 'email13@gmail.com', '7196504e9eaa32a765cc505250e781a9a3e4f171e5eb3eff0a08b243bf33cc08', 'Karina', 'Dávidová', 'basic', 'Stredná priemyselná škola elektrotechnická', 'Bratislava-Petržalka, Hálova 16, 85101', 'Dolná 1', '90051', 'Zohor', 0),
(136, 'email14@gmail.com', '573a20e52f3b3ed1d5b5eeb9e01e58ead04c9e9f7dc75589e3b7f328c810eca9', 'Alana', 'Debnárová', 'basic', 'Spojená škola-Stredná odborná škola technická', 'Prešov, Ľ. Podjavorinskej 22, 08005', 'L. Novomeského 1', '8001', 'Prešov', 0),
(137, 'email15@gmail.com', '5da7dfc8432fe16942b287446624312495bd0b707559fe295a255ffefeae9661', 'Koloman', 'Devečka', 'basic', 'Stredná odborná škola obchodu a služieb', 'Nové Mesto nad Váhom, Piešťanská 2262/80, 91501', 'Ivanovce 1', '91305', 'Ivanovce', 0),
(138, 'email16@gmail.com', '722fde95e54010d5d28700f229d9f2f8222495b48b1157db251d8fe5d7f54485', 'Zoja', 'Doležalová', 'basic', 'Gymnázium', 'Považská Bystrica, Školská 234/8, 01701', 'Riečna 1', '2001', 'Hrabovka', 0),
(139, 'email17@gmail.com', '8e916b52cdcac7d3c36e2578b05e08f9742baafb61cd36a004d2dce3b337c380', 'Tibor', 'Dorko', 'basic', 'Gymnázium Ľudovíta Štúra', 'Zvolen, Hronská 1467/3, 96049', 'Neresnická 1', '96261', 'Dobrá Niva', 0),
(140, 'email18@gmail.com', '09051a551c11fe441df818d1a27e0b0e8a3c2e011b23ec29169686f1213c25dd', 'Miloslav', 'Droppa', 'basic', 'Gymnázium', 'Vranov nad Topľou, Dr. C. Daxnera 88/3, 09380', 'Vyšný Žipov 1', '9433', 'Vyšný Žipov', 0),
(141, 'email19@gmail.com', 'fe8925d403b660bb14e2f38addb4f5458b5c98d9225f1e431c9b1a5c32d78868', 'Iveta', 'Dudiková', 'basic', 'Stredná priemyselná škola elektrotechnická', 'Bratislava-Petržalka, Hálova 16, 85101', 'Hraničiarska 1', '85110', 'Bratislava - Čunovo', 0),
(142, 'email20@gmail.com', '26fdc716d12d7f02bcb078e16eb1ebe6394a77dea9a98b6f637981e91b913650', 'Olívia', 'Ďuricová', 'basic', 'Gymnázium Pavla Horova', 'Michalovce, Masarykova 1, 07179', 'Hradská 1', '7215', 'Budkovce', 0),
(143, 'email21@gmail.com', 'bcd4272420dab8f724e0043b79b57363219254fb5fee9aad4c92027f55d2fbb0', 'Svetozár', 'Ďurka', 'basic', 'Stredná priemyselná škola elektrotechnická', 'Bratislava-Petržalka, Hálova 16, 85101', 'Jasovská 1', '85107', 'Bratislava', 0),
(144, 'email22@gmail.com', 'bfad018ce74d89e03891d5ce232f86188d80bc2e22ffeccf3cbafba42915943a', 'Jela', 'Ďurová', 'basic', 'Gymnázium', 'Vranov nad Topľou, Dr. C. Daxnera 88/3, 09380', 'Puškinova 1', '9303', 'Čemerné', 0),
(145, 'email23@gmail.com', '8c182c1c605ee41ae38afade48c879cb796e606b9fb61bcb2c1167f8c9487e48', 'Bohumil', 'Fajnor', 'basic', 'Gymnázium', 'Stropkov, Konštantínova 64, 09101', 'Breznica 1', '9101', 'Stropkov', 0),
(146, 'email24@gmail.com', '9c508b2f01a72e08c5c1178e0c2a42a5c36a513e68e03a20c8ecf64f78e24434', 'Marcel', 'Gál', 'basic', 'Gymnázium', 'Vranov nad Topľou, Dr. C. Daxnera 88/3, 09380', 'Majerovce 1', '9409', 'Majerovce', 0),
(147, 'email25@gmail.com', '56db70b66519c6bb7090858faf613c9010f58639817c6f6e6336201e0c9c0978', 'Bohuš', 'Gavenda', 'basic', 'Gymnázium Ľudovíta Štúra', 'Zvolen, Hronská 1467/3, 96049', 'Ľ. Štúra 1', '96001', 'Zvolen', 0),
(148, 'email26@gmail.com', 'ebdbb233a605f6f940b0d1e9a435116aaf8c3c83267f49f8e022831f80419356', 'Sláva', 'Gavendová', 'basic', 'Gymnázium Milana Rúfusa', 'Žiar nad Hronom, J. Kollára 2, 96501', 'Janova Lehota 1', '96624', 'Janova Lehota', 0),
(149, 'email27@gmail.com', '4d7057e46594c60f3057734580a73d5b2bc874e61339b5e02a7d41d8c679273c', 'Mikuláš', 'Greguš', 'basic', 'Spojená škola cirkevná-Gymnázium sv. Cyrila a Metoda', 'Humenné, Duchnovičova 24, 06601', 'Ľubiša 1', '6711', 'Ľubiša', 0),
(150, 'email28@gmail.com', '148c3e3c6d1c6fb5c6a0976f439acf449e33a00ae4001cd7a5e8be60f56e33de', 'Elvíra', 'Habdušová', 'basic', 'Gymnázium', 'Bratislava-Ružinov, Metodova 2, 82108', 'Konopná 1', '90025', 'Čierna Voda', 0),
(151, 'email29@gmail.com', '3fdee3f040ed9131e24675c8efe826f40fe3bc0ccd9bc2e569eef8de3bf41fe6', 'Margita', 'Hagarová', 'basic', 'Gymnázium', 'Ružomberok, Š. Moyzesa 21, 03401', 'Vavra Šrobára 1', '3401', 'Ružomberok', 0),
(152, 'email30@gmail.com', 'a5991a8e1939cd8af7cc01392201fb36f7ca7d6ae22cce10fefb49fb098bb094', 'Blanka', 'Haňušková', 'basic', 'Stredná priemyselná škola elektrotechnická', 'Bratislava-Petržalka, Hálova 16, 85101', 'Parková 1', '90042', 'Alžbetin Dvor', 0),
(153, 'email31@gmail.com', '20096cbd364112ae052142cfcd54a714f65089596470f4f061fee1e4e709021c', 'Ervín', 'Harvánek', 'basic', 'Stredná priemyselná škola strojnícka', 'Bratislava-Staré Mesto, Fajnorovo nábrežie 5, 81475', 'Stromová 1', '90101', 'Malacky', 0),
(154, 'email32@gmail.com', 'a657bf50b9f31874b6a22de8f7505a1dc1a5615251f2bf4f94c79a613c18428a', 'Petronela', 'Hlaváčiková', 'basic', 'Stredná odborná škola sv. Jozefa Robotníka', 'Žilina, Saleziánska 18, 01001', 'Družstevná 1', '1004', 'Bánová', 0),
(155, 'email33@gmail.com', '1379b67dbf88ccc0ac45acf5eb67c539c000e83872b4df4cc6b980919965297b', 'Mário', 'Hoza', 'basic', 'Gymnázium', 'Snina, Študentská 4, 06901', 'Parková 1', '6761', 'Stakčín', 0),
(156, 'email34@gmail.com', '5e2dbb6d1e2ff333641282bf59a13dc1d5e572324b666d380f097de83c33c68e', 'Miroslav', 'Husťák', 'basic', 'Gymnázium', 'Myjava, Jablonská 5, 90701', 'SNP 1', '91601', 'Stará Turá', 0),
(157, 'email35@gmail.com', '5c15f0b8d80da2e05553182aa7f8a34da110893a7329de64ce14e04647ed2103', 'Félix', 'Janček', 'basic', 'Spojená škola-Stredná priemyselná škola elektrotechnická S. A. Jedlika', 'Nové Zámky, Komárňanská 28, 94075', 'Zemné 1', '94122', 'Zemné', 0),
(158, 'email36@gmail.com', 'f0f005ac370d18e06c2ebb733b9b2be87815651bc20d5bd5bd8481bdbfba1e92', 'Karol', 'Jantošovič', 'basic', 'Spojená škola-Gymnázium Jura Hronca', 'Bratislava-Ružinov, Novohradská 3, 82109', 'Suché Miesto 1', '90025', 'Chorvátsky Grob', 0),
(159, 'email37@gmail.com', '121521e00b11587d571ece2cb01747db456fcc1a4a778be3b1239ff364567c76', 'Oldrich', 'Junás', 'basic', 'Stredná priemyselná škola', 'Dubnica nad Váhom, Obrancov mieru 343/1, 01841', 'Farská 1', '1861', 'Beluša', 0),
(160, 'email38@gmail.com', 'f39e6cdadf5abf3a4a9355deab0f90fb29286b316178c98aec556f39835bc491', 'Teodor', 'Kolár', 'basic', 'Stredná priemyselná škola elektrotechnická', 'Prešov, Plzenská 1, 08047', 'Šarišské Jastrabie 1', '6548', 'Šarišské Jastrabie', 0),
(161, 'email39@gmail.com', '269d94b757db39c1e03f829d11655f4d7973acb806d8d47cb58c58dee25a9fff', 'Teodor', 'Kolník', 'basic', 'Spojená škola-Gymnázium Jura Hronca', 'Bratislava-Ružinov, Novohradská 3, 82109', 'Štefana Králika 1', '84108', 'Bratislava', 0),
(162, 'email40@gmail.com', '8fd2712fc33e432833e785c245baa257f388030bfb37c2de2c11caeedd321c2d', 'Silvia', 'Krajčová', 'basic', 'Stredná odborná škola elektrotechnická', 'Poprad, Hlavná 1400/1, 05951', 'Vlkovce 1', '5971', 'Vlkovce', 0),
(163, 'email41@gmail.com', 'ce8948e65e371032cd9b9eb40a338d6bc2482fce03ee1d4e7e6dfcd553b4a0de', 'Drahoslava', 'Kubecová', 'basic', 'Gymnázium Matky Alexie', 'Bratislava-Staré Mesto, Jesenského 4/A, 81102', 'A.Dubčeka 1', '90301', 'Senec', 0),
(164, 'email42@gmail.com', 'a48efa8ac7203844a3b7fd30f23cedb0c9400a01f12f89ad0325d88ee9392c94', 'Martin', 'Martinek', 'basic', 'Súkromná stredná odborná škola podnikania', 'Senica, Hollého 1380, 90501', 'J.Mudrocha 1', '90501', 'Sotina', 0),
(165, 'email43@gmail.com', 'efb5760a2cdc33ab4a0b0d9dcfaaaddf01d469c310e5849b686e53a67eb106f3', 'Svätopluk', 'Maslo', 'basic', 'Gymnázium Ľudovíta Štúra', 'Zvolen, Hronská 1467/3, 96049', 'Centrum 1', '96001', 'Zvolen', 0),
(166, 'email44@gmail.com', '3b331c1f5c9a497ac382d0c4d45bed03b7aa133677d4ba198bdec4d82e53a9c6', 'Beňadik', 'Melicher', 'basic', 'Gymnázium Hansa Selyeho s vyučovacím jazykom maďarským', 'Komárno, Biskupa Királya 5, 94501', 'Veľké Ludince 1', '93565', 'Veľké Ludince', 0),
(167, 'email45@gmail.com', 'b88362cdccdc5dad13b874705bc17a817524bd83a36f84f8ff68278a6a1f9071', 'Peter', 'Michalko', 'basic', 'Elektrotechnicka a stavebna škola \'Nikola Tesla\'', 'Narodnog Fronta 1, 23000 Zrenjanin', 'Ive Lole Ribara 1', '26215', 'Padina', 0),
(168, 'email46@gmail.com', '1960143716aea283dd2b4c9bfefec84fa02374c3b26521143b872f2b072e4464', 'Bystrík', 'Mrazko', 'basic', 'Spojená škola sv. Františka z Assisi-Gymnázium sv. Františka z Assisi', 'Bratislava-Karlova Ves, Karloveská 32, 84104', 'Ľudovíta Fullu 1', '84105', 'Bratislava', 0),
(169, 'email47@gmail.com', '582dbd98ed6251527622ce859536abc7a8088f940622a532a6d5d7d4391420c1', 'Zdenko', 'Novák', 'basic', 'Stredná odborná škola technická', 'Šurany, Nitrianska 61, 94201', 'Lipová 1', '94110', 'Tvrdošovce', 0),
(170, 'email48@gmail.com', '5ccaa3e11a72e937b269eccb15fde7658eb2a24e23f75dd61246989c8eb179ce', 'Roman', 'Palo', 'basic', 'Stredná priemyselná škola elektrotechnická', 'Bratislava-Petržalka, Hálova 16, 85101', 'Kostolná pri Dunaji 1', '90301', 'Kostolná pri Dunaji', 0),
(171, 'email49@gmail.com', '82f7aac285f7e91d9cd26f4a80473efd919b69fb92a1c6309a27bad3536daa96', 'Róbert', 'Paľov', 'basic', 'Stredná priemyselná škola elektrotechnická', 'Bratislava-Petržalka, Hálova 16, 85101', 'Kadnárova 1', '83151', 'Bratislava - Rača', 0),
(172, 'email50@gmail.com', 'd9d3b07141f7595a6c0c36ae42f1cfcffecb31f9f9e69c1cb12ea7bf7ef9cb70', 'Viliam', 'Paulik', 'basic', 'Stredná priemyselná škola', 'Dubnica nad Váhom, Obrancov mieru 343/1, 01841', 'Dolná Súča 1', '91332', 'Dolná Súča', 0),
(173, 'email51@gmail.com', '7877df511973ba783e07a2972e51227f5d41e6e5c9c56e88d93349d1e0515cc6', 'Severín', 'Pavliček', 'basic', 'Stredná odborná škola informačných technológií', 'Bratislava-Rača, Hlinícka 1, 83152', 'Sokolská 1', '90872', 'Závod', 0),
(174, 'email52@gmail.com', 'ce8cfef2806961a2722fd0c3907d7ebd818f6148116a7f643ae4a25c88e0d992', 'Belo', 'Pavúk', 'basic', 'Gymnázium Ivana Horvátha', 'Bratislava-Ružinov, Ivana Horvátha 14, 82103', 'Lotyšská 1', '82106', 'Bratislava - Podunajské Biskupice', 0),
(175, 'email53@gmail.com', '334c5eb96cf085e84a87802bb07f68763d6e8e5f6d7f68c10f00ce5c905b2133', 'Marek', 'Petruška', 'basic', 'Stredná priemyselná škola', 'Bardejov, Komenského 5, 08542', 'Vaniškovce 1', '8641', 'Vaniškovce', 0),
(176, 'email54@gmail.com', 'e59891fd481b278bfe9ddb02128ddb0f21c3ede1ddd537316c14c2f4f7f5863d', 'Viktor', 'Šimko', 'basic', 'Spojená škola-Športové gymnázium', 'Nitra, Slančíkovej 2, 95050', 'Narcisová 1', '94901', 'Nitra', 0),
(177, 'email55@gmail.com', '79d6b38588eca7d4893067d5ac722fb70b531c49a893d358a6dfc3928bf9a6de', 'Blažej', 'Škantár', 'basic', 'Stredná odborná škola technická', 'Michalovce, Partizánska 1, 07192', 'Jovsa 1', '7232', 'Jovsa', 0),
(178, 'email56@gmail.com', 'cfa5fa837cabe68338f77c49e76394836c4d5171a1e7dd7f3cab1bb589b1e7a7', 'Dobroslav', 'Višňovský', 'basic', 'Spojená škola-Športové gymnázium', 'Nitra, Slančíkovej 2, 95050', 'Chmeľová dolina 1', '94901', 'Zobor', 0);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `USER_PATH`
--

CREATE TABLE `USER_PATH` (
  `UserPath_id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_trasa` int(11) NOT NULL,
  `aktivnost` varchar(10) NOT NULL,
  `progres` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sťahujem dáta pre tabuľku `USER_PATH`
--

INSERT INTO `USER_PATH` (`UserPath_id`, `id_user`, `id_trasa`, `aktivnost`, `progres`) VALUES
(1, 1, 40, '1', 10),
(2, 2, 41, '0', 50);

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
-- Indexy pre tabuľku `POKROKY`
--
ALTER TABLE `POKROKY`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `TRASA`
--
ALTER TABLE `TRASA`
  ADD PRIMARY KEY (`Trasa_id`);

--
-- Indexy pre tabuľku `USER`
--
ALTER TABLE `USER`
  ADD PRIMARY KEY (`User_id`);

--
-- Indexy pre tabuľku `USER_PATH`
--
ALTER TABLE `USER_PATH`
  ADD PRIMARY KEY (`UserPath_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT pre tabuľku `POKROKY`
--
ALTER TABLE `POKROKY`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT pre tabuľku `TRASA`
--
ALTER TABLE `TRASA`
  MODIFY `Trasa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;
--
-- AUTO_INCREMENT pre tabuľku `USER`
--
ALTER TABLE `USER`
  MODIFY `User_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;
--
-- AUTO_INCREMENT pre tabuľku `USER_PATH`
--
ALTER TABLE `USER_PATH`
  MODIFY `UserPath_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
