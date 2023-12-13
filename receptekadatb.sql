-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Dec 13. 10:27
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `receptekadatb`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `etelek`
--

CREATE TABLE `etelek` (
  `etelek_id` int(11) NOT NULL,
  `etelek_nev` varchar(255) NOT NULL,
  `etelek_tipus` int(11) NOT NULL,
  `etelek_kep` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `etelek`
--

INSERT INTO `etelek` (`etelek_id`, `etelek_nev`, `etelek_tipus`, `etelek_kep`) VALUES
(1, 'Sült paradicsom', 1, 'kep1.jpg'),
(2, 'Krémsajtos tojássaláta', 1, 'kep2.jpg'),
(3, 'Csikós tokány', 2, 'kep3.jpg'),
(4, 'Margó torony', 4, 'kep4.jpg'),
(5, 'Finom görögsaláta', 5, 'kep5.jpg'),
(6, 'Babgulyás', 3, 'kep6.jpg'),
(7, 'Linzerkarika', 4, 'kep7.jpg'),
(8, 'Gazpacho', 3, 'kep8.jpg'),
(9, 'Majonézes kukoricasaláta', 5, 'kep9.jpg'),
(10, 'Csirkemellpaprikás', 2, 'kep10.jpg'),
(11, 'Pulled pork', 2, 'kep11.jpg'),
(12, 'Bruschetta', 1, 'kep12.jpg'),
(13, 'Körtés-pudingos pite', 4, 'kep13.jpg'),
(14, 'Tojásleves', 3, 'kep14.jpg'),
(15, 'Majonézes krumplisaláta', 5, 'kep15.jpg'),
(16, 'Cobb saláta', 5, 'kep16.jpg'),
(17, 'Harcsaleves', 3, 'kep17.jpg'),
(18, 'Csokis muffin', 4, 'kep18.jpg'),
(19, 'Töltött tök', 2, 'kep19.jpg'),
(20, 'Fasírt', 1, 'kep20.jpg'),
(21, 'Hollandi mártás', 1, 'kep21.jpg'),
(22, 'Kapros lazactatár', 1, 'kep22.jpg'),
(23, 'Rántott karfiol', 2, 'kep23.jpg'),
(24, 'Vadas marha', 2, 'kep24.jpg'),
(25, 'Madeira sütemény', 4, 'kep25.jpg'),
(26, 'Rumos meggy parfé', 4, 'kep26.jpg'),
(27, 'Marhahúsleves', 3, 'kep27.jpg'),
(28, 'Ramen', 3, 'kep28.jpg'),
(29, 'Színes rizssaláta', 5, 'kep29.jpg'),
(30, 'Tzatziki Görög joghurttal', 5, 'kep30.jpg'),
(40, 'Asd', 4, 'photo_1702285718516_photo.jpg'),
(41, 'Hshsgs', 4, 'photo_1702294887540_photo.jpg'),
(42, 'Hshsgs', 4, 'photo_1702294912394_photo.jpg'),
(43, 'Iiii', 4, 'photo_1702295935750_photo.jpg');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `eteltipusok`
--

CREATE TABLE `eteltipusok` (
  `eteltipusok_id` int(11) NOT NULL,
  `eteltipusok_nev` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `eteltipusok`
--

INSERT INTO `eteltipusok` (`eteltipusok_id`, `eteltipusok_nev`) VALUES
(1, 'előételek'),
(2, 'főételek'),
(3, 'levesek'),
(4, 'desszertek'),
(5, 'saláták');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `etelek`
--
ALTER TABLE `etelek`
  ADD PRIMARY KEY (`etelek_id`),
  ADD KEY `etelek_tipus` (`etelek_tipus`);

--
-- A tábla indexei `eteltipusok`
--
ALTER TABLE `eteltipusok`
  ADD PRIMARY KEY (`eteltipusok_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `etelek`
--
ALTER TABLE `etelek`
  MODIFY `etelek_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT a táblához `eteltipusok`
--
ALTER TABLE `eteltipusok`
  MODIFY `eteltipusok_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `etelek`
--
ALTER TABLE `etelek`
  ADD CONSTRAINT `etelek_ibfk_1` FOREIGN KEY (`etelek_tipus`) REFERENCES `eteltipusok` (`eteltipusok_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
