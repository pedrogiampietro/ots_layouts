-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 16-Dez-2019 às 06:11
-- Versão do servidor: 10.4.8-MariaDB
-- versão do PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `pokemon`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL,
  `salt` varchar(40) NOT NULL DEFAULT '',
  `premdays` int(11) NOT NULL DEFAULT 0,
  `lastday` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `email` varchar(255) NOT NULL DEFAULT '',
  `key` varchar(32) NOT NULL DEFAULT '0',
  `blocked` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'internal usage',
  `warnings` int(11) NOT NULL DEFAULT 0,
  `group_id` int(11) NOT NULL DEFAULT 1,
  `premium_points` int(11) NOT NULL DEFAULT 0,
  `backup_points` int(11) NOT NULL DEFAULT 0,
  `guild_points` int(11) NOT NULL DEFAULT 0,
  `email_new` varchar(255) NOT NULL DEFAULT '',
  `email_new_time` int(11) NOT NULL DEFAULT 0,
  `rlname` varchar(255) NOT NULL DEFAULT '',
  `location` varchar(255) NOT NULL DEFAULT '',
  `page_access` int(11) NOT NULL DEFAULT 0,
  `email_code` varchar(255) NOT NULL DEFAULT '',
  `next_email` int(11) NOT NULL DEFAULT 0,
  `create_date` int(11) NOT NULL DEFAULT 0,
  `create_ip` int(11) NOT NULL DEFAULT 0,
  `last_post` int(11) NOT NULL DEFAULT 0,
  `flag` varchar(80) NOT NULL DEFAULT '',
  `vip_time` int(15) NOT NULL DEFAULT 0,
  `vote` int(11) NOT NULL,
  `guild_points_stats` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `accounts`
--

