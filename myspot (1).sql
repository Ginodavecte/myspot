-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1:3307
-- Gegenereerd op: 09 jan 2018 om 23:47
-- Serverversie: 10.1.19-MariaDB
-- PHP-versie: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myspot`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `businessspots`
--

CREATE TABLE `businessspots` (
  `id` int(11) NOT NULL,
  `Location` varchar(255) NOT NULL,
  `Ownerid` varchar(255) NOT NULL,
  `AvailableSpots` int(11) NOT NULL,
  `TotalSpots` int(11) NOT NULL,
  `CurrentUsers` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `businessspots`
--

INSERT INTO `businessspots` (`id`, `Location`, `Ownerid`, `AvailableSpots`, `TotalSpots`, `CurrentUsers`) VALUES
(1, 'Rotterdam', '', 4, 0, 0),
(2, 'Groningen', '4', 5, 0, 0);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `codegorillausers`
--

CREATE TABLE `codegorillausers` (
  `UserID` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `Name` text NOT NULL,
  `E-mail` varchar(255) NOT NULL,
  `Present` tinyint(1) NOT NULL,
  `TimeArrival` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP
) ;

--
-- Gegevens worden geëxporteerd voor tabel `codegorillausers`
--

INSERT INTO `codegorillausers` (`UserID`, `location_id`, `Name`, `E-mail`, `Present`, `TimeArrival`, `TimeDeparture`) VALUES
(3, 0, 'ttttt', '89089', 7, '2018-01-07 10:59:46.851338', '2018-01-07 10:59:46.851338'),
(5, 0, 'yhgkjh', 'jtyf', 2, '2018-01-07 10:59:58.091135', '2018-01-07 10:59:58.091135');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `usertype` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `telefoon` int(25) NOT NULL,
  `email` varchar(255) NOT NULL,
  `points` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `users`
--

INSERT INTO `users` (`id`, `usertype`, `name`, `telefoon`, `email`, `points`, `username`, `password`) VALUES
(4, 2, 'JAAP', 22, '3@3.nl', 0, '3', '$2a$10$SUkuXLYW4ScrV6Fk7ap3POjdI2I1kSP8pgcxbrVpYaRnQhSgPD7f2'),
(5, 2, 'Hans', 123, 'l@l.nl', 0, 'l', '$2a$10$ZluyE62T9KKaqDfnfm24aOyiCfuSq/Ju/J5n6z/qqTxOSYsS7UfCa'),
(6, 2, 'Piet', 321, 'k@k.nl', 10, 'k', '$2a$10$4QtbpR1/YWsi3mMG/BTExu3ZDcNWKNwkEmzOFZwpoH7g6Qhn5smlq');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `usertype`
--

CREATE TABLE `usertype` (
  `id` int(11) NOT NULL,
  `function` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `usertype`
--

INSERT INTO `usertype` (`id`, `function`) VALUES
(1, 'Medewerker'),
(2, 'Bezoeker');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `businessspots`
--
ALTER TABLE `businessspots`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usertype` (`usertype`);

--
-- Indexen voor tabel `usertype`
--
ALTER TABLE `usertype`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `businessspots`
--
ALTER TABLE `businessspots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT voor een tabel `codegorillausers`
--
ALTER TABLE `codegorillausers`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT voor een tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT voor een tabel `usertype`
--
ALTER TABLE `usertype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`usertype`) REFERENCES `usertype` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
