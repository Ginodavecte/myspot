-- phpMyAdmin SQL Dump
-- version 4.5.1
-- 
http://www.phpmyadmin.net
--
-- 
Host: 127.0.0.1:3307
-- 
Gegenereerd op: 07 jan 2018 om 06:00
-- 
Serverversie: 10.1.19-MariaDB
-- 
PHP-versie: 5.6.28

SET 
SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

SET time_zone = "+00:00";


/*!40101 SE
T @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myspot`
--

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
(1, 1, 'KLAAS12', 66, '6@6.nl', 2, '6', '$2a$10$ivAa/LH8bcDMsAVm5BfAM.NZmeYYtFud9bgHDf4HyHdqLALjjsUTC'),
(4, 2, 'JAAP', 22, '3@3.nl', 0, '3', '$2a$10$SUkuXLYW4ScrV6Fk7ap3POjdI2I1kSP8pgcxbrVpYaRnQhSgPD7f2'),
(5, 2, 'Hans', 123, 'l@l.nl', 0, 'l', '$2a$10$ZluyE62T9KKaqDfnfm24aOyiCfuSq/Ju/J5n6z/qqTxOSYsS7UfCa'),
(6, 2, 'Piet', 321, 'k@k.nl', 10, 'k', '$2a$10$4QtbpR1/YWsi3mMG/BTExu3ZDcNWKNwkEmzOFZwpoH7g6Qhn5smlq'),
(7, 2, 'Peter', 123, 'p@p.nl', 0, 'p', '$2a$10$Pvwh95Kt3e2IfNs8.pP/HOcA5ZYsvBCqJHQwLu89AMKiHEJHsHtbS');

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
