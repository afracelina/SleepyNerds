-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 21 déc. 2024 à 11:33
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `hack`
--

-- --------------------------------------------------------

--
-- Structure de la table `blacklist`
--

CREATE TABLE `blacklist` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `numero_carte_identite` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `blacklist`
--

INSERT INTO `blacklist` (`id`, `nom`, `prenom`, `numero_carte_identite`) VALUES
(1, 'Lemoine', 'Marie', 'XYZ987654'),
(2, 'zii', 'exemple', '123456'),
(3, 'youcef', 'hadek houwa', 'ABCff3456'),
(4, 'youcefé', 'hadek houwa', 'ABCff3845'),
(6, 'Dupont', 'Jean', 'ABC125856');

-- --------------------------------------------------------

--
-- Structure de la table `citetouristique`
--

CREATE TABLE `citetouristique` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `localisation` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `citetouristique`
--

INSERT INTO `citetouristique` (`id`, `nom`, `description`, `localisation`, `image_url`) VALUES
(1, 'kasbah dells', 'Elle se compose dune haute Casbah et dune basse Casbah qui longe le port', 'boumerdes', 'https://www.elmoudjahid.com/storage/images/article/08c662af437dc949af7a0c4b6f9fe830.jpg'),
(2, 'Tour Eiffel', 'Un monument emblématique de Paris, offrant une vue panoramique de la ville.', '48.858844, 2.294351', 'tour_eiffel.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `complexes_touristiques`
--

CREATE TABLE `complexes_touristiques` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(100) NOT NULL DEFAULT 'complex',
  `num` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `complexes_touristiques`
--

INSERT INTO `complexes_touristiques` (`id`, `name`, `type`, `num`, `email`, `description`) VALUES
(1, 'Complexe Paradise', 'complex', '0123456789', 'contact@paradise.com', 'Un complexe touristique de luxe situé en bord de mer, avec des services exclusifs pour les clients.'),
(2, 'Mountain Retreat', 'complex', '0987654321', 'info@mountainretreat.com', 'Un complexe au sommet des montagnes, offrant des vues spectaculaires et des activités en plein air.'),
(3, 'Sunset Resort', 'complex', '0712345678', 'hello@sunsetresort.com', 'Un resort tranquille en bord de mer, idéal pour des vacances en famille avec de nombreuses commodités.');

-- --------------------------------------------------------

--
-- Structure de la table `hauberge`
--

CREATE TABLE `hauberge` (
  `id` int(11) NOT NULL,
  `type` enum('maison','camp') DEFAULT NULL,
  `capacite` int(11) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `emplacement` varchar(255) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `nbr_personne_reserve` int(11) DEFAULT NULL,
  `disponibilite` tinyint(1) DEFAULT NULL,
  `image_list` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`image_list`)),
  `offres` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`offres`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `hauberge`
--

