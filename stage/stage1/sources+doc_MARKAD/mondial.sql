-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 04, 2015 at 10:31 AM
-- Server version: 5.5.44-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mondial`
--

-- --------------------------------------------------------

--
-- Table structure for table `Conference`
--

CREATE TABLE IF NOT EXISTS `Conference` (
  `id` int(11) NOT NULL,
  `acronym` varchar(255) DEFAULT NULL,
  `dateAbstractSubmission` varchar(255) DEFAULT NULL,
  `dateEvt` varchar(255) DEFAULT NULL,
  `dateNotifAcceptance` varchar(255) DEFAULT NULL,
  `datePaperSubmission` varchar(255) DEFAULT NULL,
  `dateRebuttal` varchar(255) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `lieuEvt` varchar(255) DEFAULT NULL,
  `nbPapier` int(11) NOT NULL,
  `nbPapierAccepte` int(11) NOT NULL,
  `nbPapierRefuse` int(11) NOT NULL,
  `nomFichierStyle` varchar(255) DEFAULT NULL,
  `rang` varchar(255) DEFAULT NULL,
  `site` varchar(255) DEFAULT NULL,
  `titre` varchar(255) DEFAULT NULL,
  `participant_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_bjxoew8hi0b2p5mchdnrmpr7i` (`participant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hibernate_sequence`
--

CREATE TABLE IF NOT EXISTS `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `Journal`
--

