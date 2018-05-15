-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Hostiteľ: localhost
-- Čas generovania: Út 15.Máj 2018, 19:56
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
(65, 'taiwin.white@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'Eugen', 'Ľaňo', 'basic', 'Gymnázium', 'Einsteinova 35, Bratislava', 'Plynárenská', '83111', 'Bratislava'),
(66, 'email1@gmail.com', '0d132b37ddaa7249cf83baf97886e99415ce4b461eb22085d8ae183f91dbc0df', 'Štefan', 'Abrahám', 'basic', 'Gymnázium Martina Kukučína', 'Revúca, V. Clementisa 1166/21, 05001', 'Revúcka Lehota 1', '4918', 'Revúcka Lehota'),
(67, 'email2@gmail.com', '0a5c98020b5d9187d31b18fbfb58df299a6f100262bca73c6b20224bb64a9dc6', 'Albert', 'Adamec', 'basic', 'Stredná odborná škola strojnícka', 'Považská Bystrica, Športovcov 341/2, 01749', 'Sládkovičova 1', '1701', 'Považská Bystrica'),
(68, 'email3@gmail.com', '23a684822f199bde83a5a40f5b097bbc5c04ca9fbb075d091a4e66a3abcd5068', 'Adela', 'Andrášová', 'basic', 'Súkromná stredná odborná škola', 'Poprad, Ul. 29. augusta 4812, 05801', 'Tatranská Lomnica 1', '5960', 'Tatranská Lomnica'),
(69, 'email4@gmail.com', '2145069045351e1fe39d0e6aec4e3753e4ca687203ebc1d666fa6ba4c9dda290', 'Adrián', 'Baran', 'basic', 'Stredná priemyselná škola elektrotechnická', 'Bratislava-Petržalka, Hálova 16, 85101', 'Bartókova 1', '81102', 'Bratislava'),
(70, 'email5@gmail.com', '47706f71bf54b83852f9636ff4aa3758b886b238f6f944eb2e8317b832856060', 'Eunika', 'Bašková', 'basic', 'Gymnázium arm. gen. Ludvíka Svobodu', 'Humenné, Komenského 4, 06601', 'Partizánska 1', '6601', 'Humenné'),
(71, 'email6@gmail.com', '8c683efeb905d606466f9f886cfd4b4094157c0e6fc295097c9fd4af374787d5', 'Ester', 'Beňová', 'basic', 'Gymnázium Antona Bernoláka', 'Námestovo, Ulica mieru 307/23, 02901', 'Novoť 1', '2955', 'Novoť'),
(72, 'email7@gmail.com', '9f6f91753b14d6cea4e395dfa1dccc8750ddb73222b8bcf6414ab99c6884e4eb', 'Ľubomír', 'Bernolák', 'basic', 'Stredná priemyselná škola elektrotechnická', 'Bratislava-Petržalka, Hálova 16, 85101', 'Wolkrova 1', '85101', 'Bratislava - Petržalka'),
(73, 'email8@gmail.com', '856e289a6ce5d6abc6456a3e3b972b2ac5706b6174e848bb3ea39965f7369e66', 'Norbert', 'Bernolák', 'basic', 'Gymnázium', 'Myjava, Jablonská 5, 90701', 'Poriadie 1', '90622', 'Poriadie'),
(74, 'email9@gmail.com', '68cfbd5c50bf04c6d1ca5e9486a3e005cc8be64f9b6f346f4898d9b16c705895', 'Jozef', 'Bilek', 'basic', 'Stredná priemyselná škola', 'Dubnica nad Váhom, Obrancov mieru 343/1, 01841', 'Neporadza 1', '91326', 'Neporadza'),
(75, 'email10@gmail.com', '7666068384448d7f70b4fed70c75fe1f7cf9e7072b15362446ef641be68e24a7', 'Iveta', 'Boreková', 'basic', 'Stredná odborná škola polytechnická', 'Humenné, Štefánikova 1550/20, 06601', 'Puškinova 1', '9303', 'Vranov nad Topľou'),
(76, 'email11@gmail.com', '18c4bc3c38e2b2108d5ad60d40e2bafab35e233380c6f6d312c5e323b22e973e', 'Enna', 'Bóriková', 'basic', 'Gymnázium', 'Vranov nad Topľou, Dr. C. Daxnera 88/3, 09380', 'Lúčna 1', '9301', 'Vranov nad Topľou'),
(77, 'email12@gmail.com', '46a003a90a71f715258aa8dbf08cff7f8b715bb71e8a0c823d5ccc7c808698da', 'Natália', 'Cesnaková', 'basic', 'Stredná priemyselná škola elektrotechnická', 'Bratislava-Petržalka, Hálova 16, 85101', 'Hostáď 1', '93036', 'Čečínska Potôň'),
(78, 'email13@gmail.com', '44a97c6cbd1358001d8d80422e4fef73720f9383ff19028159c6f361d535f682', 'Karina', 'Dávidová', 'basic', 'Stredná priemyselná škola elektrotechnická', 'Bratislava-Petržalka, Hálova 16, 85101', 'Dolná 1', '90051', 'Zohor'),
(79, 'email14@gmail.com', 'ff569fc0c389202cea97828b9b0c62e395688f531696f0b4e2e500cade8c35d5', 'Alana', 'Debnárová', 'basic', 'Spojená škola-Stredná odborná škola technická', 'Prešov, Ľ. Podjavorinskej 22, 08005', 'L. Novomeského 1', '8001', 'Prešov'),
(80, 'email15@gmail.com', '220e8b5a5d41178038c9f8359da084234702de3ab89db9fcf9afff0015489e5a', 'Koloman', 'Devečka', 'basic', 'Stredná odborná škola obchodu a služieb', 'Nové Mesto nad Váhom, Piešťanská 2262/80, 91501', 'Ivanovce 1', '91305', 'Ivanovce'),
(81, 'email16@gmail.com', 'f62a538b7656cd582f9ee5a6e615517f6e08cc90a3bf45bb91db4891b3c877ec', 'Zoja', 'Doležalová', 'basic', 'Gymnázium', 'Považská Bystrica, Školská 234/8, 01701', 'Riečna 1', '2001', 'Hrabovka'),
(82, 'email17@gmail.com', '737a75b14886c214a94963bc2f0e0143a4f08ec6401f4bf0ef68b36f467ab53f', 'Tibor', 'Dorko', 'basic', 'Gymnázium Ľudovíta Štúra', 'Zvolen, Hronská 1467/3, 96049', 'Neresnická 1', '96261', 'Dobrá Niva'),
(83, 'email18@gmail.com', '5d951dc02403e59103430d347c1805e1cdbde5010759d015654cf87e1c4cec92', 'Miloslav', 'Droppa', 'basic', 'Gymnázium', 'Vranov nad Topľou, Dr. C. Daxnera 88/3, 09380', 'Vyšný Žipov 1', '9433', 'Vyšný Žipov'),
(84, 'email19@gmail.com', '935cc9076adf2e24d1e8c57b9a639bb067165ffa2041b8877ee348d4bd110d01', 'Iveta', 'Dudiková', 'basic', 'Stredná priemyselná škola elektrotechnická', 'Bratislava-Petržalka, Hálova 16, 85101', 'Hraničiarska 1', '85110', 'Bratislava - Čunovo'),
(85, 'email20@gmail.com', 'fc5f5f740a77083c32d66eec4494ebf2e0359b6a14547c30baf2b19824332891', 'Olívia', 'Ďuricová', 'basic', 'Gymnázium Pavla Horova', 'Michalovce, Masarykova 1, 07179', 'Hradská 1', '7215', 'Budkovce'),
(86, 'email21@gmail.com', 'cbc9080b09c05fe6ab450e6e6237ede5eff5e8334cac52ebbef83be671ba80d1', 'Svetozár', 'Ďurka', 'basic', 'Stredná priemyselná škola elektrotechnická', 'Bratislava-Petržalka, Hálova 16, 85101', 'Jasovská 1', '85107', 'Bratislava'),
(87, 'email22@gmail.com', '2ac9d8fd1ed8e8f14bc6e69469567da584cee51ffc563d0d733a0650bec93a28', 'Jela', 'Ďurová', 'basic', 'Gymnázium', 'Vranov nad Topľou, Dr. C. Daxnera 88/3, 09380', 'Puškinova 1', '9303', 'Čemerné'),
(88, 'email23@gmail.com', 'd57735a166c71393568d16dcc8adbf74dd9f71fee85e4835ea7ea8088f19af5c', 'Bohumil', 'Fajnor', 'basic', 'Gymnázium', 'Stropkov, Konštantínova 64, 09101', 'Breznica 1', '9101', 'Stropkov'),
(89, 'email24@gmail.com', '03c3e53caba35b3e21fe07eb9d2f4bba6abbba77697cb3e9ef6bfa90a119b356', 'Marcel', 'Gál', 'basic', 'Gymnázium', 'Vranov nad Topľou, Dr. C. Daxnera 88/3, 09380', 'Majerovce 1', '9409', 'Majerovce'),
(90, 'email25@gmail.com', '725e22dbeff515ba7574db3ab9f7f00ad5f894d9cb1bb93f444067029a47f884', 'Bohuš', 'Gavenda', 'basic', 'Gymnázium Ľudovíta Štúra', 'Zvolen, Hronská 1467/3, 96049', 'Ľ. Štúra 1', '96001', 'Zvolen'),
(91, 'email26@gmail.com', 'aba08587d7fde1164f0bc2051c4363ce09413be68e77294fe4436c85ac015f5f', 'Sláva', 'Gavendová', 'basic', 'Gymnázium Milana Rúfusa', 'Žiar nad Hronom, J. Kollára 2, 96501', 'Janova Lehota 1', '96624', 'Janova Lehota'),
(92, 'email27@gmail.com', '62464c035d1bbd45c5494e402d51efe880ed0f11f7c14c61bed19bd59ad1518e', 'Mikuláš', 'Greguš', 'basic', 'Spojená škola cirkevná-Gymnázium sv. Cyrila a Metoda', 'Humenné, Duchnovičova 24, 06601', 'Ľubiša 1', '6711', 'Ľubiša'),
(93, 'email28@gmail.com', 'a28691c5080c424577603807977d5f6c7f723c4e01557dc7bb2c68942aa22823', 'Elvíra', 'Habdušová', 'basic', 'Gymnázium', 'Bratislava-Ružinov, Metodova 2, 82108', 'Konopná 1', '90025', 'Čierna Voda'),
(94, 'email29@gmail.com', '545a8155a11388f9b2dda76d60ee6c96c7fcf5ef7e758c26d0fdaa5b2059d72a', 'Margita', 'Hagarová', 'basic', 'Gymnázium', 'Ružomberok, Š. Moyzesa 21, 03401', 'Vavra Šrobára 1', '3401', 'Ružomberok'),
(95, 'email30@gmail.com', '5a69fcf691834728210752167a349c5734fe828445a028c2203ac758f6eae7fd', 'Blanka', 'Haňušková', 'basic', 'Stredná priemyselná škola elektrotechnická', 'Bratislava-Petržalka, Hálova 16, 85101', 'Parková 1', '90042', 'Alžbetin Dvor'),
(96, 'email31@gmail.com', 'a531e4575b273213997ebb367b85ce38abe0408cad8bd1cf86380e2fe887ebab', 'Ervín', 'Harvánek', 'basic', 'Stredná priemyselná škola strojnícka', 'Bratislava-Staré Mesto, Fajnorovo nábrežie 5, 81475', 'Stromová 1', '90101', 'Malacky'),
(97, 'email32@gmail.com', '93ad06c8ee8100e3f472d5ab57c7d4eeb0e026ce26f922b2af5ebab6eec5baec', 'Petronela', 'Hlaváčiková', 'basic', 'Stredná odborná škola sv. Jozefa Robotníka', 'Žilina, Saleziánska 18, 01001', 'Družstevná 1', '1004', 'Bánová'),
(98, 'email33@gmail.com', '2620024a411ad33182027c234250ffcb212d5b231c8fad49d07f5fa439504b2e', 'Mário', 'Hoza', 'basic', 'Gymnázium', 'Snina, Študentská 4, 06901', 'Parková 1', '6761', 'Stakčín'),
(99, 'email34@gmail.com', 'aec13aa8aadce042ffce9c8ef7b1979605f001dbfb0070441993a1a1cb6c0fc2', 'Miroslav', 'Husťák', 'basic', 'Gymnázium', 'Myjava, Jablonská 5, 90701', 'SNP 1', '91601', 'Stará Turá'),
(100, 'email35@gmail.com', 'd5840d4167d2752e81cb15af749fed962345474081830cf97f337dc952c4a432', 'Félix', 'Janček', 'basic', 'Spojená škola-Stredná priemyselná škola elektrotechnická S. A. Jedlika', 'Nové Zámky, Komárňanská 28, 94075', 'Zemné 1', '94122', 'Zemné'),
(101, 'email36@gmail.com', '20945766a40bb572a22ff385ba52c2434e7c74240be2c4e2808911acf790e4b2', 'Karol', 'Jantošovič', 'basic', 'Spojená škola-Gymnázium Jura Hronca', 'Bratislava-Ružinov, Novohradská 3, 82109', 'Suché Miesto 1', '90025', 'Chorvátsky Grob'),
(102, 'email37@gmail.com', '30f915a0a5a2978b19613b8311b81faa3dfc03bb3ed6d1cd18f894bc3d9461a8', 'Oldrich', 'Junás', 'basic', 'Stredná priemyselná škola', 'Dubnica nad Váhom, Obrancov mieru 343/1, 01841', 'Farská 1', '1861', 'Beluša'),
(103, 'email38@gmail.com', 'e4ae862d146da59976d1eb0ff646d834b4203b02332d254d6bf333dd7c359427', 'Teodor', 'Kolár', 'basic', 'Stredná priemyselná škola elektrotechnická', 'Prešov, Plzenská 1, 08047', 'Šarišské Jastrabie 1', '6548', 'Šarišské Jastrabie'),
(104, 'email39@gmail.com', '0f14e785593ad4a4ba220b00ad0dc988b068d9a631e7d49ff0f3ab865334387e', 'Teodor', 'Kolník', 'basic', 'Spojená škola-Gymnázium Jura Hronca', 'Bratislava-Ružinov, Novohradská 3, 82109', 'Štefana Králika 1', '84108', 'Bratislava'),
(105, 'email40@gmail.com', 'ddcde10da3c91888f992e18b227b326d79452c89f1768f919427d4a4ada1803f', 'Silvia', 'Krajčová', 'basic', 'Stredná odborná škola elektrotechnická', 'Poprad, Hlavná 1400/1, 05951', 'Vlkovce 1', '5971', 'Vlkovce'),
(106, 'email41@gmail.com', '8e3d746f83f548f30fe9d83f629348686459b3b85c95bf24f22f9e86be4c7bcc', 'Drahoslava', 'Kubecová', 'basic', 'Gymnázium Matky Alexie', 'Bratislava-Staré Mesto, Jesenského 4/A, 81102', 'A.Dubčeka 1', '90301', 'Senec'),
(107, 'email42@gmail.com', '3d88c4e4670162053e9dfecb2f1dd443c3e13a632330e2a09d3ab9e19f3c32e4', 'Martin', 'Martinek', 'basic', 'Súkromná stredná odborná škola podnikania', 'Senica, Hollého 1380, 90501', 'J.Mudrocha 1', '90501', 'Sotina'),
(108, 'email43@gmail.com', 'a8ab050195f493ae48877694ae7809da49cffd96802567890232ea7c47331577', 'Svätopluk', 'Maslo', 'basic', 'Gymnázium Ľudovíta Štúra', 'Zvolen, Hronská 1467/3, 96049', 'Centrum 1', '96001', 'Zvolen'),
(109, 'email44@gmail.com', '0ee26ef9bd1c15f794d0177c6ee23f33f0f5342c9aaad7b2ac000ee622aa3364', 'Beňadik', 'Melicher', 'basic', 'Gymnázium Hansa Selyeho s vyučovacím jazykom maďarským', 'Komárno, Biskupa Királya 5, 94501', 'Veľké Ludince 1', '93565', 'Veľké Ludince'),
(110, 'email45@gmail.com', '078ab472517948c94f31c87d9ec5f2b9e7cc47f0ab267cc06f5da1d1bddc8fa9', 'Peter', 'Michalko', 'basic', 'Elektrotechnicka a stavebna škola \'Nikola Tesla\'', 'Narodnog Fronta 1, 23000 Zrenjanin', 'Ive Lole Ribara 1', '26215', 'Padina'),
(111, 'email46@gmail.com', '2511d3cd0c1266b2639d0b2da4ec03bb357afd70b7f165ec4783cb4a5daa946e', 'Bystrík', 'Mrazko', 'basic', 'Spojená škola sv. Františka z Assisi-Gymnázium sv. Františka z Assisi', 'Bratislava-Karlova Ves, Karloveská 32, 84104', 'Ľudovíta Fullu 1', '84105', 'Bratislava'),
(112, 'email47@gmail.com', '7712073f5cb557acfb890e46fa16d86c4a878de81049eb4d21ec5724094b0fbd', 'Zdenko', 'Novák', 'basic', 'Stredná odborná škola technická', 'Šurany, Nitrianska 61, 94201', 'Lipová 1', '94110', 'Tvrdošovce'),
(113, 'email48@gmail.com', '1c6989e53694e10cc757a6b933da36e42d317f47c2d5169cb85cd2542aad3eb0', 'Roman', 'Palo', 'basic', 'Stredná priemyselná škola elektrotechnická', 'Bratislava-Petržalka, Hálova 16, 85101', 'Kostolná pri Dunaji 1', '90301', 'Kostolná pri Dunaji'),
(114, 'email49@gmail.com', 'ab8f2469a08f011d5b3b6aff5f957cd77b2bcb8fcfc28252090f0ac56c86d523', 'Róbert', 'Paľov', 'basic', 'Stredná priemyselná škola elektrotechnická', 'Bratislava-Petržalka, Hálova 16, 85101', 'Kadnárova 1', '83151', 'Bratislava - Rača'),
(115, 'email50@gmail.com', '7638cdb9fe270ecb11ea4e0ac61056f6824673f4938b4590207f4273b47472ba', 'Viliam', 'Paulik', 'basic', 'Stredná priemyselná škola', 'Dubnica nad Váhom, Obrancov mieru 343/1, 01841', 'Dolná Súča 1', '91332', 'Dolná Súča'),
(116, 'email51@gmail.com', '6fa6dc343150996bf02700e645e655963f911c6ec0ebe08638e21b4430566bbe', 'Severín', 'Pavliček', 'basic', 'Stredná odborná škola informačných technológií', 'Bratislava-Rača, Hlinícka 1, 83152', 'Sokolská 1', '90872', 'Závod'),
(117, 'email52@gmail.com', '4bb5dc220fff6043eca2ebd7d39f874cec6f9900605267f82ed6efecf1dafa0e', 'Belo', 'Pavúk', 'basic', 'Gymnázium Ivana Horvátha', 'Bratislava-Ružinov, Ivana Horvátha 14, 82103', 'Lotyšská 1', '82106', 'Bratislava - Podunajské Biskupice'),
(118, 'email53@gmail.com', '7c6f43b3e11c79c60e6f9a34bddff4b1305c10e3290dce360b0e9a739dcefec9', 'Marek', 'Petruška', 'basic', 'Stredná priemyselná škola', 'Bardejov, Komenského 5, 08542', 'Vaniškovce 1', '8641', 'Vaniškovce'),
(119, 'email54@gmail.com', '62a5c21109d03209ad3587c3c18efc15487bd4f7b4fccc08dbc7b3ba1f773f77', 'Viktor', 'Šimko', 'basic', 'Spojená škola-Športové gymnázium', 'Nitra, Slančíkovej 2, 95050', 'Narcisová 1', '94901', 'Nitra'),
(120, 'email55@gmail.com', 'fd9268ecbf161bef4c51a986ff35a2971875190a8021ed3ee0474607facf1d80', 'Blažej', 'Škantár', 'basic', 'Stredná odborná škola technická', 'Michalovce, Partizánska 1, 07192', 'Jovsa 1', '7232', 'Jovsa'),
(121, 'email56@gmail.com', '65ad539c65fe67fc9ad12201f4e691119edb3ce5e3aa39a91bbd735a86636f68', 'Dobroslav', 'Višňovský', 'basic', 'Spojená škola-Športové gymnázium', 'Nitra, Slančíkovej 2, 95050', 'Chmeľová dolina 1', '94901', 'Zobor');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