INSERT INTO `hauberge` (`id`, `type`, `capacite`, `nom`, `emplacement`, `adresse`, `email`, `password`, `telephone`, `nbr_personne_reserve`, `disponibilite`, `image_list`, `offres`) VALUES
(7, 'maison', 50, 'Auberge de Jeunesse à isser', '35.612,-0.123', 'Adresse 1, isser', 'auberge_isser@example.com', 'password123', '+213555000001', 0, 1, '[]', '[]'),
(8, 'maison', 50, 'Maison de Jeunesse cap-djenet', '36.123,-0.456', 'Adresse 2, Janab', 'maison_djenet@example.com', 'password123', '+213555000002', 0, 1, '[]', '[]'),
(9, 'maison', 50, 'Auberge de Jeunesse Zemouri', '36.345,-0.789', 'Adresse 3, Zemouri', 'auberge_zemouri@example.com', 'password123', '+213555000003', 0, 1, '[\"https://lh3.googleusercontent.com/p/AF1QipML8EungGpNua5mSC6me5UWW9G5QJkWVIMIaKcZ=s680-w680-h510\"]', '[]'),
(10, 'maison', 50, 'Auberge de Jeunesse Karma', '36.567,-0.910', 'Adresse 4, Karma', 'auberge_karma@example.com', 'password123', '+213555000004', 0, 1, '[]', '[]'),
(11, 'maison', 50, 'Auberge Paradis', '36.752887, 3.042048', 'Rue des Palmiers, Alger', 'contact@aubergeparadis.com', '$2y$10$DJLPmUEvVnRuCf5ZbXgW0OW//106oZxk5rQ2QIzRWghX7A4XKVBt2', '+213123456789', 10, 1, '[\"image1.jpg\",\"image2.jpg\"]', '[\"Petit d\\u00e9jeuner gratuit\",\"Acc\\u00e8s Wi-Fi\"]'),
(12, 'maison', 50, 'Auberge Paradis', '36.752887, 3.042048', 'Rue des Palmiers, Alger', 'contact@aubergeparadis.com', '$2y$10$qzzyRxqAmeJ6A3NH35YghORlywJ67iTbhdp2loBKhw8ThY3dYniiO', '+213123456789', 10, 1, '[\"image1.jpg\",\"image2.jpg\"]', '[\"Petit d\\u00e9jeuner gratuit\",\"Acc\\u00e8s Wi-Fi\"]'),
(14, 'maison', 50, 'Auberge Paradis', '36.752887, 3.042048', 'Rue des Palmiers, Alger', 'contact@aubergeparadis.com', '$2y$10$WNf4BBEpTyAqt1rpDB0Xeepfx.qaEr/TEaY5Bp7Z7X9uTIIz82YgK', '+213123456789', 10, 1, '[\"image1.jpg\",\"image2.jpg\"]', '[\"Petit d\\u00e9jeuner gratuit\",\"Acc\\u00e8s Wi-Fi\"]');

-- --------------------------------------------------------

--
-- Structure de la table `hauberge_resident`
--