CREATE TABLE IF NOT EXISTS `Journal` (
  `id` int(11) NOT NULL,
  `dateAbstractSubmission` varchar(255) DEFAULT NULL,
  `datePaperSubmission` varchar(255) DEFAULT NULL,
  `dateRebuttal` varchar(255) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `nbPapier` int(11) NOT NULL,
  `nbPapierAccepte` int(11) NOT NULL,
  `nbPapierRefuse` int(11) NOT NULL,
  `nomFichierStyle` varchar(255) DEFAULT NULL,
  `rang` varchar(255) DEFAULT NULL,
  `site` varchar(255) DEFAULT NULL,
  `titre` varchar(255) DEFAULT NULL,
  `participant_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ohyyqdiuul17lwyjut9r1cvy6` (`participant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Personne`
--

CREATE TABLE IF NOT EXISTS `Personne` (
  `id` int(11) NOT NULL,
  `Prenom` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `identifiant` varchar(255) DEFAULT NULL,
  `mdp` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Reponse`
--

CREATE TABLE IF NOT EXISTS `Reponse` (
  `id` int(11) NOT NULL,
  `detailReponse` varchar(255) DEFAULT NULL,
  `jugement` varchar(255) DEFAULT NULL,
  `reviewer` varchar(255) DEFAULT NULL,
  `version_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_10ji319g8iy4hhormq1sg3oli` (`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Travail`
--

CREATE TABLE IF NOT EXISTS `Travail` (
  `id` int(11) NOT NULL,
  `abstr` varchar(255) DEFAULT NULL,
  `hasResponse` tinyint(1) NOT NULL,
  `jourRestant` bigint(20) NOT NULL,
  `nomFichier` varchar(255) DEFAULT NULL,
  `nomSource` varchar(255) DEFAULT NULL,
  `soumis` tinyint(1) DEFAULT NULL,
  `titre` varchar(255) DEFAULT NULL,
  `proprio_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_40pjfcmesvydbm2md9tbh0989` (`proprio_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Travail_ConfsCibles`
--

CREATE TABLE IF NOT EXISTS `Travail_ConfsCibles` (
  `travail_id` int(11) NOT NULL,
  `conference_id` int(11) NOT NULL,
  PRIMARY KEY (`travail_id`,`conference_id`),
  KEY `FK_fhtjbaf6rvnami87h0teqjfas` (`conference_id`),
  KEY `FK_7q6wooof2kkoiaep90180ox7u` (`travail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Travail_ConfsSoumis`
--

CREATE TABLE IF NOT EXISTS `Travail_ConfsSoumis` (
  `travailS_id` int(11) NOT NULL,
  `confS_id` int(11) NOT NULL,
  PRIMARY KEY (`travailS_id`,`confS_id`),
  KEY `FK_pxgkw0uwb2dv1aukmifac0sex` (`confS_id`),
  KEY `FK_b7dx050mr88binjimnoedybqb` (`travailS_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Travail_JournalCibles`
--

CREATE TABLE IF NOT EXISTS `Travail_JournalCibles` (
  `travail_id` int(11) NOT NULL,
  `journal_id` int(11) NOT NULL,
  PRIMARY KEY (`travail_id`,`journal_id`),
  KEY `FK_6iaka876smj2129saeq48pky8` (`journal_id`),
  KEY `FK_6tf7ib2nq6kstg3tax20wd7oj` (`travail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Travail_JournalSoumis`
--

CREATE TABLE IF NOT EXISTS `Travail_JournalSoumis` (
  `travailS_id` int(11) NOT NULL,
  `journalS_id` int(11) NOT NULL,
  PRIMARY KEY (`travailS_id`,`journalS_id`),
  KEY `FK_3mrtxtkktd9q7bux00rnng13c` (`journalS_id`),
  KEY `FK_q7c77tf0irru84ftwst3lv1ko` (`travailS_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Version`
--

CREATE TABLE IF NOT EXISTS `Version` (
  `id` int(11) NOT NULL,
  `accepte` tinyint(1) NOT NULL,
  `date` datetime DEFAULT NULL,
  `nomPresentateur` varchar(255) DEFAULT NULL,
  `prenomPresentateur` varchar(255) DEFAULT NULL,
  `publique` tinyint(1) NOT NULL,
  `refuse` tinyint(1) NOT NULL,
  `versionArchive` varchar(255) DEFAULT NULL,
  `versionFichier` varchar(255) DEFAULT NULL,
  `conference_id` int(11) DEFAULT NULL,
  `journal_id` int(11) DEFAULT NULL,
  `travail_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_gr60oc9a9fnj0ajappi1of8h4` (`conference_id`),
  KEY `FK_tirg72igkoi44v6eiwcly7rrd` (`journal_id`),
  KEY `FK_y35wcvl11kyt988d6glkktyp` (`travail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Conference`
--
ALTER TABLE `Conference`
  ADD CONSTRAINT `FK_bjxoew8hi0b2p5mchdnrmpr7i` FOREIGN KEY (`participant_id`) REFERENCES `Personne` (`id`);

--
-- Constraints for table `Journal`
--
ALTER TABLE `Journal`
  ADD CONSTRAINT `FK_ohyyqdiuul17lwyjut9r1cvy6` FOREIGN KEY (`participant_id`) REFERENCES `Personne` (`id`);

--
-- Constraints for table `Reponse`
--
ALTER TABLE `Reponse`
  ADD CONSTRAINT `FK_10ji319g8iy4hhormq1sg3oli` FOREIGN KEY (`version_id`) REFERENCES `Version` (`id`);

--
-- Constraints for table `Travail`
--
ALTER TABLE `Travail`
  ADD CONSTRAINT `FK_40pjfcmesvydbm2md9tbh0989` FOREIGN KEY (`proprio_id`) REFERENCES `Personne` (`id`);

--
-- Constraints for table `Travail_ConfsCibles`
--
ALTER TABLE `Travail_ConfsCibles`
  ADD CONSTRAINT `FK_7q6wooof2kkoiaep90180ox7u` FOREIGN KEY (`travail_id`) REFERENCES `Travail` (`id`),
  ADD CONSTRAINT `FK_fhtjbaf6rvnami87h0teqjfas` FOREIGN KEY (`conference_id`) REFERENCES `Conference` (`id`);

--
-- Constraints for table `Travail_ConfsSoumis`
--
ALTER TABLE `Travail_ConfsSoumis`
  ADD CONSTRAINT `FK_b7dx050mr88binjimnoedybqb` FOREIGN KEY (`travailS_id`) REFERENCES `Travail` (`id`),
  ADD CONSTRAINT `FK_pxgkw0uwb2dv1aukmifac0sex` FOREIGN KEY (`confS_id`) REFERENCES `Conference` (`id`);

--
-- Constraints for table `Travail_JournalCibles`
--
ALTER TABLE `Travail_JournalCibles`
  ADD CONSTRAINT `FK_6tf7ib2nq6kstg3tax20wd7oj` FOREIGN KEY (`travail_id`) REFERENCES `Travail` (`id`),
  ADD CONSTRAINT `FK_6iaka876smj2129saeq48pky8` FOREIGN KEY (`journal_id`) REFERENCES `Journal` (`id`);

--
-- Constraints for table `Travail_JournalSoumis`
--
ALTER TABLE `Travail_JournalSoumis`
  ADD CONSTRAINT `FK_q7c77tf0irru84ftwst3lv1ko` FOREIGN KEY (`travailS_id`) REFERENCES `Travail` (`id`),
  ADD CONSTRAINT `FK_3mrtxtkktd9q7bux00rnng13c` FOREIGN KEY (`journalS_id`) REFERENCES `Journal` (`id`);

--
-- Constraints for table `Version`
--
ALTER TABLE `Version`
  ADD CONSTRAINT `FK_y35wcvl11kyt988d6glkktyp` FOREIGN KEY (`travail_id`) REFERENCES `Travail` (`id`),
  ADD CONSTRAINT `FK_gr60oc9a9fnj0ajappi1of8h4` FOREIGN KEY (`conference_id`) REFERENCES `Conference` (`id`),
  ADD CONSTRAINT `FK_tirg72igkoi44v6eiwcly7rrd` FOREIGN KEY (`journal_id`) REFERENCES `Journal` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
