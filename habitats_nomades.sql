-- Adminer 4.7.6 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

CREATE DATABASE `habitats-nomades` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `habitats-nomades`;

CREATE TABLE `assoc_peuples_habitats` (
  `assoc_id` int NOT NULL AUTO_INCREMENT,
  `assoc_peuple_id` int NOT NULL,
  `assoc_hab_id` int NOT NULL,
  PRIMARY KEY (`assoc_id`),
  KEY `assoc_peuple_id` (`assoc_peuple_id`),
  KEY `assoc_hab_id` (`assoc_hab_id`),
  CONSTRAINT `assoc_peuples_habitats_ibfk_1` FOREIGN KEY (`assoc_peuple_id`) REFERENCES `peuples` (`peuple_id`),
  CONSTRAINT `assoc_peuples_habitats_ibfk_2` FOREIGN KEY (`assoc_hab_id`) REFERENCES `habitats` (`hab_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `assoc_peuples_habitats` (`assoc_id`, `assoc_peuple_id`, `assoc_hab_id`) VALUES
(1,	4,	8),
(2,	5,	12),
(3,	6,	12),
(4,	7,	12),
(5,	8,	12);

CREATE TABLE `categories` (
  `cat_id` int NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `categories` (`cat_id`, `cat_name`) VALUES
(1,	'hutte'),
(2,	'tente'),
(3,	'habitation tsigane');

CREATE TABLE `habitats` (
  `hab_id` int NOT NULL AUTO_INCREMENT,
  `hab_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hat_cat_id` int NOT NULL,
  PRIMARY KEY (`hab_id`),
  KEY `hat_cat_id` (`hat_cat_id`),
  CONSTRAINT `habitats_ibfk_1` FOREIGN KEY (`hat_cat_id`) REFERENCES `categories` (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `habitats` (`hab_id`, `hab_name`, `hat_cat_id`) VALUES
(1,	'hutte écran',	1),
(2,	'bateau maison',	1),
(3,	'hutte conique',	1),
(4,	'voûte',	1),
(5,	'hutte coupolaire',	1),
(6,	'igloo',	1),
(7,	'tente noire',	2),
(8,	'yourte',	2),
(9,	'tente des Bédoins',	2),
(10,	'tente noire des montagnards du Maroc',	2),
(11,	'tente en peau des Touareg',	2),
(12,	'tipi',	2);

CREATE TABLE `peuples` (
  `peuple_id` int NOT NULL AUTO_INCREMENT,
  `peuple_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`peuple_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `peuples` (`peuple_id`, `peuple_name`) VALUES
(1,	'bédoin'),
(2,	'mongole'),
(3,	'kirghiz'),
(4,	'turkmène'),
(5,	'apache'),
(6,	'cheyennes'),
(7,	'comanches'),
(8,	'sioux');

-- 2021-01-05 15:02:45