CREATE TABLE `hauberge_resident` (
  `id` int(11) NOT NULL,
  `hauberge_id` int(11) DEFAULT NULL,
  `resident_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `hauberge_resident`
--

INSERT INTO `hauberge_resident` (`id`, `hauberge_id`, `resident_id`) VALUES
(2, 10, 1);

-- --------------------------------------------------------

--
-- Structure de la table `hotel`
--

CREATE TABLE `hotel` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `capacite` int(11) DEFAULT NULL,
  `type` enum('luxury','economy','standard') DEFAULT NULL,
  `disponibilite` tinyint(1) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `hotel`
--

INSERT INTO `hotel` (`id`, `nom`, `adresse`, `email`, `telephone`, `capacite`, `type`, `disponibilite`, `description`, `url`) VALUES
(1, 'Hotel elamine', '123route boumerdes', 'contact@hotelroyal.com', '0142567890', 200, 'luxury', 1, 'Hôtel de luxe avec des chambres spacieuses, un spa, et une vue magnifique sur la ville.', ''),
(2, 'Hôtel Royal', '123 Rue de Paris, Lyon', 'contact@hotelroyal.com', '+33412345678', 100, 'luxury', 1, 'Un hôtel 5 étoiles situé au cœur de la ville.', '');

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `id` int(11) NOT NULL,
  `hauberge_id` int(11) DEFAULT NULL,
  `resident_id` int(11) DEFAULT NULL,
  `numero_chambre` int(11) DEFAULT NULL,
  `date_entree` date DEFAULT NULL,
  `date_sortie` date DEFAULT NULL,
  `nature_reservation` enum('Gratuit','Non Gratuit') DEFAULT NULL,
  `restauration_montant` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`id`, `hauberge_id`, `resident_id`, `numero_chambre`, `date_entree`, `date_sortie`, `nature_reservation`, `restauration_montant`) VALUES
(1, 7, 1, 2548, '2024-12-25', '2024-12-30', 'Non Gratuit', '50000.00'),
(5, 8, 1, 50, '2024-10-02', '2024-10-22', 'Gratuit', '12000.00'),
(9, 8, 1, 101, '2024-10-22', '2024-11-25', 'Gratuit', '1400.00'),
(10, 7, 1, 111, '2024-12-22', '2024-12-25', 'Gratuit', '15075.00'),
(15, 7, 1, 11, '2024-12-25', '2024-12-30', 'Non Gratuit', '150.00');

-- --------------------------------------------------------

--
-- Structure de la table `resident`
--

CREATE TABLE `resident` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `lieu_naissance` varchar(255) DEFAULT NULL,
  `sexe` enum('Homme','Femme') DEFAULT NULL,
  `numero_carte_identite` varchar(50) DEFAULT NULL,
  `permission_parentale` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `resident`
--

INSERT INTO `resident` (`id`, `nom`, `prenom`, `date_naissance`, `lieu_naissance`, `sexe`, `numero_carte_identite`, `permission_parentale`) VALUES
(1, 'Dupont', 'Jean', '1990-05-15', 'Paris', 'Homme', 'ABC123456', 1);

-- --------------------------------------------------------

--
-- Structure de la table `transports`
--

CREATE TABLE `transports` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `numero_ligne` varchar(50) DEFAULT NULL,
  `depart` varchar(100) NOT NULL,
  `destination` varchar(100) NOT NULL,
  `heure_depart` time NOT NULL,
  `heure_arrivee` time NOT NULL,
  `jours_operables` varchar(100) DEFAULT NULL,
  `disponibilite` tinyint(1) DEFAULT 1,
  `tarif` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `transports`
--

INSERT INTO `transports` (`id`, `type`, `nom`, `numero_ligne`, `depart`, `destination`, `heure_depart`, `heure_arrivee`, `jours_operables`, `disponibilite`, `tarif`) VALUES
(1, 'Bus', 'Ligne 1', 'L1', 'Gare centrale', 'Place de la mairie', '08:00:00', '08:30:00', 'Lundi, Mercredi, Vendredi', 1, '2.50'),
(2, 'Bus', 'Ligne 1', 'L1', 'Gare centrale', 'Place de la mairie', '08:00:00', '08:30:00', 'Lundi, Mercredi, Vendredi', 1, '2.50');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `blacklist`
--
ALTER TABLE `blacklist`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numero_carte_identite` (`numero_carte_identite`);

--
-- Index pour la table `citetouristique`
--
ALTER TABLE `citetouristique`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `complexes_touristiques`
--
ALTER TABLE `complexes_touristiques`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `hauberge`
--
ALTER TABLE `hauberge`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `hauberge_resident`
--
ALTER TABLE `hauberge_resident`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hauberge_id` (`hauberge_id`),
  ADD KEY `resident_id` (`resident_id`);

--
-- Index pour la table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hauberge_id` (`hauberge_id`),
  ADD KEY `resident_id` (`resident_id`);

--
-- Index pour la table `resident`
--
ALTER TABLE `resident`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numero_carte_identite` (`numero_carte_identite`);

--
-- Index pour la table `transports`
--
ALTER TABLE `transports`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `blacklist`
--
ALTER TABLE `blacklist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `citetouristique`
--
ALTER TABLE `citetouristique`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `complexes_touristiques`
--
ALTER TABLE `complexes_touristiques`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `hauberge`
--
ALTER TABLE `hauberge`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `hauberge_resident`
--
ALTER TABLE `hauberge_resident`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `hotel`
--
ALTER TABLE `hotel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `resident`
--
ALTER TABLE `resident`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `transports`
--
ALTER TABLE `transports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `hauberge_resident`
--
ALTER TABLE `hauberge_resident`
  ADD CONSTRAINT `hauberge_resident_ibfk_1` FOREIGN KEY (`hauberge_id`) REFERENCES `hauberge` (`id`),
  ADD CONSTRAINT `hauberge_resident_ibfk_2` FOREIGN KEY (`resident_id`) REFERENCES `resident` (`id`);

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`hauberge_id`) REFERENCES `hauberge` (`id`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`resident_id`) REFERENCES `resident` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
