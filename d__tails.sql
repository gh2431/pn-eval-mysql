-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 16 jan. 2025 à 09:22
-- Version du serveur : 8.0.40-0ubuntu0.24.04.1
-- Version de PHP : 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `entreprise qui vend du vend`
--

-- --------------------------------------------------------

--
-- Structure de la vue `détails`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`localhost` SQL SECURITY DEFINER VIEW `détails`  AS SELECT `client`.`prenom` AS `prenom`, `client`.`nom` AS `nom`, `commande`.`date` AS `date`, `produit`.`nom` AS `produit`, `détails_commande`.`quantité` AS `quantité` FROM (((`client` left join `commande` on((`client`.`id` = `commande`.`reférence_de_client`))) left join `détails_commande` on((`commande`.`id` = `détails_commande`.`référence_de_commande`))) left join `produit` on((`détails_commande`.`référence_du_produit` = `produit`.`id`))) ;

--
-- VIEW `détails`
-- Données : Aucun(e)
--

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
