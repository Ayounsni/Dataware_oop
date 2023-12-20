-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 04 déc. 2023 à 14:41
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `dataware1`
--

-- --------------------------------------------------------

--
-- Structure de la table `equipes`
--

CREATE TABLE `equipes` (
  `id_equipe` int(11) NOT NULL,
  `Name_equipe` varchar(255) NOT NULL,
  `scrum_master_id` int(11) DEFAULT NULL,
  `date_creation` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `equipes`
--

INSERT INTO `equipes` (`id_equipe`, `Name_equipe`, `scrum_master_id`, `date_creation`) VALUES
(2, 'barcelona', 56, '2023-11-29'),
(3, 'real', 56, '2023-12-02'),
(14, 'admini', 59, '2023-12-01'),
(16, 'ayouuuuuuuuub', 59, '2023-12-10'),
(20, 'CODEX', 57, '2023-12-07'),
(21, 'nightcrawlers', 57, '2023-12-06');

-- --------------------------------------------------------

--
-- Structure de la table `projets`
--

CREATE TABLE `projets` (
  `id_projets` int(11) NOT NULL,
  `nom_projet` varchar(255) NOT NULL,
  `date_debut` date DEFAULT NULL,
  `equipe_id` int(11) DEFAULT NULL,
  `scrum_master_id` int(11) DEFAULT NULL,
  `status_projet` varchar(50) NOT NULL DEFAULT 'en cours',
  `date_fin` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `projets`
--

INSERT INTO `projets` (`id_projets`, `nom_projet`, `date_debut`, `equipe_id`, `scrum_master_id`, `status_projet`, `date_fin`) VALUES
(35, 'restaurant', '2023-12-21', 21, 54, 'en cours', '2024-01-06'),
(36, 'bizza', '2023-12-15', 16, 58, 'finaliser', '2023-12-23'),
(37, 'hayakkk', '2023-12-02', 16, 57, 'finaliser', '2023-12-23');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `First_name` varchar(255) NOT NULL,
  `Last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','product_owner','scrum_master') NOT NULL DEFAULT 'user',
  `id_equip` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id_user`, `First_name`, `Last_name`, `email`, `password`, `role`, `id_equip`) VALUES
(1, 'Doe', 'John', 'john.doe@example.com', 'motdepasse123', 'scrum_master', NULL),
(54, 'manal', 'najwa', 'ehh@gmaik.com', '123456789', 'scrum_master', NULL),
(56, 'Ayoub', 'Snini', 'Ayoubsnini@gmail.com', 'Manalmhsn', 'product_owner', NULL),
(57, 'kjkjj', 'Snini', 'fffd@ggf.com', 'ayoubsnini', 'scrum_master', NULL),
(58, 'khadija', 'liba', 'khadija@gmail.com', '12345678', 'scrum_master', NULL),
(59, 'oumaima', 'errada', 'Ayoubsniniii@gmail.com', '0663311599', 'scrum_master', NULL),
(60, 'mppkl', 'mppl', 'Ayoubsniiini@gmail.com', '123456789', 'user', 16),
(61, 'mpo', 'mloo', 'Ayoubsnini@gmailll.com', '123456789', 'user', NULL),
(62, 'yasser', 'hammed', 'yasser@hotmail.com', '123456789', 'user', NULL),
(63, 'zouhair ', 'ghoumri', 'zouhair@gmail.com', '123456789', 'user', NULL),
(64, 'meryem', 'snini', 'meryem@hotmail.com', '123456789', 'user', NULL),
(65, 'soumia', 'sahtani', 'soumia.sahtani@gmail.com', '12345678', 'user', NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `equipes`
--
ALTER TABLE `equipes`
  ADD PRIMARY KEY (`id_equipe`),
  ADD KEY `scrum_master_id` (`scrum_master_id`);

--
-- Index pour la table `projets`
--
ALTER TABLE `projets`
  ADD PRIMARY KEY (`id_projets`),
  ADD KEY `equipe_id` (`equipe_id`),
  ADD KEY `scrum_master_id` (`scrum_master_id`) USING BTREE;

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `id_equipe` (`id_equip`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `equipes`
--
ALTER TABLE `equipes`
  MODIFY `id_equipe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT pour la table `projets`
--
ALTER TABLE `projets`
  MODIFY `id_projets` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `equipes`
--
ALTER TABLE `equipes`
  ADD CONSTRAINT `equipes_ibfk_1` FOREIGN KEY (`scrum_master_id`) REFERENCES `users` (`id_user`);

--
-- Contraintes pour la table `projets`
--
ALTER TABLE `projets`
  ADD CONSTRAINT `projets_ibfk_1` FOREIGN KEY (`equipe_id`) REFERENCES `equipes` (`id_equipe`),
  ADD CONSTRAINT `projets_ibfk_2` FOREIGN KEY (`scrum_master_id`) REFERENCES `users` (`id_user`);

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`id_equip`) REFERENCES `equipes` (`id_equipe`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
