-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 19 oct. 2022 à 15:01
-- Version du serveur : 10.4.25-MariaDB
-- Version de PHP : 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `wadfilms`
--
CREATE DATABASE IF NOT EXISTS `wadfilms` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `wadfilms`;
-- --------------------------------------------------------

--
-- Structure de la table `favori`
--

CREATE TABLE `favori` (
  `id` int(11) NOT NULL,
  `idFilm` int(11) NOT NULL,
  `idUtilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `film`
--

CREATE TABLE `film` (
  `id` int(11) NOT NULL,
  `titre` varchar(150) NOT NULL,
  `duree` int(11) NOT NULL,
  `description` text NOT NULL,
  `dateSortie` date NOT NULL,
  `image` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `film`
--

INSERT INTO `film` (`id`, `titre`, `duree`, `description`, `dateSortie`, `image`) VALUES
(12, 'Blonde', 0, '', '0000-00-00', '634ff49397ee32022-10-19-14-58-59MV5BNDk2YTA1MGYtMGNjMi00YTJlLWI1YjItMjBjOGJlZGIwZmYzXkEyXkFqcGdeQXVyODA0MjgyNzM@._V1_FMjpg_UX1000_.jpg'),
(13, 'The Woman King', 0, '', '0000-00-00', '634ff49e6fe112022-10-19-14-59-10thewomanking_onesheet_1400x2100.jpg'),
(14, 'Encanto', 0, '', '0000-00-00', '634ff4ae8040e2022-10-19-14-59-26p_encanto_homeent_22359_4892ae1c.jpeg');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `nom` varchar(200) NOT NULL,
  `login` varchar(200) NOT NULL,
  `password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `nom`, `login`, `password`) VALUES
(3, 'wad', 'wad@interface3.be', '$2y$12$qmNA5LChmxFNnF1YrV/3quXujUJS5j9qYCcqKgl.848eKzgtTyQAm'),
(4, 'Ele', 'ele@gmail.com', '$2y$12$3g.aBXl3wYIe7wxYZtce..LbWJJDjMBhiphN7369rOHlhQ0dHIuCS'),
(6, 'maya', 'maya@gmail.com', '$2y$12$y.P1Y1dHh/R25pOKG8Uh5eNNFEfR4BuWyoanUS1ER/MBJd9hM6aM6');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `favori`
--
ALTER TABLE `favori`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idFilm` (`idFilm`),
  ADD KEY `idUtilisateur` (`idUtilisateur`);

--
-- Index pour la table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `favori`
--
ALTER TABLE `favori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT pour la table `film`
--
ALTER TABLE `film`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `favori`
--
ALTER TABLE `favori`
  ADD CONSTRAINT `favori_ibfk_1` FOREIGN KEY (`idFilm`) REFERENCES `film` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favori_ibfk_2` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