INSERT INTO `accounts` (`id`, `name`, `password`, `salt`, `premdays`, `lastday`, `email`, `key`, `blocked`, `warnings`, `group_id`, `premium_points`, `backup_points`, `guild_points`, `email_new`, `email_new_time`, `rlname`, `location`, `page_access`, `email_code`, `next_email`, `create_date`, `create_ip`, `last_post`, `flag`, `vip_time`, `vote`, `guild_points_stats`) VALUES
(1, '1', 'nohavelookmyfoot', '', 65535, 0, '', '0', 0, 0, 1, 0, 0, 0, '', 0, '', '', 0, '', 0, 0, 0, 0, 'unknown', 0, 0, 0),
(2, '10', 'nohavelookmyfoot', '', 0, 0, '', '', 0, 0, 1, 0, 0, 0, '', 0, '', '', 0, '', 0, 1480371940, 0, 0, 'unknown', 0, 0, 0),
(3, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', '', 30, 1554756036, 'admin@admin.com', '', 0, 0, 1, 0, 0, 0, '', 0, '', '', 15, '', 0, 1531414410, 0, 1576472557, 'unknown', 0, 0, 0);

--
-- Acionadores `accounts`
--
DELIMITER $$
CREATE TRIGGER `ondelete_accounts` BEFORE DELETE ON `accounts` FOR EACH ROW BEGIN
	DELETE FROM `bans` WHERE `type` IN (3, 4) AND `value` = OLD.`id`;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `account_viplist`
--

CREATE TABLE `account_viplist` (
  `account_id` int(11) NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `player_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bans`
--

CREATE TABLE `bans` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1 - ip, 2 - player, 3 - account, 4 - notation',
  `value` int(10) UNSIGNED NOT NULL COMMENT 'ip - ip address, player - player_id, account - account_id, notation - account_id',
  `param` int(10) UNSIGNED NOT NULL COMMENT 'ip - mask, player - type (1 - report, 2 - lock, 3 - ban), account - player, notation - player',
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `expires` int(11) NOT NULL DEFAULT -1,
  `added` int(10) UNSIGNED NOT NULL,
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment` text NOT NULL,
  `reason` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `action` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `statement` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `dtt_players`
--

CREATE TABLE `dtt_players` (
  `id` int(11) NOT NULL,
  `pid` bigint(20) NOT NULL,
  `team` int(5) NOT NULL,
  `ip` bigint(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `dtt_results`
--

CREATE TABLE `dtt_results` (
  `id` int(11) NOT NULL,
  `frags_blue` int(11) NOT NULL,
  `frags_red` int(11) NOT NULL,
  `towers_blue` int(11) NOT NULL,
  `towers_red` int(11) NOT NULL,
  `data` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `hora` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `environment_killers`
--

CREATE TABLE `environment_killers` (
  `kill_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `global_storage`
--

CREATE TABLE `global_storage` (
  `key` varchar(32) NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guilds`
--

CREATE TABLE `guilds` (
  `id` int(11) NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `ownerid` int(11) NOT NULL,
  `creationdata` int(11) NOT NULL,
  `checkdata` int(11) NOT NULL,
  `motd` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `guild_logo` mediumblob DEFAULT NULL,
  `create_ip` int(11) NOT NULL DEFAULT 0,
  `balance` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `logo_gfx_name` varchar(255) NOT NULL DEFAULT '',
  `real_castle` int(11) NOT NULL DEFAULT 0,
  `last_execute_points` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Acionadores `guilds`
--
DELIMITER $$
CREATE TRIGGER `oncreate_guilds` AFTER INSERT ON `guilds` FOR EACH ROW BEGIN
	INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Leader', 3, NEW.`id`);
	INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Vice-Leader', 2, NEW.`id`);
	INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Member', 1, NEW.`id`);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `ondelete_guilds` BEFORE DELETE ON `guilds` FOR EACH ROW BEGIN
	UPDATE `players` SET `guildnick` = '', `rank_id` = 0 WHERE `rank_id` IN (SELECT `id` FROM `guild_ranks` WHERE `guild_id` = OLD.`id`);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_invites`
--

CREATE TABLE `guild_invites` (
  `player_id` int(11) NOT NULL DEFAULT 0,
  `guild_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_kills`
--

CREATE TABLE `guild_kills` (
  `id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL,
  `war_id` int(11) NOT NULL,
  `death_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_ranks`
--

CREATE TABLE `guild_ranks` (
  `id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `level` int(11) NOT NULL COMMENT '1 - leader, 2 - vice leader, 3 - member'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_wars`
--

CREATE TABLE `guild_wars` (
  `id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL,
  `enemy_id` int(11) NOT NULL,
  `begin` bigint(20) NOT NULL DEFAULT 0,
  `end` bigint(20) NOT NULL DEFAULT 0,
  `frags` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `payment` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `guild_kills` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `enemy_kills` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `houses`
--

CREATE TABLE `houses` (
  `id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `owner` int(11) NOT NULL,
  `paid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `warnings` int(11) NOT NULL DEFAULT 0,
  `lastwarning` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `town` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `size` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `price` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `rent` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `doors` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `beds` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tiles` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `guild` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `clear` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `houses`
--

INSERT INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
(1, 0, 0, 0, 0, 0, 'Pirate Isle 1', 1, 41, 391085, 391085, 12, 2, 95, 0, 0),
(2, 0, 0, 0, 0, 0, 'Pirate Isle 2', 1, 36, 345610, 345610, 11, 2, 84, 0, 0),
(3, 0, 0, 0, 0, 0, 'Barbarian Isle 1(shop)', 1, 75, 691220, 691220, 10, 1, 141, 0, 0),
(4, 0, 0, 0, 0, 0, 'Barbarian Isle 2', 1, 44, 409275, 409275, 8, 1, 98, 0, 0),
(5, 0, 0, 0, 0, 0, 'Barbarian Isle 3', 1, 67, 627555, 627555, 9, 2, 129, 0, 0),
(6, 0, 0, 0, 0, 0, 'Central Plaza 1(shop)', 1, 31, 291040, 291040, 6, 1, 74, 0, 0),
(7, 0, 0, 0, 0, 0, 'Central Plaza 2(shop)', 1, 31, 291040, 291040, 4, 1, 74, 0, 0),
(8, 0, 0, 0, 0, 0, 'Central Plaza 3(shop)', 1, 31, 291040, 291040, 5, 1, 74, 0, 0),
(9, 0, 0, 0, 0, 0, 'Central Plaza 4(shop)', 1, 31, 291040, 291040, 5, 1, 74, 0, 0),
(10, 0, 0, 0, 0, 0, 'Central Plaza 5(shop)', 1, 38, 363800, 363800, 8, 2, 96, 0, 0),
(11, 0, 0, 0, 0, 0, 'Chaves Village 1', 1, 7, 72760, 72760, 2, 1, 21, 0, 0),
(12, 0, 0, 0, 0, 0, 'Chaves Village 2', 1, 10, 100045, 100045, 4, 1, 27, 0, 0),
(13, 0, 0, 0, 0, 0, 'Chaves Village 3', 1, 10, 100045, 100045, 4, 1, 30, 0, 0),
(14, 0, 0, 0, 0, 0, 'Beach Home Apartment 1', 1, 18, 181900, 181900, 6, 2, 49, 0, 0),
(15, 0, 0, 0, 0, 0, 'Beach Home Apartment 2', 1, 13, 127330, 127330, 7, 1, 43, 0, 0),
(16, 0, 0, 0, 0, 0, 'Beach Home Apartment 3', 1, 7, 72760, 72760, 5, 1, 25, 0, 0),
(17, 0, 0, 0, 0, 0, 'Beach Home Apartment 4', 1, 10, 100045, 100045, 3, 1, 29, 0, 0),
(18, 0, 0, 0, 0, 0, 'Beach Home Apartment 5(shop)', 1, 12, 118235, 118235, 6, 1, 37, 0, 0),
(19, 0, 0, 0, 0, 0, 'North Avenue 1', 1, 6, 63665, 63665, 3, 1, 22, 0, 0),
(20, 0, 0, 0, 0, 0, 'North Avenue 2', 1, 6, 63665, 63665, 2, 1, 19, 0, 0),
(21, 0, 0, 0, 0, 0, 'North Avenue 3', 1, 20, 190995, 190995, 4, 1, 43, 0, 0),
(22, 0, 0, 0, 0, 0, 'North Avenue 4', 1, 19, 181900, 181900, 4, 1, 49, 0, 0),
(23, 0, 0, 0, 0, 0, 'North Avenue 5', 1, 17, 163710, 163710, 4, 1, 50, 0, 0),
(24, 0, 0, 0, 0, 0, 'North Avenue 6', 1, 6, 63665, 63665, 1, 1, 22, 0, 0),
(25, 0, 0, 0, 0, 0, 'Central Flat 1', 1, 10, 100045, 100045, 2, 1, 28, 0, 0),
(26, 0, 0, 0, 0, 0, 'Central Flat 2', 1, 10, 100045, 100045, 3, 1, 30, 0, 0),
(27, 0, 0, 0, 0, 0, 'Central Flat 3', 1, 22, 209185, 209185, 5, 1, 50, 0, 0),
(28, 0, 0, 0, 0, 0, 'Central Flat 4', 1, 10, 100045, 100045, 3, 1, 30, 0, 0),
(29, 0, 0, 0, 0, 0, 'Central Flat 5', 1, 7, 72760, 72760, 3, 1, 23, 0, 0),
(30, 0, 0, 0, 0, 0, 'Central Flat 6', 1, 14, 136425, 136425, 2, 1, 27, 0, 0),
(31, 0, 0, 0, 0, 0, 'Central Flat 7', 1, 10, 100045, 100045, 3, 1, 30, 0, 0),
(32, 0, 0, 0, 0, 0, 'Central Flat 8', 1, 22, 209185, 209185, 5, 1, 50, 0, 0),
(33, 0, 0, 0, 0, 0, 'Main Street 1', 1, 10, 100045, 100045, 4, 1, 30, 0, 0),
(34, 0, 0, 0, 0, 0, 'Dream Street 1', 1, 29, 281945, 281945, 9, 2, 80, 0, 0),
(35, 0, 0, 0, 0, 0, 'Dream Street 2', 1, 12, 118235, 118235, 5, 1, 41, 0, 0),
(36, 0, 0, 0, 0, 0, 'Dream Street 3', 1, 13, 127330, 127330, 5, 1, 35, 0, 0),
(37, 0, 0, 0, 0, 0, 'Guardamar Village 1', 1, 6, 63665, 63665, 2, 1, 20, 0, 0),
(38, 0, 0, 0, 0, 0, 'Guardamar Village 2', 1, 13, 127330, 127330, 3, 1, 35, 0, 0),
(39, 0, 0, 0, 0, 0, 'Guardamar Village 3', 1, 20, 190995, 190995, 4, 1, 52, 0, 0),
(40, 0, 0, 0, 0, 0, 'Guardamar Village 4', 1, 20, 190995, 190995, 4, 1, 47, 0, 0),
(41, 0, 0, 0, 0, 0, 'Guardamar Village 5', 1, 10, 100045, 100045, 3, 1, 26, 0, 0),
(42, 0, 0, 0, 0, 0, 'Rugged Village 1', 1, 32, 309230, 309230, 8, 2, 91, 0, 0),
(43, 0, 0, 0, 0, 0, 'Rugged Village 2', 1, 37, 345610, 345610, 8, 1, 90, 0, 0),
(44, 0, 0, 0, 0, 0, 'Rugged Village 3', 1, 15, 145520, 145520, 4, 1, 39, 0, 0),
(45, 0, 0, 0, 0, 0, 'Rugged Village 4', 1, 35, 327420, 327420, 5, 1, 79, 0, 0),
(46, 0, 0, 0, 0, 0, 'Rugged Village 5', 1, 17, 163710, 163710, 4, 1, 43, 0, 0),
(47, 0, 0, 0, 0, 0, 'Rugged Village 6', 1, 10, 100045, 100045, 2, 1, 32, 0, 0),
(48, 0, 0, 0, 0, 0, 'Rugged Village 7', 1, 10, 100045, 100045, 3, 1, 28, 0, 0),
(49, 0, 0, 0, 0, 0, 'Rugged Village 8', 1, 13, 136425, 136425, 3, 2, 37, 0, 0),
(50, 0, 0, 0, 0, 0, 'Rugged Village 9', 1, 15, 145520, 145520, 4, 1, 35, 0, 0),
(51, 0, 0, 0, 0, 0, 'Rugged Village 10', 1, 8, 81855, 81855, 3, 1, 28, 0, 0),
(52, 0, 0, 0, 0, 0, 'Temple House 1', 1, 9, 90950, 90950, 1, 1, 22, 0, 0),
(53, 0, 0, 0, 0, 0, 'Temple House 2', 1, 8, 81855, 81855, 1, 1, 17, 0, 0),
(54, 0, 0, 0, 0, 0, 'Temple House 3', 1, 8, 81855, 81855, 1, 1, 17, 0, 0),
(55, 0, 0, 0, 0, 0, 'Temple House 4', 1, 8, 81855, 81855, 1, 1, 17, 0, 0),
(56, 0, 0, 0, 0, 0, 'Temple House 5', 1, 8, 81855, 81855, 1, 1, 17, 0, 0),
(57, 0, 0, 0, 0, 0, 'Temple House 6', 1, 10, 100045, 100045, 2, 1, 25, 0, 0),
(58, 0, 0, 0, 0, 0, 'Temple House 7', 1, 15, 145520, 145520, 1, 1, 28, 0, 0),
(59, 0, 0, 0, 0, 0, 'Temple House 8', 1, 15, 145520, 145520, 1, 1, 27, 0, 0),
(60, 0, 0, 0, 0, 0, 'Temple House 9', 1, 19, 181900, 181900, 1, 1, 36, 0, 0),
(61, 0, 0, 0, 0, 0, 'Upper House 1', 1, 33, 309230, 309230, 9, 1, 77, 0, 0),
(62, 0, 0, 0, 0, 0, 'Central Circle 1', 1, 61, 572985, 572985, 11, 2, 127, 0, 0),
(63, 0, 0, 0, 0, 0, 'Central Circle 2', 1, 81, 754885, 754885, 7, 2, 142, 0, 0),
(64, 0, 0, 0, 0, 0, 'Central Circle 3', 1, 63, 582080, 582080, 6, 1, 113, 0, 0),
(65, 0, 0, 0, 0, 0, 'Central Circle 4', 1, 66, 618460, 618460, 6, 2, 112, 0, 0),
(66, 0, 0, 0, 0, 0, 'Central Circle 5', 1, 62, 582080, 582080, 10, 2, 126, 0, 0),
(67, 0, 0, 0, 0, 0, 'Central Circle 6', 1, 56, 518415, 518415, 10, 1, 116, 0, 0),
(68, 0, 0, 0, 0, 0, 'Central Circle 7', 1, 48, 445655, 445655, 12, 1, 112, 0, 0),
(69, 0, 0, 0, 0, 0, 'Central Circle 8', 1, 69, 645745, 645745, 12, 2, 138, 0, 0),
(70, 0, 0, 0, 0, 0, 'Central Circle 9', 1, 69, 636650, 636650, 13, 1, 139, 0, 0),
(71, 0, 0, 0, 0, 0, 'Townhouse 1', 1, 42, 391085, 391085, 7, 1, 84, 0, 0),
(72, 0, 0, 0, 0, 0, 'Townhouse 2', 1, 70, 645745, 645745, 8, 1, 123, 0, 0),
(73, 0, 0, 0, 0, 0, 'Townhouse 3', 1, 47, 436560, 436560, 5, 1, 100, 0, 0),
(74, 0, 0, 0, 0, 0, 'Townhouse 4', 1, 60, 563890, 563890, 8, 2, 121, 0, 0),
(75, 0, 0, 0, 0, 0, 'Evolution Avenue 1', 1, 73, 682125, 682125, 14, 2, 142, 0, 0),
(76, 0, 0, 0, 0, 0, 'Evolution Avenue 2', 1, 119, 1100495, 1100495, 16, 2, 207, 0, 0),
(77, 0, 0, 0, 0, 0, 'Evolution Avenue 3', 1, 22, 209185, 209185, 4, 1, 48, 0, 0),
(78, 0, 0, 0, 0, 0, 'Evolution Avenue 4', 1, 22, 209185, 209185, 4, 1, 48, 0, 0),
(79, 0, 0, 0, 0, 0, 'Evolution Avenue 5', 1, 22, 209185, 209185, 5, 1, 48, 0, 0),
(80, 0, 0, 0, 0, 0, 'Evolution Avenue 6', 1, 63, 609365, 609365, 14, 4, 137, 0, 0),
(81, 0, 0, 0, 0, 0, 'Evolution Avenue 7a', 1, 22, 209185, 209185, 4, 1, 41, 0, 0),
(82, 0, 0, 0, 0, 0, 'Evolution Avenue 8a', 1, 22, 209185, 209185, 4, 1, 47, 0, 0),
(83, 0, 0, 0, 0, 0, 'Evolution Avenue 7b', 1, 22, 209185, 209185, 4, 1, 41, 0, 0),
(84, 0, 0, 0, 0, 0, 'Evolution Avenue 8b', 1, 22, 209185, 209185, 4, 1, 47, 0, 0),
(85, 0, 0, 0, 0, 0, 'Evolution Flat 1', 1, 6, 63665, 63665, 4, 1, 24, 0, 0),
(86, 0, 0, 0, 0, 0, 'Evolution Flat 2', 1, 14, 136425, 136425, 4, 1, 33, 0, 0),
(87, 0, 0, 0, 0, 0, 'Evolution Flat 3', 1, 15, 145520, 145520, 3, 1, 35, 0, 0),
(88, 0, 0, 0, 0, 0, 'Evolution Flat 4', 1, 18, 172805, 172805, 3, 1, 41, 0, 0),
(89, 0, 0, 0, 0, 0, 'Evolution Flat 5', 1, 14, 136425, 136425, 3, 1, 33, 0, 0),
(90, 0, 0, 0, 0, 0, 'Evolution Flat 6', 1, 35, 327420, 327420, 6, 1, 74, 0, 0),
(91, 0, 0, 0, 0, 0, 'Evolution Flat 7', 1, 31, 291040, 291040, 5, 1, 66, 0, 0),
(92, 0, 0, 0, 0, 0, 'Main Street 1a', 1, 9, 90950, 90950, 4, 1, 27, 0, 0),
(93, 0, 0, 0, 0, 0, 'Main Street 2a', 1, 12, 118235, 118235, 3, 1, 34, 0, 0),
(94, 0, 0, 0, 0, 0, 'Main Street 1b', 1, 10, 100045, 100045, 4, 1, 29, 0, 0),
(95, 0, 0, 0, 0, 0, 'Main Street 2b', 1, 12, 118235, 118235, 4, 1, 33, 0, 0),
(96, 0, 0, 0, 0, 0, 'Main Street 3', 1, 67, 618460, 618460, 6, 1, 109, 0, 0),
(97, 0, 0, 0, 0, 0, 'Main Street 4', 1, 67, 618460, 618460, 6, 1, 110, 0, 0),
(98, 0, 0, 0, 0, 0, 'Main Street 5', 1, 34, 318325, 318325, 6, 1, 84, 0, 0),
(99, 0, 0, 0, 0, 0, 'Main Street 6', 1, 25, 236470, 236470, 3, 1, 47, 0, 0),
(100, 0, 0, 0, 0, 0, 'Main Street 7', 1, 27, 254660, 254660, 4, 1, 48, 0, 0),
(101, 0, 0, 0, 0, 0, 'Main Street 8', 1, 40, 372895, 372895, 5, 1, 90, 0, 0),
(102, 0, 0, 0, 0, 0, 'Complex German 1', 1, 13, 127330, 127330, 3, 1, 35, 0, 0),
(103, 0, 0, 0, 0, 0, 'Complex German 2', 1, 21, 200090, 200090, 4, 1, 59, 0, 0),
(104, 0, 0, 0, 0, 0, 'Complex German 3', 1, 10, 100045, 100045, 3, 1, 25, 0, 0),
(105, 0, 0, 0, 0, 0, 'Complex German 4', 1, 9, 90950, 90950, 3, 1, 31, 0, 0),
(106, 0, 0, 0, 0, 0, 'Complex German 5', 1, 23, 218280, 218280, 4, 1, 54, 0, 0),
(107, 0, 0, 0, 0, 0, 'Grand House 1', 1, 55, 518415, 518415, 9, 2, 111, 0, 0),
(108, 0, 0, 0, 0, 0, 'Grand House 2', 1, 51, 482035, 482035, 8, 2, 107, 0, 0),
(109, 0, 0, 0, 0, 0, 'Main Circle 1', 1, 28, 263755, 263755, 6, 1, 56, 0, 0),
(110, 0, 0, 0, 0, 0, 'Main Circle 2', 1, 32, 309230, 309230, 4, 2, 63, 0, 0),
(111, 0, 0, 0, 0, 0, 'Main Circle 3', 1, 28, 263755, 263755, 4, 1, 48, 0, 0),
(112, 0, 0, 0, 0, 0, 'Main Circle 4', 1, 28, 263755, 263755, 6, 1, 56, 0, 0),
(113, 0, 0, 0, 0, 0, 'Main Circle 5', 1, 28, 263755, 263755, 5, 1, 56, 0, 0),
(114, 0, 0, 0, 0, 0, 'Main Circle 6', 1, 32, 309230, 309230, 4, 2, 63, 0, 0),
(115, 0, 0, 0, 0, 0, 'Main Circle 7', 1, 28, 263755, 263755, 4, 1, 48, 0, 0),
(116, 0, 0, 0, 0, 0, 'Main Circle 8', 1, 28, 263755, 263755, 6, 1, 56, 0, 0),
(117, 0, 0, 0, 0, 0, 'Main Circle 9', 1, 26, 254660, 254660, 6, 2, 56, 0, 0),
(118, 0, 0, 0, 0, 0, 'Main Circle 10', 1, 26, 254660, 254660, 4, 2, 55, 0, 0),
(119, 0, 0, 0, 0, 0, 'Main Circle 11', 1, 32, 309230, 309230, 4, 2, 56, 0, 0),
(120, 0, 0, 0, 0, 0, 'Main Circle 12', 1, 26, 254660, 254660, 6, 2, 56, 0, 0),
(121, 0, 0, 0, 0, 0, 'Harbour Street 1', 1, 22, 209185, 209185, 3, 1, 49, 0, 0),
(122, 0, 0, 0, 0, 0, 'Harbour Street 2', 1, 22, 209185, 209185, 3, 1, 44, 0, 0),
(123, 0, 0, 0, 0, 0, 'Harbour Street 3', 1, 30, 281945, 281945, 3, 1, 55, 0, 0),
(124, 0, 0, 0, 0, 0, 'Harbour Street 4', 1, 22, 209185, 209185, 4, 1, 45, 0, 0),
(125, 0, 0, 0, 0, 0, 'Harbour Place 1', 1, 73, 682125, 682125, 14, 2, 143, 0, 0),
(126, 0, 0, 0, 0, 0, 'Park Lane 1', 1, 16, 154615, 154615, 3, 1, 35, 0, 0),
(127, 0, 0, 0, 0, 0, 'Park Lane 2', 1, 18, 172805, 172805, 2, 1, 36, 0, 0),
(128, 0, 0, 0, 0, 0, 'Park Lane 3', 1, 20, 190995, 190995, 2, 1, 45, 0, 0),
(129, 0, 0, 0, 0, 0, 'Park Lane 4', 1, 16, 154615, 154615, 3, 1, 36, 0, 0),
(130, 0, 0, 0, 0, 0, 'Park Lane 5', 1, 13, 127330, 127330, 3, 1, 30, 0, 0),
(131, 0, 0, 0, 0, 0, 'Park Lane 6', 1, 19, 181900, 181900, 3, 1, 44, 0, 0),
(132, 0, 0, 0, 0, 0, 'Harbour Place 2', 1, 52, 482035, 482035, 6, 1, 109, 0, 0),
(133, 0, 0, 0, 0, 0, 'Center Farm 1', 1, 91, 845835, 845835, 12, 2, 169, 0, 0),
(134, 0, 0, 0, 0, 0, 'Center Farm 2', 1, 104, 954975, 954975, 17, 1, 207, 0, 0),
(135, 0, 0, 0, 0, 0, 'Outside Village 1', 1, 28, 263755, 263755, 9, 1, 66, 0, 0),
(136, 0, 0, 0, 0, 0, 'Outside Village 2', 1, 29, 272850, 272850, 4, 1, 65, 0, 0),
(137, 0, 0, 0, 0, 0, 'Outside Village 3', 1, 27, 254660, 254660, 9, 1, 65, 0, 0),
(138, 0, 0, 0, 0, 0, 'Outside House 1', 1, 26, 245565, 245565, 12, 1, 73, 0, 0),
(139, 0, 0, 0, 0, 0, 'Highgarden 1', 1, 26, 245565, 245565, 7, 1, 68, 0, 0),
(140, 0, 0, 0, 0, 0, 'Highgarden 2', 1, 27, 254660, 254660, 7, 1, 68, 0, 0),
(141, 0, 0, 0, 0, 0, 'Highgarden 3', 1, 17, 163710, 163710, 3, 1, 37, 0, 0),
(142, 0, 0, 0, 0, 0, 'Highgarden 4', 1, 23, 218280, 218280, 7, 1, 58, 0, 0),
(143, 0, 0, 0, 0, 0, 'Highgarden 5', 1, 13, 127330, 127330, 3, 1, 32, 0, 0),
(144, 0, 0, 0, 0, 0, 'Highgarden 6', 1, 25, 236470, 236470, 7, 1, 56, 0, 0),
(145, 0, 0, 0, 0, 0, 'Highgarden 7', 1, 10, 100045, 100045, 3, 1, 27, 0, 0),
(146, 0, 0, 0, 0, 0, 'Highgarden 8', 1, 21, 200090, 200090, 6, 1, 47, 0, 0),
(147, 0, 0, 0, 0, 0, 'Highgarden 9', 1, 13, 127330, 127330, 4, 1, 30, 0, 0),
(148, 0, 0, 0, 0, 0, 'Highgarden 10', 1, 21, 200090, 200090, 3, 1, 55, 0, 0),
(149, 0, 0, 0, 0, 0, 'Highgarden 11', 1, 10, 100045, 100045, 4, 1, 26, 0, 0),
(150, 0, 0, 0, 0, 0, 'Highgarden 12', 1, 13, 127330, 127330, 4, 1, 32, 0, 0),
(151, 0, 0, 0, 0, 0, 'Highgarden 13', 1, 19, 181900, 181900, 4, 1, 45, 0, 0),
(152, 0, 0, 0, 0, 0, 'Highgarden 14', 1, 12, 118235, 118235, 3, 1, 36, 0, 0),
(153, 0, 0, 0, 0, 0, 'Highgarden 15', 1, 42, 391085, 391085, 8, 1, 95, 0, 0),
(154, 0, 0, 0, 0, 0, 'Highgarden 16', 1, 94, 882215, 882215, 14, 3, 192, 0, 0),
(155, 0, 0, 0, 0, 0, 'Highgarden 17', 1, 33, 309230, 309230, 7, 1, 79, 0, 0),
(156, 0, 0, 0, 0, 0, 'Highgarden 18', 1, 9, 90950, 90950, 4, 1, 26, 0, 0),
(157, 0, 0, 0, 0, 0, 'Highgarden 19', 1, 12, 118235, 118235, 3, 1, 34, 0, 0),
(158, 0, 0, 0, 0, 0, 'Highgarden 20', 1, 10, 100045, 100045, 4, 1, 27, 0, 0),
(159, 0, 0, 0, 0, 0, 'Highgarden 21', 1, 12, 118235, 118235, 3, 1, 33, 0, 0),
(160, 0, 0, 0, 0, 0, 'Highgarden 22', 1, 55, 518415, 518415, 11, 2, 128, 0, 0),
(161, 0, 0, 0, 0, 0, 'Highgarden 23', 1, 88, 818550, 818550, 11, 2, 167, 0, 0),
(162, 0, 0, 0, 0, 0, 'Highgarden 24', 1, 63, 591175, 591175, 8, 2, 124, 0, 0),
(163, 0, 0, 0, 0, 0, 'Highgarden 25', 1, 12, 118235, 118235, 4, 1, 30, 0, 0),
(164, 0, 0, 0, 0, 0, 'Highgarden 26', 1, 18, 172805, 172805, 3, 1, 41, 0, 0),
(165, 0, 0, 0, 0, 0, 'Highgarden 27', 1, 30, 281945, 281945, 6, 1, 57, 0, 0),
(166, 0, 0, 0, 0, 0, 'Highgarden 28', 1, 13, 127330, 127330, 4, 1, 33, 0, 0),
(167, 0, 0, 0, 0, 0, 'Highgarden 29', 1, 23, 218280, 218280, 3, 1, 47, 0, 0),
(168, 0, 0, 0, 0, 0, 'Gm Isle', 1, 109, 991355, 991355, 3, 0, 220, 0, 0),
(169, 0, 0, 0, 0, 0, 'Underworld base 1', 1, 44, 409275, 409275, 2, 1, 74, 0, 0),
(170, 0, 0, 0, 0, 0, 'Underworld base 2', 1, 58, 545700, 545700, 2, 2, 101, 0, 0),
(171, 0, 0, 0, 0, 0, 'Underworld base 3', 1, 57, 536605, 536605, 2, 2, 88, 0, 0),
(172, 0, 0, 0, 0, 0, 'Vip 1', 1, 32, 300135, 300135, 1, 1, 56, 0, 0),
(173, 0, 0, 0, 0, 0, 'Vip 2', 1, 24, 227375, 227375, 1, 1, 55, 0, 0),
(174, 0, 0, 0, 0, 0, 'Vip 3', 1, 32, 300135, 300135, 1, 1, 56, 0, 0),
(175, 0, 0, 0, 0, 0, 'Vip 4', 1, 24, 227375, 227375, 1, 1, 60, 0, 0),
(176, 0, 0, 0, 0, 0, 'Vip 5', 1, 15, 145520, 145520, 1, 1, 32, 0, 0),
(177, 0, 0, 0, 0, 0, 'Vip 6', 1, 56, 518415, 518415, 2, 1, 94, 0, 0),
(178, 0, 0, 0, 0, 0, 'Vip 7', 1, 56, 518415, 518415, 2, 1, 105, 0, 0),
(179, 0, 0, 0, 0, 0, 'Vip 8', 1, 15, 145520, 145520, 1, 1, 39, 0, 0),
(180, 0, 0, 0, 0, 0, 'Vip 9', 1, 42, 391085, 391085, 2, 1, 100, 0, 0),
(181, 0, 0, 0, 0, 0, 'Vip 10', 1, 23, 218280, 218280, 2, 1, 30, 0, 0),
(182, 0, 0, 0, 0, 0, 'Vip 11', 1, 14, 136425, 136425, 1, 1, 30, 0, 0),
(183, 0, 0, 0, 0, 0, 'Vip 12', 1, 14, 136425, 136425, 1, 1, 35, 0, 0),
(184, 0, 0, 0, 0, 0, 'Vip 13', 1, 7, 72760, 72760, 1, 1, 25, 0, 0),
(185, 0, 0, 0, 0, 0, 'Vip 14', 1, 14, 136425, 136425, 1, 1, 34, 0, 0),
(186, 0, 0, 0, 0, 0, 'Vip 15', 1, 14, 136425, 136425, 1, 1, 31, 0, 0),
(187, 0, 0, 0, 0, 0, 'Vip 16', 1, 14, 136425, 136425, 1, 1, 30, 0, 0),
(188, 0, 0, 0, 0, 0, 'Vip 17', 1, 14, 136425, 136425, 1, 1, 35, 0, 0),
(189, 0, 0, 0, 0, 0, 'Vip 18', 1, 7, 72760, 72760, 1, 1, 25, 0, 0),
(190, 0, 0, 0, 0, 0, 'Vip 19', 1, 14, 136425, 136425, 1, 1, 35, 0, 0),
(191, 0, 0, 0, 0, 0, 'Vip 20', 1, 14, 136425, 136425, 1, 1, 30, 0, 0),
(192, 0, 0, 0, 0, 0, 'Vip 21', 1, 14, 136425, 136425, 1, 1, 20, 0, 0),
(193, 0, 0, 0, 0, 0, 'Vip 22', 1, 18, 172805, 172805, 1, 1, 41, 0, 0),
(194, 0, 0, 0, 0, 0, 'Vip 23', 1, 53, 500225, 500225, 1, 2, 100, 0, 0),
(195, 0, 0, 0, 0, 0, 'Vip 24', 1, 21, 209185, 209185, 2, 2, 56, 0, 0),
(196, 0, 0, 0, 0, 0, 'Vip 25', 1, 47, 445655, 445655, 1, 2, 101, 0, 0),
(197, 0, 0, 0, 0, 0, 'Vip 26', 1, 23, 227375, 227375, 2, 2, 71, 0, 0),
(198, 0, 0, 0, 0, 0, 'Vip 27', 1, 34, 318325, 318325, 1, 1, 72, 0, 0),
(199, 0, 0, 0, 0, 0, 'Vip 28', 1, 34, 318325, 318325, 1, 1, 72, 0, 0),
(200, 0, 0, 0, 0, 0, 'Vip 29', 1, 22, 209185, 209185, 1, 1, 54, 0, 0),
(201, 0, 0, 0, 0, 0, 'Vip 30', 1, 24, 227375, 227375, 1, 1, 50, 0, 0),
(202, 0, 0, 0, 0, 0, 'Vip 31', 1, 22, 209185, 209185, 1, 1, 40, 0, 0),
(203, 0, 0, 0, 0, 0, 'Top House 1', 1, 7, 72760, 72760, 2, 1, 24, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `house_auctions`
--

CREATE TABLE `house_auctions` (
  `house_id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `player_id` int(11) NOT NULL,
  `bid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `limit` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `endtime` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `house_data`
--

CREATE TABLE `house_data` (
  `house_id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `data` longblob NOT NULL,
  `serial` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `house_lists`
--

CREATE TABLE `house_lists` (
  `house_id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `listid` int(11) NOT NULL,
  `list` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `killers`
--

CREATE TABLE `killers` (
  `id` int(11) NOT NULL,
  `death_id` int(11) NOT NULL,
  `final_hit` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `unjustified` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `war` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `live_casts`
--

CREATE TABLE `live_casts` (
  `player_id` int(11) NOT NULL,
  `cast_name` varchar(255) NOT NULL,
  `password` tinyint(1) NOT NULL DEFAULT 0,
  `description` varchar(255) DEFAULT NULL,
  `spectators` smallint(5) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `login_history`
--

CREATE TABLE `login_history` (
  `account_id` int(11) NOT NULL DEFAULT 0,
  `player_id` int(11) NOT NULL DEFAULT 0,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `login` tinyint(1) NOT NULL DEFAULT 0,
  `ip` int(11) NOT NULL DEFAULT 0,
  `date` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `market_history`
--

CREATE TABLE `market_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `player_id` int(11) NOT NULL,
  `sale` tinyint(1) NOT NULL DEFAULT 0,
  `itemtype` int(10) UNSIGNED NOT NULL,
  `amount` smallint(5) UNSIGNED NOT NULL,
  `price` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `expires_at` bigint(20) UNSIGNED NOT NULL,
  `inserted` bigint(20) UNSIGNED NOT NULL,
  `state` tinyint(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `market_offers`
--

CREATE TABLE `market_offers` (
  `id` int(10) UNSIGNED NOT NULL,
  `player_id` int(11) NOT NULL,
  `sale` tinyint(1) NOT NULL DEFAULT 0,
  `itemtype` int(10) UNSIGNED NOT NULL,
  `amount` smallint(5) UNSIGNED NOT NULL,
  `created` bigint(20) UNSIGNED NOT NULL,
  `anonymous` tinyint(1) NOT NULL DEFAULT 0,
  `price` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagseguro_transactions`
--

CREATE TABLE `pagseguro_transactions` (
  `transaction_code` varchar(36) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `payment_method` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `item_count` int(11) NOT NULL,
  `data` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `group_id` int(11) NOT NULL DEFAULT 1,
  `account_id` int(11) NOT NULL DEFAULT 0,
  `level` int(11) NOT NULL DEFAULT 1,
  `vocation` int(11) NOT NULL DEFAULT 0,
  `health` int(11) NOT NULL DEFAULT 150,
  `healthmax` int(11) NOT NULL DEFAULT 150,
  `experience` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `lookbody` int(11) NOT NULL DEFAULT 0,
  `lookfeet` int(11) NOT NULL DEFAULT 0,
  `lookhead` int(11) NOT NULL DEFAULT 0,
  `looklegs` int(11) NOT NULL DEFAULT 0,
  `looktype` int(11) NOT NULL DEFAULT 136,
  `lookaddons` int(11) NOT NULL DEFAULT 0,
  `lookmount` int(11) NOT NULL DEFAULT 0,
  `maglevel` int(11) NOT NULL DEFAULT 0,
  `mana` int(11) NOT NULL DEFAULT 0,
  `manamax` int(11) NOT NULL DEFAULT 0,
  `manaspent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `soul` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `town_id` int(11) NOT NULL DEFAULT 0,
  `posx` int(11) NOT NULL DEFAULT 0,
  `posy` int(11) NOT NULL DEFAULT 0,
  `posz` int(11) NOT NULL DEFAULT 0,
  `conditions` blob NOT NULL,
  `cap` int(11) NOT NULL DEFAULT 0,
  `sex` int(11) NOT NULL DEFAULT 0,
  `lastlogin` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `lastip` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `save` tinyint(1) NOT NULL DEFAULT 1,
  `skull` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `skulltime` int(11) NOT NULL DEFAULT 0,
  `rank_id` int(11) NOT NULL DEFAULT 0,
  `guildnick` varchar(255) NOT NULL DEFAULT '',
  `lastlogout` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `blessings` tinyint(2) NOT NULL DEFAULT 0,
  `pvp_blessing` tinyint(1) NOT NULL DEFAULT 0,
  `balance` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `stamina` bigint(20) UNSIGNED NOT NULL DEFAULT 151200000 COMMENT 'stored in miliseconds',
  `direction` int(11) NOT NULL DEFAULT 2,
  `loss_experience` int(11) NOT NULL DEFAULT 100,
  `loss_mana` int(11) NOT NULL DEFAULT 100,
  `loss_skills` int(11) NOT NULL DEFAULT 100,
  `loss_containers` int(11) NOT NULL DEFAULT 100,
  `loss_items` int(11) NOT NULL DEFAULT 100,
  `premend` int(11) NOT NULL DEFAULT 0 COMMENT 'NOT IN USE BY THE SERVER',
  `online` tinyint(1) NOT NULL DEFAULT 0,
  `marriage` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `promotion` int(11) NOT NULL DEFAULT 0,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `description` varchar(255) NOT NULL DEFAULT '',
  `comment` text NOT NULL,
  `create_ip` int(11) NOT NULL DEFAULT 0,
  `create_date` int(11) NOT NULL DEFAULT 0,
  `hide_char` int(11) NOT NULL DEFAULT 0,
  `signature` text NOT NULL,
  `broadcasting` tinyint(4) NOT NULL DEFAULT 0,
  `castDescription` varchar(255) NOT NULL DEFAULT '',
  `viewers` int(1) NOT NULL DEFAULT 0,
  `ip` varchar(17) NOT NULL DEFAULT '0',
  `offlinetraining_time` smallint(5) UNSIGNED NOT NULL DEFAULT 43200,
  `offlinetraining_skill` int(11) NOT NULL DEFAULT -1,
  `guildjoin` int(11) NOT NULL,
  `sbw_points` bigint(255) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `players`
--

INSERT INTO `players` (`id`, `name`, `world_id`, `group_id`, `account_id`, `level`, `vocation`, `health`, `healthmax`, `experience`, `lookbody`, `lookfeet`, `lookhead`, `looklegs`, `looktype`, `lookaddons`, `lookmount`, `maglevel`, `mana`, `manamax`, `manaspent`, `soul`, `town_id`, `posx`, `posy`, `posz`, `conditions`, `cap`, `sex`, `lastlogin`, `lastip`, `save`, `skull`, `skulltime`, `rank_id`, `guildnick`, `lastlogout`, `blessings`, `pvp_blessing`, `balance`, `stamina`, `direction`, `loss_experience`, `loss_mana`, `loss_skills`, `loss_containers`, `loss_items`, `premend`, `online`, `marriage`, `promotion`, `deleted`, `description`, `comment`, `create_ip`, `create_date`, `hide_char`, `signature`, `broadcasting`, `castDescription`, `viewers`, `ip`, `offlinetraining_time`, `offlinetraining_skill`, `guildjoin`, `sbw_points`) VALUES
(1, 'Account Manager', 0, 1, 1, 1, 0, 150, 150, 0, 0, 0, 0, 0, 110, 0, 0, 0, 0, 0, 0, 0, 0, 50, 50, 7, '', 400, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 201660000, 0, 100, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', 0, '', 0, '0', 43200, -1, 0, 0),
(2, 'Rook Sample', 0, 1, 1, 8, 0, 185, 185, 4200, 0, 0, 0, 0, 136, 0, 0, 0, 35, 35, 0, 0, 0, 1988, 2018, 7, '', 480, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 151200000, 0, 100, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', 0, '', 0, '127.0.0.1', 43200, -1, 0, 0),
(3, 'Sorcerer Sample', 0, 1, 1, 8, 1, 185, 185, 4200, 0, 0, 0, 0, 136, 0, 0, 0, 35, 35, 0, 100, 0, 1988, 2018, 7, '', 400, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 151200000, 0, 100, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', 0, '', 0, '127.0.0.1', 43200, -1, 0, 0),
(4, 'Druid Sample', 0, 1, 1, 8, 2, 185, 185, 4200, 0, 0, 0, 0, 136, 0, 0, 0, 35, 35, 0, 100, 0, 1988, 2018, 7, '', 400, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 151200000, 0, 100, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', 0, '', 0, '127.0.0.1', 43200, -1, 0, 0),
(5, 'Paladin Sample', 0, 1, 1, 8, 3, 185, 185, 4200, 0, 0, 0, 0, 136, 0, 0, 0, 35, 35, 0, 100, 0, 1988, 2018, 7, '', 400, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 151200000, 0, 100, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', 0, '', 0, '127.0.0.1', 43200, -1, 0, 0),
(6, 'Knight Sample', 0, 1, 1, 8, 4, 185, 185, 4200, 0, 0, 0, 0, 136, 0, 0, 0, 35, 35, 0, 100, 0, 1988, 2018, 7, '', 400, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 151200000, 0, 100, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', 0, '', 0, '127.0.0.1', 43200, -1, 0, 0),
(7, 'Admin', 0, 7, 3, 1, 4, 10000, 10000, 0, 0, 0, 0, 0, 75, 0, 0, 0, 5000, 5000, 0, 200, 1, 1988, 2018, 7, '', 5000, 1, 1554826511, 16777343, 1, 0, 0, 0, '', 1554832248, 31, 0, 0, 151200000, 0, 100, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '', 0, 1532436430, 0, '', 0, '', 0, '127.0.0.1', 43200, -1, 0, 0);

--
-- Acionadores `players`
--
DELIMITER $$
CREATE TRIGGER `oncreate_players` AFTER INSERT ON `players` FOR EACH ROW BEGIN
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 0, 10);
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 1, 10);
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 2, 10);
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 3, 10);
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 4, 10);
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 5, 10);
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 6, 10);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `ondelete_players` BEFORE DELETE ON `players` FOR EACH ROW BEGIN
	DELETE FROM `bans` WHERE `type` IN (2, 5) AND `value` = OLD.`id`;
	UPDATE `houses` SET `owner` = 0 WHERE `owner` = OLD.`id`;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_deaths`
--

CREATE TABLE `player_deaths` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL,
  `level` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_depotitems`
--

CREATE TABLE `player_depotitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL COMMENT 'any given range, eg. 0-100 is reserved for depot lockers and all above 100 will be normal items inside depots',
  `pid` int(11) NOT NULL DEFAULT 0,
  `itemtype` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL,
  `serial` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_items`
--

CREATE TABLE `player_items` (
  `player_id` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT 0,
  `sid` int(11) NOT NULL DEFAULT 0,
  `itemtype` int(11) NOT NULL DEFAULT 0,
  `count` int(11) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL,
  `serial` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_killers`
--

CREATE TABLE `player_killers` (
  `kill_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_namelocks`
--

CREATE TABLE `player_namelocks` (
  `player_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `new_name` varchar(255) NOT NULL,
  `date` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_skills`
--

CREATE TABLE `player_skills` (
  `player_id` int(11) NOT NULL,
  `skillid` tinyint(2) NOT NULL DEFAULT 0,
  `value` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `count` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `player_skills`
--

INSERT INTO `player_skills` (`player_id`, `skillid`, `value`, `count`) VALUES
(2, 0, 10, 0),
(2, 1, 10, 0),
(2, 2, 10, 0),
(2, 3, 10, 0),
(2, 4, 10, 0),
(2, 5, 10, 0),
(2, 6, 10, 0),
(3, 0, 10, 0),
(3, 1, 10, 0),
(3, 2, 10, 0),
(3, 3, 10, 0),
(3, 4, 10, 0),
(3, 5, 10, 0),
(3, 6, 10, 0),
(4, 0, 10, 0),
(4, 1, 10, 0),
(4, 2, 10, 0),
(4, 3, 10, 0),
(4, 4, 10, 0),
(4, 5, 10, 0),
(4, 6, 10, 0),
(5, 0, 10, 0),
(5, 1, 10, 0),
(5, 2, 10, 0),
(5, 3, 10, 0),
(5, 4, 10, 0),
(5, 5, 10, 0),
(5, 6, 10, 0),
(6, 0, 10, 0),
(6, 1, 10, 0),
(6, 2, 10, 0),
(6, 3, 10, 0),
(6, 4, 10, 0),
(6, 5, 10, 0),
(6, 6, 10, 0),
(7, 0, 10, 0),
(7, 1, 10, 0),
(7, 2, 10, 0),
(7, 3, 10, 0),
(7, 4, 10, 0),
(7, 5, 10, 0),
(7, 6, 10, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_spells`
--

CREATE TABLE `player_spells` (
  `player_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_statements`
--

CREATE TABLE `player_statements` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL DEFAULT 0,
  `text` varchar(255) NOT NULL,
  `date` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_storage`
--

CREATE TABLE `player_storage` (
  `player_id` int(11) NOT NULL,
  `key` varchar(32) NOT NULL DEFAULT '0',
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `player_storage`
--

INSERT INTO `player_storage` (`player_id`, `key`, `value`) VALUES
(7, '10001501', '1835008'),
(7, '1814210', '0'),
(7, '25950', '1'),
(7, '25951', '1'),
(7, '25952', '5'),
(7, '25955', '1'),
(7, '29998', '1'),
(7, '45002', '1'),
(7, '45370', '1'),
(7, '45469', '0'),
(7, '45486', '1'),
(7, '45820', '0'),
(7, '45821', '0'),
(7, '666', '1554739613');

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_viplist`
--

CREATE TABLE `player_viplist` (
  `player_id` int(11) NOT NULL,
  `vip_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `server_config`
--

CREATE TABLE `server_config` (
  `config` varchar(35) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `server_config`
--

INSERT INTO `server_config` (`config`, `value`) VALUES
('db_version', '43'),
('encryption', '2');

-- --------------------------------------------------------

--
-- Estrutura da tabela `server_motd`
--

CREATE TABLE `server_motd` (
  `id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `server_motd`
--

INSERT INTO `server_motd` (`id`, `world_id`, `text`) VALUES
(1, 0, 'Welcome to The OTX Server!'),
(2, 0, 'Welcome to the Yurots Server!');

-- --------------------------------------------------------

--
-- Estrutura da tabela `server_record`
--

CREATE TABLE `server_record` (
  `record` int(11) NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `timestamp` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `server_record`
--

INSERT INTO `server_record` (`record`, `world_id`, `timestamp`) VALUES
(0, 0, 0),
(1, 0, 1546541311);

-- --------------------------------------------------------

--
-- Estrutura da tabela `server_reports`
--

CREATE TABLE `server_reports` (
  `id` int(11) NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `player_id` int(11) NOT NULL DEFAULT 1,
  `posx` int(11) NOT NULL DEFAULT 0,
  `posy` int(11) NOT NULL DEFAULT 0,
  `posz` int(11) NOT NULL DEFAULT 0,
  `timestamp` bigint(20) NOT NULL DEFAULT 0,
  `report` text NOT NULL,
  `reads` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `snowballwar`
--

CREATE TABLE `snowballwar` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `score` int(11) NOT NULL,
  `data` varchar(255) NOT NULL,
  `hora` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tiles`
--

CREATE TABLE `tiles` (
  `id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `house_id` int(10) UNSIGNED NOT NULL,
  `x` int(5) UNSIGNED NOT NULL,
  `y` int(5) UNSIGNED NOT NULL,
  `z` tinyint(2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tile_items`
--

CREATE TABLE `tile_items` (
  `tile_id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT 0,
  `itemtype` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL,
  `serial` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tile_store`
--

CREATE TABLE `tile_store` (
  `house_id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `data` longblob NOT NULL,
  `serial` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tile_store`
--

INSERT INTO `tile_store` (`house_id`, `world_id`, `data`, `serial`) VALUES
(1, 0, 0x7e00e302060100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520275069726174652049736c652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393130383520676f6c6420636f696e732e00, ''),
(1, 0, 0x7e00e602070100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520275069726174652049736c652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393130383520676f6c6420636f696e732e00, ''),
(1, 0, 0x8100e102060100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520275069726174652049736c652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393130383520676f6c6420636f696e732e00, ''),
(1, 0, 0x8200e302060100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520275069726174652049736c652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393130383520676f6c6420636f696e732e00, ''),
(1, 0, 0x8100e102070100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520275069726174652049736c652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393130383520676f6c6420636f696e732e00, ''),
(1, 0, 0x8400e202070100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520275069726174652049736c652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393130383520676f6c6420636f696e732e00, ''),
(1, 0, 0x8500e3020701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(1, 0, 0x8700e3020701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(1, 0, 0x8100e702060100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520275069726174652049736c652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393130383520676f6c6420636f696e732e00, ''),
(1, 0, 0x8200e602060100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520275069726174652049736c652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393130383520676f6c6420636f696e732e00, ''),
(1, 0, 0x8100e7020701000000c5048001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520275069726174652049736c652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393130383520676f6c6420636f696e732e00, ''),
(1, 0, 0x8200e5020701000000c3048001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520275069726174652049736c652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393130383520676f6c6420636f696e732e00, ''),
(1, 0, 0x8400e602070100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520275069726174652049736c652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393130383520676f6c6420636f696e732e00, ''),
(1, 0, 0x8500e4020701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(1, 0, 0x8700e4020701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(1, 0, 0x8700e602070100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520275069726174652049736c652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393130383520676f6c6420636f696e732e00, ''),
(2, 0, 0x8800e302060100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520275069726174652049736c652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033343536313020676f6c6420636f696e732e00, ''),
(2, 0, 0x8a00e102060100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520275069726174652049736c652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033343536313020676f6c6420636f696e732e00, ''),
(2, 0, 0x8a00e102070100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520275069726174652049736c652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033343536313020676f6c6420636f696e732e00, ''),
(2, 0, 0x8d00e302060100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520275069726174652049736c652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033343536313020676f6c6420636f696e732e00, ''),
(2, 0, 0x8c00e102070100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520275069726174652049736c652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033343536313020676f6c6420636f696e732e00, ''),
(2, 0, 0x8800e602060100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520275069726174652049736c652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033343536313020676f6c6420636f696e732e00, ''),
(2, 0, 0x8900e4020601000000dc068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2, 0, 0x8900e6020601000000dc068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2, 0, 0x8a00e4020601000000dd068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2, 0, 0x8a00e6020601000000dd068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(2, 0, 0x8a00e702060100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520275069726174652049736c652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033343536313020676f6c6420636f696e732e00, ''),
(2, 0, 0x8b00e7020701000000c5048001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520275069726174652049736c652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033343536313020676f6c6420636f696e732e00, ''),
(2, 0, 0x8c00e7020601000000c5048001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520275069726174652049736c652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033343536313020676f6c6420636f696e732e00, ''),
(2, 0, 0x8d00e602060100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520275069726174652049736c652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033343536313020676f6c6420636f696e732e00, ''),
(2, 0, 0x8d00e602070100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520275069726174652049736c652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033343536313020676f6c6420636f696e732e00, ''),
(3, 0, 0x4c000f040601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3, 0, 0x4d000e040701000000711b8001000b006465736372697074696f6e016100000049742062656c6f6e677320746f20686f757365202742617262617269616e2049736c6520312873686f7029272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036393132323020676f6c6420636f696e732e00, ''),
(3, 0, 0x51000e040701000000ee1a8001000b006465736372697074696f6e016100000049742062656c6f6e677320746f20686f757365202742617262617269616e2049736c6520312873686f7029272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036393132323020676f6c6420636f696e732e00, ''),
(3, 0, 0x4c0010040601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(3, 0, 0x4d0012040701000000ee1a8001000b006465736372697074696f6e016100000049742062656c6f6e677320746f20686f757365202742617262617269616e2049736c6520312873686f7029272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036393132323020676f6c6420636f696e732e00, ''),
(3, 0, 0x4f001004070100000062068001000b006465736372697074696f6e016100000049742062656c6f6e677320746f20686f757365202742617262617269616e2049736c6520312873686f7029272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036393132323020676f6c6420636f696e732e00, ''),
(3, 0, 0x4b0014040601000000721b8001000b006465736372697074696f6e016100000049742062656c6f6e677320746f20686f757365202742617262617269616e2049736c6520312873686f7029272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036393132323020676f6c6420636f696e732e00, ''),
(3, 0, 0x4b0014040701000000f71a8001000b006465736372697074696f6e016100000049742062656c6f6e677320746f20686f757365202742617262617269616e2049736c6520312873686f7029272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036393132323020676f6c6420636f696e732e00, ''),
(3, 0, 0x4e0015040601000000711b8001000b006465736372697074696f6e016100000049742062656c6f6e677320746f20686f757365202742617262617269616e2049736c6520312873686f7029272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036393132323020676f6c6420636f696e732e00, ''),
(3, 0, 0x500010040601000000721b8001000b006465736372697074696f6e016100000049742062656c6f6e677320746f20686f757365202742617262617269616e2049736c6520312873686f7029272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036393132323020676f6c6420636f696e732e00, ''),
(3, 0, 0x500012040601000000f71a8001000b006465736372697074696f6e016100000049742062656c6f6e677320746f20686f757365202742617262617269616e2049736c6520312873686f7029272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036393132323020676f6c6420636f696e732e00, ''),
(3, 0, 0x500014040601000000721b8001000b006465736372697074696f6e016100000049742062656c6f6e677320746f20686f757365202742617262617269616e2049736c6520312873686f7029272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036393132323020676f6c6420636f696e732e00, ''),
(4, 0, 0x570002040601000000711b8001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202742617262617269616e2049736c652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034303932373520676f6c6420636f696e732e00, ''),
(4, 0, 0x530004040701000000f71a8001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202742617262617269616e2049736c652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034303932373520676f6c6420636f696e732e00, ''),
(4, 0, 0x550006040601000000711b8001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202742617262617269616e2049736c652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034303932373520676f6c6420636f696e732e00, ''),
(4, 0, 0x570005040701000000ee1a8001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202742617262617269616e2049736c652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034303932373520676f6c6420636f696e732e00, ''),
(4, 0, 0x580006040601000000ee1a8001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202742617262617269616e2049736c652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034303932373520676f6c6420636f696e732e00, ''),
(4, 0, 0x5a0004040601000000721b8001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202742617262617269616e2049736c652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034303932373520676f6c6420636f696e732e00, ''),
(4, 0, 0x590006040701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(4, 0, 0x590007040701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(4, 0, 0x5a0004040701000000721b8001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202742617262617269616e2049736c652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034303932373520676f6c6420636f696e732e00, ''),
(4, 0, 0x580008040701000000711b8001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202742617262617269616e2049736c652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034303932373520676f6c6420636f696e732e00, ''),
(5, 0, 0x4f00fb030701000000721b8001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202742617262617269616e2049736c652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036323735353520676f6c6420636f696e732e00, ''),
(5, 0, 0x5300f8030601000000711b8001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202742617262617269616e2049736c652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036323735353520676f6c6420636f696e732e00, ''),
(5, 0, 0x5300fb030701000000f71a8001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202742617262617269616e2049736c652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036323735353520676f6c6420636f696e732e00, ''),
(5, 0, 0x5600fb030601000000f71a8001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202742617262617269616e2049736c652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036323735353520676f6c6420636f696e732e00, ''),
(5, 0, 0x5600f9030701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(5, 0, 0x5600fa030701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(5, 0, 0x5800f9030701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(5, 0, 0x5800fa030701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(5, 0, 0x5900fb030701000000721b8001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202742617262617269616e2049736c652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036323735353520676f6c6420636f696e732e00, ''),
(5, 0, 0x5200fd030601000000711b8001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202742617262617269616e2049736c652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036323735353520676f6c6420636f696e732e00, ''),
(5, 0, 0x5100fd030701000000ee1a8001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202742617262617269616e2049736c652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036323735353520676f6c6420636f696e732e00, ''),
(5, 0, 0x5500fd030601000000711b8001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202742617262617269616e2049736c652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036323735353520676f6c6420636f696e732e00, ''),
(5, 0, 0x5700fd030701000000711b8001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202742617262617269616e2049736c652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036323735353520676f6c6420636f696e732e00, ''),
(6, 0, 0xf4070a08070100000018288001000b006465736372697074696f6e016000000049742062656c6f6e677320746f20686f757365202743656e7472616c20506c617a6120312873686f7029272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032393130343020676f6c6420636f696e732e00, ''),
(6, 0, 0xf5070a08070100000024288001000b006465736372697074696f6e016000000049742062656c6f6e677320746f20686f757365202743656e7472616c20506c617a6120312873686f7029272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032393130343020676f6c6420636f696e732e00, ''),
(6, 0, 0xf2070f08060100000019288001000b006465736372697074696f6e016000000049742062656c6f6e677320746f20686f757365202743656e7472616c20506c617a6120312873686f7029272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032393130343020676f6c6420636f696e732e00, ''),
(6, 0, 0xf2070e08070100000019288001000b006465736372697074696f6e016000000049742062656c6f6e677320746f20686f757365202743656e7472616c20506c617a6120312873686f7029272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032393130343020676f6c6420636f696e732e00, ''),
(6, 0, 0xf4070c08070100000064068001000b006465736372697074696f6e016000000049742062656c6f6e677320746f20686f757365202743656e7472616c20506c617a6120312873686f7029272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032393130343020676f6c6420636f696e732e00, ''),
(6, 0, 0xf30711080601000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(6, 0, 0xf40711080601000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(6, 0, 0xf4071008070100000018288001000b006465736372697074696f6e016000000049742062656c6f6e677320746f20686f757365202743656e7472616c20506c617a6120312873686f7029272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032393130343020676f6c6420636f696e732e00, ''),
(7, 0, 0xf9070a08070100000018288001000b006465736372697074696f6e016000000049742062656c6f6e677320746f20686f757365202743656e7472616c20506c617a6120322873686f7029272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032393130343020676f6c6420636f696e732e00, ''),
(7, 0, 0xfa070a08070100000024288001000b006465736372697074696f6e016000000049742062656c6f6e677320746f20686f757365202743656e7472616c20506c617a6120322873686f7029272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032393130343020676f6c6420636f696e732e00, ''),
(7, 0, 0xf9070c08070100000064068001000b006465736372697074696f6e016000000049742062656c6f6e677320746f20686f757365202743656e7472616c20506c617a6120322873686f7029272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032393130343020676f6c6420636f696e732e00, ''),
(7, 0, 0xf80711080601000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(7, 0, 0xf90711080601000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(7, 0, 0xfa071008070100000018288001000b006465736372697074696f6e016000000049742062656c6f6e677320746f20686f757365202743656e7472616c20506c617a6120322873686f7029272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032393130343020676f6c6420636f696e732e00, ''),
(8, 0, 0xfe070a08070100000018288001000b006465736372697074696f6e016000000049742062656c6f6e677320746f20686f757365202743656e7472616c20506c617a6120332873686f7029272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032393130343020676f6c6420636f696e732e00, ''),
(8, 0, 0xff070a08070100000024288001000b006465736372697074696f6e016000000049742062656c6f6e677320746f20686f757365202743656e7472616c20506c617a6120332873686f7029272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032393130343020676f6c6420636f696e732e00, ''),
(8, 0, 0xfe070c08070100000064068001000b006465736372697074696f6e016000000049742062656c6f6e677320746f20686f757365202743656e7472616c20506c617a6120332873686f7029272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032393130343020676f6c6420636f696e732e00, ''),
(8, 0, 0xfd0711080601000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(8, 0, 0xfe0711080601000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(8, 0, 0xfe071008070100000018288001000b006465736372697074696f6e016000000049742062656c6f6e677320746f20686f757365202743656e7472616c20506c617a6120332873686f7029272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032393130343020676f6c6420636f696e732e00, ''),
(8, 0, '', ''),
(9, 0, 0x0a080a08070100000018288001000b006465736372697074696f6e016000000049742062656c6f6e677320746f20686f757365202743656e7472616c20506c617a6120342873686f7029272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032393130343020676f6c6420636f696e732e00, ''),
(9, 0, 0x0b080a08070100000024288001000b006465736372697074696f6e016000000049742062656c6f6e677320746f20686f757365202743656e7472616c20506c617a6120342873686f7029272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032393130343020676f6c6420636f696e732e00, ''),
(9, 0, 0x0a080c08070100000064068001000b006465736372697074696f6e016000000049742062656c6f6e677320746f20686f757365202743656e7472616c20506c617a6120342873686f7029272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032393130343020676f6c6420636f696e732e00, ''),
(9, 0, 0x0c080f08060100000019288001000b006465736372697074696f6e016000000049742062656c6f6e677320746f20686f757365202743656e7472616c20506c617a6120342873686f7029272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032393130343020676f6c6420636f696e732e00, ''),
(9, 0, 0x090811080601000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(9, 0, 0x0a0811080601000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(9, 0, 0x0a081008070100000018288001000b006465736372697074696f6e016000000049742062656c6f6e677320746f20686f757365202743656e7472616c20506c617a6120342873686f7029272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032393130343020676f6c6420636f696e732e00, ''),
(10, 0, 0x0e080208070100000019288001000b006465736372697074696f6e016000000049742062656c6f6e677320746f20686f757365202743656e7472616c20506c617a6120352873686f7029272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033363338303020676f6c6420636f696e732e00, ''),
(10, 0, 0x10080008060100000018288001000b006465736372697074696f6e016000000049742062656c6f6e677320746f20686f757365202743656e7472616c20506c617a6120352873686f7029272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033363338303020676f6c6420636f696e732e00, ''),
(10, 0, 0x120801080601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(10, 0, 0x120802080601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(10, 0, 0x12080308070100000064068001000b006465736372697074696f6e016000000049742062656c6f6e677320746f20686f757365202743656e7472616c20506c617a6120352873686f7029272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033363338303020676f6c6420636f696e732e00, ''),
(10, 0, 0x13080008070100000018288001000b006465736372697074696f6e016000000049742062656c6f6e677320746f20686f757365202743656e7472616c20506c617a6120352873686f7029272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033363338303020676f6c6420636f696e732e00, ''),
(10, 0, 0x140801080601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(10, 0, 0x140802080601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(10, 0, 0x15080208070100000019288001000b006465736372697074696f6e016000000049742062656c6f6e677320746f20686f757365202743656e7472616c20506c617a6120352873686f7029272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033363338303020676f6c6420636f696e732e00, ''),
(10, 0, 0x11080508060100000018288001000b006465736372697074696f6e016000000049742062656c6f6e677320746f20686f757365202743656e7472616c20506c617a6120352873686f7029272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033363338303020676f6c6420636f696e732e00, ''),
(10, 0, 0x120805080701000000242800, ''),
(10, 0, 0x15080408060100000019288001000b006465736372697074696f6e016000000049742062656c6f6e677320746f20686f757365202743656e7472616c20506c617a6120352873686f7029272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033363338303020676f6c6420636f696e732e00, ''),
(10, 0, 0x14080508070100000018288001000b006465736372697074696f6e016000000049742062656c6f6e677320746f20686f757365202743656e7472616c20506c617a6120352873686f7029272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033363338303020676f6c6420636f696e732e00, ''),
(11, 0, 0x1508eb070701000000c5048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f75736520274368617665732056696c6c6167652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320373237363020676f6c6420636f696e732e00, ''),
(11, 0, 0x1608e8070701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(11, 0, 0x1608e9070701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(11, 0, 0x1608eb0707010000002c198001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f75736520274368617665732056696c6c6167652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320373237363020676f6c6420636f696e732e00, ''),
(12, 0, 0x1708f207070100000019288001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520274368617665732056696c6c6167652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(12, 0, 0x1708f307070100000022288001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520274368617665732056696c6c6167652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(12, 0, 0x1908f007070100000018288001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520274368617665732056696c6c6167652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(12, 0, 0x1a08f1070701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(12, 0, 0x1a08f2070701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(12, 0, 0x1a08f50707010000002c198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520274368617665732056696c6c6167652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(13, 0, 0x1108e80706010000002c198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520274368617665732056696c6c6167652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(13, 0, 0x1208e9070601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(13, 0, 0x1208ea070601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(13, 0, 0x1108ed070601000000c5048001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520274368617665732056696c6c6167652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(13, 0, 0x1208ed0706010000002c198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520274368617665732056696c6c6167652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(13, 0, 0x1308ec0706010000002d198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520274368617665732056696c6c6167652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(14, 0, 0x0608ef070701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(14, 0, 0x0908ee07070100000018288001000b006465736372697074696f6e016100000049742062656c6f6e677320746f20686f7573652027426561636820486f6d652041706172746d656e742031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031383139303020676f6c6420636f696e732e00, ''),
(14, 0, 0x0a08ef070701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(14, 0, 0x0508f007070100000019288001000b006465736372697074696f6e016100000049742062656c6f6e677320746f20686f7573652027426561636820486f6d652041706172746d656e742031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031383139303020676f6c6420636f696e732e00, ''),
(14, 0, 0x0508f207070100000022288001000b006465736372697074696f6e016100000049742062656c6f6e677320746f20686f7573652027426561636820486f6d652041706172746d656e742031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031383139303020676f6c6420636f696e732e00, ''),
(14, 0, 0x0608f0070701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(14, 0, 0x0a08f0070701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(14, 0, 0x0b08f107070100000019288001000b006465736372697074696f6e016100000049742062656c6f6e677320746f20686f7573652027426561636820486f6d652041706172746d656e742031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031383139303020676f6c6420636f696e732e00, ''),
(14, 0, 0x0708f407070100000018288001000b006465736372697074696f6e016100000049742062656c6f6e677320746f20686f7573652027426561636820486f6d652041706172746d656e742031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031383139303020676f6c6420636f696e732e00, ''),
(14, 0, 0x0a08f407070100000018288001000b006465736372697074696f6e016100000049742062656c6f6e677320746f20686f7573652027426561636820486f6d652041706172746d656e742031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031383139303020676f6c6420636f696e732e00, ''),
(15, 0, 0xfc07ea070701000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(15, 0, 0xfd07ea070701000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(15, 0, 0xff07e90707010000002c198001000b006465736372697074696f6e016100000049742062656c6f6e677320746f20686f7573652027426561636820486f6d652041706172746d656e742032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323733333020676f6c6420636f696e732e00, ''),
(15, 0, 0xfb07ec0707010000002d198001000b006465736372697074696f6e016100000049742062656c6f6e677320746f20686f7573652027426561636820486f6d652041706172746d656e742032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323733333020676f6c6420636f696e732e00, ''),
(15, 0, 0xfc07ee0707010000002c198001000b006465736372697074696f6e016100000049742062656c6f6e677320746f20686f7573652027426561636820486f6d652041706172746d656e742032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323733333020676f6c6420636f696e732e00, ''),
(15, 0, 0xfe07ee070701000000c5048001000b006465736372697074696f6e016100000049742062656c6f6e677320746f20686f7573652027426561636820486f6d652041706172746d656e742032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323733333020676f6c6420636f696e732e00, ''),
(15, 0, 0x0108eb0707010000002d198001000b006465736372697074696f6e016100000049742062656c6f6e677320746f20686f7573652027426561636820486f6d652041706172746d656e742032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323733333020676f6c6420636f696e732e00, ''),
(15, 0, '', ''),
(15, 0, '', ''),
(16, 0, 0x0808ee0706010000002c198001000b006465736372697074696f6e016000000049742062656c6f6e677320746f20686f7573652027426561636820486f6d652041706172746d656e742033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320373237363020676f6c6420636f696e732e00, ''),
(16, 0, 0x0908ee070601000000c5048001000b006465736372697074696f6e016000000049742062656c6f6e677320746f20686f7573652027426561636820486f6d652041706172746d656e742033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320373237363020676f6c6420636f696e732e00, ''),
(16, 0, 0x0a08ee0706010000002c198001000b006465736372697074696f6e016000000049742062656c6f6e677320746f20686f7573652027426561636820486f6d652041706172746d656e742033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320373237363020676f6c6420636f696e732e00, ''),
(16, 0, 0x0808f1070601000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(16, 0, 0x0908f1070601000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(16, 0, 0x0908f20706010000002c198001000b006465736372697074696f6e016000000049742062656c6f6e677320746f20686f7573652027426561636820486f6d652041706172746d656e742033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320373237363020676f6c6420636f696e732e00, ''),
(16, 0, 0x0b08f10706010000002d198001000b006465736372697074696f6e016000000049742062656c6f6e677320746f20686f7573652027426561636820486f6d652041706172746d656e742033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320373237363020676f6c6420636f696e732e00, ''),
(17, 0, 0x0208ea070601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(17, 0, 0x0208eb070601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(17, 0, 0x0308e90706010000002c198001000b006465736372697074696f6e016100000049742062656c6f6e677320746f20686f7573652027426561636820486f6d652041706172746d656e742034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(17, 0, 0x0508eb0706010000002d198001000b006465736372697074696f6e016100000049742062656c6f6e677320746f20686f7573652027426561636820486f6d652041706172746d656e742034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(17, 0, 0x0508ec070601000000c3048001000b006465736372697074696f6e016100000049742062656c6f6e677320746f20686f7573652027426561636820486f6d652041706172746d656e742034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(18, 0, 0xfd07e907060100000018288001000b006465736372697074696f6e016700000049742062656c6f6e677320746f20686f7573652027426561636820486f6d652041706172746d656e7420352873686f7029272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031313832333520676f6c6420636f696e732e00, ''),
(18, 0, 0xff07e907060100000018288001000b006465736372697074696f6e016700000049742062656c6f6e677320746f20686f7573652027426561636820486f6d652041706172746d656e7420352873686f7029272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031313832333520676f6c6420636f696e732e00, ''),
(18, 0, 0xfd07ec07060100000020288001000b006465736372697074696f6e016700000049742062656c6f6e677320746f20686f7573652027426561636820486f6d652041706172746d656e7420352873686f7029272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031313832333520676f6c6420636f696e732e00, ''),
(18, 0, 0xfd07ee07060100000024288001000b006465736372697074696f6e016700000049742062656c6f6e677320746f20686f7573652027426561636820486f6d652041706172746d656e7420352873686f7029272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031313832333520676f6c6420636f696e732e00, ''),
(18, 0, 0xfe07ed0706010000001d288001000b006465736372697074696f6e016700000049742062656c6f6e677320746f20686f7573652027426561636820486f6d652041706172746d656e7420352873686f7029272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031313832333520676f6c6420636f696e732e00, ''),
(18, 0, '', ''),
(18, 0, '', ''),
(18, 0, '', ''),
(19, 0, 0xf707ed070701000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(19, 0, 0xf807ed070701000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(19, 0, 0xf907ee0707010000002d198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274e6f727468204176656e75652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320363336363520676f6c6420636f696e732e00, ''),
(19, 0, 0xf807f1070701000000c5048001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274e6f727468204176656e75652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320363336363520676f6c6420636f696e732e00, ''),
(19, 0, 0xf907f00707010000002d198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274e6f727468204176656e75652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320363336363520676f6c6420636f696e732e00, ''),
(20, 0, 0xf307ee0707010000002d198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274e6f727468204176656e75652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320363336363520676f6c6420636f696e732e00, ''),
(20, 0, 0xf407ed070701000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(20, 0, 0xf507ed070701000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(20, 0, 0xf507f1070701000000c5048001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274e6f727468204176656e75652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320363336363520676f6c6420636f696e732e00, ''),
(21, 0, 0xf907e7070701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(21, 0, 0xf407e80707010000002d198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f75736520274e6f727468204176656e75652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031393039393520676f6c6420636f696e732e00, ''),
(21, 0, 0xf407ea070701000000c3048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f75736520274e6f727468204176656e75652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031393039393520676f6c6420636f696e732e00, ''),
(21, 0, 0xf507eb0707010000002c198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f75736520274e6f727468204176656e75652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031393039393520676f6c6420636f696e732e00, ''),
(21, 0, 0xf907e8070701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(21, 0, 0xfa07e90707010000002d198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f75736520274e6f727468204176656e75652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031393039393520676f6c6420636f696e732e00, ''),
(22, 0, 0xea07e7070701000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(22, 0, 0xeb07e7070701000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(22, 0, 0xe907e80707010000002d198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f75736520274e6f727468204176656e75652034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031383139303020676f6c6420636f696e732e00, ''),
(22, 0, 0xe907ea0707010000002d198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f75736520274e6f727468204176656e75652034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031383139303020676f6c6420636f696e732e00, ''),
(22, 0, 0xf007e80707010000002d198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f75736520274e6f727468204176656e75652034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031383139303020676f6c6420636f696e732e00, ''),
(22, 0, 0xf007ea070701000000c3048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f75736520274e6f727468204176656e75652034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031383139303020676f6c6420636f696e732e00, ''),
(23, 0, 0xe907ed070701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(23, 0, 0xe907ee070701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(23, 0, 0xef07ee07070100000020288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f75736520274e6f727468204176656e75652035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363337313020676f6c6420636f696e732e00, ''),
(23, 0, 0xec07f107070100000018288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f75736520274e6f727468204176656e75652035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363337313020676f6c6420636f696e732e00, ''),
(23, 0, 0xef07f107070100000024288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f75736520274e6f727468204176656e75652035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363337313020676f6c6420636f696e732e00, ''),
(23, 0, 0xf007f007070100000019288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f75736520274e6f727468204176656e75652035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363337313020676f6c6420636f696e732e00, ''),
(24, 0, 0xeb07ee070601000000ba048001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274e6f727468204176656e75652036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320363336363520676f6c6420636f696e732e00, ''),
(24, 0, 0xef07ed070601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(24, 0, 0xef07ee070601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(25, 0, 0xee07fb07070100000024288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202743656e7472616c20466c61742031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(25, 0, 0xf007f707070100000018288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202743656e7472616c20466c61742031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(25, 0, 0xf107f8070701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(25, 0, 0xf107f9070701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(26, 0, 0xef07f707060100000024288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202743656e7472616c20466c61742032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(26, 0, 0xed07f907060100000019288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202743656e7472616c20466c61742032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(26, 0, 0xf107f8070601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(26, 0, 0xf107f9070601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(26, 0, 0xf107fb07060100000018288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202743656e7472616c20466c61742032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(27, 0, 0xee07fe07060100000018288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202743656e7472616c20466c61742033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(27, 0, 0xf007fe07060100000024288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202743656e7472616c20466c61742033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(27, 0, 0xed070208060100000018288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202743656e7472616c20466c61742033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(27, 0, 0xef0703080601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(27, 0, 0xef0704080601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(27, 0, 0xf2070008060100000019288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202743656e7472616c20466c61742033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(27, 0, 0xf2070308060100000019288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202743656e7472616c20466c61742033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(28, 0, 0xef07f707050100000018288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202743656e7472616c20466c61742034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(28, 0, 0xee07f8070501000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(28, 0, 0xee07f9070501000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(28, 0, 0xf007fb07050100000024288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202743656e7472616c20466c61742034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(28, 0, 0xf207f907050100000019288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202743656e7472616c20466c61742034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(29, 0, 0xed07ff070501000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(29, 0, 0xef07fe07050100000018288001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202743656e7472616c20466c61742035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320373237363020676f6c6420636f696e732e00, ''),
(29, 0, 0xed0700080501000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(29, 0, 0xf0070008050100000022288001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202743656e7472616c20466c61742035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320373237363020676f6c6420636f696e732e00, ''),
(29, 0, 0xf0070108050100000019288001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202743656e7472616c20466c61742035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320373237363020676f6c6420636f696e732e00, ''),
(30, 0, 0xef0703080501000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(30, 0, 0xef0704080501000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(30, 0, 0xf1070208050100000024288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202743656e7472616c20466c61742036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031333634323520676f6c6420636f696e732e00, ''),
(30, 0, 0xf1070508050100000018288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202743656e7472616c20466c61742036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031333634323520676f6c6420636f696e732e00, ''),
(31, 0, 0xef07f707040100000018288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202743656e7472616c20466c61742037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(31, 0, 0xee07f8070401000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(31, 0, 0xee07f9070401000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(31, 0, 0xf007fb07040100000024288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202743656e7472616c20466c61742037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(31, 0, 0xf207f907040100000019288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202743656e7472616c20466c61742037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(32, 0, 0xef07fe07040100000018288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202743656e7472616c20466c61742038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(32, 0, 0xf007fe07040100000024288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202743656e7472616c20466c61742038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(32, 0, 0xed070208040100000018288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202743656e7472616c20466c61742038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, '');
INSERT INTO `tile_store` (`house_id`, `world_id`, `data`, `serial`) VALUES
(32, 0, 0xef0704080401000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(32, 0, 0xf2070008040100000019288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202743656e7472616c20466c61742038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(32, 0, 0xf2070308040100000019288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202743656e7472616c20466c61742038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(32, 0, 0xf00704080401000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(33, 0, 0xdf07f90707010000002d198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e205374726565742031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(33, 0, 0xe007f7070701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(33, 0, 0xe107f607070100000018288001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e205374726565742031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(33, 0, 0xe007f8070701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(33, 0, 0xe407f8070701000000c3048001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e205374726565742031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(33, 0, 0xe407f90707010000002d198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e205374726565742031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(34, 0, 0xdf070d08070100000019288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027447265616d205374726565742031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032383139343520676f6c6420636f696e732e00, ''),
(34, 0, 0xe3070b08060100000018288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027447265616d205374726565742031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032383139343520676f6c6420636f696e732e00, ''),
(34, 0, 0xe2070b08070100000024288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027447265616d205374726565742031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032383139343520676f6c6420636f696e732e00, ''),
(34, 0, 0xe3070b08070100000018288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027447265616d205374726565742031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032383139343520676f6c6420636f696e732e00, ''),
(34, 0, 0xe1070c080601000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(34, 0, 0xe1070e080601000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(34, 0, 0xe2070c080601000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(34, 0, 0xe2070e080601000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(34, 0, 0xe1070f08070100000018288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027447265616d205374726565742031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032383139343520676f6c6420636f696e732e00, ''),
(34, 0, 0xe4070f08060100000018288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027447265616d205374726565742031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032383139343520676f6c6420636f696e732e00, ''),
(34, 0, 0xe4070e0807010000001d288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027447265616d205374726565742031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032383139343520676f6c6420636f696e732e00, ''),
(34, 0, 0xe6070f08070100000018288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027447265616d205374726565742031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032383139343520676f6c6420636f696e732e00, ''),
(34, 0, 0xe7070e08070100000019288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027447265616d205374726565742031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032383139343520676f6c6420636f696e732e00, ''),
(35, 0, 0xd9070b08070100000018288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027447265616d205374726565742032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031313832333520676f6c6420636f696e732e00, ''),
(35, 0, 0xd7070c080701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(35, 0, 0xd7070d080701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(35, 0, 0xda070d0807010000001d288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027447265616d205374726565742032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031313832333520676f6c6420636f696e732e00, ''),
(35, 0, 0xdb070f08070100000024288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027447265616d205374726565742032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031313832333520676f6c6420636f696e732e00, ''),
(35, 0, 0xdc070d08070100000019288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027447265616d205374726565742032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031313832333520676f6c6420636f696e732e00, ''),
(35, 0, 0xd6071008070100000019288001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027447265616d205374726565742032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031313832333520676f6c6420636f696e732e00, ''),
(36, 0, 0xd80713080701000000c5048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027447265616d205374726565742033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323733333020676f6c6420636f696e732e00, ''),
(36, 0, 0xda07130807010000002c198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027447265616d205374726565742033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323733333020676f6c6420636f696e732e00, ''),
(36, 0, 0xd607150807010000002d198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027447265616d205374726565742033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323733333020676f6c6420636f696e732e00, ''),
(36, 0, 0xda07170807010000002c198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027447265616d205374726565742033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323733333020676f6c6420636f696e732e00, ''),
(36, 0, 0xdb0714080701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(36, 0, 0xdb0715080701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(36, 0, 0xdc07160807010000002d198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027447265616d205374726565742033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323733333020676f6c6420636f696e732e00, ''),
(37, 0, 0xd0070f080701000000c3048001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f75736520274775617264616d61722056696c6c6167652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320363336363520676f6c6420636f696e732e00, ''),
(37, 0, 0xd3070f08070100000025198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f75736520274775617264616d61722056696c6c6167652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320363336363520676f6c6420636f696e732e00, ''),
(37, 0, 0xd10711080701000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(37, 0, 0xd20711080701000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(38, 0, 0xcf0712080701000000c5048001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274775617264616d61722056696c6c6167652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323733333020676f6c6420636f696e732e00, ''),
(38, 0, 0xcd071408070100000025198001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274775617264616d61722056696c6c6167652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323733333020676f6c6420636f696e732e00, ''),
(38, 0, 0xd20713080701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(38, 0, 0xd20714080701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(38, 0, 0xd3071508070100000025198001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274775617264616d61722056696c6c6167652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323733333020676f6c6420636f696e732e00, ''),
(39, 0, 0xc4071708070100000025198001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274775617264616d61722056696c6c6167652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031393039393520676f6c6420636f696e732e00, ''),
(39, 0, 0xc50715080701000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(39, 0, 0xc60715080701000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(39, 0, 0xc7071608070100000025198001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274775617264616d61722056696c6c6167652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031393039393520676f6c6420636f696e732e00, ''),
(39, 0, 0xcb0716080701000000c5048001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274775617264616d61722056696c6c6167652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031393039393520676f6c6420636f696e732e00, ''),
(39, 0, 0xc9071a08070100000024198001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274775617264616d61722056696c6c6167652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031393039393520676f6c6420636f696e732e00, ''),
(40, 0, 0xc4070e08070100000025198001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274775617264616d61722056696c6c6167652034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031393039393520676f6c6420636f696e732e00, ''),
(40, 0, 0xc9070e080701000000c3048001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274775617264616d61722056696c6c6167652034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031393039393520676f6c6420636f696e732e00, ''),
(40, 0, 0xc9070f08070100000025198001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274775617264616d61722056696c6c6167652034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031393039393520676f6c6420636f696e732e00, ''),
(40, 0, 0xc4071208070100000025198001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274775617264616d61722056696c6c6167652034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031393039393520676f6c6420636f696e732e00, ''),
(40, 0, 0xc80711080701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(40, 0, 0xc80712080701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(41, 0, 0xc4070a08070100000025198001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274775617264616d61722056696c6c6167652035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(41, 0, 0xc50708080701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(41, 0, 0xc50709080701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(41, 0, 0xc8070908070100000025198001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274775617264616d61722056696c6c6167652035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(41, 0, 0xc8070a080701000000c3048001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274775617264616d61722056696c6c6167652035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(42, 0, 0xcd07ea070601000000dc068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(42, 0, 0xce07e907060100000046198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520275275676765642056696c6c6167652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303932333020676f6c6420636f696e732e00, ''),
(42, 0, 0xce07ea070601000000dd068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(42, 0, 0xcd07ea070701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(42, 0, 0xcd07eb070701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(42, 0, 0xcf07e907070100000046198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520275275676765642056696c6c6167652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303932333020676f6c6420636f696e732e00, ''),
(42, 0, 0xcc07ec07060100000047198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520275275676765642056696c6c6167652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303932333020676f6c6420636f696e732e00, ''),
(42, 0, 0xcf07ee07060100000046198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520275275676765642056696c6c6167652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303932333020676f6c6420636f696e732e00, ''),
(42, 0, 0xd107eb07060100000047198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520275275676765642056696c6c6167652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303932333020676f6c6420636f696e732e00, ''),
(42, 0, 0xd007ed070701000000a1148001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520275275676765642056696c6c6167652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303932333020676f6c6420636f696e732e00, ''),
(42, 0, 0xd307ee07070100000047198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520275275676765642056696c6c6167652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303932333020676f6c6420636f696e732e00, ''),
(42, 0, 0xd107f0070701000000a6148001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520275275676765642056696c6c6167652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303932333020676f6c6420636f696e732e00, ''),
(43, 0, 0xc307ec07060100000046198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520275275676765642056696c6c6167652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033343536313020676f6c6420636f696e732e00, ''),
(43, 0, 0xc207ec07070100000046198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520275275676765642056696c6c6167652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033343536313020676f6c6420636f696e732e00, ''),
(43, 0, 0xc407ef070601000000a1148001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520275275676765642056696c6c6167652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033343536313020676f6c6420636f696e732e00, ''),
(43, 0, 0xc607ee070601000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(43, 0, 0xc607ef070601000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(43, 0, 0xc707ef07070100000047198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520275275676765642056696c6c6167652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033343536313020676f6c6420636f696e732e00, ''),
(43, 0, 0xc307f107060100000046198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520275275676765642056696c6c6167652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033343536313020676f6c6420636f696e732e00, ''),
(43, 0, 0xc707f007060100000047198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520275275676765642056696c6c6167652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033343536313020676f6c6420636f696e732e00, ''),
(43, 0, 0xc407f107070100000046198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520275275676765642056696c6c6167652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033343536313020676f6c6420636f696e732e00, ''),
(43, 0, 0xc507f1070701000000a6148001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520275275676765642056696c6c6167652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033343536313020676f6c6420636f696e732e00, ''),
(44, 0, 0xbd07f307070100000046198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520275275676765642056696c6c6167652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343535323020676f6c6420636f696e732e00, ''),
(44, 0, 0xbe07f4070701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(44, 0, 0xbe07f5070701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(44, 0, 0xbf07f607070100000047198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520275275676765642056696c6c6167652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343535323020676f6c6420636f696e732e00, ''),
(44, 0, 0xbc07f807070100000046198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520275275676765642056696c6c6167652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343535323020676f6c6420636f696e732e00, ''),
(44, 0, 0xbd07f8070701000000a6148001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520275275676765642056696c6c6167652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343535323020676f6c6420636f696e732e00, ''),
(45, 0, 0xb707ed07070100000024198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520275275676765642056696c6c6167652034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033323734323020676f6c6420636f696e732e00, ''),
(45, 0, 0xb307f007070100000025198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520275275676765642056696c6c6167652034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033323734323020676f6c6420636f696e732e00, ''),
(45, 0, 0xb307f1070701000000c3048001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520275275676765642056696c6c6167652034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033323734323020676f6c6420636f696e732e00, ''),
(45, 0, 0xb607f3070701000000c5048001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520275275676765642056696c6c6167652034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033323734323020676f6c6420636f696e732e00, ''),
(45, 0, 0xb907f0070701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(45, 0, 0xb907f1070701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(45, 0, 0xb907f207070100000024198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520275275676765642056696c6c6167652034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033323734323020676f6c6420636f696e732e00, ''),
(46, 0, 0xb607ee070601000000dc068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(46, 0, 0xb707ee070601000000dd068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(46, 0, 0xb307f107060100000025198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520275275676765642056696c6c6167652035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363337313020676f6c6420636f696e732e00, ''),
(46, 0, 0xb607f2070601000000c5048001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520275275676765642056696c6c6167652035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363337313020676f6c6420636f696e732e00, ''),
(46, 0, 0xb907f207060100000024198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520275275676765642056696c6c6167652035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363337313020676f6c6420636f696e732e00, ''),
(46, 0, 0xba07f107060100000025198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520275275676765642056696c6c6167652035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363337313020676f6c6420636f696e732e00, ''),
(47, 0, 0xb407ff070701000000a4148001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520275275676765642056696c6c6167652036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(47, 0, 0xb507fc070701000000dc068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(47, 0, 0xb607fc070701000000dd068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(47, 0, 0xb807ff07070100000047198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520275275676765642056696c6c6167652036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(48, 0, 0xb00702080701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(48, 0, 0xb00703080701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(48, 0, 0xb30700080701000000c5048001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520275275676765642056696c6c6167652037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(48, 0, 0xb4070308070100000025198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520275275676765642056696c6c6167652037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(48, 0, 0xb3070508070100000024198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520275275676765642056696c6c6167652037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(49, 0, 0xac07fe07070100000025198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520275275676765642056696c6c6167652038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031333634323520676f6c6420636f696e732e00, ''),
(49, 0, 0xae07fc070701000000dc068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(49, 0, 0xaf07fc070701000000dd068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(49, 0, 0xb007fb07070100000024198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520275275676765642056696c6c6167652038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031333634323520676f6c6420636f696e732e00, ''),
(49, 0, 0xb107fe070701000000c3048001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520275275676765642056696c6c6167652038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031333634323520676f6c6420636f696e732e00, ''),
(49, 0, 0xae0700080701000000dc068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(49, 0, 0xaf0700080701000000dd068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(50, 0, 0xb607fb07060100000046198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520275275676765642056696c6c6167652039272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343535323020676f6c6420636f696e732e00, ''),
(50, 0, 0xb307fe070601000000a4148001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520275275676765642056696c6c6167652039272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343535323020676f6c6420636f696e732e00, ''),
(50, 0, 0xb707fe07060100000047198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520275275676765642056696c6c6167652039272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343535323020676f6c6420636f696e732e00, ''),
(50, 0, 0xb707ff070601000000a1148001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520275275676765642056696c6c6167652039272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343535323020676f6c6420636f696e732e00, ''),
(50, 0, 0xb40700080601000000dc068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(50, 0, 0xb50700080601000000dd068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(51, 0, 0xaf070308060100000025198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520275275676765642056696c6c616765203130272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320383138353520676f6c6420636f696e732e00, ''),
(51, 0, 0xb10701080601000000c5048001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520275275676765642056696c6c616765203130272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320383138353520676f6c6420636f696e732e00, ''),
(51, 0, 0xb4070308060100000025198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520275275676765642056696c6c616765203130272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320383138353520676f6c6420636f696e732e00, ''),
(51, 0, 0xb20704080601000000dc068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(51, 0, 0xb30704080601000000dd068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(52, 0, 0x050802080501000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(52, 0, 0x050803080501000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(52, 0, 0x060801080501000000c5048001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202754656d706c6520486f7573652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320393039353020676f6c6420636f696e732e00, ''),
(53, 0, 0x020802080501000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(53, 0, 0x020803080501000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(53, 0, 0x030801080501000000c5048001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202754656d706c6520486f7573652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320383138353520676f6c6420636f696e732e00, ''),
(54, 0, 0xff0702080501000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(54, 0, 0xff0703080501000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(54, 0, '', ''),
(55, 0, 0xfc0702080501000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(55, 0, 0xfc0703080501000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(55, 0, 0xfd0701080501000000c5048001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202754656d706c6520486f7573652034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320383138353520676f6c6420636f696e732e00, ''),
(56, 0, 0xf90702080501000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(56, 0, 0xf90703080501000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(56, 0, 0xfa0701080501000000c5048001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202754656d706c6520486f7573652035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320383138353520676f6c6420636f696e732e00, ''),
(57, 0, 0xf907fd070501000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(57, 0, 0xfa07fd070501000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(57, 0, 0xfc07ff0705010000002c198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202754656d706c6520486f7573652036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(57, 0, 0xfd07fe070501000000c3048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202754656d706c6520486f7573652036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(58, 0, 0xf907f9070501000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(58, 0, 0xfa07f9070501000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(58, 0, 0xfd07fa070501000000c3048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202754656d706c6520486f7573652037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343535323020676f6c6420636f696e732e00, ''),
(59, 0, 0x0108f9070501000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(59, 0, 0x0108fa070501000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(59, 0, 0x0208fd070501000000c5048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202754656d706c6520486f7573652038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343535323020676f6c6420636f696e732e00, ''),
(60, 0, 0x0808fb070501000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(60, 0, 0x0708fd070501000000c5048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202754656d706c6520486f7573652039272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031383139303020676f6c6420636f696e732e00, ''),
(60, 0, 0x0808fc070501000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(61, 0, 0xf707d9070701000000c3048001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f7573652027557070657220486f7573652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303932333020676f6c6420636f696e732e00, ''),
(61, 0, 0xfa07d80706010000002c198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f7573652027557070657220486f7573652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303932333020676f6c6420636f696e732e00, ''),
(61, 0, 0xfb07d9070601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(61, 0, 0xfb07da070601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(61, 0, 0xf907d80707010000002c198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f7573652027557070657220486f7573652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303932333020676f6c6420636f696e732e00, ''),
(61, 0, 0xf707dc0707010000002d198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f7573652027557070657220486f7573652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303932333020676f6c6420636f696e732e00, ''),
(61, 0, 0xf907dd0706010000002c198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f7573652027557070657220486f7573652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303932333020676f6c6420636f696e732e00, ''),
(61, 0, 0xf907dd070701000000bc048001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f7573652027557070657220486f7573652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303932333020676f6c6420636f696e732e00, ''),
(61, 0, 0xfa07dd0707010000002c198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f7573652027557070657220486f7573652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303932333020676f6c6420636f696e732e00, ''),
(61, 0, 0xfc07dc0706010000002d198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f7573652027557070657220486f7573652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303932333020676f6c6420636f696e732e00, ''),
(61, 0, 0xfc07dc0707010000002d198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f7573652027557070657220486f7573652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303932333020676f6c6420636f696e732e00, ''),
(62, 0, 0xb30903080701000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(62, 0, 0xb40903080701000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(62, 0, 0xb809020806010000002c198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035373239383520676f6c6420636f696e732e00, ''),
(62, 0, 0xb809020807010000002c198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035373239383520676f6c6420636f696e732e00, ''),
(62, 0, 0xb9090208070100000071188001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035373239383520676f6c6420636f696e732e00, ''),
(62, 0, 0xb30905080701000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(62, 0, 0xb609040806010000006a188001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035373239383520676f6c6420636f696e732e00, ''),
(62, 0, 0xb40905080701000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(62, 0, 0xb509060807010000002c198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035373239383520676f6c6420636f696e732e00, ''),
(62, 0, 0xb609040807010000006a188001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035373239383520676f6c6420636f696e732e00, ''),
(62, 0, 0xbb09060806010000002d198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035373239383520676f6c6420636f696e732e00, ''),
(62, 0, 0xbb09050807010000002d198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035373239383520676f6c6420636f696e732e00, ''),
(62, 0, 0xb609080806010000002d198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035373239383520676f6c6420636f696e732e00, ''),
(62, 0, 0xba09090806010000002c198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035373239383520676f6c6420636f696e732e00, ''),
(62, 0, 0xb809090807010000002c198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035373239383520676f6c6420636f696e732e00, ''),
(63, 0, 0xbd09050807010000002d198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037353438383520676f6c6420636f696e732e00, ''),
(63, 0, 0xbe0906080701000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(63, 0, 0xbf0906080701000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(63, 0, 0xbe0908080701000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(63, 0, 0xbf0908080701000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(63, 0, 0xc0090208070100000071188001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037353438383520676f6c6420636f696e732e00, ''),
(63, 0, 0xc109020807010000002c198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037353438383520676f6c6420636f696e732e00, ''),
(63, 0, 0xc309040807010000002d198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037353438383520676f6c6420636f696e732e00, ''),
(63, 0, 0xc309070807010000006a188001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037353438383520676f6c6420636f696e732e00, ''),
(63, 0, 0xc009090807010000002c198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037353438383520676f6c6420636f696e732e00, ''),
(63, 0, 0xc609090807010000002c198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037353438383520676f6c6420636f696e732e00, ''),
(64, 0, 0xc409fe0707010000002d198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383230383020676f6c6420636f696e732e00, ''),
(64, 0, 0xc409ff0707010000006f188001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383230383020676f6c6420636f696e732e00, ''),
(64, 0, 0xc909ff0707010000006d188001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383230383020676f6c6420636f696e732e00, ''),
(64, 0, 0xc409010807010000002d198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383230383020676f6c6420636f696e732e00, ''),
(64, 0, 0xc80902080701000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(64, 0, 0xc90902080701000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(64, 0, 0xca09030807010000002c198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383230383020676f6c6420636f696e732e00, ''),
(64, 0, 0xcb09010807010000002d198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383230383020676f6c6420636f696e732e00, ''),
(65, 0, 0xc709f30707010000002c198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036313834363020676f6c6420636f696e732e00, ''),
(65, 0, 0xc409f60707010000002d198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036313834363020676f6c6420636f696e732e00, ''),
(65, 0, 0xc409f70707010000006f188001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036313834363020676f6c6420636f696e732e00, ''),
(65, 0, 0xc509f4070701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(65, 0, 0xc509f5070701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(65, 0, 0xc709f4070701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(65, 0, 0xc709f5070701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(65, 0, 0xcb09f50707010000002d198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036313834363020676f6c6420636f696e732e00, ''),
(65, 0, 0xc409f90707010000002d198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036313834363020676f6c6420636f696e732e00, ''),
(65, 0, 0xcb09f90707010000002d198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036313834363020676f6c6420636f696e732e00, ''),
(66, 0, 0xc009e6070701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(66, 0, 0xc009e7070701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(66, 0, 0xc109e50707010000002c198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383230383020676f6c6420636f696e732e00, ''),
(66, 0, 0xc209e6070701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(66, 0, 0xc209e7070701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(66, 0, 0xc109e90706010000002c198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383230383020676f6c6420636f696e732e00, ''),
(66, 0, 0xc209e90706010000006d188001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383230383020676f6c6420636f696e732e00, ''),
(66, 0, 0xc109e90707010000006d188001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383230383020676f6c6420636f696e732e00, ''),
(66, 0, 0xc309e80707010000002d198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383230383020676f6c6420636f696e732e00, ''),
(66, 0, 0xc109ef0707010000002c198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383230383020676f6c6420636f696e732e00, ''),
(66, 0, 0xc309ef07070100000071188001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383230383020676f6c6420636f696e732e00, ''),
(66, 0, 0xc409ef0706010000002c198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383230383020676f6c6420636f696e732e00, ''),
(66, 0, 0xc509ec0706010000002d198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383230383020676f6c6420636f696e732e00, ''),
(66, 0, 0xc509ee0707010000002d198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383230383020676f6c6420636f696e732e00, ''),
(67, 0, 0xb909eb0706010000002d198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035313834313520676f6c6420636f696e732e00, ''),
(67, 0, 0xbb09e80706010000002c198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035313834313520676f6c6420636f696e732e00, ''),
(67, 0, 0xb909eb0707010000002d198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035313834313520676f6c6420636f696e732e00, ''),
(67, 0, 0xbb09e80707010000002c198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035313834313520676f6c6420636f696e732e00, ''),
(67, 0, 0xb609ed070701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(67, 0, 0xb609ee070701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, '');
INSERT INTO `tile_store` (`house_id`, `world_id`, `data`, `serial`) VALUES
(67, 0, 0xb709ef0707010000002c198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035313834313520676f6c6420636f696e732e00, ''),
(67, 0, 0xb909ee0706010000006a188001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035313834313520676f6c6420636f696e732e00, ''),
(67, 0, 0xbb09ef0706010000002c198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035313834313520676f6c6420636f696e732e00, ''),
(67, 0, 0xb909ee0707010000006a188001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035313834313520676f6c6420636f696e732e00, ''),
(67, 0, 0xbc09ef07070100000071188001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035313834313520676f6c6420636f696e732e00, ''),
(67, 0, 0xbd09ef0707010000002c198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035313834313520676f6c6420636f696e732e00, ''),
(68, 0, 0xaf09e90706010000002d198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034343536353520676f6c6420636f696e732e00, ''),
(68, 0, 0xaf09ec0707010000002d198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034343536353520676f6c6420636f696e732e00, ''),
(68, 0, 0xb209e70706010000002c198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034343536353520676f6c6420636f696e732e00, ''),
(68, 0, 0xb509e70707010000002c198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034343536353520676f6c6420636f696e732e00, ''),
(68, 0, 0xb309e90706010000006a188001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034343536353520676f6c6420636f696e732e00, ''),
(68, 0, 0xb309eb0706010000002d198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034343536353520676f6c6420636f696e732e00, ''),
(68, 0, 0xb309e90707010000006a188001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034343536353520676f6c6420636f696e732e00, ''),
(68, 0, 0xb609e8070701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(68, 0, 0xb609e9070701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(68, 0, 0xb709e90707010000002d198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034343536353520676f6c6420636f696e732e00, ''),
(68, 0, 0xb109ec0706010000006d188001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034343536353520676f6c6420636f696e732e00, ''),
(68, 0, 0xb209ec0706010000002c198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034343536353520676f6c6420636f696e732e00, ''),
(68, 0, 0xb109ef07070100000071188001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034343536353520676f6c6420636f696e732e00, ''),
(68, 0, 0xb209ef0707010000002c198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034343536353520676f6c6420636f696e732e00, ''),
(69, 0, 0xa709ee070701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(69, 0, 0xa709ef070701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(69, 0, 0xa809ed0707010000002c198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343537343520676f6c6420636f696e732e00, ''),
(69, 0, 0xa909ee070701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(69, 0, 0xa909ef070701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(69, 0, 0xa909f10706010000006d188001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343537343520676f6c6420636f696e732e00, ''),
(69, 0, 0xa809f10707010000006d188001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343537343520676f6c6420636f696e732e00, ''),
(69, 0, 0xac09f10706010000002c198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343537343520676f6c6420636f696e732e00, ''),
(69, 0, 0xae09f30706010000002d198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343537343520676f6c6420636f696e732e00, ''),
(69, 0, 0xac09f10707010000002c198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343537343520676f6c6420636f696e732e00, ''),
(69, 0, 0xa609f40706010000002d198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343537343520676f6c6420636f696e732e00, ''),
(69, 0, 0xa609f40707010000002d198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343537343520676f6c6420636f696e732e00, ''),
(69, 0, 0xa909f60706010000002c198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343537343520676f6c6420636f696e732e00, ''),
(69, 0, 0xac09f60707010000002c198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343537343520676f6c6420636f696e732e00, ''),
(69, 0, 0xae09f40707010000006f188001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343537343520676f6c6420636f696e732e00, ''),
(69, 0, 0xae09f50707010000002d198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343537343520676f6c6420636f696e732e00, ''),
(70, 0, 0xaa09fa0706010000002c198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652039272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333636353020676f6c6420636f696e732e00, ''),
(70, 0, 0xa909fa0707010000002c198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652039272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333636353020676f6c6420636f696e732e00, ''),
(70, 0, 0xa709fe0706010000002d198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652039272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333636353020676f6c6420636f696e732e00, ''),
(70, 0, 0xa609fd0707010000002c198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652039272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333636353020676f6c6420636f696e732e00, ''),
(70, 0, 0xa709fe0707010000006a188001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652039272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333636353020676f6c6420636f696e732e00, ''),
(70, 0, 0xa809ff0706010000006d188001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652039272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333636353020676f6c6420636f696e732e00, ''),
(70, 0, 0xab09ff0706010000002c198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652039272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333636353020676f6c6420636f696e732e00, ''),
(70, 0, 0xae09fe0706010000002d198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652039272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333636353020676f6c6420636f696e732e00, ''),
(70, 0, 0xac09ff0707010000002c198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652039272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333636353020676f6c6420636f696e732e00, ''),
(70, 0, 0xae09fc0707010000002d198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652039272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333636353020676f6c6420636f696e732e00, ''),
(70, 0, 0xae09fd0707010000006f188001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652039272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333636353020676f6c6420636f696e732e00, ''),
(70, 0, 0xa409000807010000002d198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652039272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333636353020676f6c6420636f696e732e00, ''),
(70, 0, 0xa80900080701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(70, 0, 0xa80901080701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(70, 0, 0xa809020807010000002c198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202743656e7472616c20436972636c652039272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333636353020676f6c6420636f696e732e00, ''),
(71, 0, 0xa7090708070100000024198001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027546f776e686f7573652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393130383520676f6c6420636f696e732e00, ''),
(71, 0, 0xa309090806010000002d198001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027546f776e686f7573652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393130383520676f6c6420636f696e732e00, ''),
(71, 0, 0xa3090b0807010000002d198001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027546f776e686f7573652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393130383520676f6c6420636f696e732e00, ''),
(71, 0, 0xa6090a0806010000006f188001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027546f776e686f7573652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393130383520676f6c6420636f696e732e00, ''),
(71, 0, 0xa6090b0806010000002d198001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027546f776e686f7573652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393130383520676f6c6420636f696e732e00, ''),
(71, 0, 0xa9090a0807010000002d198001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027546f776e686f7573652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393130383520676f6c6420636f696e732e00, ''),
(71, 0, 0xa9090b0807010000006f188001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027546f776e686f7573652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393130383520676f6c6420636f696e732e00, ''),
(71, 0, 0xa4090c080601000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(71, 0, 0xa5090c080601000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(72, 0, 0xa3090f08070100000025198001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027546f776e686f7573652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343537343520676f6c6420636f696e732e00, ''),
(72, 0, 0xa9090f0807010000006f188001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027546f776e686f7573652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343537343520676f6c6420636f696e732e00, ''),
(72, 0, 0xa309110806010000002d198001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027546f776e686f7573652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343537343520676f6c6420636f696e732e00, ''),
(72, 0, 0xa309120807010000002d198001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027546f776e686f7573652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343537343520676f6c6420636f696e732e00, ''),
(72, 0, 0xa609100806010000006f188001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027546f776e686f7573652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343537343520676f6c6420636f696e732e00, ''),
(72, 0, 0xa80913080601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(72, 0, 0xa909100807010000002d198001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027546f776e686f7573652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343537343520676f6c6420636f696e732e00, ''),
(72, 0, 0xa709160806010000002c198001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027546f776e686f7573652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343537343520676f6c6420636f696e732e00, ''),
(72, 0, 0xa709160807010000002c198001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027546f776e686f7573652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343537343520676f6c6420636f696e732e00, ''),
(72, 0, 0xa80914080601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(73, 0, 0xae09130806010000002c198001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027546f776e686f7573652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333635363020676f6c6420636f696e732e00, ''),
(73, 0, 0xaf091308060100000071188001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027546f776e686f7573652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333635363020676f6c6420636f696e732e00, ''),
(73, 0, 0xad091108070100000071188001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027546f776e686f7573652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333635363020676f6c6420636f696e732e00, ''),
(73, 0, 0xac09160806010000002c198001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027546f776e686f7573652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333635363020676f6c6420636f696e732e00, ''),
(73, 0, 0xaf091608070100000024198001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027546f776e686f7573652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333635363020676f6c6420636f696e732e00, ''),
(73, 0, 0xb00912080701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(73, 0, 0xb00913080701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(74, 0, 0xb9090d0806010000002c198001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027546f776e686f7573652034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035363338393020676f6c6420636f696e732e00, ''),
(74, 0, 0xbb090e080601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(74, 0, 0xbb090f080601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(74, 0, 0xb9090d0807010000002c198001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027546f776e686f7573652034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035363338393020676f6c6420636f696e732e00, ''),
(74, 0, 0xbb090e080701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(74, 0, 0xbb090f080701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(74, 0, 0xb809120806010000002c198001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027546f776e686f7573652034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035363338393020676f6c6420636f696e732e00, ''),
(74, 0, 0xb9091208060100000071188001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027546f776e686f7573652034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035363338393020676f6c6420636f696e732e00, ''),
(74, 0, 0xbc091108060100000025198001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027546f776e686f7573652034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035363338393020676f6c6420636f696e732e00, ''),
(74, 0, 0xb8091508070100000024198001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027546f776e686f7573652034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035363338393020676f6c6420636f696e732e00, ''),
(74, 0, 0xb9091508070100000071188001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027546f776e686f7573652034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035363338393020676f6c6420636f696e732e00, ''),
(74, 0, 0xbc09140807010000002d198001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027546f776e686f7573652034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035363338393020676f6c6420636f696e732e00, ''),
(75, 0, 0x9f09df0706010000002d198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383231323520676f6c6420636f696e732e00, ''),
(75, 0, 0xa309dd0706010000002c198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383231323520676f6c6420636f696e732e00, ''),
(75, 0, 0xa309dd0707010000002c198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383231323520676f6c6420636f696e732e00, ''),
(75, 0, 0x9f09e20706010000002d198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383231323520676f6c6420636f696e732e00, ''),
(75, 0, 0x9f09e30706010000006a188001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383231323520676f6c6420636f696e732e00, ''),
(75, 0, 0x9c09e1070701000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(75, 0, 0x9c09e3070701000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(75, 0, 0x9d09e1070701000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(75, 0, 0x9d09e3070701000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(75, 0, 0x9e09e00707010000002c198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383231323520676f6c6420636f696e732e00, ''),
(75, 0, 0x9f09e20707010000006a188001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383231323520676f6c6420636f696e732e00, ''),
(75, 0, 0x9e09e40707010000002c198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383231323520676f6c6420636f696e732e00, ''),
(75, 0, 0xa509e10706010000002d198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383231323520676f6c6420636f696e732e00, ''),
(75, 0, 0xa509e00707010000002d198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383231323520676f6c6420636f696e732e00, ''),
(75, 0, 0xa509e30707010000002d198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383231323520676f6c6420636f696e732e00, ''),
(75, 0, 0xa109e40706010000002c198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383231323520676f6c6420636f696e732e00, ''),
(75, 0, 0xa209e407070100000071188001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383231323520676f6c6420636f696e732e00, ''),
(75, 0, 0xa409e40707010000002c198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383231323520676f6c6420636f696e732e00, ''),
(76, 0, 0x9009de0706010000002c198001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131303034393520676f6c6420636f696e732e00, ''),
(76, 0, 0x9009de0707010000002c198001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131303034393520676f6c6420636f696e732e00, ''),
(76, 0, 0x8c09e10706010000002d198001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131303034393520676f6c6420636f696e732e00, ''),
(76, 0, 0x8c09e10707010000002d198001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131303034393520676f6c6420636f696e732e00, ''),
(76, 0, 0x8c09e40706010000002d198001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131303034393520676f6c6420636f696e732e00, ''),
(76, 0, 0x8c09e40707010000002d198001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131303034393520676f6c6420636f696e732e00, ''),
(76, 0, 0x8e09e60707010000002c198001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131303034393520676f6c6420636f696e732e00, ''),
(76, 0, 0x9309e00706010000002d198001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131303034393520676f6c6420636f696e732e00, ''),
(76, 0, 0x9609e2070701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(76, 0, 0x9609e3070701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(76, 0, 0x9709e10707010000002c198001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131303034393520676f6c6420636f696e732e00, ''),
(76, 0, 0x9809e2070701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(76, 0, 0x9809e3070701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(76, 0, 0x9009e60706010000002c198001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131303034393520676f6c6420636f696e732e00, ''),
(76, 0, 0x9309e40706010000006a188001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131303034393520676f6c6420636f696e732e00, ''),
(76, 0, 0x9309e50706010000002d198001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131303034393520676f6c6420636f696e732e00, ''),
(76, 0, 0x9009e607070100000071188001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131303034393520676f6c6420636f696e732e00, ''),
(76, 0, 0x9309e40707010000006a188001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131303034393520676f6c6420636f696e732e00, ''),
(76, 0, 0x9509e60707010000002c198001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131303034393520676f6c6420636f696e732e00, ''),
(76, 0, 0x9909e50707010000002d198001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131303034393520676f6c6420636f696e732e00, ''),
(77, 0, 0x8d09eb070701000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(77, 0, 0x8e09eb070701000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(77, 0, 0x8f09ea0707010000002c198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(77, 0, 0x8c09ec0707010000002d198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(77, 0, 0x9309ed0707010000006f188001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(77, 0, 0x9309ee0707010000002d198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(78, 0, 0x8d09f2070701000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(78, 0, 0x8e09f2070701000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(78, 0, 0x8f09f10707010000002c198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(78, 0, 0x8c09f40707010000002d198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(78, 0, 0x9309f40707010000006f188001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(78, 0, 0x9309f50707010000002d198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(79, 0, 0x8c09fb0707010000002d198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(79, 0, 0x8d09f9070701000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(79, 0, 0x8e09f9070701000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(79, 0, 0x8f09f80707010000002c198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(79, 0, 0x9309fa0707010000002d198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(79, 0, 0x9309fb0707010000006f188001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(79, 0, 0x9109fd0707010000002c198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(80, 0, 0x9b09eb070601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(80, 0, 0x9909ea0707010000002c198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303933363520676f6c6420636f696e732e00, ''),
(80, 0, 0x9c09ea0706010000002c198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303933363520676f6c6420636f696e732e00, ''),
(80, 0, 0x9d09eb070601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(80, 0, 0x9c09ea0707010000002c198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303933363520676f6c6420636f696e732e00, ''),
(80, 0, 0x9709ed0706010000002d198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303933363520676f6c6420636f696e732e00, ''),
(80, 0, 0x9709ed0707010000002d198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303933363520676f6c6420636f696e732e00, ''),
(80, 0, 0x9a09ef0706010000006d188001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303933363520676f6c6420636f696e732e00, ''),
(80, 0, 0x9b09ec070601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(80, 0, 0x9b09ef0706010000002c198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303933363520676f6c6420636f696e732e00, ''),
(80, 0, 0x9a09ef0707010000006d188001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303933363520676f6c6420636f696e732e00, ''),
(80, 0, 0x9d09ec070601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(80, 0, 0x9e09ee0706010000002d198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303933363520676f6c6420636f696e732e00, ''),
(80, 0, 0x9d09ef0707010000002c198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303933363520676f6c6420636f696e732e00, ''),
(80, 0, 0x9e09ec0707010000002d198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303933363520676f6c6420636f696e732e00, ''),
(80, 0, 0x9e09ed0707010000006f188001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303933363520676f6c6420636f696e732e00, ''),
(80, 0, 0x9709f10707010000002d198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303933363520676f6c6420636f696e732e00, ''),
(80, 0, 0x9809f0070701000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(80, 0, 0x9809f2070701000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(80, 0, 0x9909f0070701000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(80, 0, 0x9909f2070701000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(80, 0, 0x9a09f30707010000002c198001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e75652036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303933363520676f6c6420636f696e732e00, ''),
(81, 0, 0x9c09f70707010000002c198001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e7565203761272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(81, 0, 0x9709fa0707010000002d198001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e7565203761272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(81, 0, 0x9809f8070701000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(81, 0, 0x9909f8070701000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(81, 0, 0x9e09f80707010000002d198001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e7565203761272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(81, 0, 0x9e09fa0707010000006f188001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e7565203761272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(82, 0, 0x9709ff0707010000002d198001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e7565203861272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(82, 0, 0x9809fd070701000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(82, 0, 0x9909fd070701000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(82, 0, 0x9e09fe0707010000006f188001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e7565203861272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(82, 0, 0x9e09ff0707010000002d198001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e7565203861272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(82, 0, 0x9c09010807010000002c198001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e7565203861272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(83, 0, 0x9b09f70706010000002c198001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e7565203762272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(83, 0, 0x9709fa0706010000002d198001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e7565203762272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(83, 0, 0x9809f8070601000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(83, 0, 0x9909f8070601000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(83, 0, 0x9e09fa0706010000006f188001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e7565203762272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(83, 0, 0x9e09fb0706010000002d198001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e7565203762272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(84, 0, 0x9709ff0706010000002d198001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e7565203862272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(84, 0, 0x9809fd070601000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(84, 0, 0x9909fd070601000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(84, 0, 0x9e09fe0706010000002d198001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e7565203862272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(84, 0, 0x9e09ff0706010000006f188001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e7565203862272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(84, 0, 0x9c09010806010000002c198001000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e204176656e7565203862272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(85, 0, 0x970906080701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(85, 0, 0x970907080701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(85, 0, 0x9a09050807010000002c198001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e20466c61742031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320363336363520676f6c6420636f696e732e00, ''),
(85, 0, 0x9b09070807010000002d198001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e20466c61742031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320363336363520676f6c6420636f696e732e00, ''),
(85, 0, 0x9809080807010000002c198001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e20466c61742031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320363336363520676f6c6420636f696e732e00, ''),
(85, 0, 0x990908080701000000c5048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e20466c61742031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320363336363520676f6c6420636f696e732e00, ''),
(86, 0, 0x8f0906080701000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(86, 0, 0x8e09080807010000002d198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e20466c61742032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031333634323520676f6c6420636f696e732e00, ''),
(86, 0, 0x900906080701000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(86, 0, 0x9109050807010000002c198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e20466c61742032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031333634323520676f6c6420636f696e732e00, ''),
(86, 0, 0x930908080701000000c3048001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e20466c61742032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031333634323520676f6c6420636f696e732e00, ''),
(86, 0, 0x9309090807010000002d198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e20466c61742032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031333634323520676f6c6420636f696e732e00, ''),
(87, 0, 0x91090b080701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(87, 0, 0x95090b080701000000c5048001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e20466c61742033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343535323020676f6c6420636f696e732e00, ''),
(87, 0, 0x90090d0807010000002d198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e20466c61742033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343535323020676f6c6420636f696e732e00, ''),
(87, 0, 0x91090c080701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(87, 0, 0x93090f0807010000002c198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e20466c61742033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343535323020676f6c6420636f696e732e00, ''),
(88, 0, 0x99090c080701000000c5048001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e20466c61742034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031373238303520676f6c6420636f696e732e00, ''),
(88, 0, 0x9a090c0807010000002c198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e20466c61742034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031373238303520676f6c6420636f696e732e00, ''),
(88, 0, 0x9c090f0807010000002d198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e20466c61742034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031373238303520676f6c6420636f696e732e00, ''),
(88, 0, 0x970910080701000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(88, 0, 0x980910080701000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(89, 0, 0x8e09070806010000002d198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e20466c61742035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031333634323520676f6c6420636f696e732e00, ''),
(89, 0, 0x8f0906080601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(89, 0, 0x8f0907080601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(89, 0, 0x930908080601000000c3048001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e20466c61742035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031333634323520676f6c6420636f696e732e00, '');
INSERT INTO `tile_store` (`house_id`, `world_id`, `data`, `serial`) VALUES
(89, 0, 0x9309090806010000002d198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e20466c61742035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031333634323520676f6c6420636f696e732e00, ''),
(90, 0, 0x91090b080601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(90, 0, 0x94090b080601000000c5048001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e20466c61742036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033323734323020676f6c6420636f696e732e00, ''),
(90, 0, 0x90090d0806010000002d198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e20466c61742036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033323734323020676f6c6420636f696e732e00, ''),
(90, 0, 0x91090c080601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(90, 0, 0x92090f0806010000002c198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e20466c61742036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033323734323020676f6c6420636f696e732e00, ''),
(90, 0, 0x96090e080601000000ba048001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e20466c61742036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033323734323020676f6c6420636f696e732e00, ''),
(90, 0, 0x99090c080601000000c5048001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e20466c61742036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033323734323020676f6c6420636f696e732e00, ''),
(90, 0, 0x9b090c0806010000002c198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e20466c61742036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033323734323020676f6c6420636f696e732e00, ''),
(91, 0, 0x8f0906080501000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(91, 0, 0x8f0907080501000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(91, 0, 0x8e09080805010000002d198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e20466c61742037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032393130343020676f6c6420636f696e732e00, ''),
(91, 0, 0x9109050805010000002c198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e20466c61742037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032393130343020676f6c6420636f696e732e00, ''),
(91, 0, 0x92090a080501000000bd048001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e20466c61742037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032393130343020676f6c6420636f696e732e00, ''),
(91, 0, 0x930908080501000000c3048001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e20466c61742037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032393130343020676f6c6420636f696e732e00, ''),
(91, 0, 0x95090b080501000000c5048001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202745766f6c7574696f6e20466c61742037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032393130343020676f6c6420636f696e732e00, ''),
(92, 0, 0xc6091208070100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e20537472656574203161272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320393039353020676f6c6420636f696e732e00, ''),
(92, 0, 0xc4091408070100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e20537472656574203161272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320393039353020676f6c6420636f696e732e00, ''),
(92, 0, 0xc50915080701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(92, 0, 0xc50916080701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(92, 0, 0xc6091708070100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e20537472656574203161272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320393039353020676f6c6420636f696e732e00, ''),
(92, 0, 0xc809140807010000006f188001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e20537472656574203161272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320393039353020676f6c6420636f696e732e00, ''),
(93, 0, 0xca091508070100000071188001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f75736520274d61696e20537472656574203261272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031313832333520676f6c6420636f696e732e00, ''),
(93, 0, 0xcc0914080701000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(93, 0, 0xcd0914080701000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(93, 0, 0xce091608070100000025198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f75736520274d61696e20537472656574203261272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031313832333520676f6c6420636f696e732e00, ''),
(93, 0, 0xcb091808070100000024198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f75736520274d61696e20537472656574203261272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031313832333520676f6c6420636f696e732e00, ''),
(94, 0, 0xc6091208060100000024198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f75736520274d61696e20537472656574203162272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(94, 0, 0xc70913080601000000c3048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f75736520274d61696e20537472656574203162272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(94, 0, 0xc4091508060100000025198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f75736520274d61696e20537472656574203162272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(94, 0, 0xc6091708060100000024198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f75736520274d61696e20537472656574203162272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(94, 0, 0xc80915080601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(94, 0, 0xc80916080601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(95, 0, 0xcd091308060100000024198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f75736520274d61696e20537472656574203262272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031313832333520676f6c6420636f696e732e00, ''),
(95, 0, 0xca0914080601000000c5048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f75736520274d61696e20537472656574203262272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031313832333520676f6c6420636f696e732e00, ''),
(95, 0, 0xcc0917080601000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(95, 0, 0xcd0917080601000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(95, 0, 0xce091608060100000025198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f75736520274d61696e20537472656574203262272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031313832333520676f6c6420636f696e732e00, ''),
(95, 0, 0xcc091808060100000024198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f75736520274d61696e20537472656574203262272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031313832333520676f6c6420636f696e732e00, ''),
(96, 0, 0xcf090e08070100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e205374726565742033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036313834363020676f6c6420636f696e732e00, ''),
(96, 0, 0xd1090b08070100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e205374726565742033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036313834363020676f6c6420636f696e732e00, ''),
(96, 0, 0xd3090b080701000000c5048001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e205374726565742033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036313834363020676f6c6420636f696e732e00, ''),
(96, 0, 0xd5090b08070100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e205374726565742033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036313834363020676f6c6420636f696e732e00, ''),
(96, 0, 0xd6090c080701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(96, 0, 0xd6090d080701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(96, 0, 0xd1091108070100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e205374726565742033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036313834363020676f6c6420636f696e732e00, ''),
(96, 0, 0xd6091108070100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e205374726565742033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036313834363020676f6c6420636f696e732e00, ''),
(97, 0, 0xda090a08070100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e205374726565742034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036313834363020676f6c6420636f696e732e00, ''),
(97, 0, 0xdc090a080701000000c5048001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e205374726565742034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036313834363020676f6c6420636f696e732e00, ''),
(97, 0, 0xdf090a08070100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e205374726565742034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036313834363020676f6c6420636f696e732e00, ''),
(97, 0, 0xdf090b080701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(97, 0, 0xdf090c080701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(97, 0, 0xe0090e08070100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e205374726565742034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036313834363020676f6c6420636f696e732e00, ''),
(97, 0, 0xda091008070100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e205374726565742034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036313834363020676f6c6420636f696e732e00, ''),
(97, 0, 0xde091008070100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e205374726565742034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036313834363020676f6c6420636f696e732e00, ''),
(98, 0, 0xd1090108060100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e205374726565742035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033313833323520676f6c6420636f696e732e00, ''),
(98, 0, 0xd50900080601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(98, 0, 0xd50901080601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(98, 0, 0xd6090108070100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e205374726565742035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033313833323520676f6c6420636f696e732e00, ''),
(98, 0, 0xd60902080701000000c3048001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e205374726565742035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033313833323520676f6c6420636f696e732e00, ''),
(98, 0, 0xd1090408070100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e205374726565742035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033313833323520676f6c6420636f696e732e00, ''),
(98, 0, 0xd30904080701000000ba048001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e205374726565742035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033313833323520676f6c6420636f696e732e00, ''),
(98, 0, 0xd5090508060100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e205374726565742035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033313833323520676f6c6420636f696e732e00, ''),
(99, 0, 0xe409f307070100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e205374726565742036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032333634373020676f6c6420636f696e732e00, ''),
(99, 0, 0xe409f4070701000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(99, 0, 0xe509f4070701000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(99, 0, 0xe609f607070100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e205374726565742036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032333634373020676f6c6420636f696e732e00, ''),
(99, 0, 0xe509f8070701000000c5048001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e205374726565742036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032333634373020676f6c6420636f696e732e00, ''),
(100, 0, 0xe809f50707010000002d198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e205374726565742037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032353436363020676f6c6420636f696e732e00, ''),
(100, 0, 0xe909f5070701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(100, 0, 0xe909f6070701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(100, 0, 0xed09f60707010000002d198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e205374726565742037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032353436363020676f6c6420636f696e732e00, ''),
(100, 0, 0xeb09f807070100000071188001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e205374726565742037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032353436363020676f6c6420636f696e732e00, ''),
(100, 0, 0xec09f80707010000002c198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e205374726565742037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032353436363020676f6c6420636f696e732e00, ''),
(101, 0, 0xf209ef0707010000006f188001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e205374726565742038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033373238393520676f6c6420636f696e732e00, ''),
(101, 0, 0xf909ed0707010000002c198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e205374726565742038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033373238393520676f6c6420636f696e732e00, ''),
(101, 0, 0xf209f00707010000002d198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e205374726565742038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033373238393520676f6c6420636f696e732e00, ''),
(101, 0, 0xfb09f0070601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(101, 0, 0xfb09f1070601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(101, 0, 0xfb09f30707010000002c198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e205374726565742038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033373238393520676f6c6420636f696e732e00, ''),
(101, 0, 0xfc09f10706010000002d198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e205374726565742038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033373238393520676f6c6420636f696e732e00, ''),
(102, 0, 0xe509e607070100000024198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027436f6d706c6578204765726d616e2031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323733333020676f6c6420636f696e732e00, ''),
(102, 0, 0xe609e7070701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(102, 0, 0xe209ea070701000000c3048001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027436f6d706c6578204765726d616e2031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323733333020676f6c6420636f696e732e00, ''),
(102, 0, 0xe509eb07070100000024198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027436f6d706c6578204765726d616e2031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323733333020676f6c6420636f696e732e00, ''),
(102, 0, 0xe609e8070701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(103, 0, 0xea09e707060100000024198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027436f6d706c6578204765726d616e2032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303030393020676f6c6420636f696e732e00, ''),
(103, 0, 0xeb09e6070701000000c5048001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027436f6d706c6578204765726d616e2032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303030393020676f6c6420636f696e732e00, ''),
(103, 0, 0xeb09e8070601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(103, 0, 0xeb09e9070601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(103, 0, 0xec09ea07060100000025198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027436f6d706c6578204765726d616e2032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303030393020676f6c6420636f696e732e00, ''),
(103, 0, 0xed09e907070100000025198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027436f6d706c6578204765726d616e2032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303030393020676f6c6420636f696e732e00, ''),
(104, 0, 0xe809ee0707010000002d198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027436f6d706c6578204765726d616e2033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(104, 0, 0xe809ef0707010000006f188001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027436f6d706c6578204765726d616e2033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(104, 0, 0xeb09ed070701000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(104, 0, 0xec09ed070701000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(104, 0, 0xed09ef07070100000025198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027436f6d706c6578204765726d616e2033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(105, 0, 0xe609f007070100000071188001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027436f6d706c6578204765726d616e2034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320393039353020676f6c6420636f696e732e00, ''),
(105, 0, 0xe709f00707010000002c198001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027436f6d706c6578204765726d616e2034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320393039353020676f6c6420636f696e732e00, ''),
(105, 0, 0xe809f307070100000024198001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027436f6d706c6578204765726d616e2034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320393039353020676f6c6420636f696e732e00, ''),
(105, 0, 0xeb09f1070701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(105, 0, 0xeb09f2070701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(106, 0, 0xe809ef0706010000006f188001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027436f6d706c6578204765726d616e2035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313832383020676f6c6420636f696e732e00, ''),
(106, 0, 0xed09ee07060100000025198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027436f6d706c6578204765726d616e2035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313832383020676f6c6420636f696e732e00, ''),
(106, 0, 0xe709f1070601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(106, 0, 0xe709f2070601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(106, 0, 0xe909f307060100000024198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027436f6d706c6578204765726d616e2035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313832383020676f6c6420636f696e732e00, ''),
(106, 0, 0xec09f207060100000025198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027436f6d706c6578204765726d616e2035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313832383020676f6c6420636f696e732e00, ''),
(107, 0, 0xee09db07060100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274772616e6420486f7573652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035313834313520676f6c6420636f696e732e00, ''),
(107, 0, 0xee09db07070100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274772616e6420486f7573652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035313834313520676f6c6420636f696e732e00, ''),
(107, 0, 0xeb09df070601000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(107, 0, 0xec09df070601000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(107, 0, 0xf009df07060100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274772616e6420486f7573652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035313834313520676f6c6420636f696e732e00, ''),
(107, 0, 0xf009de07070100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274772616e6420486f7573652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035313834313520676f6c6420636f696e732e00, ''),
(107, 0, 0xea09e007060100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274772616e6420486f7573652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035313834313520676f6c6420636f696e732e00, ''),
(107, 0, 0xeb09e1070601000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(107, 0, 0xec09e1070601000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(107, 0, 0xef09e207060100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274772616e6420486f7573652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035313834313520676f6c6420636f696e732e00, ''),
(107, 0, 0xed09e207070100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274772616e6420486f7573652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035313834313520676f6c6420636f696e732e00, ''),
(107, 0, 0xee09e2070701000000c5048001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274772616e6420486f7573652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035313834313520676f6c6420636f696e732e00, ''),
(107, 0, 0xf009e107070100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274772616e6420486f7573652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035313834313520676f6c6420636f696e732e00, ''),
(108, 0, 0xe509da07060100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274772616e6420486f7573652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034383230333520676f6c6420636f696e732e00, ''),
(108, 0, 0xe509da07070100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274772616e6420486f7573652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034383230333520676f6c6420636f696e732e00, ''),
(108, 0, 0xe309df070601000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(108, 0, 0xe209df07070100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274772616e6420486f7573652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034383230333520676f6c6420636f696e732e00, ''),
(108, 0, 0xe409df070601000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(108, 0, 0xe709df07070100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274772616e6420486f7573652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034383230333520676f6c6420636f696e732e00, ''),
(108, 0, 0xe209e007060100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274772616e6420486f7573652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034383230333520676f6c6420636f696e732e00, ''),
(108, 0, 0xe309e1070601000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(108, 0, 0xe409e1070601000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(108, 0, 0xe609e207060100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274772616e6420486f7573652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034383230333520676f6c6420636f696e732e00, ''),
(108, 0, 0xe409e207070100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274772616e6420486f7573652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034383230333520676f6c6420636f696e732e00, ''),
(108, 0, 0xe509e2070701000000c5048001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274772616e6420486f7573652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034383230333520676f6c6420636f696e732e00, ''),
(109, 0, 0xcd09d60707010000002c198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363337353520676f6c6420636f696e732e00, ''),
(109, 0, 0xcf09d7070701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(109, 0, 0xca09d90707010000002d198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363337353520676f6c6420636f696e732e00, ''),
(109, 0, 0xca09da0707010000006f188001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363337353520676f6c6420636f696e732e00, ''),
(109, 0, 0xcf09d8070701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(109, 0, 0xcd09dd07070100000071188001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363337353520676f6c6420636f696e732e00, ''),
(109, 0, 0xd009d80707010000002d198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363337353520676f6c6420636f696e732e00, ''),
(109, 0, 0xd009db0707010000002d198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363337353520676f6c6420636f696e732e00, ''),
(110, 0, 0xc009d7070701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(110, 0, 0xc209d7070701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(110, 0, 0xc409d60707010000002c198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303932333020676f6c6420636f696e732e00, ''),
(110, 0, 0xc009d8070701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(110, 0, 0xc209d8070701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(110, 0, 0xc609db0707010000002d198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303932333020676f6c6420636f696e732e00, ''),
(110, 0, 0xc309dd07070100000071188001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303932333020676f6c6420636f696e732e00, ''),
(110, 0, 0xc409dd0707010000002c198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303932333020676f6c6420636f696e732e00, ''),
(111, 0, 0xbc09d60707010000002c198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363337353520676f6c6420636f696e732e00, ''),
(111, 0, 0xbe09d7070701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(111, 0, 0xb909db0707010000002d198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363337353520676f6c6420636f696e732e00, ''),
(111, 0, 0xbe09d8070701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(111, 0, 0xbb09dd0707010000002c198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363337353520676f6c6420636f696e732e00, ''),
(111, 0, 0xbc09dd07070100000071188001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363337353520676f6c6420636f696e732e00, ''),
(112, 0, 0xaf09d80707010000002d198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c652034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363337353520676f6c6420636f696e732e00, ''),
(112, 0, 0xaf09db0707010000002d198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c652034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363337353520676f6c6420636f696e732e00, ''),
(112, 0, 0xb209d60707010000002c198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c652034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363337353520676f6c6420636f696e732e00, ''),
(112, 0, 0xb409d7070701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(112, 0, 0xb409d8070701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(112, 0, 0xb509d90707010000002d198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c652034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363337353520676f6c6420636f696e732e00, ''),
(112, 0, 0xb209dd07070100000071188001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c652034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363337353520676f6c6420636f696e732e00, ''),
(112, 0, 0xb309dd0707010000002c198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c652034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363337353520676f6c6420636f696e732e00, ''),
(113, 0, 0xce09d60706010000002c198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c652035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363337353520676f6c6420636f696e732e00, ''),
(113, 0, 0xcf09d7070601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(113, 0, 0xca09da0706010000006f188001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c652035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363337353520676f6c6420636f696e732e00, ''),
(113, 0, 0xcf09d8070601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(113, 0, 0xce09dd0706010000002c198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c652035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363337353520676f6c6420636f696e732e00, ''),
(113, 0, 0xd009d90706010000002d198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c652035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363337353520676f6c6420636f696e732e00, ''),
(113, 0, 0xd009dc0706010000002d198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c652035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363337353520676f6c6420636f696e732e00, ''),
(114, 0, 0xc009d7070601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(114, 0, 0xc209d7070601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(114, 0, 0xc309d60706010000002c198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c652036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303932333020676f6c6420636f696e732e00, ''),
(114, 0, 0xc009d8070601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(114, 0, 0xc209d8070601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(114, 0, 0xc609da0706010000006f188001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c652036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303932333020676f6c6420636f696e732e00, ''),
(114, 0, 0xc609db0706010000002d198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c652036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303932333020676f6c6420636f696e732e00, ''),
(114, 0, 0xc209dd0706010000002c198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c652036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303932333020676f6c6420636f696e732e00, ''),
(115, 0, 0xbd09d60706010000002c198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c652037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363337353520676f6c6420636f696e732e00, ''),
(115, 0, 0xbe09d7070601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(115, 0, 0xb909d90706010000006f188001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c652037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363337353520676f6c6420636f696e732e00, ''),
(115, 0, 0xb909db0706010000002d198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c652037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363337353520676f6c6420636f696e732e00, ''),
(115, 0, 0xbe09d8070601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(115, 0, 0xbd09dd0706010000002c198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c652037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363337353520676f6c6420636f696e732e00, ''),
(116, 0, 0xaf09d80706010000002d198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c652038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363337353520676f6c6420636f696e732e00, ''),
(116, 0, 0xaf09db0706010000002d198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c652038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363337353520676f6c6420636f696e732e00, ''),
(116, 0, 0xb009d7070601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(116, 0, 0xb209d60706010000002c198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c652038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363337353520676f6c6420636f696e732e00, ''),
(116, 0, 0xb009d8070601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(116, 0, 0xb509d90706010000002d198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c652038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363337353520676f6c6420636f696e732e00, ''),
(116, 0, 0xb509da0706010000006f188001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c652038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363337353520676f6c6420636f696e732e00, ''),
(116, 0, 0xb109dd0706010000002c198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c652038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363337353520676f6c6420636f696e732e00, ''),
(117, 0, 0xcd09d7070501000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(117, 0, 0xce09d60705010000002c198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c652039272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032353436363020676f6c6420636f696e732e00, ''),
(117, 0, 0xcf09d7070501000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(117, 0, 0xca09d80705010000002d198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c652039272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032353436363020676f6c6420636f696e732e00, ''),
(117, 0, 0xca09da0705010000006f188001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c652039272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032353436363020676f6c6420636f696e732e00, ''),
(117, 0, 0xcd09d8070501000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(117, 0, 0xcf09d8070501000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(117, 0, 0xcd09dd0705010000002c198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c652039272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032353436363020676f6c6420636f696e732e00, ''),
(117, 0, 0xd009d80705010000002d198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c652039272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032353436363020676f6c6420636f696e732e00, ''),
(117, 0, 0xd009db0705010000002d198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c652039272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032353436363020676f6c6420636f696e732e00, ''),
(118, 0, 0xc109d7070501000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(118, 0, 0xc209d60705010000002c198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c65203130272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032353436363020676f6c6420636f696e732e00, ''),
(118, 0, 0xc309d7070501000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(118, 0, 0xc109d8070501000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(118, 0, 0xc309d8070501000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(118, 0, 0xc609d90705010000002d198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c65203130272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032353436363020676f6c6420636f696e732e00, ''),
(118, 0, 0xc609db0705010000006f188001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c65203130272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032353436363020676f6c6420636f696e732e00, ''),
(118, 0, 0xc309dd0705010000002c198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c65203130272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032353436363020676f6c6420636f696e732e00, ''),
(119, 0, 0xbd09d7070501000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(119, 0, 0xbe09d60705010000002c198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c65203131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303932333020676f6c6420636f696e732e00, ''),
(119, 0, 0xbf09d7070501000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(119, 0, 0xb909d80705010000002d198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c65203131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303932333020676f6c6420636f696e732e00, ''),
(119, 0, 0xb909db0705010000006f188001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c65203131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303932333020676f6c6420636f696e732e00, ''),
(119, 0, 0xbd09d8070501000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(119, 0, 0xbf09d8070501000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(119, 0, 0xbb09dd0705010000002c198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c65203131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303932333020676f6c6420636f696e732e00, ''),
(120, 0, 0xaf09d80705010000002d198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c65203132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032353436363020676f6c6420636f696e732e00, ''),
(120, 0, 0xaf09db0705010000002d198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c65203132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032353436363020676f6c6420636f696e732e00, ''),
(120, 0, 0xb009d7070501000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(120, 0, 0xb109d7070501000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(120, 0, 0xb209d60705010000002c198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c65203132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032353436363020676f6c6420636f696e732e00, ''),
(120, 0, 0xb009d9070501000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(120, 0, 0xb109d9070501000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(120, 0, 0xb509d90705010000002d198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c65203132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032353436363020676f6c6420636f696e732e00, ''),
(120, 0, 0xb509da0705010000006f188001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c65203132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032353436363020676f6c6420636f696e732e00, ''),
(120, 0, 0xb309dd0705010000002c198001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f75736520274d61696e20436972636c65203132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032353436363020676f6c6420636f696e732e00, ''),
(121, 0, 0xd409db070701000000c3048001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027486172626f7572205374726565742031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(121, 0, 0xd409dc07070100000025198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027486172626f7572205374726565742031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(121, 0, 0xd509dc070701000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, '');
INSERT INTO `tile_store` (`house_id`, `world_id`, `data`, `serial`) VALUES
(121, 0, 0xd609dc070701000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(121, 0, 0xd709dd07070100000024198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027486172626f7572205374726565742031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(122, 0, 0xd409d7070701000000c3048001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027486172626f7572205374726565742032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(122, 0, 0xd909d707070100000025198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027486172626f7572205374726565742032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(122, 0, 0xd409d807070100000025198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027486172626f7572205374726565742032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(122, 0, 0xd509d8070701000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(122, 0, 0xd609d8070701000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(123, 0, 0xd409d207070100000025198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027486172626f7572205374726565742033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032383139343520676f6c6420636f696e732e00, ''),
(123, 0, 0xd409d3070701000000c3048001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027486172626f7572205374726565742033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032383139343520676f6c6420636f696e732e00, ''),
(123, 0, 0xd909d307070100000025198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027486172626f7572205374726565742033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032383139343520676f6c6420636f696e732e00, ''),
(123, 0, 0xd509d4070701000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(123, 0, 0xd609d4070701000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(124, 0, 0xd409ce070701000000c3048001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027486172626f7572205374726565742034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(124, 0, 0xd409cf07070100000025198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027486172626f7572205374726565742034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(124, 0, 0xd509cf070701000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(124, 0, 0xd609cf070701000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(124, 0, 0xd709cc07070100000024198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027486172626f7572205374726565742034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(124, 0, 0xd909ce07070100000025198001000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027486172626f7572205374726565742034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(125, 0, 0xbf09ca0706010000002c198001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027486172626f757220506c6163652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383231323520676f6c6420636f696e732e00, ''),
(125, 0, 0xbf09ca0707010000002c198001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027486172626f757220506c6163652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383231323520676f6c6420636f696e732e00, ''),
(125, 0, 0xb809cf0707010000002d198001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027486172626f757220506c6163652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383231323520676f6c6420636f696e732e00, ''),
(125, 0, 0xb909ce070701000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(125, 0, 0xba09ce070701000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(125, 0, 0xbc09ce0706010000002d198001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027486172626f757220506c6163652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383231323520676f6c6420636f696e732e00, ''),
(125, 0, 0xbc09cf0706010000006a188001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027486172626f757220506c6163652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383231323520676f6c6420636f696e732e00, ''),
(125, 0, 0xbc09cc0707010000002d198001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027486172626f757220506c6163652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383231323520676f6c6420636f696e732e00, ''),
(125, 0, 0xbc09cf0707010000006a188001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027486172626f757220506c6163652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383231323520676f6c6420636f696e732e00, ''),
(125, 0, 0xb909d0070701000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(125, 0, 0xba09d0070701000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(125, 0, 0xba09d10707010000002c198001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027486172626f757220506c6163652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383231323520676f6c6420636f696e732e00, ''),
(125, 0, 0xbe09d10706010000002c198001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027486172626f757220506c6163652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383231323520676f6c6420636f696e732e00, ''),
(125, 0, 0xc209ce0706010000002d198001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027486172626f757220506c6163652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383231323520676f6c6420636f696e732e00, ''),
(125, 0, 0xc209cc0707010000002d198001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027486172626f757220506c6163652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383231323520676f6c6420636f696e732e00, ''),
(125, 0, 0xc209ce0707010000006f188001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027486172626f757220506c6163652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383231323520676f6c6420636f696e732e00, ''),
(125, 0, 0xc009d10707010000002c198001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027486172626f757220506c6163652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383231323520676f6c6420636f696e732e00, ''),
(125, 0, 0xc209d00707010000002d198001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027486172626f757220506c6163652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383231323520676f6c6420636f696e732e00, ''),
(126, 0, 0xc309c307070100000025198001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f75736520275061726b204c616e652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031353436313520676f6c6420636f696e732e00, ''),
(126, 0, 0xc409c2070701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(126, 0, 0xc409c3070701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(126, 0, 0xc709c7070701000000c3048001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f75736520275061726b204c616e652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031353436313520676f6c6420636f696e732e00, ''),
(126, 0, 0xc609c807070100000024198001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f75736520275061726b204c616e652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031353436313520676f6c6420636f696e732e00, ''),
(127, 0, 0xc809c2070701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(127, 0, 0xc809c3070701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(127, 0, 0xc909c107070100000024198001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f75736520275061726b204c616e652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031373238303520676f6c6420636f696e732e00, ''),
(127, 0, 0xcc09c6070701000000c5048001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f75736520275061726b204c616e652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031373238303520676f6c6420636f696e732e00, ''),
(128, 0, 0xce09c2070701000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(128, 0, 0xcf09c2070701000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(128, 0, 0xd209c507070100000025198001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f75736520275061726b204c616e652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031393039393520676f6c6420636f696e732e00, ''),
(128, 0, 0xd009c8070701000000c5048001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f75736520275061726b204c616e652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031393039393520676f6c6420636f696e732e00, ''),
(129, 0, 0xc409c2070601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(129, 0, 0xc409c3070601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(129, 0, 0xc509c10706010000002c198001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f75736520275061726b204c616e652034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031353436313520676f6c6420636f696e732e00, ''),
(129, 0, 0xc309c707060100000025198001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f75736520275061726b204c616e652034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031353436313520676f6c6420636f696e732e00, ''),
(129, 0, 0xc709c6070601000000c3048001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f75736520275061726b204c616e652034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031353436313520676f6c6420636f696e732e00, ''),
(130, 0, 0xca09c107060100000024198001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f75736520275061726b204c616e652035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323733333020676f6c6420636f696e732e00, ''),
(130, 0, 0xcc09c2070601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(130, 0, 0xcc09c3070601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(130, 0, 0xc909c5070601000000c5048001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f75736520275061726b204c616e652035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323733333020676f6c6420636f696e732e00, ''),
(130, 0, 0xcc09c507060100000024198001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f75736520275061726b204c616e652035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323733333020676f6c6420636f696e732e00, ''),
(131, 0, 0xce09c2070601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(131, 0, 0xce09c3070601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(131, 0, 0xce09c6070601000000c3048001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f75736520275061726b204c616e652036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031383139303020676f6c6420636f696e732e00, ''),
(131, 0, 0xd209c307060100000025198001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f75736520275061726b204c616e652036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031383139303020676f6c6420636f696e732e00, ''),
(131, 0, 0xd109c807060100000024198001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f75736520275061726b204c616e652036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031383139303020676f6c6420636f696e732e00, ''),
(132, 0, 0xa409d707070100000025198001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027486172626f757220506c6163652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034383230333520676f6c6420636f696e732e00, ''),
(132, 0, 0xa909d607060100000025198001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027486172626f757220506c6163652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034383230333520676f6c6420636f696e732e00, ''),
(132, 0, 0xab09d7070701000000c3048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027486172626f757220506c6163652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034383230333520676f6c6420636f696e732e00, ''),
(132, 0, 0xa509d9070601000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(132, 0, 0xa609d9070601000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(132, 0, 0xa909d8070601000000c3048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027486172626f757220506c6163652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034383230333520676f6c6420636f696e732e00, ''),
(132, 0, 0xa909da07070100000024198001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027486172626f757220506c6163652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034383230333520676f6c6420636f696e732e00, ''),
(132, 0, 0xab09d807070100000025198001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027486172626f757220506c6163652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034383230333520676f6c6420636f696e732e00, ''),
(133, 0, 0x9d09230807010000002c198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202743656e746572204661726d2031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038343538333520676f6c6420636f696e732e00, ''),
(133, 0, 0x9b0924080701000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(133, 0, 0x9b0926080701000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(133, 0, 0x9c0924080701000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(133, 0, 0x9c0926080701000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(133, 0, 0x9f09260807010000002d198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202743656e746572204661726d2031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038343538333520676f6c6420636f696e732e00, ''),
(133, 0, 0x96092a0806010000002d198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202743656e746572204661726d2031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038343538333520676f6c6420636f696e732e00, ''),
(133, 0, 0x9d09280806010000006d188001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202743656e746572204661726d2031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038343538333520676f6c6420636f696e732e00, ''),
(133, 0, 0x9f092b0806010000002d198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202743656e746572204661726d2031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038343538333520676f6c6420636f696e732e00, ''),
(133, 0, 0x9c09280807010000006d188001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202743656e746572204661726d2031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038343538333520676f6c6420636f696e732e00, ''),
(133, 0, 0x9f09290807010000002d198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202743656e746572204661726d2031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038343538333520676f6c6420636f696e732e00, ''),
(133, 0, 0x9f092a0807010000002d198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202743656e746572204661726d2031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038343538333520676f6c6420636f696e732e00, ''),
(133, 0, 0x99092d0806010000002c198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202743656e746572204661726d2031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038343538333520676f6c6420636f696e732e00, ''),
(133, 0, 0x99092d08070100000071188001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202743656e746572204661726d2031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038343538333520676f6c6420636f696e732e00, ''),
(133, 0, 0x9d092d0806010000002c198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202743656e746572204661726d2031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038343538333520676f6c6420636f696e732e00, ''),
(133, 0, 0x9c092d0807010000002c198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202743656e746572204661726d2031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038343538333520676f6c6420636f696e732e00, ''),
(134, 0, 0x8809d208050100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202743656e746572204661726d2032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039353439373520676f6c6420636f696e732e00, ''),
(134, 0, 0x8809d3080501000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(134, 0, 0x8809d208060100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202743656e746572204661726d2032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039353439373520676f6c6420636f696e732e00, ''),
(134, 0, 0x8809d208070100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202743656e746572204661726d2032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039353439373520676f6c6420636f696e732e00, ''),
(134, 0, 0x8509d408050100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202743656e746572204661726d2032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039353439373520676f6c6420636f696e732e00, ''),
(134, 0, 0x8509d508060100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202743656e746572204661726d2032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039353439373520676f6c6420636f696e732e00, ''),
(134, 0, 0x8509d508070100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202743656e746572204661726d2032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039353439373520676f6c6420636f696e732e00, ''),
(134, 0, 0x8809d4080501000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(134, 0, 0x8909d408050100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202743656e746572204661726d2032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039353439373520676f6c6420636f696e732e00, ''),
(134, 0, 0x8909d5080501000000b9048001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202743656e746572204661726d2032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039353439373520676f6c6420636f696e732e00, ''),
(134, 0, 0x8909d608050100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202743656e746572204661726d2032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039353439373520676f6c6420636f696e732e00, ''),
(134, 0, 0x8809d7080601000000bc048001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202743656e746572204661726d2032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039353439373520676f6c6420636f696e732e00, ''),
(134, 0, 0x8b09d5080701000000b9048001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202743656e746572204661726d2032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039353439373520676f6c6420636f696e732e00, ''),
(134, 0, 0x8b09d60807010000001a0700, ''),
(134, 0, 0x8609d9080701000000b9048001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202743656e746572204661726d2032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039353439373520676f6c6420636f696e732e00, ''),
(134, 0, 0x8809da08060100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202743656e746572204661726d2032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039353439373520676f6c6420636f696e732e00, ''),
(134, 0, 0x8a09d908060100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202743656e746572204661726d2032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039353439373520676f6c6420636f696e732e00, ''),
(134, 0, 0x8809da08070100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202743656e746572204661726d2032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039353439373520676f6c6420636f696e732e00, ''),
(134, 0, 0x8a09d908070100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202743656e746572204661726d2032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039353439373520676f6c6420636f696e732e00, ''),
(134, 0, 0x8409dc08070100000005068001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202743656e746572204661726d2032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039353439373520676f6c6420636f696e732e00, ''),
(135, 0, 0x8309e208070100000005068001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520274f7574736964652056696c6c6167652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363337353520676f6c6420636f696e732e00, ''),
(135, 0, 0x8609e208060100000024198001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520274f7574736964652056696c6c6167652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363337353520676f6c6420636f696e732e00, ''),
(135, 0, 0x8609e208070100000024198001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520274f7574736964652056696c6c6167652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363337353520676f6c6420636f696e732e00, ''),
(135, 0, 0x8809e3080601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(135, 0, 0x8809e208070100000024198001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520274f7574736964652056696c6c6167652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363337353520676f6c6420636f696e732e00, ''),
(135, 0, 0x8409e508060100000025198001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520274f7574736964652056696c6c6167652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363337353520676f6c6420636f696e732e00, ''),
(135, 0, 0x8409e4080701000000ba048001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520274f7574736964652056696c6c6167652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363337353520676f6c6420636f696e732e00, ''),
(135, 0, 0x8409e508070100000025198001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520274f7574736964652056696c6c6167652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363337353520676f6c6420636f696e732e00, ''),
(135, 0, 0x8809e4080601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(135, 0, 0x8909e508060100000025198001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520274f7574736964652056696c6c6167652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363337353520676f6c6420636f696e732e00, ''),
(135, 0, 0x8909e5080701000000c3048001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520274f7574736964652056696c6c6167652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363337353520676f6c6420636f696e732e00, ''),
(136, 0, 0x8309ea080601000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(136, 0, 0x8409ea080601000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(136, 0, 0x8409eb08060100000024198001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520274f7574736964652056696c6c6167652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032373238353020676f6c6420636f696e732e00, ''),
(136, 0, 0x8709e808060100000025198001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520274f7574736964652056696c6c6167652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032373238353020676f6c6420636f696e732e00, ''),
(136, 0, 0x8409eb08070100000024198001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520274f7574736964652056696c6c6167652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032373238353020676f6c6420636f696e732e00, ''),
(136, 0, 0x8709e8080701000000c3048001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520274f7574736964652056696c6c6167652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032373238353020676f6c6420636f696e732e00, ''),
(137, 0, 0x8909e908060100000024198001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520274f7574736964652056696c6c6167652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032353436363020676f6c6420636f696e732e00, ''),
(137, 0, 0x8a09ea080601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(137, 0, 0x8a09eb080601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(137, 0, 0x8909e9080701000000c5048001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520274f7574736964652056696c6c6167652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032353436363020676f6c6420636f696e732e00, ''),
(137, 0, 0x8b09eb08070100000025198001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520274f7574736964652056696c6c6167652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032353436363020676f6c6420636f696e732e00, ''),
(137, 0, 0x8609ed08060100000025198001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520274f7574736964652056696c6c6167652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032353436363020676f6c6420636f696e732e00, ''),
(137, 0, 0x8609ed08070100000025198001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520274f7574736964652056696c6c6167652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032353436363020676f6c6420636f696e732e00, ''),
(137, 0, 0x8909ee08060100000024198001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520274f7574736964652056696c6c6167652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032353436363020676f6c6420636f696e732e00, ''),
(137, 0, 0x8b09ed08060100000025198001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520274f7574736964652056696c6c6167652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032353436363020676f6c6420636f696e732e00, ''),
(137, 0, 0x8909ee08070100000024198001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520274f7574736964652056696c6c6167652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032353436363020676f6c6420636f696e732e00, ''),
(137, 0, 0x8b09ed08070100000025198001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520274f7574736964652056696c6c6167652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032353436363020676f6c6420636f696e732e00, ''),
(138, 0, 0x7c09be08070100000024198001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f75736520274f75747369646520486f7573652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343535363520676f6c6420636f696e732e00, ''),
(138, 0, 0x7e09be080701000000c5048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f75736520274f75747369646520486f7573652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343535363520676f6c6420636f696e732e00, ''),
(138, 0, 0x8209be08060100000024198001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f75736520274f75747369646520486f7573652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343535363520676f6c6420636f696e732e00, ''),
(138, 0, 0x8209be08070100000024198001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f75736520274f75747369646520486f7573652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343535363520676f6c6420636f696e732e00, ''),
(138, 0, 0x7a09c008070100000025198001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f75736520274f75747369646520486f7573652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343535363520676f6c6420636f696e732e00, ''),
(138, 0, 0x7d09c1080701000000c5048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f75736520274f75747369646520486f7573652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343535363520676f6c6420636f696e732e00, ''),
(138, 0, 0x8009c008060100000025198001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f75736520274f75747369646520486f7573652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343535363520676f6c6420636f696e732e00, ''),
(138, 0, 0x8209c1080601000000c5048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f75736520274f75747369646520486f7573652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343535363520676f6c6420636f696e732e00, ''),
(138, 0, 0x8309c008060100000027198001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f75736520274f75747369646520486f7573652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343535363520676f6c6420636f696e732e00, ''),
(138, 0, 0x8009c0080701000000c3048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f75736520274f75747369646520486f7573652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343535363520676f6c6420636f696e732e00, ''),
(138, 0, 0x8109c2080701000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(138, 0, 0x8209c2080701000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(138, 0, 0x8309c008070100000025198001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f75736520274f75747369646520486f7573652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343535363520676f6c6420636f696e732e00, ''),
(138, 0, 0x8309c20807010000002d198001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f75736520274f75747369646520486f7573652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343535363520676f6c6420636f696e732e00, ''),
(139, 0, 0x7b09f5080701000000c5048001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e2031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343535363520676f6c6420636f696e732e00, ''),
(139, 0, 0x7809f908060100000025198001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e2031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343535363520676f6c6420636f696e732e00, ''),
(139, 0, 0x7b09f8080601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(139, 0, 0x7b09f9080601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(139, 0, 0x7b09fb08060100000024198001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e2031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343535363520676f6c6420636f696e732e00, ''),
(139, 0, 0x7809f908070100000025198001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e2031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343535363520676f6c6420636f696e732e00, ''),
(139, 0, 0x7a09fb08070100000024198001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e2031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343535363520676f6c6420636f696e732e00, ''),
(139, 0, 0x7c09fa08060100000025198001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e2031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343535363520676f6c6420636f696e732e00, ''),
(139, 0, 0x7e09f808070100000025198001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e2031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343535363520676f6c6420636f696e732e00, ''),
(140, 0, 0x6f09f708070100000025198001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e2032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032353436363020676f6c6420636f696e732e00, ''),
(140, 0, 0x7009f5080701000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(140, 0, 0x7109f5080701000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(140, 0, 0x7209f7080701000000b9048001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e2032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032353436363020676f6c6420636f696e732e00, ''),
(140, 0, 0x7409f508070100000024198001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e2032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032353436363020676f6c6420636f696e732e00, ''),
(140, 0, 0x7509f5080701000000c5048001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e2032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032353436363020676f6c6420636f696e732e00, ''),
(140, 0, 0x7109fa080701000000b9048001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e2032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032353436363020676f6c6420636f696e732e00, ''),
(140, 0, 0x7409fb08070100000024198001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e2032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032353436363020676f6c6420636f696e732e00, ''),
(140, 0, 0x7609f808070100000025198001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e2032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032353436363020676f6c6420636f696e732e00, ''),
(141, 0, 0x6609f1080701000000c5048001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e2033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363337313020676f6c6420636f696e732e00, ''),
(141, 0, 0x6709f20807010000002d198001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e2033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363337313020676f6c6420636f696e732e00, ''),
(141, 0, 0x6909f4080701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(141, 0, 0x6909f5080701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(141, 0, 0x6a09f60807010000002d198001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e2033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363337313020676f6c6420636f696e732e00, ''),
(142, 0, 0x6109f50807010000002d198001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e2034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313832383020676f6c6420636f696e732e00, ''),
(142, 0, 0x6309f60807010000006c188001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e2034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313832383020676f6c6420636f696e732e00, ''),
(142, 0, 0x6109f80807010000002d198001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e2034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313832383020676f6c6420636f696e732e00, ''),
(142, 0, 0x6209fa080701000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(142, 0, 0x6309fa080701000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(142, 0, 0x6509fb0807010000002c198001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e2034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313832383020676f6c6420636f696e732e00, ''),
(142, 0, 0x6709f908070100000069188001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e2034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313832383020676f6c6420636f696e732e00, ''),
(142, 0, 0x6a09f80807010000002d198001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e2034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313832383020676f6c6420636f696e732e00, ''),
(142, 0, 0x6a09f9080701000000c3048001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e2034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313832383020676f6c6420636f696e732e00, ''),
(143, 0, 0x6209f8080601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(143, 0, 0x6209f9080601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(143, 0, 0x6309fb0806010000002c198001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e2035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323733333020676f6c6420636f696e732e00, ''),
(143, 0, 0x6509fb0806010000002c198001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e2035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323733333020676f6c6420636f696e732e00, ''),
(143, 0, 0x6709fa080601000000c3048001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e2035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323733333020676f6c6420636f696e732e00, ''),
(144, 0, 0x6409f30806010000002d198001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e2036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032333634373020676f6c6420636f696e732e00, ''),
(144, 0, 0x6509f2080601000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(144, 0, 0x6609f2080601000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(144, 0, 0x6109f60806010000002d198001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e2036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032333634373020676f6c6420636f696e732e00, ''),
(144, 0, 0x6309f40806010000006c188001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e2036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032333634373020676f6c6420636f696e732e00, ''),
(144, 0, 0x6709f608060100000069188001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e2036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032333634373020676f6c6420636f696e732e00, ''),
(144, 0, 0x6909f40806010000006c188001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e2036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032333634373020676f6c6420636f696e732e00, ''),
(144, 0, 0x6a09f70806010000002d198001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e2036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032333634373020676f6c6420636f696e732e00, ''),
(144, 0, 0x6909f8080601000000c5048001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e2036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032333634373020676f6c6420636f696e732e00, ''),
(145, 0, 0x6109fa0805010000002d198001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e2037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(145, 0, 0x6209f8080501000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(145, 0, 0x6209f9080501000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(145, 0, 0x6409fb0805010000002c198001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e2037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(145, 0, 0x6609fa080501000000c3048001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e2037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(146, 0, 0x6209f5080501000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(146, 0, 0x6209f6080501000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(146, 0, 0x6309f40805010000002c198001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e2038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303030393020676f6c6420636f696e732e00, ''),
(146, 0, 0x6509f4080501000000c5048001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e2038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303030393020676f6c6420636f696e732e00, ''),
(146, 0, 0x6609f6080501000000c3048001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e2038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303030393020676f6c6420636f696e732e00, ''),
(146, 0, 0x6909f40805010000002c198001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e2038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303030393020676f6c6420636f696e732e00, ''),
(146, 0, 0x6709f8080501000000c5048001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e2038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303030393020676f6c6420636f696e732e00, ''),
(146, 0, 0x6909f80805010000002c198001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e2038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303030393020676f6c6420636f696e732e00, ''),
(147, 0, 0x5709f3080701000000dc068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(147, 0, 0x5809f3080701000000dd068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(147, 0, 0x5909f208070100000046198001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e2039272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323733333020676f6c6420636f696e732e00, ''),
(147, 0, 0x5b09f3080701000000a1148001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e2039272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323733333020676f6c6420636f696e732e00, ''),
(147, 0, 0x5609f508070100000047198001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e2039272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323733333020676f6c6420636f696e732e00, ''),
(147, 0, 0x5709f808070100000046198001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e2039272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323733333020676f6c6420636f696e732e00, ''),
(148, 0, 0x5d09f5080701000000c5048001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203130272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303030393020676f6c6420636f696e732e00, ''),
(148, 0, 0x5e09f7080701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(148, 0, 0x5b09f908070100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203130272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303030393020676f6c6420636f696e732e00, ''),
(148, 0, 0x5c09f9080701000000bc048001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203130272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303030393020676f6c6420636f696e732e00, ''),
(148, 0, 0x5e09f8080701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(149, 0, 0x5709f3080601000000dc068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(149, 0, 0x5809f208060100000046198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(149, 0, 0x5809f3080601000000dd068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, '');
INSERT INTO `tile_store` (`house_id`, `world_id`, `data`, `serial`) VALUES
(149, 0, 0x5609f608060100000047198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(149, 0, 0x5a09f4080601000000a1148001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(149, 0, 0x5709f808060100000046198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(150, 0, 0x5b09f5080601000000c5048001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323733333020676f6c6420636f696e732e00, ''),
(150, 0, 0x5d09f6080601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(150, 0, 0x5d09f7080601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(150, 0, 0x5b09f908060100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323733333020676f6c6420636f696e732e00, ''),
(150, 0, 0x5c09f9080601000000bc048001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323733333020676f6c6420636f696e732e00, ''),
(150, 0, 0x5e09f808060100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323733333020676f6c6420636f696e732e00, ''),
(151, 0, 0x5309ec08070100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203133272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031383139303020676f6c6420636f696e732e00, ''),
(151, 0, 0x5509ef08070100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203133272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031383139303020676f6c6420636f696e732e00, ''),
(151, 0, 0x5009f0080701000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(151, 0, 0x5109f0080701000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(151, 0, 0x5409f208070100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203133272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031383139303020676f6c6420636f696e732e00, ''),
(151, 0, 0x5509f0080701000000c3048001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203133272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031383139303020676f6c6420636f696e732e00, ''),
(152, 0, 0x5209ec08060100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203134272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031313832333520676f6c6420636f696e732e00, ''),
(152, 0, 0x5409ee080601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(152, 0, 0x5409ef080601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(152, 0, 0x4f09f008060100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203134272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031313832333520676f6c6420636f696e732e00, ''),
(152, 0, 0x5309f0080601000000c5048001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203134272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031313832333520676f6c6420636f696e732e00, ''),
(153, 0, 0x6309e508060100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393130383520676f6c6420636f696e732e00, ''),
(153, 0, 0x6509e6080601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(153, 0, 0x6509e7080601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(153, 0, 0x6509e508070100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393130383520676f6c6420636f696e732e00, ''),
(153, 0, 0x6609e5080701000000c5048001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393130383520676f6c6420636f696e732e00, ''),
(153, 0, 0x6809e708070100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393130383520676f6c6420636f696e732e00, ''),
(153, 0, 0x6309e9080601000000c5048001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393130383520676f6c6420636f696e732e00, ''),
(153, 0, 0x6509e908060100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393130383520676f6c6420636f696e732e00, ''),
(153, 0, 0x6409ea08070100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393130383520676f6c6420636f696e732e00, ''),
(153, 0, 0x6709e8080701000000bc048001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393130383520676f6c6420636f696e732e00, ''),
(154, 0, 0x5909e308070100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203136272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038383232313520676f6c6420636f696e732e00, ''),
(154, 0, 0x5709e4080701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(154, 0, 0x5709e5080701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(154, 0, 0x5b09e508070100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203136272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038383232313520676f6c6420636f696e732e00, ''),
(154, 0, 0x5b09e7080701000000ba048001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203136272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038383232313520676f6c6420636f696e732e00, ''),
(154, 0, 0x5d09e7080501000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(154, 0, 0x5f09e7080501000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(154, 0, 0x5c09e608060100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203136272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038383232313520676f6c6420636f696e732e00, ''),
(154, 0, 0x5f09e608060100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203136272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038383232313520676f6c6420636f696e732e00, ''),
(154, 0, 0x5e09e6080701000000c5048001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203136272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038383232313520676f6c6420636f696e732e00, ''),
(154, 0, 0x5a09e808050100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203136272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038383232313520676f6c6420636f696e732e00, ''),
(154, 0, 0x5909e808070100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203136272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038383232313520676f6c6420636f696e732e00, ''),
(154, 0, 0x5d09e8080501000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(154, 0, 0x5f09e8080501000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(154, 0, 0x5c09ec08050100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203136272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038383232313520676f6c6420636f696e732e00, ''),
(154, 0, 0x5f09ec08050100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203136272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038383232313520676f6c6420636f696e732e00, ''),
(154, 0, 0x5c09ec08060100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203136272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038383232313520676f6c6420636f696e732e00, ''),
(154, 0, 0x5d09ec08070100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203136272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038383232313520676f6c6420636f696e732e00, ''),
(154, 0, 0x6009ea08050100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203136272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038383232313520676f6c6420636f696e732e00, ''),
(154, 0, 0x6009eb08070100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203136272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038383232313520676f6c6420636f696e732e00, ''),
(155, 0, 0x4f09e708070100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203137272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303932333020676f6c6420636f696e732e00, ''),
(155, 0, 0x5109e3080701000000c5048001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203137272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303932333020676f6c6420636f696e732e00, ''),
(155, 0, 0x5209e308070100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203137272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303932333020676f6c6420636f696e732e00, ''),
(155, 0, 0x5209e508060100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203137272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303932333020676f6c6420636f696e732e00, ''),
(155, 0, 0x5009e9080601000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(155, 0, 0x5109e9080601000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(155, 0, 0x5309e808060100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203137272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303932333020676f6c6420636f696e732e00, ''),
(155, 0, 0x5209ea08070100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203137272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303932333020676f6c6420636f696e732e00, ''),
(155, 0, 0x5409ea08070100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203137272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303932333020676f6c6420636f696e732e00, ''),
(156, 0, 0x4e09d9080701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(156, 0, 0x4e09da080701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(156, 0, 0x4f09d808070100000024198001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e203138272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320393039353020676f6c6420636f696e732e00, ''),
(156, 0, 0x4d09dc08070100000025198001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e203138272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320393039353020676f6c6420636f696e732e00, ''),
(156, 0, 0x4f09dd08070100000024198001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e203138272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320393039353020676f6c6420636f696e732e00, ''),
(156, 0, 0x5109da0807010000006f188001000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274869676867617264656e203138272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320393039353020676f6c6420636f696e732e00, ''),
(157, 0, 0x5309db08070100000071188001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203139272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031313832333520676f6c6420636f696e732e00, ''),
(157, 0, 0x5509da080701000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(157, 0, 0x5609da080701000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(157, 0, 0x5409de08070100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203139272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031313832333520676f6c6420636f696e732e00, ''),
(157, 0, 0x5709dc08070100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203139272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031313832333520676f6c6420636f696e732e00, ''),
(158, 0, 0x4d09db08060100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203230272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(158, 0, 0x4f09d808060100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203230272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(158, 0, 0x4f09dd08060100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203230272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(158, 0, 0x5009d9080601000000b9048001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203230272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303030343520676f6c6420636f696e732e00, ''),
(158, 0, 0x5109db080601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(158, 0, 0x5109dc080601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(159, 0, 0x5309da080601000000bc048001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203231272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031313832333520676f6c6420636f696e732e00, ''),
(159, 0, 0x5609da080601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(159, 0, 0x5609db080601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(159, 0, 0x5509de08060100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203231272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031313832333520676f6c6420636f696e732e00, ''),
(159, 0, 0x5709dc08060100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203231272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031313832333520676f6c6420636f696e732e00, ''),
(160, 0, 0x4509d108060100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203232272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035313834313520676f6c6420636f696e732e00, ''),
(160, 0, 0x4609d1080601000000bc048001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203232272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035313834313520676f6c6420636f696e732e00, ''),
(160, 0, 0x4609d108070100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203232272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035313834313520676f6c6420636f696e732e00, ''),
(160, 0, 0x4809d2080601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(160, 0, 0x4809d3080601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(160, 0, 0x4909d308070100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203232272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035313834313520676f6c6420636f696e732e00, ''),
(160, 0, 0x4309d6080601000000b9048001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203232272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035313834313520676f6c6420636f696e732e00, ''),
(160, 0, 0x4109d508070100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203232272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035313834313520676f6c6420636f696e732e00, ''),
(160, 0, 0x4309d6080701000000b9048001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203232272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035313834313520676f6c6420636f696e732e00, ''),
(160, 0, 0x4709d6080601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(160, 0, 0x4709d7080601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(160, 0, 0x4909d408060100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203232272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035313834313520676f6c6420636f696e732e00, ''),
(160, 0, 0x4909d4080701000000c3048001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203232272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035313834313520676f6c6420636f696e732e00, ''),
(160, 0, 0x4609d808060100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203232272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035313834313520676f6c6420636f696e732e00, ''),
(160, 0, 0x4609d808070100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203232272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035313834313520676f6c6420636f696e732e00, ''),
(161, 0, 0x4d09ca08060100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203233272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038313835353020676f6c6420636f696e732e00, ''),
(161, 0, 0x4e09ca08070100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203233272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038313835353020676f6c6420636f696e732e00, ''),
(161, 0, 0x4a09ce08060100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203233272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038313835353020676f6c6420636f696e732e00, ''),
(161, 0, 0x4a09cc08070100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203233272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038313835353020676f6c6420636f696e732e00, ''),
(161, 0, 0x4f09cd080701000000b9048001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203233272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038313835353020676f6c6420636f696e732e00, ''),
(161, 0, 0x5109cb080601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(161, 0, 0x5209ca08060100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203233272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038313835353020676f6c6420636f696e732e00, ''),
(161, 0, 0x5309cb080601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(161, 0, 0x5309ca08070100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203233272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038313835353020676f6c6420636f696e732e00, ''),
(161, 0, 0x5109cc080601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(161, 0, 0x5209cf08060100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203233272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038313835353020676f6c6420636f696e732e00, ''),
(161, 0, 0x5309cc080601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(161, 0, 0x5109cf08070100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203233272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038313835353020676f6c6420636f696e732e00, ''),
(161, 0, 0x5309cf080701000000c5048001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203233272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038313835353020676f6c6420636f696e732e00, ''),
(161, 0, 0x4d09d208070100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203233272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038313835353020676f6c6420636f696e732e00, ''),
(162, 0, 0x5609cb080601000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(162, 0, 0x5709cb080601000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(162, 0, 0x5709ca08070100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203234272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035393131373520676f6c6420636f696e732e00, ''),
(162, 0, 0x5809ca08060100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203234272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035393131373520676f6c6420636f696e732e00, ''),
(162, 0, 0x5b09ca08060100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203234272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035393131373520676f6c6420636f696e732e00, ''),
(162, 0, 0x5a09ce080601000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(162, 0, 0x5b09ce080601000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(162, 0, 0x5c09cf08060100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203234272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035393131373520676f6c6420636f696e732e00, ''),
(162, 0, 0x5d09cc08060100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203234272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035393131373520676f6c6420636f696e732e00, ''),
(162, 0, 0x5c09cf08070100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203234272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035393131373520676f6c6420636f696e732e00, ''),
(162, 0, 0x5d09cd08070100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203234272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035393131373520676f6c6420636f696e732e00, ''),
(162, 0, 0x5709d1080701000000c5048001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203234272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035393131373520676f6c6420636f696e732e00, ''),
(163, 0, 0x6309d6080701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(163, 0, 0x6309d7080701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(163, 0, 0x6509d50807010000002c198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203235272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031313832333520676f6c6420636f696e732e00, ''),
(163, 0, 0x6209d80807010000002d198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203235272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031313832333520676f6c6420636f696e732e00, ''),
(163, 0, 0x6409da08070100000071188001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203235272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031313832333520676f6c6420636f696e732e00, ''),
(163, 0, 0x6609d90807010000002c198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203235272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031313832333520676f6c6420636f696e732e00, ''),
(164, 0, 0x6909d308070100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203236272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031373238303520676f6c6420636f696e732e00, ''),
(164, 0, 0x6a09d3080701000000c5048001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203236272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031373238303520676f6c6420636f696e732e00, ''),
(164, 0, 0x6809d8080701000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(164, 0, 0x6909d8080701000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(164, 0, 0x6a09d908070100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203236272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031373238303520676f6c6420636f696e732e00, ''),
(165, 0, 0x6b09d308060100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203237272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032383139343520676f6c6420636f696e732e00, ''),
(165, 0, 0x6509d70806010000002d198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203237272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032383139343520676f6c6420636f696e732e00, ''),
(165, 0, 0x6709d4080601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(165, 0, 0x6709d5080601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(165, 0, 0x6b09d7080601000000c5048001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203237272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032383139343520676f6c6420636f696e732e00, ''),
(165, 0, 0x6509d808060100000069188001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203237272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032383139343520676f6c6420636f696e732e00, ''),
(165, 0, 0x6809d908060100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203237272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032383139343520676f6c6420636f696e732e00, ''),
(165, 0, 0x6909d808060100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203237272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032383139343520676f6c6420636f696e732e00, ''),
(166, 0, 0x7509db08070100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203238272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323733333020676f6c6420636f696e732e00, ''),
(166, 0, 0x7909d9080701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(166, 0, 0x7909da080701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(166, 0, 0x7a09db08070100000025198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203238272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323733333020676f6c6420636f696e732e00, ''),
(166, 0, 0x7709dd080701000000c5048001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203238272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323733333020676f6c6420636f696e732e00, ''),
(166, 0, 0x7809dd08070100000024198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203238272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323733333020676f6c6420636f696e732e00, ''),
(167, 0, 0x7b09cb080701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(167, 0, 0x7d09ca0807010000002c198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203239272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313832383020676f6c6420636f696e732e00, ''),
(167, 0, 0x7b09cc080701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(167, 0, 0x7d09ce08070100000071188001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203239272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313832383020676f6c6420636f696e732e00, ''),
(167, 0, 0x7e09ce0807010000002c198001000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274869676867617264656e203239272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313832383020676f6c6420636f696e732e00, ''),
(168, 0, 0xc607d2070601000000b606170000000000, ''),
(168, 0, 0xc707d2070601000000b806170000000000, ''),
(168, 0, 0xc207d5070601000000b606170000000000, ''),
(168, 0, 0xc207d7070601000000b606170000000000, ''),
(168, 0, 0xc307d5070601000000b706170000000000, ''),
(168, 0, 0xc307d7070601000000b706170000000000, ''),
(168, 0, 0xc607d5070601000000b606170000000000, ''),
(168, 0, 0xc607d7070601000000b606170000000000, ''),
(168, 0, 0xc707d5070601000000b706170000000000, ''),
(168, 0, 0xc707d7070601000000b706170000000000, ''),
(168, 0, 0xc807d5070601000000b606170000000000, ''),
(168, 0, 0xc807d7070601000000b606170000000000, ''),
(168, 0, 0xc907d5070601000000b806170000000000, ''),
(168, 0, 0xc907d7070601000000b706170000000000, ''),
(168, 0, 0xc607d9070601000000bd048001000b006465736372697074696f6e015200000049742062656c6f6e677320746f20686f7573652027476d2049736c65272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039393133353520676f6c6420636f696e732e00, ''),
(168, 0, 0xc707d9070601000000bd048001000b006465736372697074696f6e015200000049742062656c6f6e677320746f20686f7573652027476d2049736c65272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039393133353520676f6c6420636f696e732e00, ''),
(168, 0, 0xc607d9070701000000c5048001000b006465736372697074696f6e015200000049742062656c6f6e677320746f20686f7573652027476d2049736c65272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039393133353520676f6c6420636f696e732e00, ''),
(169, 0, 0x380dde020c01000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(169, 0, 0x390dde020c01000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(169, 0, 0x3c0de0020c01000000212a8001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027556e646572776f726c6420626173652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034303932373520676f6c6420636f696e732e00, ''),
(169, 0, 0x3f0de5020c01000000182a8001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027556e646572776f726c6420626173652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034303932373520676f6c6420636f696e732e00, ''),
(170, 0, 0x470dd9020c01000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(170, 0, 0x470dda020c01000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(170, 0, 0x490dd9020c01000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(170, 0, 0x490dda020c01000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(170, 0, 0x450ddd020c01000000182a8001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027556e646572776f726c6420626173652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035343537303020676f6c6420636f696e732e00, ''),
(170, 0, 0x460de5020c01000000182a8001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027556e646572776f726c6420626173652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035343537303020676f6c6420636f696e732e00, ''),
(171, 0, 0x470de8020c01000000182a8001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027556e646572776f726c6420626173652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035333636303520676f6c6420636f696e732e00, ''),
(171, 0, 0x470df1020c01000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(171, 0, 0x470df3020c01000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(171, 0, 0x480df1020c01000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(171, 0, 0x480df3020c01000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(171, 0, 0x4a0df0020c01000000182a8001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027556e646572776f726c6420626173652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035333636303520676f6c6420636f696e732e00, ''),
(172, 0, 0xe705090806010000008b1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(172, 0, 0xe7050a0806010000008c1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(172, 0, 0xe9050d0806010000008d158001000b006465736372697074696f6e015000000049742062656c6f6e677320746f20686f75736520275669702031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303031333520676f6c6420636f696e732e00, ''),
(173, 0, 0xed05090806010000008b1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(173, 0, 0xed050a0806010000008c1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(173, 0, 0xef050d0806010000008d158001000b006465736372697074696f6e015000000049742062656c6f6e677320746f20686f75736520275669702032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032323733373520676f6c6420636f696e732e00, ''),
(174, 0, 0xe705110806010000008b1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(174, 0, 0xe705120806010000008c1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(174, 0, 0xe905150806010000008d158001000b006465736372697074696f6e015000000049742062656c6f6e677320746f20686f75736520275669702033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303031333520676f6c6420636f696e732e00, ''),
(175, 0, 0xed05110806010000008b1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(175, 0, 0xed05120806010000008c1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(175, 0, 0xef05150806010000008d158001000b006465736372697074696f6e015000000049742062656c6f6e677320746f20686f75736520275669702034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032323733373520676f6c6420636f696e732e00, ''),
(176, 0, 0xf7050e080601000000b71400, ''),
(176, 0, 0xf8050f0806010000008b1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(176, 0, 0xf805100806010000008c1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(176, 0, 0xf705150806010000008d158001000b006465736372697074696f6e015000000049742062656c6f6e677320746f20686f75736520275669702035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343535323020676f6c6420636f696e732e00, ''),
(176, 0, 0xf80515080601000000b71400, ''),
(177, 0, 0xfa050f0805010000008b1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(177, 0, 0xfc050e080601000000b71400, ''),
(177, 0, 0xf90513080501000000c3048001000b006465736372697074696f6e015000000049742062656c6f6e677320746f20686f75736520275669702036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035313834313520676f6c6420636f696e732e00, ''),
(177, 0, 0xfa05100805010000008c1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(177, 0, 0xfb0514080601000000b71400, ''),
(177, 0, 0xfc05140806010000008d158001000b006465736372697074696f6e015000000049742062656c6f6e677320746f20686f75736520275669702036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035313834313520676f6c6420636f696e732e00, ''),
(178, 0, 0x02060f0805010000008b1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(178, 0, 0x01060e080601000000b71400, ''),
(178, 0, 0x0206100805010000008c1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(178, 0, 0x030613080501000000c3048001000b006465736372697074696f6e015000000049742062656c6f6e677320746f20686f75736520275669702037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035313834313520676f6c6420636f696e732e00, ''),
(178, 0, 0x0106140806010000008d158001000b006465736372697074696f6e015000000049742062656c6f6e677320746f20686f75736520275669702037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035313834313520676f6c6420636f696e732e00, ''),
(179, 0, 0x04060f0806010000008b1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(179, 0, 0x05060e080601000000b71400, ''),
(179, 0, 0x0406100806010000008c1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(179, 0, 0x0606150806010000008d158001000b006465736372697074696f6e015000000049742062656c6f6e677320746f20686f75736520275669702038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343535323020676f6c6420636f696e732e00, ''),
(180, 0, 0x1b06050805010000008b158001000b006465736372697074696f6e015000000049742062656c6f6e677320746f20686f75736520275669702039272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393130383520676f6c6420636f696e732e00, ''),
(180, 0, 0x1f0608080401000000b81400, ''),
(180, 0, 0x210605080401000000b71400, ''),
(180, 0, 0x2206070805010000008b1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(180, 0, 0x2206080805010000008c1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(180, 0, 0x2206090805010000003e198001000b006465736372697074696f6e015000000049742062656c6f6e677320746f20686f75736520275669702039272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393130383520676f6c6420636f696e732e00, ''),
(181, 0, 0x0d06140806010000008b1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(181, 0, 0x0d06150806010000008c1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(181, 0, 0x120616080601000000d5048001000b006465736372697074696f6e015100000049742062656c6f6e677320746f20686f7573652027566970203130272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313832383020676f6c6420636f696e732e00, ''),
(181, 0, 0x120617080601000000d5048001000b006465736372697074696f6e015100000049742062656c6f6e677320746f20686f7573652027566970203130272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313832383020676f6c6420636f696e732e00, ''),
(182, 0, 0x0c06210806010000008b1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(182, 0, 0x0c06220806010000008c1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(182, 0, 0x0f0620080601000000b71400, ''),
(182, 0, 0x0b0624080601000000b81400, ''),
(182, 0, 0x0e06250806010000008d158001000b006465736372697074696f6e015100000049742062656c6f6e677320746f20686f7573652027566970203131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031333634323520676f6c6420636f696e732e00, ''),
(182, 0, 0x0f0625080601000000b71400, ''),
(183, 0, 0x1106210806010000008b1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(183, 0, 0x1106220806010000008c1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(183, 0, 0x140620080601000000b71400, ''),
(183, 0, 0x1206250806010000008d158001000b006465736372697074696f6e015100000049742062656c6f6e677320746f20686f7573652027566970203132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031333634323520676f6c6420636f696e732e00, ''),
(183, 0, 0x140625080601000000b71400, ''),
(183, 0, 0x150624080601000000b81400, ''),
(184, 0, 0x1906270806010000008b1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(184, 0, 0x1606280806010000008b158001000b006465736372697074696f6e015000000049742062656c6f6e677320746f20686f7573652027566970203133272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320373237363020676f6c6420636f696e732e00, ''),
(184, 0, 0x160629080601000000b81400, ''),
(184, 0, 0x1906280806010000008c1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(184, 0, 0x19062a080601000000b71400, ''),
(185, 0, 0x12062b0806010000008d158001000b006465736372697074696f6e015100000049742062656c6f6e677320746f20686f7573652027566970203134272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031333634323520676f6c6420636f696e732e00, ''),
(185, 0, 0x14062b080601000000b71400, ''),
(185, 0, 0x11062f0806010000008d1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(185, 0, 0x12062f0806010000008e1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(185, 0, 0x15062f080601000000b81400, ''),
(186, 0, 0x0d062b080601000000b71400, ''),
(186, 0, 0x0e062b0806010000008d158001000b006465736372697074696f6e015100000049742062656c6f6e677320746f20686f7573652027566970203135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031333634323520676f6c6420636f696e732e00, ''),
(186, 0, 0x0b062d080601000000b81400, ''),
(186, 0, 0x0c062f0806010000008d1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(186, 0, 0x0d062f0806010000008e1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(187, 0, 0x0c06210805010000008b1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(187, 0, 0x0c06220805010000008c1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(187, 0, 0x0d0620080501000000b71400, ''),
(187, 0, 0x0d0625080501000000b71400, ''),
(187, 0, 0x0e06250805010000008d158001000b006465736372697074696f6e015100000049742062656c6f6e677320746f20686f7573652027566970203136272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031333634323520676f6c6420636f696e732e00, ''),
(188, 0, 0x130620080501000000b71400, ''),
(188, 0, 0x1406210805010000008b1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(188, 0, 0x1406220805010000008c1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(188, 0, 0x1206250805010000008d158001000b006465736372697074696f6e015100000049742062656c6f6e677320746f20686f7573652027566970203137272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031333634323520676f6c6420636f696e732e00, ''),
(188, 0, 0x150624080501000000b81400, ''),
(189, 0, 0x1906270805010000008b1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(189, 0, 0x1606280805010000008b158001000b006465736372697074696f6e015000000049742062656c6f6e677320746f20686f7573652027566970203138272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320373237363020676f6c6420636f696e732e00, ''),
(189, 0, 0x160629080501000000b81400, ''),
(189, 0, 0x1906280805010000008c1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(190, 0, 0x12062b0805010000008d158001000b006465736372697074696f6e015100000049742062656c6f6e677320746f20686f7573652027566970203139272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031333634323520676f6c6420636f696e732e00, ''),
(190, 0, 0x14062b080501000000b71400, ''),
(190, 0, 0x11062f0805010000008d1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(190, 0, 0x12062f0805010000008e1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(190, 0, 0x15062e080501000000b81400, '');
INSERT INTO `tile_store` (`house_id`, `world_id`, `data`, `serial`) VALUES
(191, 0, 0x0e062b0805010000008d158001000b006465736372697074696f6e015100000049742062656c6f6e677320746f20686f7573652027566970203230272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031333634323520676f6c6420636f696e732e00, ''),
(191, 0, 0x0f062b080501000000b71400, ''),
(191, 0, 0x0b062e080501000000b81400, ''),
(191, 0, 0x0c062f0805010000008d1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(191, 0, 0x0d062f0805010000008e1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(192, 0, 0x0106260806010000008b1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(192, 0, 0x0106270806010000008c1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(192, 0, 0x050628080601000000d5048001000b006465736372697074696f6e015100000049742062656c6f6e677320746f20686f7573652027566970203231272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031333634323520676f6c6420636f696e732e00, ''),
(193, 0, 0x03061b080601000000b71400, ''),
(193, 0, 0x06061b080601000000b71400, ''),
(193, 0, 0x02061c0806010000008b1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(193, 0, 0x02061d0806010000008c1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(193, 0, 0x07061d080601000000b81400, ''),
(193, 0, 0x07061f080601000000b81400, ''),
(193, 0, 0x0406200806010000008d158001000b006465736372697074696f6e015100000049742062656c6f6e677320746f20686f7573652027566970203232272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031373238303520676f6c6420636f696e732e00, ''),
(193, 0, 0x060620080601000000b71400, ''),
(194, 0, 0xfc051a0805010000008b1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(194, 0, 0xfc051b0805010000008c1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(194, 0, 0xff051a0805010000008d1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(194, 0, '', ''),
(194, 0, 0x01061e0805010000008b158001000b006465736372697074696f6e015100000049742062656c6f6e677320746f20686f7573652027566970203233272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035303032323520676f6c6420636f696e732e00, ''),
(195, 0, 0xf2051a0806010000008b1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(195, 0, 0xf2051b0806010000008c1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(195, 0, 0xf5051a0806010000008b1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(195, 0, 0xf5051b0806010000008c1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(195, 0, 0xf7051e0806010000008b158001000b006465736372697074696f6e015100000049742062656c6f6e677320746f20686f7573652027566970203234272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(195, 0, 0xf305200806010000008d158001000b006465736372697074696f6e015100000049742062656c6f6e677320746f20686f7573652027566970203234272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(196, 0, 0xf2051a0805010000008b1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(196, 0, 0xf2051b0805010000008c1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(196, 0, 0xf4051a0805010000008b1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(196, 0, 0xf4051b0805010000008c1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(196, 0, 0xf1051f080501000000c3048001000b006465736372697074696f6e015100000049742062656c6f6e677320746f20686f7573652027566970203235272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034343536353520676f6c6420636f696e732e00, ''),
(197, 0, 0xe3051b080601000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(197, 0, 0xe2051e080501000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(197, 0, 0xe2051f080501000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(197, 0, 0xe2051d080601000000a6148001000b006465736372697074696f6e015100000049742062656c6f6e677320746f20686f7573652027566970203236272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032323733373520676f6c6420636f696e732e00, ''),
(197, 0, 0xe3051c080601000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(197, 0, 0xe30520080601000000a4148001000b006465736372697074696f6e015100000049742062656c6f6e677320746f20686f7573652027566970203236272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032323733373520676f6c6420636f696e732e00, ''),
(198, 0, 0xf605250806010000008b1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(198, 0, 0xf605260806010000008c1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(198, 0, 0xfb0527080601000000b81400, ''),
(198, 0, 0xfb05280806010000008b158001000b006465736372697074696f6e015100000049742062656c6f6e677320746f20686f7573652027566970203237272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033313833323520676f6c6420636f696e732e00, ''),
(199, 0, 0xf6052c0806010000008b1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(199, 0, 0xf6052d0806010000008c1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(199, 0, 0xfb052e0806010000008b158001000b006465736372697074696f6e015100000049742062656c6f6e677320746f20686f7573652027566970203238272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033313833323520676f6c6420636f696e732e00, ''),
(200, 0, 0xed052d0806010000008b1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(200, 0, 0xed052e0806010000008c1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(200, 0, 0xf1052e0806010000008b158001000b006465736372697074696f6e015100000049742062656c6f6e677320746f20686f7573652027566970203239272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(201, 0, 0xf005290805010000008b1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(201, 0, 0xf0052a0805010000008c1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(201, 0, 0xf1052a0806010000008b158001000b006465736372697074696f6e015100000049742062656c6f6e677320746f20686f7573652027566970203330272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032323733373520676f6c6420636f696e732e00, ''),
(202, 0, 0xed05250806010000008b1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(202, 0, 0xed05260806010000008c1e8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(202, 0, 0xf105260806010000008b158001000b006465736372697074696f6e015100000049742062656c6f6e677320746f20686f7573652027566970203331272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303931383520676f6c6420636f696e732e00, ''),
(203, 0, 0x1108fa07060100000071188001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027546f7020486f7573652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320373237363020676f6c6420636f696e732e00, ''),
(203, 0, 0x1208fa0706010000002c198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027546f7020486f7573652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320373237363020676f6c6420636f696e732e00, ''),
(203, 0, 0x1208fc070601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(203, 0, 0x1208fd070601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `woe`
--

CREATE TABLE `woe` (
  `id` int(11) NOT NULL,
  `started` int(11) NOT NULL,
  `guild` int(11) NOT NULL,
  `breaker` int(11) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `woe`
--

INSERT INTO `woe` (`id`, `started`, `guild`, `breaker`, `time`) VALUES
(1, 1554768325, 1, 7, 1552276120);

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_featured_article`
--

CREATE TABLE `z_featured_article` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `text` varchar(255) NOT NULL,
  `date` varchar(30) NOT NULL,
  `author` varchar(50) NOT NULL,
  `read_more` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_forum`
--

CREATE TABLE `z_forum` (
  `id` int(11) NOT NULL,
  `first_post` int(11) NOT NULL DEFAULT 0,
  `last_post` int(11) NOT NULL DEFAULT 0,
  `section` int(3) NOT NULL DEFAULT 0,
  `replies` int(20) NOT NULL DEFAULT 0,
  `views` int(20) NOT NULL DEFAULT 0,
  `author_aid` int(20) NOT NULL DEFAULT 0,
  `author_guid` int(20) NOT NULL DEFAULT 0,
  `post_text` text NOT NULL,
  `post_topic` varchar(255) NOT NULL,
  `post_smile` tinyint(1) NOT NULL DEFAULT 0,
  `post_date` int(20) NOT NULL DEFAULT 0,
  `last_edit_aid` int(20) NOT NULL DEFAULT 0,
  `edit_date` int(20) NOT NULL DEFAULT 0,
  `post_ip` varchar(15) NOT NULL DEFAULT '0.0.0.0',
  `icon_id` tinyint(4) NOT NULL DEFAULT 1,
  `post_icon_id` tinyint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `z_forum`
--

INSERT INTO `z_forum` (`id`, `first_post`, `last_post`, `section`, `replies`, `views`, `author_aid`, `author_guid`, `post_text`, `post_topic`, `post_smile`, `post_date`, `last_edit_aid`, `edit_date`, `post_ip`, `icon_id`, `post_icon_id`) VALUES
(1, 1, 1576472216, 1, 0, 1, 3, 7, 'asdasdasdasdsadasdasd', 'teste', 1, 1576472216, 0, 0, '::1', 1, 0),
(2, 2, 1576472557, 1, 0, 1, 3, 7, 'O que é Lorem Ipsum?\r\nLorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos. Lorem Ipsum sobreviveu não só a cinco séculos, como também ao salto para a editoração eletrônica, permanecendo essencialmente inalterado. Se popularizou na década de 60, quando a Letraset lançou decalques contendo passagens de Lorem Ipsum, e mais recentemente quando passou a ser integrado a softwares de editoração eletrônica como Aldus PageMaker.', 'teste 222', 1, 1576472557, 0, 0, '::1', 1, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_network_box`
--

CREATE TABLE `z_network_box` (
  `id` int(11) NOT NULL,
  `network_name` varchar(10) NOT NULL,
  `network_link` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_news_tickers`
--

CREATE TABLE `z_news_tickers` (
  `id` int(11) NOT NULL,
  `date` int(11) NOT NULL DEFAULT 1,
  `author` int(11) NOT NULL,
  `image_id` int(3) NOT NULL DEFAULT 0,
  `text` text NOT NULL,
  `hide_ticker` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `z_news_tickers`
--

INSERT INTO `z_news_tickers` (`id`, `date`, `author`, `image_id`, `text`, `hide_ticker`) VALUES
(1, 1480371820, 1, 1, 'Bem-Vindo ao Gesior 2012 Edited by Natanael Beckman!', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_ots_comunication`
--

CREATE TABLE `z_ots_comunication` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `param1` varchar(255) NOT NULL,
  `param2` varchar(255) NOT NULL,
  `param3` varchar(255) NOT NULL,
  `param4` varchar(255) NOT NULL,
  `param5` varchar(255) NOT NULL,
  `param6` varchar(255) NOT NULL,
  `param7` varchar(255) NOT NULL,
  `delete_it` int(2) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_ots_guildcomunication`
--

CREATE TABLE `z_ots_guildcomunication` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `param1` varchar(255) NOT NULL,
  `param2` varchar(255) NOT NULL,
  `param3` varchar(255) NOT NULL,
  `param4` varchar(255) NOT NULL,
  `param5` varchar(255) NOT NULL,
  `param6` varchar(255) NOT NULL,
  `param7` varchar(255) NOT NULL,
  `delete_it` int(2) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_polls`
--

CREATE TABLE `z_polls` (
  `id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `end` int(11) NOT NULL,
  `start` int(11) NOT NULL,
  `answers` int(11) NOT NULL,
  `votes_all` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_polls_answers`
--

CREATE TABLE `z_polls_answers` (
  `poll_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `votes` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shopguild_history_item`
--

CREATE TABLE `z_shopguild_history_item` (
  `id` int(11) NOT NULL,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT 0,
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL DEFAULT 0,
  `offer_id` varchar(255) NOT NULL DEFAULT '',
  `offer_desc` varchar(255) DEFAULT NULL,
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT 0,
  `trans_real` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shopguild_history_pacc`
--

CREATE TABLE `z_shopguild_history_pacc` (
  `id` int(11) NOT NULL,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT 0,
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL DEFAULT 0,
  `pacc_days` int(11) NOT NULL DEFAULT 0,
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT 0,
  `trans_real` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shopguild_offer`
--

CREATE TABLE `z_shopguild_offer` (
  `id` int(11) NOT NULL,
  `points` int(11) NOT NULL DEFAULT 0,
  `itemid1` int(11) NOT NULL DEFAULT 0,
  `count1` int(11) NOT NULL DEFAULT 0,
  `itemid2` int(11) NOT NULL DEFAULT 0,
  `count2` int(11) NOT NULL DEFAULT 0,
  `offer_type` varchar(255) DEFAULT NULL,
  `offer_description` text NOT NULL,
  `offer_name` varchar(255) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT 0,
  `looktype` int(3) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `z_shopguild_offer`
--

INSERT INTO `z_shopguild_offer` (`id`, `points`, `itemid1`, `count1`, `itemid2`, `count2`, `offer_type`, `offer_description`, `offer_name`, `pid`, `looktype`) VALUES
(1, 2, 0, 3, 0, 0, 'pacc', '3 Dias de VIP Account.', '3 Vip Days', 0, 0),
(2, 5, 0, 7, 0, 0, 'pacc', '7 Dias de VIP Account.', '7 Vip Days', 0, 0),
(3, 10, 0, 15, 0, 0, 'pacc', '15 Dias de VIP Account.', '15 Vip Days', 0, 0),
(4, 5, 12884, 1, 0, 0, 'item', '<li>Vol: 32<br>\r\n<li>Weight: 15.00 oz.', 'Guild Backpack', 0, 0),
(5, 5, 6132, 1, 0, 0, 'item', '<li>Regen: +5mp/1sec and +2hp/1sec.', 'Pair Of Soft Boots', 0, 0),
(6, 6, 12849, 1, 0, 0, 'item', 'Regenera uma boa quantidade de stamina.<br><br>\r\nPara maiores informaÃ§Ãµes, <a href=\"?subtopic=stamina\">clique aqui</a>.', 'Stamina Refiller', 0, 0),
(7, 5, 7455, 1, 0, 0, 'item', '<li>Attack: 48<br>\r\n<li>Defense: 28<br>\r\n<li>Extradef: +2<br>\r\n<b>Only Elite Knights.</b>', 'Mythril Axe', 0, 0),
(8, 5, 7431, 1, 0, 0, 'item', '<li>Attack: 48<br>\r\n<li>Defense: 38<br>\r\n<li>Extradef: -2<br>\r\n<b>Only Elite Knights.</b>', 'Demonbone', 0, 0),
(9, 5, 12649, 1, 0, 0, 'item', '<li>Attack: 48<br>\r\n<li>Defense: 29<br>\r\n<li>Extradef: +2<br>\r\n<b>Only Elite Knights.</b>', 'Blade Of Corruption', 0, 0),
(10, 5, 5803, 1, 0, 0, 'item', '<li>Range: 6<br>\r\n<li>Attack: +2<br>\r\n<li>HitChance: +2%<br>\r\n<b>Only Royal Paladins.</b>', 'Arbalest', 0, 0),
(12, 5, 12678, 1, 0, 0, 'item', '<li>Attack: 90~140<br>\r\n<li>Element: Holy<br>\r\n<li>Range: 4<br>\r\n<b>Only Master Sorcerers and Elder Druids.</b>', 'Staff Of Destruction', 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shop_history_item`
--

CREATE TABLE `z_shop_history_item` (
  `id` int(11) NOT NULL,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT 0,
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL DEFAULT 0,
  `offer_id` varchar(255) NOT NULL DEFAULT '',
  `offer_desc` varchar(255) DEFAULT NULL,
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT 0,
  `trans_real` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shop_history_pacc`
--

CREATE TABLE `z_shop_history_pacc` (
  `id` int(11) NOT NULL,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT 0,
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL DEFAULT 0,
  `pacc_days` int(11) NOT NULL DEFAULT 0,
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT 0,
  `trans_real` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shop_offer`
--

CREATE TABLE `z_shop_offer` (
  `id` int(11) NOT NULL,
  `points` int(11) NOT NULL DEFAULT 0,
  `itemid1` int(11) NOT NULL DEFAULT 0,
  `count1` int(11) NOT NULL DEFAULT 0,
  `itemid2` int(11) NOT NULL DEFAULT 0,
  `count2` int(11) NOT NULL DEFAULT 0,
  `offer_type` varchar(255) DEFAULT NULL,
  `offer_description` text NOT NULL,
  `offer_name` varchar(255) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT 0,
  `looktype` int(3) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `z_shop_offer`
--

INSERT INTO `z_shop_offer` (`id`, `points`, `itemid1`, `count1`, `itemid2`, `count2`, `offer_type`, `offer_description`, `offer_name`, `pid`, `looktype`) VALUES
(1, 60, 12885, 1, 0, 0, 'itemvip', 'Como benefÃ­cio exclusivo de Fundador, vocÃª receberÃ¡:<br><br>\r\n<li>30 Dias de VIP Account.<br>\r\n<li>1 Aura Exclusiva. <small>(Para mais informaÃ§Ãµes, <a href=\"?subtopic=founderaura\">clique aqui</a>.)</small><br>\r\n<li>1 Founder Outfit. <small>(Para mais informaÃ§Ãµes, <a href=\"?subtopic=founderoutfit\">clique aqui</a>.)</small><br>\r\n<li>1 Founder Backpack. <small>(Vol: 36)</small><br>\r\n<li>1 Cave Exclusiva.<br>\r\n<li>2 Exp Potions.<br>\r\n<li>2 Founder Rings. <small>(+10mp/2sec, +5hp/2sec. Duration: 60min.)</small><br>\r\n<li>1 Holy Icon (5 charges). <small>(USE para receber full bless.)</small><br>\r\n<li>1 Full Stamina Refiller. <small>(Recupera toda a sua stamina.)</small><br>\r\n<li>1 Bronze VIP Days. <small>(USE para receber 2 dias de VIP Account.)</small><br><br>\r\n<b><font color=\"darkred\">VocÃª sÃ³ pode usar esse item 1x por personagem.</font></b>', 'Pacote de Fundador', 0, 0),
(2, 20, 12860, 1, 0, 0, 'itemvip', '<li>Armor: +3<br>\r\n<li>Speed: +20<br>\r\n<li>Regen: +15mp/1sec and +10hp/1sec.<br><br>\r\n<b><font color=\"darkred\">Item Infinito.</font></b>', 'Vip Boots', 0, 0),
(3, 20, 12861, 1, 0, 0, 'itemvip', '<li>Armor: +11<br>\r\n<li>Speed: +10<br>\r\n<li>AbsorbPercentAll: +3%<br>\r\n<li>Regen: +2mp/1sec and +2hp/1sec.', 'Vip Helmet', 0, 0),
(4, 2, 12889, 1, 0, 0, 'itemvip', '<li>Vol: 32<br>\r\n<li>Weight: 15.00 oz.', 'Vip Backpack', 0, 0),
(5, 1, 12879, 1, 0, 0, 'itemvip', 'Use to receive 2 VIP Days.', 'Bronze Vip Days', 0, 0),
(6, 2, 12880, 1, 0, 0, 'itemvip', 'Use to receive 5 VIP Days.', 'Silver Vip Days', 0, 0),
(7, 5, 12881, 1, 0, 0, 'itemvip', 'Use to receive 14 VIP Days.', 'Gold Vip Days', 0, 0),
(8, 5, 0, 15, 0, 0, 'pacc', '15 Dias de VIP Account.', '15 Vip Days', 0, 0),
(9, 10, 0, 30, 0, 0, 'pacc', '30 Dias de VIP Account.', '30 Vip Days', 0, 0),
(10, 26, 0, 90, 0, 0, 'pacc', '90 Dias de VIP Account.', '90 Vip Days', 0, 0),
(11, 52, 0, 180, 0, 0, 'pacc', '180 Dias de VIP Account.', '180 Vip Days', 0, 0),
(12, 100, 0, 360, 0, 0, 'pacc', '360 Dias de VIP Account.', '360 Vip Days', 0, 0),
(13, 4, 12707, 1, 0, 0, 'item', 'Usado para acessar a cave exclusiva.<br><br>\r\nPara maiores informaÃ§Ãµes, <a href=\"?subtopic=caveexc\">clique aqui</a>.', 'Cave Exclusiva', 0, 0),
(14, 2, 12698, 1, 0, 0, 'item', 'Aumenta em 20% a experiÃªncia obtida de monstros.<br><br>\r\n\r\n<li>DuraÃ§Ã£o: 30 minutos.', 'Exp Potion', 0, 0),
(15, 3, 12849, 1, 0, 0, 'item', 'Regenera uma boa quantidade de stamina.<br><br>\r\nPara maiores informaÃ§Ãµes, <a href=\"?subtopic=stamina\">clique aqui</a>.', 'Stamina Refiller', 0, 0),
(16, 30, 12850, 1, 0, 0, 'item', 'Regenera toda a sua stamina.<br><br>\r\nPara maiores informaÃ§Ãµes, <a href=\"?subtopic=stamina\">clique aqui</a>.<br>', 'Full Stamina Refiller', 0, 0),
(17, 10, 0, 0, 0, 0, 'changename', 'Enjoou do seu nick?<br>\r\nLevou Hunted ou seu nick estÃ¡ marcado?<br><br>\r\nAo comprar este item, vocÃª pode mudar o nome de seu personagem.', 'Change Name', 0, 0),
(18, 50, 0, 0, 0, 0, 'unban', 'Matou jogadores de mais?<br>\r\nInfringiu alguma regra e levou ban?<br><br>\r\nAo comprar este item, o ban de seu personagem serÃ¡ removido.<br>\r\n<b><font color=\"darkred\">Respeite e siga as regras do servidor. Caso seu personagem tome deleted, serÃ¡ impossÃ­vel recuperÃ¡-lo.</font></b>', 'Unban', 0, 0),
(19, 5, 0, 0, 0, 0, 'redskull', 'Remove o RedSkull de seu personagem.', 'Remove Redskull', 0, 0),
(20, 2, 12710, 1, 0, 0, 'item', 'Use para receber full bless.<br><br>\r\n<b><font color=\"darkred\">Este item possui 5 cargas.</font></b>', 'Holy Icon', 0, 0),
(21, 5, 2408, 1, 0, 0, 'item', '<li>Attack: 52<br>\r\n<li>Defense: 32<br>\r\n<li>Extradef: +3<br>\r\n<b>Only Elite Knights.</b><br><br>\r\n<b><font color=\"darkred\">Ã‰ possÃ­vel mudar o elemento desta arma.<br>\r\nEste item pode ser obtido em Quest In-Game.</font></b>', 'Warlord Sword', 0, 0),
(22, 5, 8925, 1, 0, 0, 'item', '<li>Attack: 52<br>\r\n<li>Defense: 29<br>\r\n<li>Extradef: +3<br>\r\n<b>Only Elite Knights.</b><br><br>\r\n<b><font color=\"darkred\">Ã‰ possÃ­vel mudar o elemento desta arma.<br>\r\nEste item pode ser obtido em Quest In-Game.</font></b>', 'Solar Axe', 0, 0),
(23, 5, 7450, 1, 0, 0, 'item', '<li>Attack: 52<br>\r\n<li>Defense: 33<br>\r\n<li>Extradef: +3<br>\r\n<b>Only Elite Knights.</b><br><br>\r\n<b><font color=\"darkred\">Ã‰ possÃ­vel mudar o elemento desta arma.<br>\r\nEste item pode ser obtido em Quest In-Game.</font></b>', 'Hammer Of Prophecy', 0, 0),
(24, 5, 12703, 1, 0, 0, 'item', '<li>Attack: 120~160<br>\r\n<li>Element: Holy<br>\r\n<li>Range: 4<br>\r\n<b>Only Master Sorcerers and Elder Druids.</b><br><br>\r\n<b><font color=\"darkred\">Ã‰ possÃ­vel mudar o elemento desta wand.<br>\r\nEste item pode ser obtido em Quest In-Game.</font></b>', 'Staff Of Dream Star', 0, 0),
(25, 5, 8856, 1, 0, 0, 'item', '<li>Range: 6<br>\r\n<li>Attack: +6<br>\r\n<li>HitChance: +5%<br>\r\n<b>Only Royal Paladins.</b><br><br>\r\n<b><font color=\"darkred\">Este item pode ser obtido em Quest In-Game.</font></b>', 'Yol\'s Bow', 0, 0),
(26, 5, 8852, 1, 0, 0, 'item', '<li>Range: 6<br>\r\n<li>Attack: +20<br>\r\n<li>HitChance: -15%<br>\r\n<b>Only Royal Paladins.</b><br><br>\r\n<b><font color=\"darkred\">Este item pode ser obtido em Quest In-Game.</font></b>', 'The Devileye', 0, 0),
(27, 5, 12709, 1, 0, 0, 'item', '<li>Defense: 37<br>\r\n<li>SkillSword: +3<br>\r\n<li>SkillAxe: +3<br>\r\n<li>SkillClub: +3<br>\r\n<li>SkillDist: +3<br>\r\n<li>AbsorbPercentFire: +2%<br>\r\n<li>AbsorbPercentIce: +2%<br>\r\n<li>AbsorbPercentEarth: +2%<br>\r\n<li>AbsorbPercentDeath: +2%<br>\r\n<li>AbsorbPercentEnergy: +2%<br><br>\r\n<b><font color=\"darkred\">Ã‰ possÃ­vel melhorar este item usando um Upgrade Gem.<br>\r\nEste item pode ser obtido em Quest In-Game.<br></font></b>', 'Elite Shield', 0, 0),
(28, 5, 12708, 1, 0, 0, 'item', '<li>Defense: 26<br>\r\n<li>MagicPoints: +3<br>\r\n<li>SkillShield: +2<br>\r\n<li>AbsorbPercentPhysical: +3%<br>\r\n<li>AbsorbPercentHoly: +2%<br>\r\n<b>Only Master Sorcerers and Elder Druids.</b><br><br>\r\n<b><font color=\"darkred\">Ã‰ possÃ­vel melhorar este item usando um Upgrade Gem.<br>\r\nEste item pode ser obtido em Quest In-Game.<br></font></b>', 'Elemental Magic Shield', 0, 0),
(29, 15, 12727, 1, 0, 0, 'item', '<li>Attack: 54<br>\r\n<li>Defense: 35<br>\r\n<li>Extradef: +2<br>\r\n<li>SkillSword: +2<br>\r\n<b>Only Elite Knights.</b><br><br>\r\n<b><font color=\"darkred\">Ã‰ possÃ­vel mudar o elemento desta arma.<br>\r\nÃ‰ possÃ­vel melhorar este item usando um Upgrade Gem.<br>\r\nEste item pode ser obtido em Quest In-Game.</font></b>', 'Classic Sword', 0, 0),
(30, 15, 12741, 1, 0, 0, 'item', '<li>Attack: 54<br>\r\n<li>Defense: 35<br>\r\n<li>Extradef: +2<br>\r\n<li>SkillAxe: +2<br>\r\n<b>Only Elite Knights.</b><br><br>\r\n<b><font color=\"darkred\">Ã‰ possÃ­vel mudar o elemento desta arma.<br>\r\nÃ‰ possÃ­vel melhorar este item usando um Upgrade Gem.<br>\r\nEste item pode ser obtido em Quest In-Game.</font></b>', 'Classic Axe', 0, 0),
(31, 15, 12755, 1, 0, 0, 'item', '<li>Attack: 54<br>\r\n<li>Defense: 35<br>\r\n<li>Extradef: +2<br>\r\n<li>SkillClub: +2<br>\r\n<b>Only Elite Knights.</b><br><br>\r\n<b><font color=\"darkred\">Ã‰ possÃ­vel mudar o elemento desta arma.<br>\r\nÃ‰ possÃ­vel melhorar este item usando um Upgrade Gem.<br>\r\nEste item pode ser obtido em Quest In-Game.</font></b>', 'Classic Club', 0, 0),
(32, 15, 12831, 1, 0, 0, 'item', '<li>Range: 6<br>\r\n<li>Attack: +15<br>\r\n<li>HitChance: -5%<br>\r\n<b>Only Royal Paladins.</b><br><br>\r\n<b><font color=\"darkred\">Ã‰ possÃ­vel melhorar este item usando um Upgrade Gem.<br>\r\nEste item pode ser obtido em Quest In-Game.</font></b>', 'Classic Crossbow', 0, 0),
(33, 15, 12769, 1, 0, 0, 'item', '<li>Range: 7<br>\r\n<li>Attack: +9<br>\r\n<li>HitChance: +5%<br>\r\n<li>SkillDist: +2<br>\r\n<b>Only Royal Paladins.</b><br><br>\r\n<b><font color=\"darkred\">Ã‰ possÃ­vel melhorar este item usando um Upgrade Gem.<br>\r\nEste item pode ser obtido em Quest In-Game.</font></b>', 'Classic Bow', 0, 0),
(34, 15, 12773, 1, 0, 0, 'item', '<li>Attack: 150~190<br>\r\n<li>Element: Energy<br>\r\n<li>Range: 5<br>\r\n<b>Only Master Sorcerers and Elder Druids.</b><br><br>\r\n<b><font color=\"darkred\">Ã‰ possÃ­vel mudar o elemento desta wand.<br>\r\nÃ‰ possÃ­vel melhorar este item usando um Upgrade Gem.<br>\r\nEste item pode ser obtido em Quest In-Game.</font></b>', 'Staff Of Imperor', 0, 0),
(35, 20, 12890, 1, 0, 0, 'itemvip', '<li>Armor: 2<br>\r\n<li>Speed: +10<br>\r\n<li>AbsorbPercentAll: +2%<br>\r\n<li>SkillSword: +3<br>\r\n<li>SkillAxe: +3<br>\r\n<li>SkillClub: +3<br>\r\n<li>SkillDistance: +3<br>\r\n<li>SkillShield: +3<br>\r\n<b>Only Elite Knights and Royal Paladins.</b><br><br>\r\n<b><font color=\"darkred\">Item Infinito.<br>\r\nRecebe +3 Skills por 15 minutos ao dar Use.</font></b>', 'Claw Ring', 0, 0),
(36, 20, 12892, 1, 0, 0, 'itemvip', '<li>Armor: 2<br>\r\n<li>Speed: +10<br>\r\n<li>AbsorbPercentAll: +2%<br>\r\n<li>MagicPoints: +3<br>\r\n<li>SkillShield: +3<br>\r\n<b>Only Master Sorcerers and Elder Druids.</b><br><br>\r\n<b><font color=\"darkred\">Item Infinito.<br>\r\nRecebe +3 ML/Shield por 15 minutos ao dar Use.</font></b>', 'Serpent Ring', 0, 0),
(37, 5, 12901, 1, 0, 0, 'item', '<li>Armor: 2<br>\r\n<li>SkillShield: +3<br>\r\n<li>AbsorbPercentPhysical: +2%<br>\r\n<li>AbsorbPercentHoly: +2%<br>\r\n<li>AbsorbPercentDeath: +2%<br>\r\n<li>Regen: +1mp/1sec and +1hp/1sec.</br></br>\r\n<b><font color=\"darkred\">Este item pode ser obtido em Quest In-Game.</font></b>', 'Classic Amulet', 0, 0),
(38, 5, 12895, 1, 0, 0, 'item', '<li>Armor: 17<br>\r\n<li>AbsorbPercentPhysical: +3%<br>\r\n<li>AbsorbPercentIce: +3%<br>\r\n<li>AbsorbPercentFire: +3%<br>\r\n<li>AbsorbPercentManaDrain: +2%<br>\r\n<li>AbsorbPercentLifeDrain: +2%<br>\r\n<b>Only Elite Knights.</b></br></br>\r\n<b><font color=\"darkred\">Este item pode ser obtido em Quest In-Game.</font></b>', 'Classic Ek Armor', 0, 0),
(39, 5, 12896, 1, 0, 0, 'item', '<li>Armor: 10<br>\r\n<li>skillAxe: +2<br>\r\n<li>skillClub: +2<br>\r\n<li>skillSword: +2<br>\r\n<li>AbsorbPercentEarth: +2%<br>\r\n<b>Only Elite Knights.</b><br><br>\r\n<b><font color=\"darkred\">Este item pode ser obtido em Quest In-Game.</font></b>', 'Classic Ek Legs', 0, 0),
(40, 5, 12897, 1, 0, 0, 'item', '<li>Armor: 16<br>\r\n<li>AbsorbPercentHoly: +3%<br>\r\n<li>AbsorbPercentIce: +3%<br>\r\n<li>AbsorbPercentFire: +3%<br>\r\n<li>AbsorbPercentManaDrain: +2%<br>\r\n<li>AbsorbPercentLifeDrain: +2%<br>\r\n<b>Only Royal Paladins.</b><br><br>\r\n<b><font color=\"darkred\">Este item pode ser obtido em Quest In-Game.</font></b>', 'Classic Rp Armor', 0, 0),
(41, 5, 12898, 1, 0, 0, 'item', '<li>Armor: 9<br>\r\n<li>skillDist: +3<br>\r\n<li>AbsorbPercentDeath: +2%<br>\r\n<b>Only Royal Paladins.</b><br><br>\r\n<b><font color=\"darkred\">Este item pode ser obtido em Quest In-Game.</font></b>', 'Classic Rp Legs', 0, 0),
(42, 5, 12899, 1, 0, 0, 'item', '<li>Armor: 15<br>\r\n<li>AbsorbPercentPhysical: +2%<br>\r\n<li>AbsorbPercentHoly: +1%<br>\r\n<li>AbsorbPercentIce: +3%<br>\r\n<li>AbsorbPercentFire: +3%<br>\r\n<li>AbsorbPercentManaDrain: +2%<br>\r\n<li>AbsorbPercentLifeDrain: +2%<br>\r\n<b>Only Master Sorcerers and Elder Druids.</b><br><br>\r\n<b><font color=\"darkred\">Este item pode ser obtido em Quest In-Game.</font></b>', 'Classic Mage Armor', 0, 0),
(43, 5, 12900, 1, 0, 0, 'item', '<li>Armor: 8<br>\r\n<li>MagicPoints: +2<br>\r\n<li>AbsorbPercentDarth: +2%<br>\r\n<b>Only Master Sorcerers and Elder Druids.</b><br><br>\r\n<b><font color=\"darkred\">Este item pode ser obtido em Quest In-Game.</font></b>', 'Classic Mage Legs', 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_ticket`
--

CREATE TABLE `z_ticket` (
  `account` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `text` text NOT NULL,
  `id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `priority` int(11) NOT NULL,
  `reply` int(11) NOT NULL,
  `who` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `tag` int(11) NOT NULL,
  `registered` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Índices para tabela `account_viplist`
--
ALTER TABLE `account_viplist`
  ADD UNIQUE KEY `account_id_2` (`account_id`,`player_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `world_id` (`world_id`);

--
-- Índices para tabela `bans`
--
ALTER TABLE `bans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`,`value`),
  ADD KEY `active` (`active`);

--
-- Índices para tabela `dtt_players`
--
ALTER TABLE `dtt_players`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Índices para tabela `dtt_results`
--
ALTER TABLE `dtt_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Índices para tabela `environment_killers`
--
ALTER TABLE `environment_killers`
  ADD KEY `kill_id` (`kill_id`);

--
-- Índices para tabela `global_storage`
--
ALTER TABLE `global_storage`
  ADD UNIQUE KEY `key` (`key`,`world_id`);

--
-- Índices para tabela `guilds`
--
ALTER TABLE `guilds`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`,`world_id`);

--
-- Índices para tabela `guild_invites`
--
ALTER TABLE `guild_invites`
  ADD UNIQUE KEY `player_id` (`player_id`,`guild_id`),
  ADD KEY `guild_id` (`guild_id`);

--
-- Índices para tabela `guild_kills`
--
ALTER TABLE `guild_kills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guild_kills_ibfk_1` (`war_id`),
  ADD KEY `guild_kills_ibfk_2` (`death_id`),
  ADD KEY `guild_kills_ibfk_3` (`guild_id`);

--
-- Índices para tabela `guild_ranks`
--
ALTER TABLE `guild_ranks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guild_id` (`guild_id`);

--
-- Índices para tabela `guild_wars`
--
ALTER TABLE `guild_wars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`),
  ADD KEY `guild_id` (`guild_id`),
  ADD KEY `enemy_id` (`enemy_id`);

--
-- Índices para tabela `houses`
--
ALTER TABLE `houses`
  ADD UNIQUE KEY `id` (`id`,`world_id`);

--
-- Índices para tabela `house_auctions`
--
ALTER TABLE `house_auctions`
  ADD UNIQUE KEY `house_id` (`house_id`,`world_id`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices para tabela `house_data`
--
ALTER TABLE `house_data`
  ADD UNIQUE KEY `house_id` (`house_id`,`world_id`);

--
-- Índices para tabela `house_lists`
--
ALTER TABLE `house_lists`
  ADD UNIQUE KEY `house_id` (`house_id`,`world_id`,`listid`);

--
-- Índices para tabela `killers`
--
ALTER TABLE `killers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `death_id` (`death_id`);

--
-- Índices para tabela `login_history`
--
ALTER TABLE `login_history`
  ADD KEY `player_id` (`player_id`);

--
-- Índices para tabela `market_history`
--
ALTER TABLE `market_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`,`sale`);

--
-- Índices para tabela `market_offers`
--
ALTER TABLE `market_offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale` (`sale`,`itemtype`),
  ADD KEY `created` (`created`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices para tabela `pagseguro_transactions`
--
ALTER TABLE `pagseguro_transactions`
  ADD UNIQUE KEY `transaction_code` (`transaction_code`,`status`),
  ADD KEY `name` (`name`),
  ADD KEY `status` (`status`);

--
-- Índices para tabela `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`,`deleted`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `online` (`online`),
  ADD KEY `deleted` (`deleted`);

--
-- Índices para tabela `player_deaths`
--
ALTER TABLE `player_deaths`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date` (`date`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices para tabela `player_depotitems`
--
ALTER TABLE `player_depotitems`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`sid`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices para tabela `player_items`
--
ALTER TABLE `player_items`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`sid`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices para tabela `player_killers`
--
ALTER TABLE `player_killers`
  ADD KEY `kill_id` (`kill_id`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices para tabela `player_namelocks`
--
ALTER TABLE `player_namelocks`
  ADD KEY `player_id` (`player_id`);

--
-- Índices para tabela `player_skills`
--
ALTER TABLE `player_skills`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`skillid`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices para tabela `player_spells`
--
ALTER TABLE `player_spells`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`name`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices para tabela `player_statements`
--
ALTER TABLE `player_statements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `channel_id` (`channel_id`);

--
-- Índices para tabela `player_storage`
--
ALTER TABLE `player_storage`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`key`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices para tabela `player_viplist`
--
ALTER TABLE `player_viplist`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`vip_id`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `vip_id` (`vip_id`);

--
-- Índices para tabela `server_config`
--
ALTER TABLE `server_config`
  ADD UNIQUE KEY `config` (`config`);

--
-- Índices para tabela `server_motd`
--
ALTER TABLE `server_motd`
  ADD UNIQUE KEY `id` (`id`,`world_id`);

--
-- Índices para tabela `server_record`
--
ALTER TABLE `server_record`
  ADD UNIQUE KEY `record` (`record`,`world_id`,`timestamp`);

--
-- Índices para tabela `server_reports`
--
ALTER TABLE `server_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `world_id` (`world_id`),
  ADD KEY `reads` (`reads`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices para tabela `snowballwar`
--
ALTER TABLE `snowballwar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Índices para tabela `tiles`
--
ALTER TABLE `tiles`
  ADD UNIQUE KEY `id` (`id`,`world_id`),
  ADD KEY `x` (`x`,`y`,`z`),
  ADD KEY `house_id` (`house_id`,`world_id`);

--
-- Índices para tabela `tile_items`
--
ALTER TABLE `tile_items`
  ADD UNIQUE KEY `tile_id` (`tile_id`,`world_id`,`sid`),
  ADD KEY `sid` (`sid`);

--
-- Índices para tabela `tile_store`
--
ALTER TABLE `tile_store`
  ADD KEY `house_id` (`house_id`);

--
-- Índices para tabela `woe`
--
ALTER TABLE `woe`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Índices para tabela `z_featured_article`
--
ALTER TABLE `z_featured_article`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `z_forum`
--
ALTER TABLE `z_forum`
  ADD PRIMARY KEY (`id`),
  ADD KEY `section` (`section`);

--
-- Índices para tabela `z_network_box`
--
ALTER TABLE `z_network_box`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `z_news_tickers`
--
ALTER TABLE `z_news_tickers`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `z_ots_comunication`
--
ALTER TABLE `z_ots_comunication`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `z_ots_guildcomunication`
--
ALTER TABLE `z_ots_guildcomunication`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `z_polls`
--
ALTER TABLE `z_polls`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `z_shopguild_history_item`
--
ALTER TABLE `z_shopguild_history_item`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `z_shopguild_history_pacc`
--
ALTER TABLE `z_shopguild_history_pacc`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `z_shopguild_offer`
--
ALTER TABLE `z_shopguild_offer`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `z_shop_history_item`
--
ALTER TABLE `z_shop_history_item`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `z_shop_history_pacc`
--
ALTER TABLE `z_shop_history_pacc`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `z_shop_offer`
--
ALTER TABLE `z_shop_offer`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `z_ticket`
--
ALTER TABLE `z_ticket`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `bans`
--
ALTER TABLE `bans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `dtt_players`
--
ALTER TABLE `dtt_players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `dtt_results`
--
ALTER TABLE `dtt_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `guilds`
--
ALTER TABLE `guilds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `guild_kills`
--
ALTER TABLE `guild_kills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `guild_ranks`
--
ALTER TABLE `guild_ranks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `guild_wars`
--
ALTER TABLE `guild_wars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `killers`
--
ALTER TABLE `killers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `market_history`
--
ALTER TABLE `market_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `market_offers`
--
ALTER TABLE `market_offers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `player_deaths`
--
ALTER TABLE `player_deaths`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `player_statements`
--
ALTER TABLE `player_statements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `server_reports`
--
ALTER TABLE `server_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `snowballwar`
--
ALTER TABLE `snowballwar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `woe`
--
ALTER TABLE `woe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `z_featured_article`
--
ALTER TABLE `z_featured_article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `z_forum`
--
ALTER TABLE `z_forum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `z_network_box`
--
ALTER TABLE `z_network_box`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `z_news_tickers`
--
ALTER TABLE `z_news_tickers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `z_ots_comunication`
--
ALTER TABLE `z_ots_comunication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `z_ots_guildcomunication`
--
ALTER TABLE `z_ots_guildcomunication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `z_polls`
--
ALTER TABLE `z_polls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `z_shopguild_history_item`
--
ALTER TABLE `z_shopguild_history_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `z_shopguild_history_pacc`
--
ALTER TABLE `z_shopguild_history_pacc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `z_shopguild_offer`
--
ALTER TABLE `z_shopguild_offer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `z_shop_history_item`
--
ALTER TABLE `z_shop_history_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `z_shop_history_pacc`
--
ALTER TABLE `z_shop_history_pacc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `z_shop_offer`
--
ALTER TABLE `z_shop_offer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de tabela `z_ticket`
--
ALTER TABLE `z_ticket`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `account_viplist`
--
ALTER TABLE `account_viplist`
  ADD CONSTRAINT `account_viplist_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `account_viplist_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `environment_killers`
--
ALTER TABLE `environment_killers`
  ADD CONSTRAINT `environment_killers_ibfk_1` FOREIGN KEY (`kill_id`) REFERENCES `killers` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `guild_invites`
--
ALTER TABLE `guild_invites`
  ADD CONSTRAINT `guild_invites_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_invites_ibfk_2` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `guild_kills`
--
ALTER TABLE `guild_kills`
  ADD CONSTRAINT `guild_kills_ibfk_1` FOREIGN KEY (`war_id`) REFERENCES `guild_wars` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_kills_ibfk_2` FOREIGN KEY (`death_id`) REFERENCES `player_deaths` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_kills_ibfk_3` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `guild_ranks`
--
ALTER TABLE `guild_ranks`
  ADD CONSTRAINT `guild_ranks_ibfk_1` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `guild_wars`
--
ALTER TABLE `guild_wars`
  ADD CONSTRAINT `guild_wars_ibfk_1` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_wars_ibfk_2` FOREIGN KEY (`enemy_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `house_auctions`
--
ALTER TABLE `house_auctions`
  ADD CONSTRAINT `house_auctions_ibfk_1` FOREIGN KEY (`house_id`,`world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `house_auctions_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `house_data`
--
ALTER TABLE `house_data`
  ADD CONSTRAINT `house_data_ibfk_1` FOREIGN KEY (`house_id`,`world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `house_lists`
--
ALTER TABLE `house_lists`
  ADD CONSTRAINT `house_lists_ibfk_1` FOREIGN KEY (`house_id`,`world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `killers`
--
ALTER TABLE `killers`
  ADD CONSTRAINT `killers_ibfk_1` FOREIGN KEY (`death_id`) REFERENCES `player_deaths` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `market_history`
--
ALTER TABLE `market_history`
  ADD CONSTRAINT `market_history_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `market_offers`
--
ALTER TABLE `market_offers`
  ADD CONSTRAINT `market_offers_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_deaths`
--
ALTER TABLE `player_deaths`
  ADD CONSTRAINT `player_deaths_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_depotitems`
--
ALTER TABLE `player_depotitems`
  ADD CONSTRAINT `player_depotitems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_items`
--
ALTER TABLE `player_items`
  ADD CONSTRAINT `player_items_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_killers`
--
ALTER TABLE `player_killers`
  ADD CONSTRAINT `player_killers_ibfk_1` FOREIGN KEY (`kill_id`) REFERENCES `killers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `player_killers_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_namelocks`
--
ALTER TABLE `player_namelocks`
  ADD CONSTRAINT `player_namelocks_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_skills`
--
ALTER TABLE `player_skills`
  ADD CONSTRAINT `player_skills_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_spells`
--
ALTER TABLE `player_spells`
  ADD CONSTRAINT `player_spells_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_statements`
--
ALTER TABLE `player_statements`
  ADD CONSTRAINT `player_statements_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_storage`
--
ALTER TABLE `player_storage`
  ADD CONSTRAINT `player_storage_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_viplist`
--
ALTER TABLE `player_viplist`
  ADD CONSTRAINT `player_viplist_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `player_viplist_ibfk_2` FOREIGN KEY (`vip_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `server_reports`
--
ALTER TABLE `server_reports`
  ADD CONSTRAINT `server_reports_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `tiles`
--
ALTER TABLE `tiles`
  ADD CONSTRAINT `tiles_ibfk_1` FOREIGN KEY (`house_id`,`world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `tile_items`
--
ALTER TABLE `tile_items`
  ADD CONSTRAINT `tile_items_ibfk_1` FOREIGN KEY (`tile_id`) REFERENCES `tiles` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `tile_store`
--
ALTER TABLE `tile_store`
  ADD CONSTRAINT `tile_store_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
