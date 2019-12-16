-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 16-Dez-2019 às 01:34
-- Versão do servidor: 5.7.28-0ubuntu0.16.04.2
-- PHP Version: 7.0.33-0ubuntu0.16.04.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `otserv`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `password` char(40) NOT NULL,
  `secret` char(16) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '1',
  `premdays` int(11) NOT NULL DEFAULT '0',
  `coins` int(12) NOT NULL DEFAULT '0',
  `lastday` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL DEFAULT '',
  `creation` int(11) NOT NULL DEFAULT '0',
  `vote` int(11) NOT NULL,
  `key` varchar(20) NOT NULL DEFAULT '0',
  `email_new` varchar(255) NOT NULL DEFAULT '',
  `email_new_time` int(11) NOT NULL DEFAULT '0',
  `rlname` varchar(255) NOT NULL DEFAULT '',
  `location` varchar(255) NOT NULL DEFAULT '',
  `page_access` int(11) NOT NULL DEFAULT '0',
  `email_code` varchar(255) NOT NULL DEFAULT '',
  `next_email` int(11) NOT NULL DEFAULT '0',
  `premium_points` int(11) NOT NULL DEFAULT '0',
  `create_date` int(11) NOT NULL DEFAULT '0',
  `create_ip` int(11) NOT NULL DEFAULT '0',
  `last_post` int(11) NOT NULL DEFAULT '0',
  `flag` varchar(80) NOT NULL DEFAULT '',
  `vip_time` int(11) NOT NULL,
  `guild_points` int(11) NOT NULL DEFAULT '0',
  `guild_points_stats` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `accounts`
--

INSERT INTO `accounts` (`id`, `name`, `password`, `secret`, `type`, `premdays`, `coins`, `lastday`, `email`, `creation`, `vote`, `key`, `email_new`, `email_new_time`, `rlname`, `location`, `page_access`, `email_code`, `next_email`, `premium_points`, `create_date`, `create_ip`, `last_post`, `flag`, `vip_time`, `guild_points`, `guild_points_stats`) VALUES
(1, '1', '169d16cbbe04b2112fb051bf0c0ddaaf2410e592', NULL, 1, 0, 0, 0, '', 0, 0, '0', '', 0, '', '', 3, '', 0, 0, 0, 0, 1576466589, 'unknown', 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `account_bans`
--

CREATE TABLE `account_bans` (
  `account_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expires_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `account_ban_history`
--

CREATE TABLE `account_ban_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expired_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `account_viplist`
--

CREATE TABLE `account_viplist` (
  `account_id` int(11) NOT NULL COMMENT 'id of account whose viplist entry it is',
  `player_id` int(11) NOT NULL COMMENT 'id of target player of viplist entry',
  `description` varchar(128) NOT NULL DEFAULT '',
  `icon` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `notify` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `global_storage`
--

CREATE TABLE `global_storage` (
  `key` varchar(32) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guilds`
--

CREATE TABLE `guilds` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `ownerid` int(11) NOT NULL,
  `creationdata` int(11) NOT NULL,
  `motd` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `guild_logo` mediumblob,
  `create_ip` int(11) NOT NULL DEFAULT '0',
  `balance` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `last_execute_points` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Acionadores `guilds`
--
DELIMITER $$
CREATE TRIGGER `oncreate_guilds` AFTER INSERT ON `guilds` FOR EACH ROW BEGIN
    INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('the Leader', 3, NEW.`id`);
    INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('a Vice-Leader', 2, NEW.`id`);
    INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('a Member', 1, NEW.`id`);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guildwar_kills`
--

CREATE TABLE `guildwar_kills` (
  `id` int(11) NOT NULL,
  `killer` varchar(50) NOT NULL,
  `target` varchar(50) NOT NULL,
  `killerguild` int(11) NOT NULL DEFAULT '0',
  `targetguild` int(11) NOT NULL DEFAULT '0',
  `warid` int(11) NOT NULL DEFAULT '0',
  `time` bigint(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_invites`
--

CREATE TABLE `guild_invites` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `guild_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_membership`
--

CREATE TABLE `guild_membership` (
  `player_id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL,
  `rank_id` int(11) NOT NULL,
  `nick` varchar(15) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_ranks`
--

CREATE TABLE `guild_ranks` (
  `id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL COMMENT 'guild',
  `name` varchar(255) NOT NULL COMMENT 'rank name',
  `level` int(11) NOT NULL COMMENT 'rank level - leader, vice, member, maybe something else'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_wars`
--

CREATE TABLE `guild_wars` (
  `id` int(11) NOT NULL,
  `guild1` int(11) NOT NULL DEFAULT '0',
  `guild2` int(11) NOT NULL DEFAULT '0',
  `name1` varchar(255) NOT NULL,
  `name2` varchar(255) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `started` bigint(15) NOT NULL DEFAULT '0',
  `ended` bigint(15) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `houses`
--

CREATE TABLE `houses` (
  `id` int(11) NOT NULL,
  `owner` int(11) NOT NULL,
  `paid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `warnings` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `rent` int(11) NOT NULL DEFAULT '0',
  `town_id` int(11) NOT NULL DEFAULT '0',
  `bid` int(11) NOT NULL DEFAULT '0',
  `bid_end` int(11) NOT NULL DEFAULT '0',
  `last_bid` int(11) NOT NULL DEFAULT '0',
  `highest_bidder` int(11) NOT NULL DEFAULT '0',
  `size` int(11) NOT NULL DEFAULT '0',
  `beds` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `houses`
--

INSERT INTO `houses` (`id`, `owner`, `paid`, `warnings`, `name`, `rent`, `town_id`, `bid`, `bid_end`, `last_bid`, `highest_bidder`, `size`, `beds`) VALUES
(1, 0, 0, 0, 'Tower 1', 0, 1, 0, 0, 0, 0, 194, 0),
(2, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 20, 1),
(3, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 135, 2),
(4, 0, 1420399299, 0, '', 0, 0, 0, 0, 0, 0, 113, 2),
(5, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 135, 3),
(6, 0, 0, 0, 'GuildHouse Street', 0, 1, 0, 0, 0, 0, 80, 0),
(7, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 97, 2),
(8, 0, 0, 1, '', 0, 0, 0, 0, 0, 0, 56, 1),
(9, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 37, 1),
(10, 0, 0, 1, '', 0, 0, 0, 0, 0, 0, 71, 1),
(11, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 83, 2),
(12, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 83, 2),
(13, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 83, 2),
(14, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 251, 2),
(15, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 203, 5),
(16, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 804, 13),
(17, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 40, 1),
(18, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 40, 1),
(19, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 72, 1),
(20, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 114, 5),
(21, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 35, 2),
(22, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 45, 2),
(23, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 794, 10),
(24, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 95, 2),
(25, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 82, 2),
(26, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 99, 2),
(27, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 59, 2),
(28, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 78, 2),
(29, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 152, 2),
(30, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 439, 12),
(31, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 164, 4),
(32, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 188, 3),
(33, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 180, 2),
(34, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 54, 1),
(35, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 68, 1),
(36, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 188, 2),
(37, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 73, 1),
(38, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 83, 2),
(39, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 134, 2),
(40, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 128, 2),
(41, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 152, 2),
(42, 0, 0, 0, 'Heavy Depot House', 0, 1, 0, 0, 0, 0, 61, 0),
(43, 0, 0, 0, 'Heavy Depot House II', 0, 1, 1, 1505822794, 1, 1798, 96, 0),
(44, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 58, 2),
(45, 0, 0, 0, 'Paupers Palace, Flat 33', 765, 1, 0, 0, 0, 0, 31, 1),
(46, 0, 0, 0, 'Paupers Palace, Flat 34', 1675, 1, 0, 0, 0, 0, 51, 2),
(47, 0, 0, 0, 'Salvation Street 1 (Shop)', 6240, 1, 0, 0, 0, 0, 200, 4),
(48, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 87, 1),
(49, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 23, 1),
(50, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 80, 1),
(51, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 68, 1),
(52, 0, 0, 0, 'Steel Home', 13845, 1, 0, 0, 0, 0, 384, 13),
(53, 0, 0, 0, 'Iron Alley 1', 3450, 1, 0, 0, 0, 0, 111, 4),
(54, 0, 0, 0, 'Iron Alley 2', 3450, 1, 0, 0, 0, 0, 108, 4),
(55, 0, 0, 0, 'Swamp Watch', 11090, 1, 0, 0, 0, 0, 347, 12),
(56, 0, 0, 0, 'Port house I', 0, 1, 0, 0, 0, 0, 252, 0),
(57, 0, 0, 0, 'Salvation Street 2', 3790, 1, 0, 0, 0, 0, 116, 2),
(60, 0, 0, 0, 'Salvation Street 3', 3790, 1, 0, 0, 0, 0, 123, 2),
(61, 0, 0, 0, 'Silver Street 3', 1980, 1, 0, 0, 0, 0, 51, 1),
(62, 0, 0, 0, 'Golden Axe Guildhall', 10485, 1, 1, 1505504478, 1, 1726, 327, 10),
(63, 0, 0, 1, 'Silver Street 1', 2565, 1, 0, 0, 0, 0, 94, 1),
(64, 0, 0, 0, 'Silver Street 2', 1980, 1, 0, 0, 0, 0, 51, 1),
(66, 0, 0, 0, 'Silver Street 4', 3295, 1, 0, 0, 0, 0, 114, 2),
(67, 0, 0, 1, 'Mystic Lane 2', 2980, 1, 0, 0, 0, 0, 99, 2),
(69, 0, 0, 0, 'Mystic Lane 1', 2945, 1, 0, 0, 0, 0, 97, 3),
(70, 0, 0, 0, 'Loot Lane 1 (Shop)', 4565, 1, 0, 0, 0, 0, 158, 3),
(71, 0, 0, 1, 'Market Street 6', 5485, 1, 0, 0, 0, 0, 168, 5),
(72, 0, 0, 0, 'Market Street 7', 2305, 1, 0, 0, 0, 0, 89, 2),
(73, 0, 1420399299, 4, 'Market Street 5 (Shop)', 6375, 1, 0, 0, 0, 0, 198, 4),
(91, 0, 0, 0, 'Depot House III', 6578, 1, 0, 0, 0, 0, 59, 0),
(95, 1809, 0, 0, 'Temple House VIII', 0, 1, 0, 0, 0, 0, 50, 0),
(120, 0, 0, 0, 'Blue House I', 0, 4, 0, 0, 0, 0, 29, 0),
(121, 0, 0, 0, 'Blue House II', 0, 4, 0, 0, 0, 0, 33, 0),
(122, 0, 0, 0, 'Blue House III', 0, 4, 0, 0, 0, 0, 59, 0),
(123, 0, 0, 0, 'Blue House IV', 0, 4, 0, 0, 0, 0, 28, 0),
(124, 0, 0, 0, 'Blue House V', 0, 4, 0, 0, 0, 0, 41, 0),
(125, 0, 0, 0, 'Blue House VI', 0, 4, 0, 0, 0, 0, 31, 0),
(126, 0, 0, 0, 'Blue House VII', 0, 4, 0, 0, 0, 0, 19, 0),
(128, 0, 0, 0, 'Blue House XX', 0, 4, 0, 0, 0, 0, 32, 0),
(129, 0, 0, 0, 'Blood House I', 0, 1, 0, 0, 0, 0, 80, 0),
(133, 0, 0, 0, 'Blood House V', 0, 1, 0, 0, 0, 0, 48, 0),
(137, 0, 0, 0, 'Blood House XX', 0, 1, 0, 0, 0, 0, 30, 0),
(139, 0, 0, 0, 'Blood House XXI', 0, 1, 0, 0, 0, 0, 43, 0),
(140, 0, 0, 0, 'Blood House XXII', 0, 1, 0, 0, 0, 0, 42, 0),
(141, 0, 0, 0, 'Blood House XXIII', 0, 1, 0, 0, 0, 0, 34, 0),
(194, 0, 0, 0, 'Lucky Lane 1 (Shop)', 6960, 1, 0, 0, 0, 0, 211, 4),
(208, 0, 0, 0, 'Underwood 1', 1495, 5, 0, 0, 0, 0, 41, 2),
(209, 0, 0, 0, '15181', 0, 0, 0, 0, 0, 0, 47, 0),
(210, 0, 0, 0, '111', 0, 0, 0, 0, 0, 0, 41, 0),
(211, 0, 0, 0, '99898', 0, 0, 0, 0, 0, 0, 49, 0),
(212, 0, 0, 0, '4874181', 0, 0, 0, 0, 0, 0, 48, 0),
(213, 0, 0, 0, '12334', 0, 0, 0, 0, 0, 0, 40, 0),
(214, 0, 0, 0, '1581481', 0, 0, 0, 0, 0, 0, 39, 0),
(215, 0, 0, 0, '1818180', 0, 0, 0, 0, 0, 0, 28, 0),
(216, 0, 0, 0, 'adcaca', 0, 0, 0, 0, 0, 0, 128, 0),
(217, 0, 0, 0, '158191', 0, 0, 0, 0, 0, 0, 41, 0),
(218, 0, 0, 0, '2343', 0, 0, 0, 0, 0, 0, 40, 0),
(219, 0, 0, 0, '34232', 0, 0, 0, 0, 0, 0, 35, 0),
(220, 0, 0, 0, '32424', 0, 0, 0, 0, 0, 0, 42, 0),
(221, 0, 0, 0, '234234', 0, 0, 0, 0, 0, 0, 113, 0),
(222, 0, 0, 0, '3244242', 0, 0, 0, 0, 0, 0, 85, 0),
(223, 0, 0, 0, '2342422', 0, 0, 0, 0, 0, 0, 45, 0),
(224, 0, 0, 0, '2342342', 0, 0, 0, 0, 0, 0, 106, 0),
(225, 0, 0, 0, '23424221', 0, 0, 0, 0, 0, 0, 115, 0),
(226, 0, 0, 0, 'Great Willow 4b', 950, 5, 0, 0, 0, 0, 25, 2),
(227, 0, 0, 0, 'Great Willow 4c', 950, 5, 0, 0, 0, 0, 25, 2),
(228, 0, 0, 0, 'Great Willow 4d', 750, 5, 0, 0, 0, 0, 26, 1),
(229, 0, 0, 0, 'Great Willow 4a', 950, 5, 0, 0, 0, 0, 25, 2),
(230, 0, 0, 0, 'Underwood 7', 1460, 5, 0, 0, 0, 0, 39, 2),
(231, 0, 0, 0, 'Shadow Caves 3', 300, 5, 0, 0, 0, 0, 16, 1),
(232, 0, 0, 0, 'Shadow Caves 4', 300, 5, 0, 0, 0, 0, 18, 1),
(233, 0, 0, 0, 'Shadow Caves 2', 300, 5, 0, 0, 0, 0, 18, 1),
(234, 0, 0, 0, 'Shadow Caves 1', 300, 5, 0, 0, 0, 0, 16, 1),
(235, 0, 0, 0, 'Shadow Caves 17', 300, 5, 0, 0, 0, 0, 16, 1),
(236, 0, 0, 0, 'Shadow Caves 18', 300, 5, 0, 0, 0, 0, 17, 1),
(237, 0, 0, 0, 'Shadow Caves 15', 300, 5, 0, 0, 0, 0, 16, 1),
(238, 0, 0, 0, 'Shadow Caves 16', 300, 5, 0, 0, 0, 0, 17, 1),
(239, 0, 0, 0, 'Shadow Caves 13', 300, 5, 0, 0, 0, 0, 16, 1),
(240, 0, 0, 0, 'Shadow Caves 14', 300, 5, 0, 0, 0, 0, 19, 1),
(241, 0, 0, 0, 'Shadow Caves 11', 300, 5, 0, 0, 0, 0, 16, 1),
(242, 0, 0, 0, 'Shadow Caves 12', 300, 5, 0, 0, 0, 0, 18, 1),
(243, 0, 0, 0, 'Shadow Caves 27', 300, 5, 0, 0, 0, 0, 14, 1),
(244, 0, 0, 0, 'Shadow Caves 28', 300, 5, 0, 0, 0, 0, 17, 1),
(245, 0, 0, 0, 'Shadow Caves 25', 300, 5, 0, 0, 0, 0, 16, 1),
(246, 0, 0, 0, 'Shadow Caves 26', 300, 5, 0, 0, 0, 0, 17, 1),
(247, 0, 0, 0, 'Shadow Caves 23', 300, 5, 0, 0, 0, 0, 16, 1),
(248, 0, 0, 0, 'Shadow Caves 24', 300, 5, 0, 0, 0, 0, 19, 1),
(249, 0, 0, 0, 'Shadow Caves 21', 300, 5, 0, 0, 0, 0, 16, 1),
(250, 0, 0, 0, 'Shadow Caves 22', 300, 5, 0, 0, 0, 0, 17, 1),
(251, 0, 0, 0, 'Underwood 9', 585, 5, 0, 0, 0, 0, 17, 1),
(252, 0, 0, 0, 'Treetop 13', 1400, 5, 0, 0, 0, 0, 33, 2),
(254, 0, 0, 0, 'Underwood 8', 865, 5, 0, 0, 0, 0, 25, 2),
(255, 0, 0, 0, 'Mangrove 4', 950, 5, 0, 0, 0, 0, 25, 2),
(256, 0, 0, 0, 'Coastwood 10', 1630, 5, 0, 0, 0, 0, 36, 3),
(257, 0, 0, 0, 'Mangrove 1', 1750, 5, 0, 0, 0, 0, 42, 3),
(258, 0, 0, 0, 'Coastwood 1', 980, 5, 0, 0, 0, 0, 24, 2),
(259, 0, 0, 0, 'Coastwood 2', 980, 5, 0, 0, 0, 0, 24, 2),
(260, 0, 0, 0, 'Mangrove 2', 1350, 5, 0, 0, 0, 0, 33, 2),
(262, 0, 0, 0, 'Mangrove 3', 1150, 5, 0, 0, 0, 0, 29, 2),
(263, 0, 0, 0, 'Coastwood 9', 935, 5, 0, 0, 0, 0, 22, 1),
(264, 0, 0, 0, 'Coastwood 8', 1255, 5, 0, 0, 0, 0, 31, 2),
(265, 0, 0, 0, 'Coastwood 6 (Shop)', 1595, 5, 0, 0, 0, 0, 44, 1),
(266, 0, 0, 0, 'Coastwood 7', 660, 5, 0, 0, 0, 0, 19, 1),
(267, 0, 0, 0, 'Coastwood 5', 1530, 5, 0, 0, 0, 0, 35, 2),
(268, 0, 0, 0, 'Coastwood 4', 1145, 5, 0, 0, 0, 0, 30, 2),
(269, 0, 0, 0, 'Coastwood 3', 1310, 5, 0, 0, 0, 0, 34, 2),
(270, 0, 0, 0, 'Treetop 11', 900, 5, 0, 0, 0, 0, 26, 2),
(271, 0, 0, 0, 'Treetop 5 (Shop)', 1350, 5, 0, 0, 0, 0, 40, 1),
(272, 0, 0, 0, 'Treetop 7', 800, 5, 0, 0, 0, 0, 24, 1),
(273, 0, 0, 0, 'Treetop 6', 450, 5, 0, 0, 0, 0, 15, 1),
(274, 0, 0, 0, 'Treetop 8', 800, 5, 0, 0, 0, 0, 23, 1),
(275, 0, 0, 0, 'Treetop 9', 1150, 5, 0, 0, 0, 0, 30, 2),
(276, 0, 0, 0, 'Treetop 10', 1150, 5, 0, 0, 0, 0, 34, 2),
(277, 0, 0, 0, 'Treetop 4 (Shop)', 1250, 5, 0, 0, 0, 0, 40, 1),
(278, 0, 0, 0, 'Treetop 3 (Shop)', 1250, 5, 0, 0, 0, 0, 38, 1),
(279, 0, 0, 0, 'Treetop 2', 650, 5, 0, 0, 0, 0, 21, 1),
(280, 0, 0, 0, 'Treetop 1', 650, 5, 0, 0, 0, 0, 19, 1),
(281, 0, 0, 0, 'Treetop 12 (Shop)', 1350, 5, 0, 0, 0, 0, 40, 1),
(469, 0, 0, 0, 'Darashia 2, Flat 07', 1000, 10, 0, 0, 0, 0, 48, 1),
(470, 0, 0, 0, 'Darashia 2, Flat 01', 1000, 10, 0, 0, 0, 0, 48, 1),
(471, 0, 0, 0, 'Darashia 2, Flat 02', 1000, 10, 0, 0, 0, 0, 42, 1),
(472, 0, 0, 0, 'Darashia 2, Flat 06', 520, 10, 0, 0, 0, 0, 24, 1),
(473, 0, 0, 0, 'Darashia 2, Flat 05', 1260, 10, 0, 0, 0, 0, 48, 2),
(474, 0, 0, 0, 'Darashia 2, Flat 04', 520, 10, 0, 0, 0, 0, 24, 1),
(475, 0, 0, 0, 'Darashia 2, Flat 03', 1160, 10, 0, 0, 0, 0, 42, 1),
(476, 0, 0, 0, 'Darashia 2, Flat 13', 1160, 10, 0, 0, 0, 0, 42, 1),
(477, 0, 0, 0, 'Darashia 2, Flat 12', 520, 10, 0, 0, 0, 0, 24, 1),
(478, 0, 0, 0, 'Darashia 2, Flat 11', 1000, 10, 0, 0, 0, 0, 42, 1),
(479, 0, 0, 0, 'Darashia 2, Flat 14', 520, 10, 0, 0, 0, 0, 24, 1),
(480, 0, 0, 0, 'Darashia 2, Flat 15', 1260, 10, 0, 0, 0, 0, 47, 2),
(481, 0, 0, 0, 'Darashia 2, Flat 16', 680, 10, 0, 0, 0, 0, 30, 1),
(482, 0, 0, 0, 'Darashia 2, Flat 17', 1000, 10, 0, 0, 0, 0, 48, 1),
(483, 0, 0, 0, 'Darashia 2, Flat 18', 680, 10, 0, 0, 0, 0, 30, 1),
(484, 0, 0, 0, 'Darashia 1, Flat 05', 1100, 10, 0, 0, 0, 0, 48, 2),
(485, 0, 0, 0, 'Darashia 1, Flat 01', 1100, 10, 0, 0, 0, 0, 48, 2),
(486, 0, 0, 0, 'Darashia 1, Flat 04', 1000, 10, 0, 0, 0, 0, 42, 1),
(487, 0, 0, 0, 'Darashia 1, Flat 03', 2660, 10, 0, 0, 0, 0, 96, 4),
(488, 0, 0, 0, 'Darashia 1, Flat 02', 1000, 10, 0, 0, 0, 0, 41, 1),
(490, 0, 0, 0, 'Darashia 1, Flat 12', 1780, 10, 0, 0, 0, 0, 66, 2),
(491, 0, 0, 0, 'Darashia 1, Flat 11', 1100, 10, 0, 0, 0, 0, 41, 2),
(492, 0, 0, 0, 'Darashia 1, Flat 13', 1780, 10, 0, 0, 0, 0, 72, 2),
(493, 0, 0, 0, 'Darashia 1, Flat 14', 2760, 10, 0, 0, 0, 0, 108, 5),
(494, 0, 0, 0, 'Darashia 4, Flat 01', 1000, 10, 0, 0, 0, 0, 48, 1),
(495, 0, 0, 0, 'Darashia 4, Flat 05', 1100, 10, 0, 0, 0, 0, 48, 2),
(496, 0, 0, 0, 'Darashia 4, Flat 04', 1780, 10, 0, 0, 0, 0, 72, 2),
(497, 0, 0, 0, 'Darashia 4, Flat 03', 1000, 10, 0, 0, 0, 0, 42, 1),
(498, 0, 0, 0, 'Darashia 4, Flat 02', 1780, 10, 0, 0, 0, 0, 66, 2),
(499, 0, 0, 0, 'Darashia 4, Flat 13', 1780, 10, 0, 0, 0, 0, 78, 2),
(500, 0, 0, 0, 'Darashia 4, Flat 14', 1780, 10, 0, 0, 0, 0, 72, 2),
(501, 0, 0, 0, 'Darashia 4, Flat 11', 1000, 10, 0, 0, 0, 0, 41, 1),
(502, 0, 0, 0, 'Darashia 4, Flat 12', 2560, 10, 0, 0, 0, 0, 96, 3),
(503, 0, 0, 1, 'Darashia 7, Flat 05', 1225, 10, 0, 0, 0, 0, 40, 2),
(504, 0, 0, 0, 'Darashia 7, Flat 01', 1125, 10, 0, 0, 0, 0, 40, 1),
(505, 0, 0, 0, 'Darashia 7, Flat 02', 1125, 10, 0, 0, 0, 0, 41, 1),
(506, 0, 0, 0, 'Darashia 7, Flat 03', 2955, 10, 0, 0, 0, 0, 108, 4),
(507, 0, 0, 0, 'Darashia 7, Flat 04', 1125, 10, 0, 0, 0, 0, 42, 1),
(508, 0, 0, 0, 'Darashia 7, Flat 14', 2955, 10, 0, 0, 0, 0, 108, 4),
(509, 0, 0, 0, 'Darashia 7, Flat 13', 1125, 10, 0, 0, 0, 0, 42, 1),
(510, 0, 0, 0, 'Darashia 7, Flat 11', 1125, 10, 0, 0, 0, 0, 41, 1),
(511, 0, 0, 0, 'Darashia 7, Flat 12', 2955, 10, 0, 0, 0, 0, 95, 4),
(512, 0, 0, 1, 'Darashia 5, Flat 01', 1000, 10, 0, 0, 0, 0, 38, 1),
(513, 0, 0, 0, 'Darashia 5, Flat 05', 1000, 10, 0, 0, 0, 0, 48, 1),
(514, 0, 0, 0, 'Darashia 5, Flat 02', 1620, 10, 0, 0, 0, 0, 57, 2),
(515, 0, 0, 0, 'Darashia 5, Flat 03', 1000, 10, 0, 0, 0, 0, 41, 1),
(516, 0, 0, 0, 'Darashia 5, Flat 04', 1620, 10, 0, 0, 0, 0, 66, 2),
(517, 0, 0, 0, 'Darashia 5, Flat 11', 1780, 10, 0, 0, 0, 0, 66, 2),
(518, 0, 0, 0, 'Darashia 5, Flat 12', 1620, 10, 0, 0, 0, 0, 65, 2),
(519, 0, 0, 0, 'Darashia 5, Flat 13', 1780, 10, 0, 0, 0, 0, 78, 2),
(520, 0, 0, 0, 'Darashia 5, Flat 14', 1620, 10, 0, 0, 0, 0, 66, 2),
(521, 0, 0, 0, 'Darashia 6a', 3115, 10, 0, 0, 0, 0, 117, 2),
(522, 0, 0, 0, 'Darashia 6b', 3430, 10, 0, 0, 0, 0, 139, 2),
(523, 0, 0, 0, 'Darashia, Villa', 5385, 10, 0, 0, 0, 0, 233, 4),
(525, 0, 0, 0, 'Darashia, Western Guildhall', 10435, 10, 0, 0, 0, 0, 376, 14),
(526, 0, 0, 0, 'Darashia 3, Flat 01', 1100, 10, 0, 0, 0, 0, 40, 2),
(527, 0, 0, 0, 'Darashia 3, Flat 05', 1000, 10, 0, 0, 0, 0, 40, 1),
(529, 0, 0, 0, 'Darashia 3, Flat 02', 1620, 10, 0, 0, 0, 0, 65, 2),
(530, 0, 0, 0, 'Darashia 3, Flat 03', 1100, 10, 0, 0, 0, 0, 42, 2),
(531, 0, 0, 0, 'Darashia 3, Flat 04', 1620, 10, 0, 0, 0, 0, 72, 2),
(532, 0, 0, 0, 'Darashia 3, Flat 13', 1100, 10, 0, 0, 0, 0, 42, 2),
(533, 0, 0, 0, 'Darashia 3, Flat 14', 2400, 10, 0, 0, 0, 0, 102, 3),
(534, 0, 0, 0, 'Darashia 3, Flat 11', 1000, 10, 0, 0, 0, 0, 41, 1),
(535, 0, 0, 0, 'Darashia 3, Flat 12', 2600, 10, 0, 0, 0, 0, 90, 5),
(541, 0, 0, 0, 'Darashia 8, Flat 11', 1990, 10, 0, 0, 0, 0, 66, 2),
(542, 0, 0, 0, 'Darashia 8, Flat 12', 1810, 10, 0, 0, 0, 0, 65, 2),
(544, 0, 0, 0, 'Darashia 8, Flat 14', 1810, 10, 0, 0, 0, 0, 66, 2),
(545, 0, 0, 0, 'Darashia 8, Flat 13', 1990, 10, 0, 0, 0, 0, 78, 2),
(569, 0, 0, 0, 'Svargrond I', 0, 5, 0, 0, 0, 0, 107, 4),
(570, 0, 0, 0, 'Svargrond Guild House II', 0, 5, 0, 0, 0, 0, 63, 4),
(571, 0, 0, 0, 'Svargrond III', 0, 5, 0, 0, 0, 0, 125, 3),
(572, 0, 0, 0, 'Svargrond IV', 0, 5, 0, 0, 0, 0, 98, 2),
(573, 0, 0, 0, 'Svargrond V', 0, 5, 0, 0, 0, 0, 92, 2),
(574, 0, 0, 0, 'Svargrond Guild House VI', 0, 5, 0, 0, 0, 0, 206, 20),
(575, 0, 0, 0, 'Svargrond VII', 0, 5, 0, 0, 0, 0, 55, 2),
(576, 0, 0, 0, 'Svargrond VIII', 0, 5, 0, 0, 0, 0, 69, 0),
(577, 0, 0, 0, 'Svargrond IX', 0, 5, 0, 0, 0, 0, 96, 2),
(578, 0, 0, 0, 'Svargrond X', 0, 5, 0, 0, 0, 0, 40, 1),
(579, 0, 0, 0, 'Svargrond XI', 0, 5, 0, 0, 0, 0, 94, 3),
(580, 0, 0, 0, 'Svargrond XII', 0, 5, 0, 0, 0, 0, 42, 1),
(581, 0, 0, 0, 'Svargrond XIII', 0, 5, 0, 0, 0, 0, 39, 1),
(582, 0, 0, 0, 'Oskahl I e', 840, 9, 0, 0, 0, 0, 33, 1),
(583, 0, 0, 0, 'Oskahl I a', 1580, 9, 0, 0, 0, 0, 52, 2),
(584, 0, 0, 0, 'Svargrond XXI', 0, 5, 0, 0, 0, 0, 105, 3),
(585, 0, 0, 0, 'Svargrond XXII', 0, 5, 0, 0, 0, 0, 44, 2),
(586, 0, 0, 0, 'Svargrond XXIII', 0, 5, 0, 0, 0, 0, 123, 3),
(587, 0, 0, 0, 'Svargrond XXIV', 0, 5, 0, 0, 0, 0, 57, 2),
(588, 0, 0, 0, 'Svargrond Guild House XXV', 0, 5, 0, 0, 0, 0, 120, 5),
(589, 0, 0, 0, 'Svargrond XXVI', 0, 5, 0, 0, 0, 0, 61, 3),
(590, 0, 0, 0, 'Svargrond XXVII', 0, 5, 0, 0, 0, 0, 167, 4),
(591, 0, 0, 0, 'Svargrond XXVIII', 0, 5, 0, 0, 0, 0, 57, 1),
(592, 0, 0, 0, 'Svargrond XXIX', 0, 5, 0, 0, 0, 0, 64, 1),
(593, 0, 0, 0, 'Svargrond XXX', 0, 5, 0, 0, 0, 0, 64, 3),
(594, 0, 0, 0, 'Svargrond XXXI', 0, 5, 0, 0, 0, 0, 23, 2),
(595, 0, 0, 0, 'Svargrond XXXII', 0, 5, 0, 0, 0, 0, 23, 1),
(596, 0, 0, 0, 'Svargrond XXXIII', 0, 5, 0, 0, 0, 0, 24, 1),
(597, 0, 0, 0, 'Svargrond XXXIV', 0, 5, 0, 0, 0, 0, 24, 2),
(598, 0, 0, 0, 'Svargrond XXXV', 0, 5, 0, 0, 0, 0, 23, 2),
(599, 0, 0, 0, 'Svargrond XXXVI', 0, 5, 0, 0, 0, 0, 19, 1),
(600, 0, 0, 0, 'Svargrond XXXVII', 0, 5, 0, 0, 0, 0, 20, 1),
(601, 0, 0, 0, 'Svargrond XXXVIII', 0, 5, 0, 0, 0, 0, 19, 2),
(602, 0, 0, 0, 'Svargrond XXXIX', 0, 5, 0, 0, 0, 0, 19, 1),
(603, 0, 0, 0, 'Svargrond L', 0, 5, 0, 0, 0, 0, 19, 1),
(604, 0, 0, 0, 'Svargrond House I', 0, 5, 0, 0, 0, 0, 88, 2),
(605, 0, 0, 0, 'Svargrond House II', 0, 5, 0, 0, 0, 0, 52, 2),
(606, 0, 0, 0, 'Svargrond House III', 0, 5, 0, 0, 0, 0, 119, 2),
(607, 0, 0, 0, 'Svargrond House IV', 0, 5, 0, 0, 0, 0, 32, 1),
(608, 0, 0, 0, 'Svargrond House V', 0, 5, 0, 0, 0, 0, 43, 1),
(609, 0, 0, 0, 'Svargrond House VI', 0, 5, 0, 0, 0, 0, 33, 2),
(610, 0, 0, 0, 'Svargrond House VII', 0, 5, 0, 0, 0, 0, 54, 2),
(611, 0, 0, 0, 'Svargrond Super Guild House I', 0, 5, 0, 0, 0, 0, 363, 13),
(612, 0, 0, 0, 'Svargrond House IX', 0, 5, 0, 0, 0, 0, 35, 2),
(613, 0, 0, 0, 'Svargrond House X', 0, 5, 0, 0, 0, 0, 35, 2),
(614, 0, 0, 0, 'Svargrond House XI', 0, 5, 0, 0, 0, 0, 33, 2),
(615, 0, 0, 0, 'Svargrond House XII', 0, 5, 0, 0, 0, 0, 16, 1),
(616, 0, 0, 0, 'Svargrond House XIII', 0, 5, 0, 0, 0, 0, 20, 1),
(617, 0, 0, 0, 'Svargrond House XIV', 0, 5, 0, 0, 0, 0, 28, 2),
(618, 0, 0, 0, 'Othehothep II c', 840, 9, 0, 0, 0, 0, 30, 1),
(619, 0, 0, 0, 'Demona House I', 0, 1, 0, 0, 0, 0, 25, 0),
(620, 0, 0, 0, 'Othehothep II a', 400, 9, 0, 0, 0, 0, 18, 1),
(621, 0, 0, 0, 'Mothrem I', 1140, 9, 0, 0, 0, 0, 38, 2),
(622, 0, 0, 0, 'Arakmehn I', 1320, 9, 0, 0, 0, 0, 41, 3),
(623, 0, 0, 0, 'Jukita I', 0, 1, 0, 0, 0, 0, 45, 0),
(624, 0, 0, 0, 'Othehothep III c', 940, 9, 0, 0, 0, 0, 30, 2),
(625, 0, 0, 0, 'Othehothep III e', 840, 9, 0, 0, 0, 0, 32, 1),
(626, 0, 0, 0, 'Depot House XIX', 0, 1, 0, 0, 0, 0, 248, 0),
(627, 0, 0, 0, 'Othehothep III b', 1340, 9, 0, 0, 0, 0, 49, 2),
(628, 0, 0, 0, 'Othehothep III a', 280, 9, 0, 0, 0, 0, 14, 1),
(629, 0, 0, 0, 'Unklath I d', 1680, 9, 0, 0, 0, 0, 49, 3),
(630, 0, 0, 0, 'Unklath I e', 1580, 9, 0, 0, 0, 0, 51, 2),
(631, 0, 0, 0, 'Unklath I g', 1480, 9, 0, 0, 0, 0, 51, 1),
(632, 0, 0, 0, 'Unklath I f', 1580, 9, 0, 0, 0, 0, 51, 2),
(633, 0, 0, 0, 'Unklath I c', 1460, 9, 0, 0, 0, 0, 50, 2),
(634, 0, 0, 0, 'Unklath I b', 1460, 9, 0, 0, 0, 0, 50, 2),
(635, 0, 0, 0, 'Unklath I a', 1140, 9, 0, 0, 0, 0, 38, 2),
(636, 0, 0, 0, 'Arakmehn II', 1040, 9, 0, 0, 0, 0, 38, 1),
(637, 0, 0, 0, 'Arakmehn III', 1140, 9, 0, 0, 0, 0, 38, 2),
(638, 0, 0, 0, 'Unklath II b', 680, 9, 0, 0, 0, 0, 25, 1),
(639, 0, 0, 0, 'Unklath II c', 680, 9, 0, 0, 0, 0, 27, 1),
(640, 0, 0, 0, 'Unklath II d', 1580, 9, 0, 0, 0, 0, 52, 2),
(641, 0, 0, 0, 'Unklath II a', 1040, 9, 0, 0, 0, 0, 36, 1),
(642, 0, 0, 0, 'Arakmehn IV', 1220, 9, 0, 0, 0, 0, 41, 2),
(643, 0, 0, 0, 'Rathal I b', 680, 9, 0, 0, 0, 0, 25, 1),
(644, 0, 0, 0, 'Rathal I c', 680, 9, 0, 0, 0, 0, 27, 1),
(645, 0, 0, 0, 'Rathal I e', 780, 9, 0, 0, 0, 0, 27, 2),
(646, 0, 0, 0, 'Rathal I d', 780, 9, 0, 0, 0, 0, 27, 2),
(647, 0, 0, 0, 'Rathal I a', 1140, 9, 0, 0, 0, 0, 36, 2),
(648, 0, 0, 0, 'Rathal II b', 680, 9, 0, 0, 0, 0, 25, 1),
(649, 0, 0, 0, 'Rathal II c', 680, 9, 0, 0, 0, 0, 27, 1),
(650, 0, 0, 0, 'Rathal II d', 1460, 9, 0, 0, 0, 0, 52, 2),
(651, 0, 0, 0, 'Rathal II a', 1040, 9, 0, 0, 0, 0, 38, 1),
(653, 0, 0, 0, 'Esuph II a', 280, 9, 0, 0, 0, 0, 14, 1),
(654, 0, 0, 0, 'Uthemath II', 4460, 9, 0, 0, 0, 0, 138, 8),
(655, 0, 0, 0, 'Uthemath I e', 940, 9, 0, 0, 0, 0, 32, 2),
(656, 0, 0, 0, 'Uthemath I d', 840, 9, 0, 0, 0, 0, 30, 1),
(657, 0, 0, 0, 'Uthemath I f', 2440, 9, 0, 0, 0, 0, 86, 3),
(658, 0, 0, 0, 'Uthemath I b', 800, 9, 0, 0, 0, 0, 32, 1),
(659, 0, 0, 0, 'Uthemath I c', 900, 9, 0, 0, 0, 0, 34, 2),
(660, 0, 0, 0, 'Uthemath I a', 400, 9, 0, 0, 0, 0, 18, 1),
(661, 0, 0, 0, 'Botham I c', 1700, 9, 0, 0, 0, 0, 49, 2),
(662, 0, 0, 0, 'Botham I e', 1650, 9, 0, 0, 0, 0, 44, 2),
(663, 0, 0, 0, 'Botham I d', 3050, 9, 0, 0, 0, 0, 80, 3),
(664, 0, 0, 0, 'Botham I b', 3000, 9, 0, 0, 0, 0, 83, 3),
(666, 0, 0, 0, 'Horakhal', 9420, 9, 0, 0, 0, 0, 277, 14),
(667, 0, 0, 0, 'Esuph III b', 1340, 9, 0, 0, 0, 0, 49, 2),
(668, 0, 0, 0, 'Esuph III a', 280, 9, 0, 0, 0, 0, 14, 1),
(669, 0, 0, 0, 'Esuph IV b', 400, 9, 0, 0, 0, 0, 16, 1),
(670, 0, 0, 0, 'Esuph IV c', 400, 9, 0, 0, 0, 0, 18, 1),
(671, 0, 0, 0, 'Esuph IV d', 800, 9, 0, 0, 0, 0, 34, 1),
(672, 0, 0, 0, 'Esuph IV a', 400, 9, 0, 0, 0, 0, 16, 1),
(673, 0, 0, 0, 'Botham II e', 1650, 9, 0, 0, 0, 0, 42, 2),
(674, 0, 0, 0, 'Botham II g', 1400, 9, 0, 0, 0, 0, 38, 2),
(675, 0, 0, 0, 'Botham II f', 1650, 9, 0, 0, 0, 0, 44, 2),
(676, 0, 0, 0, 'Botham II d', 1950, 9, 0, 0, 0, 0, 49, 2),
(677, 0, 0, 0, 'Botham II c', 1250, 9, 0, 0, 0, 0, 38, 2),
(678, 0, 0, 0, 'Botham II b', 1600, 9, 0, 0, 0, 0, 47, 2),
(679, 0, 0, 0, 'Botham II a', 850, 9, 0, 0, 0, 0, 25, 1),
(680, 0, 0, 0, 'Botham III g', 1650, 9, 0, 0, 0, 0, 42, 2),
(681, 0, 0, 0, 'Botham III f', 2350, 9, 0, 0, 0, 0, 56, 3),
(682, 0, 0, 0, 'Botham III h', 3750, 9, 0, 0, 0, 0, 98, 3),
(683, 0, 0, 0, 'Botham III d', 850, 9, 0, 0, 0, 0, 27, 1),
(684, 0, 0, 0, 'Botham III e', 850, 9, 0, 0, 0, 0, 27, 1),
(685, 0, 0, 0, 'Botham III b', 950, 9, 0, 0, 0, 0, 25, 2),
(686, 0, 0, 0, 'Botham III c', 850, 9, 0, 0, 0, 0, 27, 1),
(687, 0, 0, 0, 'Botham III a', 1400, 9, 0, 0, 0, 0, 36, 2),
(688, 0, 0, 0, 'Botham IV i', 1800, 9, 0, 0, 0, 0, 51, 3),
(689, 0, 0, 0, 'Botham IV h', 1850, 9, 0, 0, 0, 0, 49, 1),
(690, 0, 0, 0, 'Botham IV f', 1700, 9, 0, 0, 0, 0, 49, 2),
(691, 0, 0, 0, 'Botham IV g', 1650, 9, 0, 0, 0, 0, 49, 2),
(692, 0, 0, 0, 'Botham IV c', 850, 9, 0, 0, 0, 0, 27, 1),
(693, 0, 0, 0, 'Botham IV e', 850, 9, 0, 0, 0, 0, 27, 1),
(694, 0, 0, 0, 'Botham IV d', 850, 9, 0, 0, 0, 0, 27, 1),
(695, 0, 0, 0, 'Botham IV b', 850, 9, 0, 0, 0, 0, 25, 1),
(696, 0, 0, 0, 'Botham IV a', 1400, 9, 0, 0, 0, 0, 36, 2),
(697, 0, 0, 0, 'Ramen Tah', 7650, 9, 0, 0, 0, 0, 182, 16),
(698, 0, 0, 0, 'Banana Bay 1', 450, 8, 0, 0, 0, 0, 25, 1),
(699, 0, 0, 0, 'Banana Bay 2', 765, 8, 0, 0, 0, 0, 36, 1),
(700, 0, 0, 0, 'Banana Bay 3', 450, 8, 0, 0, 0, 0, 25, 1),
(701, 0, 0, 0, 'Banana Bay 4', 450, 8, 0, 0, 0, 0, 25, 1),
(702, 0, 0, 0, 'Shark Manor', 8780, 8, 0, 0, 0, 0, 286, 15),
(703, 0, 0, 0, 'Coconut Quay 1', 1765, 8, 0, 0, 0, 0, 64, 2),
(704, 0, 0, 0, 'Coconut Quay 2', 1045, 8, 0, 0, 0, 0, 42, 2),
(705, 0, 0, 0, 'Coconut Quay 3', 2145, 8, 0, 0, 0, 0, 70, 4),
(706, 0, 0, 0, 'Coconut Quay 4', 2135, 8, 0, 0, 0, 0, 72, 3),
(707, 0, 0, 0, 'Crocodile Bridge 3', 1270, 8, 0, 0, 0, 0, 49, 2),
(708, 0, 0, 0, 'Crocodile Bridge 2', 865, 8, 0, 0, 0, 0, 36, 2),
(709, 0, 0, 0, 'Crocodile Bridge 1', 1045, 8, 0, 0, 0, 0, 42, 2),
(710, 0, 0, 0, 'Bamboo Garden 1', 1640, 8, 0, 0, 0, 0, 63, 3),
(711, 0, 0, 0, 'Crocodile Bridge 4', 4755, 8, 0, 0, 0, 0, 176, 4),
(712, 0, 0, 0, 'Crocodile Bridge 5', 3970, 8, 0, 0, 0, 0, 157, 2),
(713, 0, 0, 0, 'Woodway 1', 765, 8, 0, 0, 0, 0, 36, 1),
(714, 0, 0, 0, 'Woodway 2', 585, 8, 0, 0, 0, 0, 30, 1),
(715, 0, 0, 0, 'Woodway 3', 1540, 8, 0, 0, 0, 0, 65, 2),
(716, 0, 0, 0, 'Woodway 4', 405, 8, 0, 0, 0, 0, 24, 1),
(717, 0, 0, 0, 'Flamingo Flats 5', 1845, 8, 0, 0, 0, 0, 84, 1),
(718, 0, 0, 0, 'Bamboo Fortress', 21970, 8, 0, 0, 0, 0, 848, 20),
(719, 0, 0, 0, 'Bamboo Garden 3', 1540, 8, 0, 0, 0, 0, 63, 2),
(720, 0, 0, 0, 'Bamboo Garden 2', 1045, 8, 0, 0, 0, 0, 42, 2),
(721, 0, 0, 0, 'Flamingo Flats 4', 865, 8, 0, 0, 0, 0, 36, 2),
(722, 0, 0, 0, 'Flamingo Flats 2', 1045, 8, 0, 0, 0, 0, 42, 2),
(723, 0, 0, 0, 'Flamingo Flats 3', 685, 8, 0, 0, 0, 0, 30, 2),
(724, 0, 0, 0, 'Flamingo Flats 1', 685, 8, 0, 0, 0, 0, 30, 2),
(725, 0, 0, 0, 'Jungle Edge 4', 865, 8, 0, 0, 0, 0, 36, 2),
(726, 0, 0, 0, 'Jungle Edge 5', 865, 8, 0, 0, 0, 0, 36, 2),
(727, 0, 0, 0, 'Jungle Edge 6', 450, 8, 0, 0, 0, 0, 25, 1),
(728, 0, 0, 0, 'Jungle Edge 2', 3170, 8, 0, 0, 0, 0, 128, 3),
(729, 0, 0, 0, 'Jungle Edge 3', 865, 8, 0, 0, 0, 0, 36, 2),
(730, 0, 0, 0, 'Jungle Edge 1', 2495, 8, 0, 0, 0, 0, 98, 3),
(731, 0, 0, 0, 'Haggler\'s Hangout 6', 6450, 8, 0, 0, 0, 0, 208, 4),
(732, 0, 0, 0, 'Haggler\'s Hangout 5 (Shop)', 1550, 8, 0, 0, 0, 0, 56, 1),
(733, 0, 0, 0, 'Haggler\'s Hangout 4a (Shop)', 1850, 8, 0, 0, 0, 0, 56, 1),
(734, 0, 0, 0, 'Haggler\'s Hangout 4b (Shop)', 1550, 8, 0, 0, 0, 0, 56, 1),
(735, 0, 0, 0, 'Haggler\'s Hangout 3', 7550, 8, 0, 0, 0, 0, 256, 4),
(736, 0, 0, 0, 'Haggler\'s Hangout 2', 1300, 8, 0, 0, 0, 0, 49, 1),
(737, 0, 0, 0, 'Haggler\'s Hangout 1', 1400, 8, 0, 0, 0, 0, 49, 2),
(738, 0, 1420399299, 0, 'River Homes 1', 3485, 8, 0, 0, 0, 0, 128, 3),
(739, 0, 0, 0, 'River Homes 2a', 1270, 8, 0, 0, 0, 0, 42, 2),
(740, 0, 0, 0, 'River Homes 2b', 1595, 8, 0, 0, 0, 0, 56, 3),
(741, 0, 0, 0, 'River Homes 3', 5055, 8, 0, 0, 0, 0, 176, 7),
(742, 0, 0, 0, 'The Treehouse', 24120, 8, 0, 0, 0, 0, 897, 23),
(743, 0, 0, 0, 'Corner Shop (Shop)', 2215, 12, 0, 0, 0, 0, 96, 2),
(744, 0, 0, 0, 'Tusk Flats 1', 765, 12, 0, 0, 0, 0, 40, 2),
(745, 0, 0, 0, 'Tusk Flats 2', 835, 12, 0, 0, 0, 0, 42, 2),
(746, 0, 0, 0, 'Tusk Flats 3', 660, 12, 0, 0, 0, 0, 34, 2),
(747, 0, 0, 0, 'Tusk Flats 4', 315, 12, 0, 0, 0, 0, 24, 1),
(748, 0, 0, 0, 'Tusk Flats 6', 660, 12, 0, 0, 0, 0, 35, 2),
(749, 0, 0, 0, 'Tusk Flats 5', 455, 12, 0, 0, 0, 0, 30, 1),
(750, 0, 0, 0, 'Shady Rocks 5', 2890, 12, 0, 0, 0, 0, 110, 2),
(751, 0, 0, 0, 'Shady Rocks 4 (Shop)', 2710, 12, 0, 0, 0, 0, 110, 2),
(752, 0, 0, 0, 'Shady Rocks 3', 4115, 12, 0, 0, 0, 0, 154, 3),
(753, 0, 0, 0, 'Shady Rocks 2', 2010, 12, 0, 0, 0, 0, 77, 4),
(754, 0, 0, 0, 'Shady Rocks 1', 3630, 12, 0, 0, 0, 0, 132, 4),
(755, 0, 0, 0, 'Crystal Glance', 19625, 12, 0, 0, 0, 0, 569, 24),
(756, 0, 0, 0, 'Arena Walk 3', 3550, 12, 0, 0, 0, 0, 126, 3),
(757, 0, 0, 0, 'Arena Walk 2', 1400, 12, 0, 0, 0, 0, 54, 2),
(758, 0, 0, 0, 'Arena Walk 1', 3250, 12, 0, 0, 0, 0, 128, 3),
(759, 0, 0, 0, 'Bears Paw 2', 2305, 12, 0, 0, 0, 0, 100, 2),
(760, 0, 0, 0, 'Bears Paw 1', 1810, 12, 0, 0, 0, 0, 72, 2),
(761, 0, 0, 0, 'Spirit Homes 5', 1450, 12, 0, 0, 0, 0, 56, 2),
(762, 0, 0, 0, 'Glacier Side 3', 1950, 12, 0, 0, 0, 0, 75, 2),
(763, 0, 0, 0, 'Glacier Side 2', 4750, 12, 0, 0, 0, 0, 154, 3),
(764, 0, 0, 0, 'Glacier Side 1', 1600, 12, 0, 0, 0, 0, 65, 2),
(765, 0, 0, 0, 'Spirit Homes 1', 1700, 12, 0, 0, 0, 0, 56, 2),
(766, 0, 0, 0, 'Spirit Homes 2', 1900, 12, 0, 0, 0, 0, 72, 2),
(767, 0, 0, 0, 'Spirit Homes 3', 4250, 12, 0, 0, 0, 0, 128, 3),
(768, 0, 0, 0, 'Spirit Homes 4', 1100, 12, 0, 0, 0, 0, 49, 1),
(770, 0, 0, 0, 'Glacier Side 4', 2050, 12, 0, 0, 0, 0, 75, 1),
(771, 0, 0, 1, 'Shelf Site', 4800, 12, 0, 0, 0, 0, 160, 3),
(772, 0, 0, 0, 'Raven Corner 1', 855, 12, 0, 0, 0, 0, 45, 1),
(773, 0, 0, 0, 'Raven Corner 2', 1685, 12, 0, 0, 0, 0, 60, 3),
(774, 0, 0, 0, 'Raven Corner 3', 855, 12, 0, 0, 0, 0, 45, 1),
(775, 0, 0, 0, 'Bears Paw 3', 2090, 12, 0, 0, 0, 0, 82, 3),
(776, 0, 0, 0, 'Bears Paw 4', 5205, 12, 0, 0, 0, 0, 189, 4),
(778, 0, 0, 0, 'Bears Paw 5', 2045, 12, 0, 0, 0, 0, 81, 3),
(779, 0, 0, 0, 'Trout Plaza 5 (Shop)', 3880, 12, 0, 0, 0, 0, 144, 2),
(780, 0, 0, 0, 'Pilchard Bin 1', 685, 12, 0, 0, 0, 0, 30, 2),
(781, 0, 0, 0, 'Pilchard Bin 2', 685, 12, 0, 0, 0, 0, 24, 2),
(782, 0, 0, 0, 'Pilchard Bin 3', 585, 12, 0, 0, 0, 0, 24, 1),
(783, 0, 0, 0, 'Pilchard Bin 4', 585, 12, 0, 0, 0, 0, 24, 1),
(784, 0, 0, 0, 'Pilchard Bin 5', 685, 12, 0, 0, 0, 0, 24, 2),
(785, 0, 0, 0, 'Pilchard Bin 10', 450, 12, 0, 0, 0, 0, 20, 1),
(786, 0, 0, 0, 'Pilchard Bin 9', 450, 12, 0, 0, 0, 0, 20, 1),
(787, 0, 0, 0, 'Pilchard Bin 8', 450, 12, 0, 0, 0, 0, 20, 2),
(789, 0, 0, 0, 'Pilchard Bin 7', 450, 12, 0, 0, 0, 0, 20, 1),
(790, 0, 0, 0, 'Pilchard Bin 6', 450, 12, 0, 0, 0, 0, 25, 1),
(791, 0, 0, 0, 'Trout Plaza 1', 2395, 12, 0, 0, 0, 0, 112, 2),
(792, 0, 0, 0, 'Trout Plaza 2', 1540, 12, 0, 0, 0, 0, 64, 2),
(793, 0, 0, 0, 'Trout Plaza 3', 900, 12, 0, 0, 0, 0, 36, 1),
(794, 0, 0, 0, 'Trout Plaza 4', 900, 12, 0, 0, 0, 0, 45, 1),
(795, 0, 0, 0, 'Skiffs End 1', 1540, 12, 0, 0, 0, 0, 70, 2),
(796, 0, 0, 0, 'Skiffs End 2', 910, 12, 0, 0, 0, 0, 42, 2),
(797, 0, 0, 0, 'Furrier Quarter 3', 1010, 12, 0, 0, 0, 0, 54, 2),
(798, 0, 1420399299, 0, 'Mammoth Belly', 22810, 12, 0, 0, 0, 0, 634, 30),
(799, 0, 0, 0, 'Furrier Quarter 2', 1045, 12, 0, 0, 0, 0, 56, 2),
(800, 0, 0, 0, 'Furrier Quarter 1', 1635, 12, 0, 0, 0, 0, 84, 3),
(801, 0, 0, 0, 'Fimbul Shelf 3', 1255, 12, 0, 0, 0, 0, 66, 2),
(802, 0, 0, 0, 'Fimbul Shelf 4', 1045, 12, 0, 0, 0, 0, 56, 2),
(803, 0, 0, 0, 'Fimbul Shelf 2', 1045, 12, 0, 0, 0, 0, 56, 2),
(804, 0, 0, 0, 'Fimbul Shelf 1', 975, 12, 0, 0, 0, 0, 48, 2),
(805, 0, 0, 0, 'Frost Manor', 26370, 12, 0, 0, 0, 0, 806, 24),
(807, 0, 0, 0, 'Lower Barracks 12', 300, 3, 0, 0, 0, 0, 16, 1),
(809, 0, 0, 0, 'Lower Barracks 10', 300, 3, 0, 0, 0, 0, 19, 1),
(811, 0, 0, 0, 'Lower Barracks 8', 300, 3, 0, 0, 0, 0, 16, 1),
(813, 0, 0, 0, 'Lower Barracks 6', 300, 3, 0, 0, 0, 0, 16, 1),
(815, 0, 0, 0, 'Lower Barracks 4', 300, 3, 0, 0, 0, 0, 19, 1),
(817, 0, 0, 0, 'Lower Barracks 2', 300, 3, 0, 0, 0, 0, 16, 1),
(818, 0, 0, 0, 'Lower Barracks 24', 300, 3, 0, 0, 0, 0, 20, 1),
(819, 0, 0, 0, 'Lower Barracks 23', 300, 3, 0, 0, 0, 0, 16, 1),
(820, 0, 0, 0, 'Lower Barracks 22', 300, 3, 0, 0, 0, 0, 20, 1),
(821, 0, 0, 0, 'Lower Barracks 21', 300, 3, 0, 0, 0, 0, 16, 1),
(822, 0, 0, 0, 'Lower Barracks 20', 300, 3, 0, 0, 0, 0, 20, 1),
(823, 0, 0, 0, 'Lower Barracks 19', 300, 3, 0, 0, 0, 0, 16, 1),
(824, 0, 0, 0, 'Lower Barracks 18', 300, 3, 0, 0, 0, 0, 20, 1),
(825, 0, 0, 0, 'Lower Barracks 17', 300, 3, 0, 0, 0, 0, 16, 1),
(826, 0, 0, 0, 'Lower Barracks 16', 300, 3, 0, 0, 0, 0, 20, 1),
(828, 0, 0, 0, 'Lower Barracks 15', 300, 3, 0, 0, 0, 0, 16, 1),
(829, 0, 0, 0, 'Lower Barracks 14', 300, 3, 0, 0, 0, 0, 20, 1),
(830, 0, 0, 0, 'Lower Barracks 13', 300, 3, 0, 0, 0, 0, 13, 0),
(831, 0, 0, 0, 'Marble Guildhall', 16810, 3, 0, 0, 0, 0, 540, 17),
(832, 0, 0, 0, 'Iron Guildhall', 15560, 3, 0, 0, 0, 0, 463, 17),
(833, 0, 0, 0, 'The Market 1 (Shop)', 650, 3, 0, 0, 0, 0, 25, 1),
(834, 0, 0, 0, 'The Market 3 (Shop)', 1450, 3, 0, 0, 0, 0, 40, 1),
(835, 0, 0, 0, 'The Market 2 (Shop)', 1100, 3, 0, 0, 0, 0, 40, 1),
(836, 0, 0, 0, 'The Market 4 (Shop)', 1800, 3, 0, 0, 0, 0, 48, 1),
(837, 0, 0, 0, 'Granite Guildhall', 17845, 3, 0, 0, 0, 0, 456, 17),
(838, 0, 0, 0, 'Upper Barracks 1', 210, 3, 0, 0, 0, 0, 2, 0),
(850, 0, 0, 0, 'Upper Barracks 13', 580, 3, 0, 0, 0, 0, 15, 2),
(851, 0, 0, 0, 'Nobility Quarter 4', 765, 3, 0, 0, 0, 0, 16, 1),
(852, 0, 0, 0, 'Nobility Quarter 5', 765, 3, 0, 0, 0, 0, 16, 1),
(853, 0, 0, 0, 'Nobility Quarter 7', 765, 3, 0, 0, 0, 0, 16, 1),
(854, 0, 0, 0, 'Nobility Quarter 6', 765, 3, 0, 0, 0, 0, 16, 1),
(855, 0, 0, 0, 'Nobility Quarter 8', 765, 3, 0, 0, 0, 0, 16, 1),
(856, 0, 0, 0, 'Nobility Quarter 9', 765, 3, 0, 0, 0, 0, 16, 1),
(857, 0, 0, 0, 'Nobility Quarter 2', 1865, 3, 0, 0, 0, 0, 36, 3),
(858, 0, 0, 0, 'Nobility Quarter 3', 1865, 3, 0, 0, 0, 0, 36, 3),
(859, 0, 0, 0, 'Nobility Quarter 1', 1865, 3, 0, 0, 0, 0, 36, 3),
(863, 0, 0, 0, 'The Farms 6, Fishing Hut', 1255, 3, 0, 0, 0, 0, 32, 2),
(864, 0, 0, 0, 'The Farms 5', 1530, 3, 0, 0, 0, 0, 28, 2),
(866, 0, 0, 0, 'The Farms 3', 1530, 3, 0, 0, 0, 0, 25, 2),
(867, 0, 0, 0, 'The Farms 2', 1530, 3, 0, 0, 0, 0, 25, 2),
(868, 0, 0, 0, 'The Farms 1', 2510, 3, 0, 0, 0, 0, 41, 3),
(886, 0, 0, 0, 'Outlaw Castle', 8000, 3, 0, 0, 0, 0, 250, 9),
(889, 0, 0, 0, 'Tunnel Gardens 3', 2000, 3, 0, 0, 0, 0, 12, 0),
(890, 0, 0, 0, 'Tunnel Gardens 4', 2000, 3, 0, 0, 0, 0, 4, 0),
(892, 0, 0, 0, 'Tunnel Gardens 5', 1360, 3, 0, 0, 0, 0, 35, 2),
(893, 0, 0, 0, 'Tunnel Gardens 6', 1360, 3, 0, 0, 0, 0, 38, 2),
(894, 0, 0, 0, 'Tunnel Gardens 8', 1360, 3, 0, 0, 0, 0, 35, 2),
(895, 0, 0, 0, 'Tunnel Gardens 7', 1360, 3, 0, 0, 0, 0, 35, 2),
(900, 0, 0, 0, 'Wolftower', 21550, 3, 0, 0, 0, 0, 638, 23),
(901, 0, 0, 0, 'Paupers Palace, Flat 11', 315, 1, 0, 0, 0, 0, 12, 1),
(905, 0, 0, 0, 'Botham I a', 950, 9, 0, 0, 0, 0, 36, 1),
(906, 0, 0, 0, 'Esuph I', 680, 9, 0, 0, 0, 0, 39, 1),
(907, 0, 0, 0, 'Esuph II b', 1380, 9, 0, 0, 0, 0, 51, 2),
(1363, 0, 0, 0, 'Unnamed House #1363', 0, 1, 0, 0, 0, 0, 3, 0),
(1372, 0, 0, 0, 'Titanic House I', 0, 1, 0, 0, 0, 0, 8, 0),
(1373, 0, 0, 0, 'Unnamed House #1373', 0, 6, 0, 0, 0, 0, 34, 0),
(1374, 0, 0, 0, 'Unnamed House #1374', 0, 6, 0, 0, 0, 0, 72, 0),
(1376, 0, 0, 0, 'Unnamed House #1376', 0, 6, 0, 0, 0, 0, 37, 0),
(1377, 0, 0, 0, 'Unnamed House #1377', 0, 6, 0, 0, 0, 0, 44, 0),
(1378, 0, 0, 0, 'Unnamed House #1378', 0, 6, 0, 0, 0, 0, 106, 0),
(1379, 0, 0, 0, 'Unnamed House #1379', 0, 6, 0, 0, 0, 0, 63, 0),
(1380, 0, 0, 0, 'Unnamed House #1380', 0, 6, 0, 0, 0, 0, 78, 0),
(1381, 0, 0, 0, 'Unnamed House #1381', 0, 6, 0, 0, 0, 0, 38, 0),
(1382, 0, 0, 0, 'Unnamed House #1382', 0, 6, 0, 0, 0, 0, 29, 0),
(1383, 0, 0, 0, 'Unnamed House #1383', 0, 6, 0, 0, 0, 0, 31, 0),
(1384, 0, 0, 0, 'Unnamed House #1384', 0, 6, 0, 0, 0, 0, 34, 0),
(1385, 0, 0, 0, 'Unnamed House #1385', 0, 6, 0, 0, 0, 0, 54, 0),
(1386, 0, 0, 0, 'Unnamed House #1386', 0, 6, 0, 0, 0, 0, 45, 0),
(1387, 0, 0, 0, 'Unnamed House #1387', 0, 6, 0, 0, 0, 0, 23, 0),
(1388, 0, 0, 0, 'Unnamed House #1388', 0, 6, 0, 0, 0, 0, 37, 0),
(1389, 0, 0, 0, 'Unnamed House #1389', 0, 6, 0, 0, 0, 0, 79, 0),
(1391, 0, 0, 0, 'Unnamed House #1391', 0, 5, 0, 0, 0, 0, 105, 4),
(1392, 0, 0, 0, 'Tiquanda I', 0, 3, 0, 0, 0, 0, 48, 0),
(1393, 0, 0, 0, 'Tiquanda II', 0, 3, 0, 0, 0, 0, 56, 0),
(1394, 0, 0, 0, 'Tiquanda III', 0, 3, 0, 0, 0, 0, 56, 0),
(1395, 0, 0, 0, 'Tiquanda IV', 0, 3, 0, 0, 0, 0, 48, 0),
(1396, 0, 0, 0, 'Tiquanda V', 0, 3, 0, 0, 0, 0, 56, 0),
(1397, 0, 0, 0, 'Tiquanda VI', 0, 3, 0, 0, 0, 0, 64, 0),
(1398, 0, 0, 0, 'Tiquanda VII', 0, 3, 0, 0, 0, 0, 72, 0),
(1399, 0, 0, 0, 'Tiquanda VIII', 0, 3, 0, 0, 0, 0, 48, 0),
(1400, 0, 0, 0, 'Tiquanda IX', 0, 3, 0, 0, 0, 0, 56, 0),
(1403, 0, 0, 0, 'Tiquanda XII', 0, 3, 0, 0, 0, 0, 59, 0),
(1404, 0, 0, 0, 'Blood House XXXXX', 0, 1, 0, 0, 0, 0, 56, 0),
(1405, 0, 0, 0, 'Blood House XV8', 0, 1, 0, 0, 0, 0, 44, 0),
(1406, 0, 0, 0, 'Blood House Pl', 0, 1, 0, 0, 0, 0, 42, 0),
(1407, 0, 0, 0, 'Blood House Xv4', 0, 1, 0, 0, 0, 0, 77, 0),
(1408, 0, 0, 0, 'Blood House Legas.', 0, 1, 0, 0, 0, 0, 66, 0),
(1666, 0, 0, 0, '12', 0, 0, 0, 0, 0, 0, 82, 0),
(1674, 0, 0, 0, '091', 0, 0, 0, 0, 0, 0, 35, 0),
(1699, 0, 0, 0, '19198', 0, 0, 0, 0, 0, 0, 95, 0),
(1700, 0, 0, 0, '185194', 0, 0, 0, 0, 0, 0, 131, 0),
(1701, 0, 0, 0, '1561851', 0, 0, 0, 0, 0, 0, 107, 0),
(1711, 1834, 0, 0, 'Blood House XX9', 0, 0, 0, 0, 0, 0, 50, 0),
(1712, 0, 0, 0, 'Blood House Pits', 0, 0, 0, 0, 0, 0, 56, 0),
(1713, 1805, 0, 0, 'Blood City XX2', 0, 0, 0, 0, 0, 0, 50, 0),
(1714, 0, 0, 0, 'Blood House XX99', 0, 0, 0, 0, 0, 0, 56, 0),
(1715, 0, 0, 0, 'Blood House 106', 0, 1, 0, 0, 0, 0, 105, 0),
(1716, 0, 0, 0, 'Blood 156', 0, 1, 0, 0, 0, 0, 147, 0),
(1717, 0, 0, 0, 'Blood 262', 0, 1, 0, 0, 0, 0, 72, 0),
(1718, 0, 0, 0, 'Blood 451', 0, 1, 0, 0, 0, 0, 103, 0),
(1719, 0, 0, 0, 'Blood 51', 0, 1, 0, 0, 0, 0, 63, 0),
(1720, 0, 0, 0, 'Blood 571', 0, 1, 0, 0, 0, 0, 48, 0),
(1721, 0, 0, 0, 'Blood 47', 0, 1, 0, 0, 0, 0, 53, 0),
(1722, 0, 0, 0, 'Blood 781', 0, 1, 0, 0, 0, 0, 132, 0),
(1723, 0, 0, 0, 'Blood 74', 0, 1, 0, 0, 0, 0, 56, 0),
(1724, 0, 0, 0, 'Blood 71', 0, 1, 0, 0, 0, 0, 40, 0),
(1725, 0, 0, 0, 'Blood Nossa', 0, 1, 0, 0, 0, 0, 144, 0),
(1726, 0, 0, 0, 'Blood Kits', 0, 1, 0, 0, 0, 0, 52, 0),
(1727, 0, 0, 0, 'Blood House XX7', 0, 1, 0, 0, 0, 0, 55, 0),
(1728, 0, 0, 0, 'Blood XD', 0, 1, 0, 0, 0, 0, 57, 0),
(1729, 0, 0, 0, 'Blood X89', 0, 1, 0, 0, 0, 0, 114, 0),
(1730, 0, 0, 0, 'I', 0, 7, 0, 0, 0, 0, 36, 0),
(1731, 0, 0, 0, 'II', 0, 7, 0, 0, 0, 0, 42, 0),
(1732, 0, 0, 0, 'III', 0, 7, 0, 0, 0, 0, 360, 0),
(1733, 0, 0, 0, 'IV', 0, 7, 0, 0, 0, 0, 152, 0),
(1734, 0, 0, 0, 'V', 0, 7, 0, 0, 0, 0, 90, 0),
(1735, 0, 0, 0, 'VI', 0, 7, 0, 0, 0, 0, 78, 0),
(1736, 0, 0, 0, 'VII', 0, 7, 0, 0, 0, 0, 195, 0),
(1737, 0, 0, 0, 'VIII', 0, 7, 0, 0, 0, 0, 135, 0),
(1738, 0, 0, 0, 'IX', 0, 7, 0, 0, 0, 0, 64, 0),
(1739, 0, 0, 0, 'X', 0, 7, 0, 0, 0, 0, 49, 0),
(1740, 0, 0, 0, 'Depot House TOP', 0, 1, 0, 0, 0, 0, 102, 0),
(1741, 0, 0, 0, 'Maconha I', 0, 3, 0, 0, 0, 0, 80, 0),
(1742, 0, 0, 0, 'Aeww', 0, 1, 0, 0, 0, 0, 90, 0),
(1743, 0, 0, 0, 'Unnamed House #1743', 0, 1, 0, 0, 0, 0, 100, 0),
(1744, 0, 0, 0, 'Unnamed House #1744', 0, 1, 0, 0, 0, 0, 49, 0),
(1745, 0, 0, 0, 'Unnamed House #1745', 0, 1, 0, 0, 0, 0, 100, 0),
(1746, 0, 0, 0, 'Unnamed House #1746', 0, 1, 0, 0, 0, 0, 42, 0),
(1747, 0, 0, 0, 'Village Mall', 0, 1, 0, 0, 0, 0, 110, 0),
(1883, 0, 0, 0, 'Aureate Court 1', 5240, 13, 0, 0, 0, 0, 276, 3),
(1884, 0, 0, 0, 'Aureate Court 2', 4860, 13, 0, 0, 0, 0, 198, 2),
(1885, 0, 0, 0, 'Aureate Court 3', 4300, 13, 0, 0, 0, 0, 226, 2),
(1886, 0, 0, 0, 'Aureate Court 4', 3980, 13, 0, 0, 0, 0, 208, 4),
(1887, 0, 0, 4, 'Fortune Wing 1', 10180, 13, 0, 0, 0, 0, 420, 4),
(1888, 0, 0, 0, 'Fortune Wing 2', 5580, 13, 0, 0, 0, 0, 260, 2),
(1889, 0, 0, 0, 'Fortune Wing 3', 5740, 13, 0, 0, 0, 0, 258, 2),
(1890, 0, 0, 0, 'Fortune Wing 4', 5740, 13, 0, 0, 0, 0, 305, 4),
(1891, 0, 0, 0, 'Luminous Arc 1', 6460, 13, 0, 0, 0, 0, 344, 2),
(1892, 0, 0, 0, 'Luminous Arc 2', 6460, 13, 0, 0, 0, 0, 301, 4),
(1893, 0, 0, 0, 'Luminous Arc 3', 5400, 13, 0, 0, 0, 0, 249, 3),
(1894, 0, 1418112028, 4, 'Luminous Arc 4', 8000, 13, 0, 0, 0, 0, 343, 5),
(1895, 0, 0, 0, 'Radiant Plaza 1', 5620, 13, 0, 0, 0, 0, 276, 4),
(1896, 0, 0, 7, 'Radiant Plaza 2', 3820, 13, 0, 0, 0, 0, 179, 2),
(1897, 0, 1420399299, 0, 'Radiant Plaza 3', 4900, 13, 0, 0, 0, 0, 256, 2),
(1898, 0, 0, 2, 'Radiant Plaza 4', 7460, 13, 0, 0, 0, 0, 367, 3),
(1899, 0, 0, 3, 'Sun Palace', 23120, 13, 0, 0, 0, 0, 974, 27),
(1900, 0, 0, 2, 'Halls of Serenity', 23360, 13, 0, 0, 0, 0, 1090, 33),
(1901, 0, 0, 5, 'Cascade Towers', 19500, 13, 0, 0, 0, 0, 810, 33),
(1902, 0, 0, 0, 'Sorcerer\'s Avenue 5', 2695, 2, 0, 0, 0, 0, 96, 1),
(1903, 0, 0, 0, 'Sorcerer\'s Avenue 1a', 1255, 2, 0, 0, 0, 0, 42, 2),
(1904, 0, 0, 0, 'Sorcerer\'s Avenue 1b', 1035, 2, 0, 0, 0, 0, 36, 2),
(1905, 0, 0, 0, 'Sorcerer\'s Avenue 1c', 1255, 2, 0, 0, 0, 0, 36, 2),
(1906, 0, 1420399299, 0, 'Beach Home Apartments, Flat 06', 1145, 2, 0, 0, 0, 0, 40, 2),
(1907, 0, 0, 0, 'Beach Home Apartments, Flat 01', 715, 2, 0, 0, 0, 0, 30, 1),
(1908, 0, 0, 0, 'Beach Home Apartments, Flat 02', 715, 2, 0, 0, 0, 0, 25, 1),
(1909, 0, 0, 0, 'Beach Home Apartments, Flat 03', 715, 2, 0, 0, 0, 0, 30, 1),
(1910, 0, 0, 0, 'Beach Home Apartments, Flat 04', 715, 2, 0, 0, 0, 0, 24, 1),
(1911, 0, 0, 0, 'Beach Home Apartments, Flat 05', 715, 2, 0, 0, 0, 0, 24, 1),
(1912, 0, 1420399299, 0, 'Beach Home Apartments, Flat 16', 1145, 2, 0, 0, 0, 0, 40, 2),
(1913, 0, 0, 0, 'Beach Home Apartments, Flat 11', 715, 2, 0, 0, 0, 0, 30, 1),
(1914, 0, 0, 0, 'Beach Home Apartments, Flat 12', 880, 2, 0, 0, 0, 0, 30, 1),
(1915, 0, 0, 0, 'Beach Home Apartments, Flat 13', 880, 2, 0, 0, 0, 0, 29, 1),
(1916, 0, 0, 0, 'Beach Home Apartments, Flat 14', 385, 2, 0, 0, 0, 0, 15, 1),
(1917, 0, 0, 0, 'Beach Home Apartments, Flat 15', 385, 2, 0, 0, 0, 0, 15, 1),
(1918, 0, 0, 1, 'Thais Clanhall', 8420, 2, 0, 0, 0, 0, 370, 10),
(1919, 0, 0, 0, 'Harbour Street 4', 935, 2, 0, 0, 0, 0, 30, 1),
(1920, 0, 0, 0, 'Thais Hostel', 6980, 2, 0, 0, 0, 0, 171, 24),
(1921, 0, 1420399299, 1, 'Lower Swamp Lane 1', 4740, 2, 0, 0, 0, 0, 166, 4),
(1923, 0, 0, 0, 'Pfygga Pyramid 1', 0, 3, 0, 0, 0, 0, 12, 1),
(1924, 0, 0, 0, 'Pfygga Pyramid 2', 0, 3, 0, 0, 0, 0, 22, 1),
(1925, 0, 0, 0, 'Pfygga Pyramid 3', 0, 3, 0, 0, 0, 0, 23, 2),
(1926, 0, 1420399299, 2, 'Pfygga Pyramid 4', 0, 3, 0, 0, 0, 0, 30, 1),
(1927, 0, 0, 0, 'Pfygga Pyramid 5', 0, 3, 0, 0, 0, 0, 34, 2),
(1928, 0, 0, 0, 'Pfygga Pyramid 6', 0, 3, 0, 0, 0, 0, 41, 2),
(1929, 0, 0, 0, 'Pfygga Pyramid 7', 0, 3, 0, 0, 0, 0, 24, 2),
(1930, 0, 0, 0, 'Osiris Pyramid 1', 0, 3, 0, 0, 0, 0, 54, 2),
(1931, 0, 0, 0, 'Osiris Pyramid 2', 0, 3, 0, 0, 0, 0, 31, 1),
(1932, 0, 0, 0, 'Osiris Pyramid 3', 0, 3, 0, 0, 0, 0, 41, 1),
(1933, 0, 0, 0, 'Osiris Pyramid 4', 0, 3, 0, 0, 0, 0, 33, 2),
(1934, 0, 0, 0, 'Osiris Pyramid 5', 0, 3, 0, 0, 0, 0, 18, 1),
(1935, 0, 0, 0, 'Anubis District 1', 0, 3, 0, 0, 0, 0, 9, 0),
(1936, 0, 0, 0, 'Anubis District 2', 0, 3, 0, 0, 0, 0, 17, 1),
(1937, 0, 0, 1, 'Anubis District 3', 0, 3, 0, 0, 0, 0, 25, 1),
(1938, 0, 0, 1, 'Anubis District 4', 0, 3, 0, 0, 0, 0, 36, 1),
(1939, 0, 1420399299, 2, 'Anubis District 5', 0, 3, 0, 0, 0, 0, 51, 2),
(1940, 0, 0, 1, 'Anubis District 6', 0, 3, 0, 0, 0, 0, 42, 1),
(1941, 0, 0, 0, 'Market Disctict 1', 0, 3, 0, 0, 0, 0, 22, 1),
(1942, 0, 0, 1, 'Market Disctict 2', 0, 3, 0, 0, 0, 0, 15, 1),
(1943, 0, 0, 0, 'Market Disctict 3', 0, 3, 0, 0, 0, 0, 19, 1),
(1944, 0, 0, 0, 'Market Disctict 4', 0, 3, 0, 0, 0, 0, 13, 1),
(1945, 0, 0, 5, 'Market Disctict 5', 0, 3, 0, 0, 0, 0, 57, 2),
(1946, 0, 0, 0, 'Market Disctict 6', 0, 3, 0, 0, 0, 0, 32, 2),
(1947, 0, 0, 0, 'Market Disctict 7', 0, 3, 0, 0, 0, 0, 28, 2),
(1948, 0, 0, 0, 'Market Disctict 8', 0, 3, 0, 0, 0, 0, 49, 2),
(1949, 0, 0, 0, 'Market Disctict 9', 0, 3, 0, 0, 0, 0, 20, 1),
(1950, 0, 0, 0, 'Sothis Avenue 1', 0, 3, 0, 0, 0, 0, 140, 3),
(1951, 0, 0, 0, 'The City Wall 5b', 585, 2, 0, 0, 0, 0, 24, 1),
(1952, 0, 0, 0, 'Sothis Avenue 3', 0, 3, 0, 0, 0, 0, 15, 1),
(1953, 0, 0, 0, 'Sothis Avenue 4', 0, 3, 0, 0, 0, 0, 25, 1),
(1954, 0, 0, 0, 'Sothis Avenue 5', 0, 3, 0, 0, 0, 0, 30, 1),
(1955, 0, 0, 0, 'Sothis Avenue 6', 0, 3, 0, 0, 0, 0, 51, 2),
(1956, 0, 0, 0, 'Sothis Avenue 7', 0, 3, 0, 0, 0, 0, 49, 1),
(1957, 0, 0, 0, 'Twin Chamber 1', 0, 3, 0, 0, 0, 0, 32, 2),
(1958, 0, 0, 0, 'Twin Chamber 2', 0, 3, 0, 0, 0, 0, 31, 2),
(1959, 0, 0, 0, 'The City Wall 3f', 1045, 2, 0, 0, 0, 0, 31, 2),
(1960, 0, 0, 0, 'The City Wall 1a', 1270, 2, 0, 0, 0, 0, 49, 2),
(1961, 0, 0, 0, 'Sothis Avenue 8', 0, 3, 0, 0, 0, 0, 46, 2),
(1962, 0, 0, 0, 'Ra Pyramid 1', 0, 3, 0, 0, 0, 0, 93, 4),
(1963, 0, 0, 0, 'Ra Pyramid 2', 0, 3, 0, 0, 0, 0, 102, 4),
(1964, 0, 0, 1, 'Ra Pyramid 3', 0, 3, 0, 0, 0, 0, 99, 2),
(1965, 0, 0, 0, 'Ra Pyramid 4', 0, 3, 0, 0, 0, 0, 65, 2),
(1966, 0, 0, 1, 'Ra Pyramid 5', 0, 3, 0, 0, 0, 0, 106, 2),
(1967, 0, 0, 0, 'Ra Pyramid 6', 0, 3, 0, 0, 0, 0, 84, 2),
(1968, 0, 0, 0, 'Ra Pyramid 7', 0, 3, 0, 0, 0, 0, 25, 1),
(1969, 0, 0, 0, 'Apis Pyramid 1', 0, 3, 0, 0, 0, 0, 96, 3),
(1970, 0, 0, 0, 'Apis Pyramid 2', 0, 3, 0, 0, 0, 0, 99, 2),
(1971, 0, 0, 0, 'Apis Pyramid 3', 0, 3, 0, 0, 0, 0, 146, 3),
(1972, 0, 0, 0, 'Apis Pyramid 4', 0, 3, 0, 0, 0, 0, 65, 2),
(1973, 0, 0, 0, 'Heket Pyramid 1', 0, 3, 0, 0, 0, 0, 81, 2),
(1974, 0, 0, 0, 'Heket Pyramid 2', 0, 3, 0, 0, 0, 0, 36, 2),
(1975, 0, 0, 1, 'Heket Pyramid 3', 0, 3, 0, 0, 0, 0, 48, 2),
(1976, 0, 0, 0, 'Heket Pyramid 4', 0, 3, 0, 0, 0, 0, 18, 1),
(1977, 0, 0, 0, 'Heket Pyramid 5', 0, 3, 0, 0, 0, 0, 16, 1),
(1978, 0, 0, 0, 'Heket Pyramid 6', 0, 3, 0, 0, 0, 0, 15, 1),
(1979, 0, 1416902429, 4, 'Heket Pyramid 7', 0, 3, 0, 0, 0, 0, 12, 1),
(1980, 0, 0, 0, 'Heket Pyramid 8', 0, 3, 0, 0, 0, 0, 30, 1),
(1981, 0, 0, 1, 'Baal Pyramid 1', 0, 3, 0, 0, 0, 0, 49, 2),
(1982, 0, 1420399299, 0, 'Baal Pyramid 2', 0, 3, 0, 0, 0, 0, 49, 2),
(1983, 0, 0, 0, 'Baal Pyramid 3', 0, 3, 0, 0, 0, 0, 49, 2),
(1984, 0, 0, 0, 'Baal Pyramid 4', 0, 3, 0, 0, 0, 0, 56, 2),
(1985, 0, 0, 0, 'Baal Pyramid 5', 0, 3, 0, 0, 0, 0, 25, 1),
(1986, 0, 0, 0, 'Baal Pyramid 6', 0, 3, 0, 0, 0, 0, 30, 1),
(1987, 0, 0, 0, 'Baal Pyramid 7', 0, 3, 0, 0, 0, 0, 30, 1),
(1988, 0, 0, 2, 'Baal Pyramid 8', 0, 3, 0, 0, 0, 0, 30, 1),
(1989, 0, 0, 0, 'Baal Pyramid 9', 0, 3, 0, 0, 0, 0, 36, 2),
(1990, 0, 0, 1, 'Seaside 1', 0, 3, 0, 0, 0, 0, 30, 1),
(1991, 0, 0, 0, 'Seaside 2', 0, 3, 0, 0, 0, 0, 25, 1),
(1992, 0, 0, 0, 'Seaside 3', 0, 3, 0, 0, 0, 0, 60, 2),
(1993, 0, 0, 0, 'Seaside 4', 0, 3, 0, 0, 0, 0, 36, 2),
(1994, 0, 0, 0, 'Seaside 5', 0, 3, 0, 0, 0, 0, 30, 1),
(1995, 0, 0, 0, 'Seaside 6', 0, 3, 0, 0, 0, 0, 63, 2),
(1996, 0, 0, 0, 'Seaside 7', 0, 3, 0, 0, 0, 0, 42, 2),
(1997, 0, 0, 0, 'Seaside 8', 0, 3, 0, 0, 0, 0, 30, 2),
(1998, 0, 0, 0, 'Seaside 9', 0, 3, 0, 0, 0, 0, 35, 1),
(1999, 0, 0, 0, 'Seaside 10', 0, 3, 0, 0, 0, 0, 25, 1),
(2000, 0, 0, 0, 'Seaside 11', 0, 3, 0, 0, 0, 0, 30, 1),
(2001, 0, 0, 0, 'Seaside 12', 0, 3, 0, 0, 0, 0, 30, 1),
(2002, 0, 0, 0, 'Seaside 13', 0, 3, 0, 0, 0, 0, 36, 2),
(2003, 0, 0, 0, 'Seaside 14', 0, 3, 0, 0, 0, 0, 36, 1),
(2004, 0, 0, 0, 'Seaside 15', 0, 3, 0, 0, 0, 0, 51, 2),
(2005, 0, 0, 0, 'Central Plaza 1', 0, 3, 0, 0, 0, 0, 42, 1),
(2006, 0, 0, 0, 'Central Plaza 2', 0, 3, 0, 0, 0, 0, 57, 2),
(2007, 0, 0, 0, 'Central Plaza 3', 0, 3, 0, 0, 0, 0, 98, 3),
(2008, 0, 0, 0, 'Sorcerer\'s Avenue Labs 2e', 715, 2, 0, 0, 0, 0, 20, 1),
(2009, 0, 0, 0, 'Central Plaza 5', 0, 3, 0, 0, 0, 0, 25, 2),
(2010, 0, 0, 0, 'Central Plaza 6', 0, 3, 0, 0, 0, 0, 30, 1),
(2011, 0, 0, 0, 'Central Plaza 7', 0, 3, 0, 0, 0, 0, 30, 1),
(2012, 0, 0, 0, 'Central Plaza 8', 0, 3, 0, 0, 0, 0, 30, 1),
(2013, 0, 0, 0, 'Central Plaza 9', 0, 3, 0, 0, 0, 0, 37, 1),
(2014, 0, 0, 0, 'Apis pyramid 5', 0, 3, 0, 0, 0, 0, 76, 2),
(2015, 0, 0, 0, 'Waterside District 1', 0, 5, 0, 0, 0, 0, 80, 1),
(2016, 0, 0, 0, 'Waterside District 2', 0, 5, 0, 0, 0, 0, 142, 2),
(2017, 0, 0, 0, 'Waterside District 3', 0, 5, 0, 0, 0, 0, 142, 2),
(2018, 0, 0, 0, 'Waterside District 4', 0, 5, 0, 0, 0, 0, 230, 4),
(2019, 0, 1420399299, 0, 'Waterside District 5', 0, 5, 0, 0, 0, 0, 38, 2),
(2020, 0, 0, 0, 'Waterside District 6', 0, 5, 0, 0, 0, 0, 87, 2),
(2021, 0, 0, 0, 'Waterside District 7', 0, 5, 0, 0, 0, 0, 81, 2),
(2022, 0, 0, 0, 'Waterside District 8', 0, 5, 0, 0, 0, 0, 194, 2),
(2023, 0, 0, 0, 'Waterside District 9', 0, 5, 0, 0, 0, 0, 196, 3),
(2024, 0, 0, 0, 'Waterside District 10', 0, 5, 0, 0, 0, 0, 152, 0),
(2025, 0, 0, 0, 'Waterside District 11', 0, 5, 0, 0, 0, 0, 149, 2),
(2026, 0, 0, 0, 'Waterside District 12', 0, 5, 0, 0, 0, 0, 173, 3),
(2027, 0, 0, 0, 'Waterside District 13', 0, 5, 0, 0, 0, 0, 95, 2),
(2028, 0, 0, 0, 'The Tavern 2b', 1700, 7, 0, 0, 0, 0, 62, 2),
(2029, 0, 0, 0, 'Outlaw\'s Hideaway 1', 0, 5, 0, 0, 0, 0, 100, 2),
(2030, 0, 0, 0, 'Outlaw\'s Hideaway 2', 0, 5, 0, 0, 0, 0, 72, 2),
(2031, 0, 0, 0, 'General Goods Store', 0, 5, 0, 0, 0, 0, 138, 2),
(2032, 0, 0, 0, 'Oaken Residence 1', 0, 5, 0, 0, 0, 0, 258, 5),
(2033, 0, 0, 0, 'Oaken Residence 2', 0, 5, 0, 0, 0, 0, 485, 5),
(2034, 0, 0, 0, 'Oaken Residence 3', 0, 5, 0, 0, 0, 0, 107, 4),
(2035, 0, 0, 0, 'Western Manor 1', 0, 5, 0, 0, 0, 0, 291, 3),
(2036, 0, 0, 0, 'Western Manor 2', 0, 5, 0, 0, 0, 0, 186, 3),
(2037, 0, 0, 0, 'Western Manor 3', 0, 5, 0, 0, 0, 0, 97, 2),
(2038, 0, 0, 0, 'Extremity 1', 0, 5, 0, 0, 0, 0, 99, 3),
(2039, 0, 0, 0, 'Extremity 2', 0, 5, 0, 0, 0, 0, 46, 2),
(2040, 0, 0, 0, 'Extremity 3', 0, 5, 0, 0, 0, 0, 37, 2),
(2041, 0, 0, 0, 'Extremity 4', 0, 5, 0, 0, 0, 0, 160, 2),
(2042, 0, 0, 0, 'Outlaw\'s Hideaway 3', 0, 5, 0, 0, 0, 0, 84, 2),
(2043, 0, 0, 0, 'The Market 1', 0, 5, 0, 0, 0, 0, 66, 0),
(2044, 0, 0, 0, 'Market Street 2', 0, 5, 0, 0, 0, 0, 148, 3),
(2045, 0, 0, 0, 'Market Street 3', 0, 5, 0, 0, 0, 0, 88, 2),
(2046, 0, 0, 0, 'Market Street 4', 0, 5, 0, 0, 0, 0, 184, 2),
(2047, 0, 0, 0, 'Market Street 5', 0, 5, 0, 0, 0, 0, 140, 2),
(2048, 0, 0, 0, 'Market Street 6', 0, 5, 0, 0, 0, 0, 87, 2),
(2049, 0, 0, 0, 'Market Street 7', 0, 5, 0, 0, 0, 0, 31, 2),
(2050, 0, 0, 0, 'Market Street 8', 0, 5, 0, 0, 0, 0, 123, 3),
(2051, 0, 0, 0, 'The Bath 1', 0, 5, 0, 0, 0, 0, 45, 2),
(2052, 0, 0, 0, 'The Bath 7', 0, 5, 0, 0, 0, 0, 79, 2),
(2053, 0, 0, 0, 'The Bath 6', 0, 5, 0, 0, 0, 0, 54, 2),
(2054, 0, 0, 0, 'The Bath 5', 0, 5, 0, 0, 0, 0, 46, 2),
(2055, 0, 0, 0, 'The Bath #13', 0, 5, 0, 0, 0, 0, 71, 2),
(2056, 0, 0, 0, 'The Bath 4', 0, 5, 0, 0, 0, 0, 97, 2),
(2057, 0, 0, 0, 'The Bath 3', 0, 5, 0, 0, 0, 0, 82, 2),
(2058, 0, 0, 0, 'The Bath 2', 0, 5, 0, 0, 0, 0, 71, 2),
(2059, 0, 0, 0, 'The Bath Basement 1', 0, 5, 0, 0, 0, 0, 54, 2),
(2060, 0, 0, 0, 'The Bath Basement 2', 0, 5, 0, 0, 0, 0, 25, 2),
(2061, 0, 0, 0, 'The Bath Basement 3', 0, 5, 0, 0, 0, 0, 54, 2),
(2062, 0, 0, 0, 'The Bath Basement 4', 0, 5, 0, 0, 0, 0, 36, 2),
(2063, 0, 0, 0, 'The Bath Basement 5', 0, 5, 0, 0, 0, 0, 52, 2),
(2064, 0, 0, 0, 'Eastern Boundary 1', 0, 5, 0, 0, 0, 0, 86, 2),
(2065, 0, 0, 0, 'Eastern Boundary 2', 0, 5, 0, 0, 0, 0, 48, 2),
(2066, 0, 0, 0, 'Eastern Boundary 3', 0, 5, 0, 0, 0, 0, 125, 2),
(2067, 0, 0, 0, 'Eastern Boundary 4', 0, 5, 0, 0, 0, 0, 95, 2),
(2068, 0, 0, 0, 'Eastern Boundary 5', 0, 5, 0, 0, 0, 0, 90, 2),
(2069, 0, 0, 0, 'Eastern Boundary 6', 0, 5, 0, 0, 0, 0, 67, 1),
(2070, 0, 0, 0, 'Eastern Boundary 7', 0, 5, 0, 0, 0, 0, 144, 2),
(2071, 0, 0, 0, 'Eastern Boundary 8', 0, 5, 0, 0, 0, 0, 132, 2),
(2072, 0, 0, 0, 'Eastern Boundary 9', 0, 5, 0, 0, 0, 0, 72, 2),
(2073, 0, 0, 0, 'Eastern Boundary 10', 0, 5, 0, 0, 0, 0, 175, 2),
(2074, 0, 0, 0, 'Eastern Boundary 11', 0, 5, 0, 0, 0, 0, 90, 2),
(2075, 0, 0, 0, 'Ivy Cottage', 30650, 7, 0, 0, 0, 0, 858, 26),
(2076, 0, 0, 0, 'Central Square 1', 0, 5, 0, 0, 0, 0, 63, 2),
(2077, 0, 0, 0, 'Central Square 2', 0, 5, 0, 0, 0, 0, 85, 2),
(2078, 0, 0, 0, 'Central Square 3', 0, 5, 0, 0, 0, 0, 115, 2),
(2079, 0, 0, 0, 'Central Square 4', 0, 5, 0, 0, 0, 0, 92, 2),
(2080, 0, 0, 0, 'Central Square 5', 0, 5, 0, 0, 0, 0, 168, 3),
(2081, 0, 0, 0, 'Central Square 6', 0, 5, 0, 0, 0, 0, 123, 0),
(2082, 0, 0, 5, 'Central Square 7', 0, 5, 0, 0, 0, 0, 87, 0),
(2083, 0, 0, 0, 'Central Square 8', 0, 5, 0, 0, 0, 0, 123, 2),
(2084, 0, 0, 0, 'Central Square 9', 0, 5, 0, 0, 0, 0, 186, 3),
(2085, 0, 0, 0, 'Central Square 10', 0, 5, 0, 0, 0, 0, 166, 2),
(2086, 0, 0, 0, 'Central Square 11', 0, 5, 0, 0, 0, 0, 84, 2),
(2087, 0, 0, 0, 'Central Square 12', 0, 5, 0, 0, 0, 0, 143, 3),
(2088, 0, 0, 0, 'Central Square 13', 0, 5, 0, 0, 0, 0, 112, 0),
(2089, 0, 0, 0, 'Central Square 14', 0, 5, 0, 0, 0, 0, 206, 4),
(2090, 0, 0, 0, 'Palladin Store', 0, 5, 0, 0, 0, 0, 151, 4),
(2091, 0, 0, 0, 'Boatyard 1', 0, 4, 0, 0, 0, 0, 144, 2),
(2092, 0, 0, 0, 'Boatyard 2', 0, 4, 0, 0, 0, 0, 88, 2),
(2093, 0, 0, 0, 'Boatyard 3', 0, 4, 0, 0, 0, 0, 77, 2),
(2094, 0, 0, 0, 'Boatyard 4', 0, 4, 0, 0, 0, 0, 120, 3),
(2095, 0, 0, 0, 'Boatyard 5', 0, 4, 0, 0, 0, 0, 112, 2),
(2097, 0, 0, 0, 'Fishing Hut 1', 0, 4, 0, 0, 0, 0, 60, 2),
(2098, 0, 0, 0, 'Fishing Hut 2', 0, 4, 0, 0, 0, 0, 84, 3),
(2099, 0, 0, 0, 'Fibula Village, Tower Flat', 5105, 2, 0, 0, 0, 0, 161, 2),
(2100, 0, 0, 0, 'Fibula Village 1', 845, 2, 0, 0, 0, 0, 30, 1),
(2101, 0, 0, 0, 'Fibula Village 2', 845, 2, 0, 0, 0, 0, 30, 1),
(2102, 0, 0, 0, 'Fishing Hut 6', 0, 4, 0, 0, 0, 0, 48, 2),
(2103, 0, 0, 0, 'Bothfar Plaza 1', 0, 4, 0, 0, 0, 0, 192, 4),
(2104, 0, 0, 0, 'Bothfar Plaza 2', 0, 4, 0, 0, 0, 0, 56, 2),
(2105, 0, 0, 0, 'Bothfar Plaza 3', 0, 4, 0, 0, 0, 0, 110, 2),
(2106, 0, 0, 0, 'Fibula Village, Villa', 11490, 2, 0, 0, 0, 0, 402, 5),
(2107, 0, 0, 0, 'Fibula Clanhall', 11430, 2, 0, 0, 0, 0, 290, 10),
(2108, 0, 0, 0, 'Spiritkeep', 19210, 2, 0, 0, 0, 0, 783, 23),
(2109, 0, 0, 0, 'Bothfar Plaza 7', 0, 4, 0, 0, 0, 0, 162, 3),
(2110, 0, 0, 0, 'Gunbjorn Valley 1', 0, 4, 0, 0, 0, 0, 154, 3),
(2111, 0, 0, 0, 'Gunbjorn Valley 2', 0, 4, 0, 0, 0, 0, 154, 3),
(2112, 0, 0, 0, 'Gunbjorn Valley 3', 0, 4, 0, 0, 0, 0, 64, 2),
(2113, 0, 0, 0, 'Gunbjorn Valley 4', 0, 4, 0, 0, 0, 0, 95, 2),
(2114, 0, 0, 0, 'Gunbjorn Valley 5', 0, 4, 0, 0, 0, 0, 62, 2),
(2115, 0, 0, 0, 'Gunbjorn Valley 6', 0, 4, 0, 0, 0, 0, 75, 2),
(2116, 0, 0, 0, 'Gunbjorn Valley 7', 0, 4, 0, 0, 0, 0, 75, 1),
(2117, 0, 0, 0, 'Senja Village 6b', 765, 4, 0, 0, 0, 0, 30, 1),
(2118, 0, 0, 0, 'Senja Village 6a', 765, 4, 0, 0, 0, 0, 30, 1),
(2119, 0, 0, 0, 'Senja Village 5', 1225, 4, 0, 0, 0, 0, 48, 2),
(2120, 0, 0, 0, 'Senja Village 10', 1485, 4, 0, 0, 0, 0, 72, 1),
(2121, 0, 0, 0, 'Senja Village 11', 2620, 4, 0, 0, 0, 0, 96, 2),
(2122, 0, 0, 0, 'Senja Village 9', 2575, 4, 0, 0, 0, 0, 103, 2),
(2123, 0, 0, 0, 'Helkarakse 7', 0, 4, 0, 0, 0, 0, 30, 2),
(2124, 0, 0, 0, 'Helkarakse 8', 0, 4, 0, 0, 0, 0, 32, 1),
(2125, 0, 0, 0, 'Helkarakse 9', 0, 4, 0, 0, 0, 0, 24, 1),
(2126, 0, 0, 0, 'Helkarakse 10', 0, 4, 0, 0, 0, 0, 32, 1),
(2127, 0, 0, 0, 'Helkarakse 11', 0, 4, 0, 0, 0, 0, 38, 1),
(2128, 0, 0, 0, 'Rosebud B', 1000, 4, 0, 0, 0, 0, 60, 1),
(2129, 0, 0, 0, 'Barbarian Area 2', 0, 4, 0, 0, 0, 0, 117, 3),
(2130, 0, 0, 0, 'Northport Village 2', 1475, 4, 0, 0, 0, 0, 40, 2),
(2131, 0, 0, 0, 'Barbarian Area 4', 0, 4, 0, 0, 0, 0, 70, 4),
(2132, 0, 0, 0, 'Northport Village 3', 5435, 4, 0, 0, 0, 0, 178, 2),
(2133, 0, 0, 0, 'Barbarian Area 5', 0, 4, 0, 0, 0, 0, 147, 2),
(2134, 0, 0, 0, 'Small Harbor', 0, 4, 0, 0, 0, 0, 154, 3),
(2135, 0, 0, 0, 'Central Square 15', 0, 5, 0, 0, 0, 0, 54, 2),
(2136, 0, 0, 0, 'Fishing Hut 3', 0, 4, 0, 0, 0, 0, 66, 2),
(2137, 0, 0, 0, 'Fishing Hut 4', 0, 4, 0, 0, 0, 0, 56, 2),
(2138, 0, 0, 0, 'Fishing Hut 5', 0, 4, 0, 0, 0, 0, 54, 2);
INSERT INTO `houses` (`id`, `owner`, `paid`, `warnings`, `name`, `rent`, `town_id`, `bid`, `bid_end`, `last_bid`, `highest_bidder`, `size`, `beds`) VALUES
(2139, 0, 0, 0, 'Helkarakse 1', 0, 4, 0, 0, 0, 0, 38, 1),
(2140, 0, 0, 0, 'Helkarakse 2', 0, 4, 0, 0, 0, 0, 64, 2),
(2141, 0, 0, 0, 'Helkarakse 3', 0, 4, 0, 0, 0, 0, 54, 1),
(2142, 0, 0, 0, 'Bothfar Plaza 4', 0, 4, 0, 0, 0, 0, 70, 2),
(2143, 0, 0, 0, 'Bothfar Plaza 5', 0, 4, 0, 0, 0, 0, 36, 1),
(2144, 0, 0, 0, 'Bothfar Plaza 6', 0, 4, 0, 0, 0, 0, 45, 1),
(2145, 0, 0, 0, 'Barbarian Area 1', 0, 4, 0, 0, 0, 0, 65, 2),
(2146, 0, 0, 0, 'Barbarian Area 3', 0, 4, 0, 0, 0, 0, 49, 1),
(2147, 0, 0, 0, 'Barbarian Area 6', 0, 4, 0, 0, 0, 0, 44, 1),
(2148, 0, 0, 0, 'Barbarian Area 7', 0, 4, 0, 0, 0, 0, 60, 3),
(2149, 0, 0, 0, 'Barbarian Area 8', 0, 4, 0, 0, 0, 0, 45, 1),
(2150, 0, 0, 0, 'Mountain Quarters 1', 0, 6, 0, 0, 0, 0, 43, 2),
(2151, 0, 0, 0, 'Mountain Quarters 2', 0, 6, 0, 0, 0, 0, 81, 3),
(2152, 0, 0, 0, 'Mountain Quarters 3', 0, 6, 0, 0, 0, 0, 28, 1),
(2153, 0, 0, 0, 'Mountain Quarters 4', 0, 6, 0, 0, 0, 0, 27, 2),
(2154, 0, 0, 0, 'Mountain Quarters 5', 0, 6, 0, 0, 0, 0, 131, 4),
(2155, 0, 0, 0, 'Mountain Quarters 6', 0, 6, 0, 0, 0, 0, 105, 3),
(2156, 0, 0, 0, 'Mountain Quarters 7', 0, 6, 0, 0, 0, 0, 91, 2),
(2157, 0, 0, 0, 'Temple Square 1', 0, 6, 0, 0, 0, 0, 94, 2),
(2158, 0, 0, 0, 'Temple Square 2', 0, 6, 0, 0, 0, 0, 28, 1),
(2159, 0, 0, 0, 'Temple Square 3', 0, 6, 0, 0, 0, 0, 55, 2),
(2160, 0, 0, 0, 'Temple Square 4', 0, 6, 0, 0, 0, 0, 17, 1),
(2161, 0, 0, 0, 'Temple Square 5', 0, 6, 0, 0, 0, 0, 80, 2),
(2162, 0, 0, 0, 'Temple Square 6', 0, 6, 0, 0, 0, 0, 36, 1),
(2163, 0, 0, 0, 'Temple Square 7', 0, 6, 0, 0, 0, 0, 58, 1),
(2164, 0, 0, 0, 'Temple Square 8', 0, 6, 0, 0, 0, 0, 27, 1),
(2165, 0, 0, 0, 'Temple Square 9', 0, 6, 0, 0, 0, 0, 48, 2),
(2166, 0, 0, 0, 'Temple Square 10', 0, 6, 0, 0, 0, 0, 41, 1),
(2167, 0, 0, 0, 'Temple Square 11', 0, 6, 0, 0, 0, 0, 40, 1),
(2168, 0, 0, 0, 'Temple Square 12', 0, 6, 0, 0, 0, 0, 19, 1),
(2169, 0, 0, 0, 'Temple Square 13', 0, 6, 0, 0, 0, 0, 20, 1),
(2170, 0, 0, 0, 'Temple Square 14', 0, 6, 0, 0, 0, 0, 32, 1),
(2171, 0, 0, 0, 'Village\'s Suburb 1', 0, 6, 0, 0, 0, 0, 24, 1),
(2172, 0, 0, 0, 'Village\'s Suburb 2', 0, 6, 0, 0, 0, 0, 45, 1),
(2173, 0, 0, 0, 'Village\'s Suburb 3', 0, 6, 0, 0, 0, 0, 23, 1),
(2174, 0, 0, 0, 'Village\'s Suburb 4', 0, 6, 0, 0, 0, 0, 33, 1),
(2175, 0, 0, 0, 'Village\'s Suburb 5', 0, 6, 0, 0, 0, 0, 35, 2),
(2176, 0, 0, 0, 'Village\'s Suburb 6', 0, 6, 0, 0, 0, 0, 26, 1),
(2177, 0, 0, 0, 'Village\'s Suburb 7', 0, 6, 0, 0, 0, 0, 24, 1),
(2178, 0, 0, 0, 'Village\'s Suburb 8', 0, 6, 0, 0, 0, 0, 42, 1),
(2179, 0, 0, 0, 'Village\'s Suburb 9', 0, 6, 0, 0, 0, 0, 16, 1),
(2180, 0, 0, 0, 'Village\'s Suburb 10', 0, 6, 0, 0, 0, 0, 28, 1),
(2181, 0, 0, 0, 'Village\'s Suburb 11', 0, 6, 0, 0, 0, 0, 33, 1),
(2182, 0, 0, 0, 'Village\'s Suburb 12', 0, 6, 0, 0, 0, 0, 25, 1),
(2183, 0, 0, 0, 'Theater Avenue 6b', 820, 4, 0, 0, 0, 0, 35, 2),
(2184, 0, 0, 0, 'Magic Avenue 15', 0, 6, 0, 0, 0, 0, 24, 1),
(2185, 0, 0, 0, 'Village\'s Suburb 14', 0, 6, 0, 0, 0, 0, 24, 1),
(2186, 0, 0, 0, 'Village\'s Suburb 15', 0, 6, 0, 0, 0, 0, 61, 2),
(2187, 0, 0, 0, 'Village\'s Suburb 16', 0, 6, 0, 0, 0, 0, 55, 2),
(2189, 0, 0, 0, 'Magic Avenue 1', 0, 6, 0, 0, 0, 0, 63, 1),
(2190, 0, 0, 0, 'Magic Avenue 2', 0, 6, 0, 0, 0, 0, 42, 2),
(2191, 0, 0, 0, 'Magic Avenue 3', 0, 6, 0, 0, 0, 0, 24, 1),
(2192, 0, 0, 0, 'Magic Avenue 4', 0, 6, 0, 0, 0, 0, 16, 1),
(2193, 0, 0, 0, 'Magic Avenue 5', 0, 6, 0, 0, 0, 0, 20, 1),
(2194, 0, 0, 0, 'Magic Avenue 6', 0, 6, 0, 0, 0, 0, 18, 1),
(2195, 0, 0, 0, 'Magic Avenue 7', 0, 6, 0, 0, 0, 0, 19, 1),
(2196, 0, 0, 0, 'Magic Avenue 8', 0, 6, 0, 0, 0, 0, 20, 1),
(2197, 0, 0, 0, 'Magic Avenue 9', 0, 6, 0, 0, 0, 0, 56, 1),
(2198, 0, 0, 0, 'Magic Avenue 10', 0, 6, 0, 0, 0, 0, 20, 1),
(2199, 0, 0, 0, 'Magic Avenue 11', 0, 6, 0, 0, 0, 0, 32, 1),
(2200, 0, 0, 0, 'Magic Avenue 12', 0, 6, 0, 0, 0, 0, 28, 1),
(2201, 0, 0, 0, 'Magic Avenue 13', 0, 6, 0, 0, 0, 0, 20, 1),
(2202, 0, 0, 0, 'Magic Avenue 14', 0, 6, 0, 0, 0, 0, 20, 1),
(2203, 0, 0, 0, 'Magic Avenue 16', 0, 6, 0, 0, 0, 0, 24, 1),
(2204, 0, 0, 0, 'Sea Boulevard 1', 0, 6, 0, 0, 0, 0, 29, 1),
(2205, 0, 0, 0, 'Sea Boulevard 2', 0, 6, 0, 0, 0, 0, 24, 1),
(2206, 0, 0, 0, 'Sea Boulevard 3', 0, 6, 0, 0, 0, 0, 32, 1),
(2207, 0, 0, 0, 'Sea Boulevard 4', 0, 6, 0, 0, 0, 0, 31, 1),
(2208, 0, 0, 0, 'Sea Boulevard 5', 0, 6, 0, 0, 0, 0, 20, 1),
(2209, 0, 0, 0, 'Theater Avenue 7, Flat 12', 405, 4, 0, 0, 0, 0, 15, 1),
(2210, 0, 0, 0, 'Sea Boulevard 7', 0, 6, 0, 0, 0, 0, 21, 1),
(2211, 0, 0, 0, 'Sea Boulevard 8', 0, 6, 0, 0, 0, 0, 18, 1),
(2212, 0, 0, 0, 'Sea Boulevard 9', 0, 6, 0, 0, 0, 0, 30, 1),
(2213, 0, 0, 0, 'Central Plaza 2', 600, 4, 0, 0, 0, 0, 20, 0),
(2214, 0, 0, 0, 'Sea Boulevard 11', 0, 6, 0, 0, 0, 0, 28, 1),
(2215, 0, 0, 1, 'Sea Boulevard 12', 0, 6, 0, 0, 0, 0, 16, 1),
(2216, 0, 0, 0, 'Sea Boulevard 13', 0, 6, 0, 0, 0, 0, 24, 1),
(2217, 0, 0, 0, 'Sea Boulevard 14', 0, 6, 0, 0, 0, 0, 28, 1),
(2218, 0, 0, 0, 'Sea Boulevard 15', 0, 6, 0, 0, 0, 0, 16, 1),
(2219, 0, 0, 0, 'Sea Boulevard 16', 0, 6, 0, 0, 0, 0, 24, 1),
(2220, 0, 0, 0, 'Sea Boulevard 17', 0, 6, 0, 0, 0, 0, 28, 1),
(2221, 0, 0, 0, 'Sea Boulevard 18', 0, 6, 0, 0, 0, 0, 24, 1),
(2222, 0, 0, 0, 'Sea Boulevard 19', 0, 6, 0, 0, 0, 0, 44, 2),
(2223, 0, 0, 0, 'Sea Boulevard 20', 0, 6, 0, 0, 0, 0, 24, 1),
(2224, 0, 0, 0, 'Temple District 1', 0, 6, 0, 0, 0, 0, 24, 2),
(2225, 0, 0, 0, 'Temple District 2', 0, 6, 0, 0, 0, 0, 41, 2),
(2226, 0, 0, 0, 'Temple District 3', 0, 6, 0, 0, 0, 0, 16, 1),
(2227, 0, 0, 0, 'Temple District 4', 0, 6, 0, 0, 0, 0, 36, 2),
(2228, 0, 0, 0, 'Temple District 5', 0, 6, 0, 0, 0, 0, 23, 1),
(2229, 0, 0, 0, 'Temple District 6', 0, 6, 0, 0, 0, 0, 41, 2),
(2230, 0, 0, 0, 'Temple District 7', 0, 6, 0, 0, 0, 0, 20, 1),
(2231, 0, 0, 0, 'Temple District 8', 0, 6, 0, 0, 0, 0, 24, 1),
(2232, 0, 0, 0, 'Temple District 9', 0, 6, 0, 0, 0, 0, 16, 1),
(2233, 0, 0, 0, 'Temple District 10', 0, 6, 0, 0, 0, 0, 16, 1),
(2234, 0, 0, 0, 'Temple District 11', 0, 6, 0, 0, 0, 0, 20, 1),
(2235, 0, 0, 0, 'Temple District 12', 0, 6, 0, 0, 0, 0, 36, 1),
(2236, 0, 0, 0, 'Temple District 13', 0, 6, 0, 0, 0, 0, 24, 1),
(2237, 0, 0, 0, 'Temple District 14', 0, 6, 0, 0, 0, 0, 62, 1),
(2238, 0, 0, 0, 'Green Embankment 1', 0, 6, 0, 0, 0, 0, 45, 2),
(2239, 0, 0, 0, 'Green Embankment 2', 0, 6, 0, 0, 0, 0, 42, 1),
(2240, 0, 0, 0, 'Green Embankment 3', 0, 6, 0, 0, 0, 0, 47, 1),
(2241, 0, 0, 0, 'Green Embankment 4', 0, 6, 0, 0, 0, 0, 20, 1),
(2242, 0, 0, 0, 'Green Embankment 5', 0, 6, 0, 0, 0, 0, 22, 1),
(2243, 0, 0, 0, 'Green Embankment 6', 0, 6, 0, 0, 0, 0, 31, 1),
(2244, 0, 0, 0, 'Green Embankment 7', 0, 6, 0, 0, 0, 0, 44, 1),
(2245, 0, 0, 0, 'Green Embankment 8', 0, 6, 0, 0, 0, 0, 30, 1),
(2246, 0, 0, 0, 'Green Embankment 9', 0, 6, 0, 0, 0, 0, 20, 1),
(2247, 0, 0, 0, 'Green Embankment 10', 0, 6, 0, 0, 0, 0, 29, 1),
(2248, 0, 0, 0, 'Green Embankment 11', 0, 6, 0, 0, 0, 0, 21, 1),
(2249, 0, 0, 0, 'Mountain Quarters 8', 0, 6, 0, 0, 0, 0, 48, 2),
(2250, 0, 0, 0, 'Waterside District 14', 0, 5, 0, 0, 0, 0, 241, 0),
(2251, 0, 0, 0, 'The Farm 1', 0, 7, 0, 0, 0, 0, 60, 1),
(2252, 0, 0, 0, 'The Farm 2', 0, 7, 0, 0, 0, 0, 50, 1),
(2253, 0, 0, 0, 'The Farm 3', 0, 7, 0, 0, 0, 0, 64, 2),
(2254, 0, 0, 0, 'The Farm 4', 0, 7, 0, 0, 0, 0, 93, 1),
(2255, 0, 0, 0, 'Stable Road 1', 0, 7, 0, 0, 0, 0, 45, 1),
(2256, 0, 0, 0, 'Stable Road 2', 0, 7, 0, 0, 0, 0, 50, 1),
(2257, 0, 0, 0, 'Stable Road 3', 0, 7, 0, 0, 0, 0, 50, 1),
(2258, 0, 0, 0, 'Stable Road 4', 0, 7, 0, 0, 0, 0, 84, 2),
(2259, 0, 0, 0, 'Stable Road 5', 0, 7, 0, 0, 0, 0, 50, 1),
(2260, 0, 0, 0, 'Stable Road 6', 0, 7, 0, 0, 0, 0, 45, 1),
(2261, 0, 0, 0, 'Stable Road 7', 0, 7, 0, 0, 0, 0, 102, 2),
(2262, 0, 0, 0, 'Central Square, 1', 0, 7, 0, 0, 0, 0, 43, 1),
(2263, 0, 0, 0, 'Central Square, 2', 0, 7, 0, 0, 0, 0, 59, 1),
(2264, 0, 0, 0, 'Central Square, 3', 0, 7, 0, 0, 0, 0, 104, 2),
(2265, 0, 0, 0, 'Central Square, 4', 0, 7, 0, 0, 0, 0, 60, 1),
(2266, 0, 0, 0, 'Central Square, 5', 0, 7, 0, 0, 0, 0, 60, 1),
(2267, 0, 0, 0, 'Central Square, 6', 0, 7, 0, 0, 0, 0, 56, 1),
(2268, 0, 0, 0, 'Central Square, 7', 0, 7, 0, 0, 0, 0, 16, 1),
(2269, 0, 0, 0, 'Central Square, 8', 0, 7, 0, 0, 0, 0, 34, 1),
(2270, 0, 0, 0, 'Central Square, 9', 0, 7, 0, 0, 0, 0, 50, 1),
(2271, 0, 0, 0, 'Central Square, 10', 0, 7, 0, 0, 0, 0, 50, 1),
(2272, 0, 0, 0, 'Central Square, 12', 0, 7, 0, 0, 0, 0, 50, 1),
(2273, 0, 0, 0, 'Central Square, 13', 0, 7, 0, 0, 0, 0, 70, 2),
(2274, 0, 0, 0, 'Central Square, 14', 0, 7, 0, 0, 0, 0, 72, 1),
(2275, 0, 0, 0, 'Gate District 1', 0, 7, 0, 0, 0, 0, 70, 1),
(2276, 0, 0, 0, 'Gate District 2', 0, 7, 0, 0, 0, 0, 50, 1),
(2277, 0, 0, 0, 'Gate District 3', 0, 7, 0, 0, 0, 0, 172, 3),
(2278, 0, 0, 0, 'Gate District 4', 0, 7, 0, 0, 0, 0, 50, 1),
(2279, 0, 0, 0, 'Gate District 5', 0, 7, 0, 0, 0, 0, 50, 1),
(2280, 0, 0, 0, 'Gate District 6', 0, 7, 0, 0, 0, 0, 50, 1),
(2281, 0, 0, 0, 'Short Avenue 1', 0, 7, 0, 0, 0, 0, 40, 1),
(2282, 0, 0, 0, 'Short Avenue 2', 0, 7, 0, 0, 0, 0, 50, 1),
(2283, 0, 0, 0, 'Short Avenue 3', 0, 7, 0, 0, 0, 0, 50, 1),
(2284, 0, 0, 0, 'Short Avenue 4', 0, 7, 0, 0, 0, 0, 66, 2),
(2285, 0, 0, 0, 'Short Avenue 5', 0, 7, 0, 0, 0, 0, 70, 1),
(2286, 0, 1420399299, 0, 'Outcasts Place', 0, 7, 0, 0, 0, 0, 568, 10),
(2287, 0, 0, 1, 'Boat Yard 1', 0, 8, 0, 0, 0, 0, 103, 2),
(2288, 0, 0, 1, 'Boat Yard 2', 0, 8, 0, 0, 0, 0, 24, 1),
(2289, 0, 1416988839, 0, 'Depot Boulevard 1', 0, 8, 0, 0, 0, 0, 85, 2),
(2290, 0, 0, 0, 'Depot Boulevard 2', 0, 8, 0, 0, 0, 0, 143, 2),
(2291, 0, 0, 0, 'Depot Boulevard 3', 0, 8, 0, 0, 0, 0, 75, 2),
(2292, 0, 0, 0, 'Depot Boulevard 4', 0, 8, 0, 0, 0, 0, 54, 0),
(2293, 0, 0, 0, 'Depot Boulevard 5', 0, 8, 0, 0, 0, 0, 112, 1),
(2294, 0, 0, 0, 'Depot Boulevard 6', 0, 8, 0, 0, 0, 0, 42, 2),
(2295, 0, 0, 1, 'Depot Boulevard 7', 0, 8, 0, 0, 0, 0, 42, 2),
(2296, 0, 0, 0, 'Corn Farm', 0, 8, 0, 0, 0, 0, 180, 4),
(2297, 0, 0, 0, 'Fishermans Hut', 0, 8, 0, 0, 0, 0, 68, 2),
(2298, 0, 1420399299, 0, 'Embankment 1', 0, 8, 0, 0, 0, 0, 179, 0),
(2299, 0, 0, 0, 'Embankment 2', 0, 8, 0, 0, 0, 0, 198, 0),
(2300, 0, 0, 0, 'Embankment 3', 0, 8, 0, 0, 0, 0, 159, 1),
(2301, 0, 0, 0, 'Embankment 4', 0, 8, 0, 0, 0, 0, 156, 4),
(2302, 0, 0, 0, 'Embankment 5', 0, 8, 0, 0, 0, 0, 56, 2),
(2303, 0, 0, 0, 'Embankment 6', 0, 8, 0, 0, 0, 0, 49, 2),
(2304, 0, 0, 0, 'Green Square 1', 0, 8, 0, 0, 0, 0, 108, 3),
(2305, 0, 0, 0, 'Green Square 2', 0, 8, 0, 0, 0, 0, 42, 2),
(2306, 0, 0, 0, 'Green Square 3', 0, 8, 0, 0, 0, 0, 36, 2),
(2307, 0, 0, 0, 'Green Square 4', 0, 8, 0, 0, 0, 0, 36, 2),
(2308, 0, 0, 0, 'Green Square 5', 0, 8, 0, 0, 0, 0, 40, 2),
(2309, 0, 0, 0, 'Green Square 6', 0, 8, 0, 0, 0, 0, 49, 2),
(2310, 0, 1420399299, 0, 'Green Square 7', 0, 8, 0, 0, 0, 0, 49, 2),
(2311, 0, 0, 1, 'Green Square 8', 0, 8, 0, 0, 0, 0, 40, 2),
(2312, 0, 0, 0, 'Green Square 9', 0, 8, 0, 0, 0, 0, 164, 2),
(2313, 0, 0, 0, 'Green Square 10', 0, 8, 0, 0, 0, 0, 126, 2),
(2314, 0, 0, 0, 'Green Square 11', 0, 8, 0, 0, 0, 0, 85, 2),
(2315, 0, 0, 0, 'Green Square 12', 0, 8, 0, 0, 0, 0, 80, 1),
(2316, 0, 0, 0, 'Main Street 1', 0, 8, 0, 0, 0, 0, 176, 2),
(2317, 0, 0, 0, 'Main Street 2', 0, 8, 0, 0, 0, 0, 200, 4),
(2318, 0, 0, 0, 'Main Street 3', 0, 8, 0, 0, 0, 0, 45, 2),
(2319, 0, 0, 0, 'Main Street 4', 0, 8, 0, 0, 0, 0, 112, 1),
(2320, 0, 0, 0, 'Main Street 5', 0, 8, 0, 0, 0, 0, 70, 2),
(2321, 0, 0, 0, 'Main Street 6', 0, 8, 0, 0, 0, 0, 116, 1),
(2322, 0, 0, 0, 'Main Street 7', 0, 8, 0, 0, 0, 0, 66, 1),
(2323, 0, 0, 0, 'Sand Square 1', 0, 9, 0, 0, 0, 0, 79, 1),
(2324, 0, 0, 0, 'Sand Square 2', 0, 9, 0, 0, 0, 0, 78, 1),
(2325, 0, 0, 0, 'Sand Square 3', 0, 9, 0, 0, 0, 0, 171, 2),
(2326, 0, 0, 0, 'Sand Square 4', 0, 9, 0, 0, 0, 0, 76, 1),
(2327, 0, 0, 0, 'Sand Square 5', 0, 9, 0, 0, 0, 0, 92, 2),
(2328, 0, 0, 0, 'Boat Avenue 1', 0, 9, 0, 0, 0, 0, 50, 1),
(2329, 0, 0, 0, 'Boat Avenue 2', 0, 9, 0, 0, 0, 0, 94, 2),
(2330, 0, 0, 0, 'Boat Avenue 3', 0, 9, 0, 0, 0, 0, 70, 2),
(2331, 0, 0, 0, 'Boat Avenue 4', 0, 9, 0, 0, 0, 0, 47, 2),
(2332, 0, 0, 0, 'Boat Avenue 5', 0, 9, 0, 0, 0, 0, 94, 2),
(2333, 0, 0, 0, 'Palm Street 1', 0, 9, 0, 0, 0, 0, 78, 1),
(2334, 0, 0, 0, 'Palm Street 2', 0, 9, 0, 0, 0, 0, 84, 1),
(2335, 0, 0, 0, 'Palm Street 3', 0, 9, 0, 0, 0, 0, 75, 2),
(2336, 0, 0, 0, 'Palm Street 4', 0, 9, 0, 0, 0, 0, 88, 2),
(2337, 0, 0, 0, 'Palm Street 5', 0, 9, 0, 0, 0, 0, 138, 2),
(2338, 0, 0, 0, 'Stonehome Village 6', 1300, 11, 0, 0, 0, 0, 55, 2),
(2339, 0, 0, 0, 'Stonehome Village 5', 1140, 11, 0, 0, 0, 0, 56, 2),
(2340, 0, 0, 0, 'Stonehome Village 7', 1140, 11, 0, 0, 0, 0, 49, 2),
(2341, 0, 0, 0, 'Stonehome Village 8', 680, 11, 0, 0, 0, 0, 36, 1),
(2342, 0, 0, 0, 'Stonehome Village 9', 680, 11, 0, 0, 0, 0, 36, 1),
(2343, 0, 0, 0, 'Wall Street 1', 0, 1, 0, 0, 0, 0, 121, 1),
(2344, 0, 0, 0, 'Wall Street 2', 0, 1, 0, 0, 0, 0, 61, 1),
(2345, 0, 0, 0, 'Wall Street 3', 0, 1, 0, 0, 0, 0, 151, 2),
(2346, 0, 0, 0, 'Central Street 1', 0, 1, 0, 0, 0, 0, 133, 2),
(2347, 0, 0, 0, 'Central Street 2', 0, 1, 0, 0, 0, 0, 140, 1),
(2348, 0, 0, 0, 'Fountain Street 1', 0, 1, 0, 0, 0, 0, 48, 1),
(2349, 0, 0, 0, 'Cormaya Flats, Flat 06', 450, 11, 0, 0, 0, 0, 20, 1),
(2350, 0, 0, 0, 'Fountain Street 2', 0, 1, 0, 0, 0, 0, 134, 1),
(2351, 0, 0, 0, 'Fountain Street 3', 0, 1, 0, 0, 0, 0, 76, 2),
(2352, 0, 0, 0, 'Fountain Street 4', 0, 1, 0, 0, 0, 0, 98, 2),
(2353, 0, 0, 0, 'Fountain Street 5', 0, 1, 0, 0, 0, 0, 98, 2),
(2354, 0, 0, 0, 'Fountain Street 6', 0, 1, 0, 0, 0, 0, 154, 2),
(2355, 0, 0, 0, 'Fountain Street 7', 0, 1, 0, 0, 0, 0, 123, 1),
(2356, 0, 0, 0, 'Fountain Street 8', 0, 1, 0, 0, 0, 0, 73, 2),
(2357, 0, 0, 0, 'Fountain Street 9', 0, 1, 0, 0, 0, 0, 185, 1),
(2358, 0, 0, 0, 'Fountain Street 10', 0, 1, 0, 0, 0, 0, 348, 5),
(2359, 0, 0, 0, 'Fountain Street 11', 0, 1, 0, 0, 0, 0, 45, 1),
(2360, 0, 0, 0, 'Fountain Street 12', 0, 1, 0, 0, 0, 0, 45, 1),
(2361, 0, 0, 0, 'Fountain Street 13', 0, 1, 0, 0, 0, 0, 45, 1),
(2362, 0, 0, 0, 'Fountain Street 14', 0, 1, 0, 0, 0, 0, 45, 1),
(2363, 0, 0, 0, 'Fountain Street 15', 0, 1, 0, 0, 0, 0, 63, 2),
(2364, 0, 0, 0, 'Fountain Street 16', 0, 1, 0, 0, 0, 0, 58, 2),
(2365, 0, 0, 0, 'Fountain Street 17', 0, 1, 0, 0, 0, 0, 45, 2),
(2366, 0, 0, 0, 'Wall Street 4', 0, 1, 0, 0, 0, 0, 123, 2),
(2367, 0, 0, 0, 'Wall Street 5', 0, 1, 0, 0, 0, 0, 118, 4),
(2368, 0, 0, 0, 'Wall Street 6', 0, 1, 0, 0, 0, 0, 118, 4),
(2369, 0, 0, 0, 'Wall Street 7', 0, 1, 0, 0, 0, 0, 93, 2),
(2370, 0, 0, 0, 'Wall Street 8', 0, 1, 0, 0, 0, 0, 97, 1),
(2371, 0, 0, 0, 'Wall Street 9', 0, 1, 0, 0, 0, 0, 52, 1),
(2372, 0, 0, 0, 'Wall Street 10', 0, 1, 0, 0, 0, 0, 67, 2),
(2373, 0, 0, 0, 'Wall Street 11', 0, 1, 0, 0, 0, 0, 136, 3),
(2374, 0, 0, 0, 'Wall Street 12', 0, 1, 0, 0, 0, 0, 156, 2),
(2375, 0, 0, 1, 'Central Street 3', 0, 1, 0, 0, 0, 0, 48, 1),
(2376, 0, 0, 0, 'Central Street 4', 0, 1, 0, 0, 0, 0, 48, 1),
(2377, 0, 0, 0, 'Central Street 5', 0, 1, 0, 0, 0, 0, 148, 4),
(2378, 0, 0, 0, 'Central Street 6', 0, 1, 0, 0, 0, 0, 109, 2),
(2379, 0, 0, 0, 'Central Street 7', 0, 1, 0, 0, 0, 0, 103, 1),
(2380, 0, 0, 0, 'Central Street 8', 0, 1, 0, 0, 0, 0, 132, 1),
(2381, 0, 0, 0, 'Central Street 9', 0, 1, 0, 0, 0, 0, 49, 1),
(2382, 0, 0, 0, 'Central Street 10', 0, 1, 0, 0, 0, 0, 56, 2),
(2383, 0, 0, 1, 'Central Street 11', 0, 1, 0, 0, 0, 0, 39, 2),
(2384, 0, 1420399299, 0, 'Central Street 12', 0, 1, 0, 0, 0, 0, 60, 2),
(2385, 0, 0, 1, 'Central Street 13', 0, 1, 0, 0, 0, 0, 108, 2),
(2386, 0, 0, 0, 'Dirty House 1', 0, 1, 0, 0, 0, 0, 35, 1),
(2387, 0, 0, 1, 'Dirty House 2', 0, 1, 0, 0, 0, 0, 68, 1),
(2388, 0, 0, 0, 'Theater Avenue 5a', 450, 4, 0, 0, 0, 0, 20, 1),
(2389, 0, 0, 0, 'Dirty House 4', 0, 1, 0, 0, 0, 0, 41, 1),
(2390, 0, 0, 0, 'Wall Street 13', 0, 1, 0, 0, 0, 0, 86, 2),
(2391, 0, 0, 0, 'Theater Avenue 5d', 450, 4, 0, 0, 0, 0, 16, 1),
(2392, 0, 0, 1, 'Harbor, Flat 1', 0, 1, 0, 0, 0, 0, 75, 1),
(2393, 0, 0, 0, 'Harbor, Flat 2', 0, 1, 0, 0, 0, 0, 83, 0),
(2394, 0, 0, 0, 'Harbor, Flat 3', 0, 1, 0, 0, 0, 0, 104, 1),
(2395, 0, 0, 0, 'Harbor, Flat 4', 0, 1, 0, 0, 0, 0, 78, 1),
(2396, 0, 0, 0, 'Harbor, Flat 5', 0, 1, 0, 0, 0, 0, 61, 1),
(2397, 0, 0, 0, 'Harbor, Flat 6', 0, 1, 0, 0, 0, 0, 159, 1),
(2398, 0, 0, 0, 'Harbor, Flat 7', 0, 1, 0, 0, 0, 0, 88, 1),
(2399, 0, 0, 0, 'Harbor, Flat 8', 0, 1, 0, 0, 0, 0, 92, 1),
(2400, 0, 0, 0, 'Harbor, Flat 9', 0, 1, 0, 0, 0, 0, 93, 1),
(2401, 0, 0, 0, 'Harbor, Flat 10', 0, 1, 0, 0, 0, 0, 63, 2),
(2402, 0, 0, 0, 'Harbor, Flat 11', 0, 1, 0, 0, 0, 0, 65, 1),
(2403, 0, 0, 0, 'Lighthouse', 0, 1, 0, 0, 0, 0, 132, 2),
(2404, 0, 0, 0, 'Dirty House 3', 0, 1, 0, 0, 0, 0, 40, 1),
(2405, 0, 0, 0, 'Vanward Flats B', 0, 30, 0, 0, 0, 0, 183, 4),
(2406, 0, 0, 0, 'Wallside Lane 1', 0, 30, 0, 0, 0, 0, 222, 4),
(2407, 0, 0, 0, 'Wallside Lane 2', 0, 30, 0, 0, 0, 0, 248, 4),
(2408, 0, 0, 0, 'Wallside Residence', 0, 30, 0, 0, 0, 0, 175, 4),
(2409, 0, 0, 0, 'Rathleton Hills Estate', 0, 30, 0, 0, 0, 0, 660, 13),
(2410, 0, 0, 0, 'Bronze Brothers Bastion', 0, 30, 0, 0, 0, 0, 1001, 15),
(2411, 0, 0, 0, 'Upper Barracks 4', 210, 3, 0, 0, 0, 0, 7, 1),
(2412, 0, 0, 0, 'Upper Barracks 5', 210, 3, 0, 0, 0, 0, 7, 1),
(2413, 0, 0, 0, 'Upper Barracks 6', 210, 3, 0, 0, 0, 0, 7, 1),
(2414, 0, 0, 0, 'Upper Barracks 7', 210, 3, 0, 0, 0, 0, 7, 1),
(2415, 0, 0, 0, 'Upper Barracks 8', 210, 3, 0, 0, 0, 0, 7, 1),
(2416, 0, 0, 0, 'Upper Barracks 9', 210, 3, 0, 0, 0, 0, 7, 1),
(2417, 0, 0, 0, 'Upper Barracks 10', 210, 3, 0, 0, 0, 0, 7, 1),
(2418, 0, 0, 0, 'Upper Barracks 11', 210, 3, 0, 0, 0, 0, 7, 1),
(2419, 0, 0, 0, 'Upper Barracks 12', 210, 3, 0, 0, 0, 0, 7, 1),
(2420, 0, 0, 0, 'Low Waters Observatory', 17165, 9, 0, 0, 0, 0, 739, 15),
(2421, 0, 0, 0, 'Eastern House of Tranquility', 11120, 14, 0, 0, 0, 0, 268, 5),
(2422, 0, 0, 0, 'Mammoth House', 9300, 12, 0, 0, 0, 0, 176, 6),
(2424, 0, 0, 0, 'VIP House 1', 2000, 32, 0, 0, 0, 0, 50, 1),
(2425, 0, 0, 0, 'VIP House 2', 2000, 32, 0, 0, 0, 0, 12, 1),
(2426, 0, 0, 0, 'VIP House 3', 2000, 32, 0, 0, 0, 0, 12, 1),
(2427, 0, 0, 0, 'VIP House 4', 2000, 32, 0, 0, 0, 0, 15, 1),
(2428, 0, 0, 0, 'VIP House 5', 2000, 32, 0, 0, 0, 0, 12, 1),
(2429, 0, 0, 0, 'VIP House 6', 2000, 32, 0, 0, 0, 0, 14, 1),
(2430, 0, 0, 0, 'VIP House 7', 2000, 32, 0, 0, 0, 0, 13, 1),
(2431, 0, 0, 0, 'VIP House 8', 2000, 32, 0, 0, 0, 0, 35, 1),
(2432, 0, 0, 0, 'VIP House 9', 2000, 32, 0, 0, 0, 0, 39, 1),
(2433, 0, 0, 0, 'VIP House 10', 2000, 32, 0, 0, 0, 0, 36, 1),
(2434, 0, 0, 0, 'VIP House 11', 2000, 32, 0, 0, 0, 0, 38, 1),
(2435, 0, 0, 0, 'VIP House 12', 2000, 32, 0, 0, 0, 0, 35, 0),
(2436, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 40, 0),
(2437, 0, 0, 0, 'VIP House 13', 2000, 0, 0, 0, 0, 0, 40, 0),
(2438, 0, 0, 0, 'VIP House 14', 2000, 0, 0, 0, 0, 0, 32, 1),
(2439, 0, 0, 0, 'VIP House 15', 2000, 0, 0, 0, 0, 0, 20, 1),
(2440, 0, 0, 0, 'VIP House 16', 2000, 0, 0, 0, 0, 0, 30, 1),
(2441, 0, 0, 0, 'VIP House 17', 2000, 0, 0, 0, 0, 0, 20, 1),
(2442, 0, 0, 0, 'VIP House 18', 2000, 0, 0, 0, 0, 0, 24, 1),
(2443, 0, 0, 0, 'VIP House 19', 2000, 0, 0, 0, 0, 0, 52, 1),
(2444, 0, 0, 0, 'VIP House 20', 2000, 0, 0, 0, 0, 0, 44, 1),
(2445, 0, 0, 0, 'VIP House 21', 2000, 0, 0, 0, 0, 0, 24, 1),
(2446, 0, 0, 0, 'VIP House 22', 2000, 0, 0, 0, 0, 0, 10, 0),
(2447, 0, 0, 0, 'VIP House 23', 2000, 0, 0, 0, 0, 0, 22, 1),
(2448, 0, 0, 0, 'VIP House 24', 2000, 0, 0, 0, 0, 0, 56, 2),
(2449, 0, 0, 0, 'VIP House 25', 2000, 0, 0, 0, 0, 0, 128, 1),
(2450, 0, 0, 0, 'VIP House 26', 2000, 0, 0, 0, 0, 0, 133, 0),
(2451, 0, 0, 0, 'VIP House 27', 2000, 0, 0, 0, 0, 0, 21, 0),
(2452, 0, 0, 0, 'VIP House 28', 2000, 0, 0, 0, 0, 0, 21, 0),
(2453, 0, 0, 0, 'VIP House 29', 2000, 0, 0, 0, 0, 0, 43, 2),
(2454, 0, 0, 0, 'VIP House 30', 2000, 0, 0, 0, 0, 0, 39, 1),
(2455, 0, 0, 0, 'VIP House 31', 2000, 0, 0, 0, 0, 0, 108, 0),
(2456, 0, 0, 0, 'VIP House 32', 2000, 32, 0, 0, 0, 0, 52, 1),
(2457, 0, 0, 0, 'VIP House 33', 2000, 32, 0, 0, 0, 0, 24, 1),
(2458, 0, 0, 0, 'VIP House 34', 2000, 32, 0, 0, 0, 0, 24, 1),
(2459, 0, 0, 0, 'VIP House 35', 2000, 32, 0, 0, 0, 0, 27, 1),
(2460, 0, 0, 0, 'VIP House 36', 2000, 32, 0, 0, 0, 0, 15, 1),
(2461, 0, 0, 0, 'VIP House 37', 2000, 32, 0, 0, 0, 0, 12, 1),
(2462, 0, 0, 0, 'VIP House 38', 2000, 32, 0, 0, 0, 0, 15, 1),
(2463, 0, 0, 0, 'VIP House 39', 2000, 32, 0, 0, 0, 0, 12, 1),
(2464, 0, 0, 0, 'VIP House 40', 2000, 32, 0, 0, 0, 0, 34, 1),
(2465, 0, 0, 0, 'VIP House 41', 2000, 32, 0, 0, 0, 0, 28, 1),
(2466, 0, 0, 0, 'VIP House 42', 3000, 32, 0, 0, 0, 0, 70, 4),
(2467, 0, 0, 0, 'VIP House 43', 5000, 32, 0, 0, 0, 0, 282, 2),
(2468, 0, 0, 0, 'VIP House 44', 2000, 32, 0, 0, 0, 0, 41, 1),
(2469, 0, 0, 0, 'VIP House 45', 2000, 32, 0, 0, 0, 0, 57, 1),
(2470, 0, 0, 0, 'VIP House 46', 2000, 32, 0, 0, 0, 0, 316, 2),
(2471, 0, 0, 0, 'VIP House 47', 2000, 32, 0, 0, 0, 0, 332, 5),
(2472, 0, 0, 0, 'Thais House DP 1', 1000, 2, 0, 0, 0, 0, 40, 0),
(2473, 0, 0, 0, 'Thais House DP 2', 1000, 2, 0, 0, 0, 0, 50, 0),
(2474, 0, 0, 0, 'Thais House DP 3', 1000, 2, 0, 0, 0, 0, 50, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `house_lists`
--

CREATE TABLE `house_lists` (
  `house_id` int(11) NOT NULL,
  `listid` int(11) NOT NULL,
  `list` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `house_lists`
--

INSERT INTO `house_lists` (`house_id`, `listid`, `list`) VALUES
(95, 257, 'foolish\'wanker\niaccept\'terms\n'),
(1711, 257, 'Sotero');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ip_bans`
--

CREATE TABLE `ip_bans` (
  `ip` int(10) UNSIGNED NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expires_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `live_casts`
--

CREATE TABLE `live_casts` (
  `player_id` int(11) NOT NULL,
  `cast_name` varchar(255) NOT NULL,
  `password` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `spectators` smallint(5) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `market_history`
--

CREATE TABLE `market_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `player_id` int(11) NOT NULL,
  `sale` tinyint(1) NOT NULL DEFAULT '0',
  `itemtype` int(10) UNSIGNED NOT NULL,
  `amount` smallint(5) UNSIGNED NOT NULL,
  `price` int(10) UNSIGNED NOT NULL DEFAULT '0',
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
  `sale` tinyint(1) NOT NULL DEFAULT '0',
  `itemtype` int(10) UNSIGNED NOT NULL,
  `amount` smallint(5) UNSIGNED NOT NULL,
  `created` bigint(20) UNSIGNED NOT NULL,
  `anonymous` tinyint(1) NOT NULL DEFAULT '0',
  `price` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL DEFAULT '1',
  `account_id` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '1',
  `vocation` int(11) NOT NULL DEFAULT '0',
  `health` int(11) NOT NULL DEFAULT '150',
  `healthmax` int(11) NOT NULL DEFAULT '150',
  `experience` bigint(20) NOT NULL DEFAULT '0',
  `lookbody` int(11) NOT NULL DEFAULT '0',
  `lookfeet` int(11) NOT NULL DEFAULT '0',
  `lookhead` int(11) NOT NULL DEFAULT '0',
  `looklegs` int(11) NOT NULL DEFAULT '0',
  `looktype` int(11) NOT NULL DEFAULT '136',
  `lookaddons` int(11) NOT NULL DEFAULT '0',
  `maglevel` int(11) NOT NULL DEFAULT '0',
  `mana` int(11) NOT NULL DEFAULT '0',
  `manamax` int(11) NOT NULL DEFAULT '0',
  `manaspent` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `soul` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `town_id` int(11) NOT NULL DEFAULT '0',
  `posx` int(11) NOT NULL DEFAULT '0',
  `posy` int(11) NOT NULL DEFAULT '0',
  `posz` int(11) NOT NULL DEFAULT '0',
  `conditions` blob NOT NULL,
  `cap` int(11) NOT NULL DEFAULT '0',
  `sex` int(11) NOT NULL DEFAULT '0',
  `lastlogin` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `lastip` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `save` tinyint(1) NOT NULL DEFAULT '1',
  `skull` tinyint(1) NOT NULL DEFAULT '0',
  `skulltime` int(11) NOT NULL DEFAULT '0',
  `lastlogout` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `blessings` tinyint(2) NOT NULL DEFAULT '0',
  `onlinetime` int(11) NOT NULL DEFAULT '0',
  `deletion` bigint(15) NOT NULL DEFAULT '0',
  `balance` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `offlinetraining_time` smallint(5) UNSIGNED NOT NULL DEFAULT '43200',
  `offlinetraining_skill` int(11) NOT NULL DEFAULT '-1',
  `stamina` smallint(5) UNSIGNED NOT NULL DEFAULT '2520',
  `skill_fist` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `skill_fist_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_club` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `skill_club_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_sword` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `skill_sword_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_axe` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `skill_axe_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_dist` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `skill_dist_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_shielding` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `skill_shielding_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_fishing` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `skill_fishing_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `comment` text NOT NULL,
  `create_ip` int(11) NOT NULL DEFAULT '0',
  `create_date` int(11) NOT NULL DEFAULT '0',
  `hide_char` int(11) NOT NULL DEFAULT '0',
  `cast` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `players`
--

INSERT INTO `players` (`id`, `name`, `group_id`, `account_id`, `level`, `vocation`, `health`, `healthmax`, `experience`, `lookbody`, `lookfeet`, `lookhead`, `looklegs`, `looktype`, `lookaddons`, `maglevel`, `mana`, `manamax`, `manaspent`, `soul`, `town_id`, `posx`, `posy`, `posz`, `conditions`, `cap`, `sex`, `lastlogin`, `lastip`, `save`, `skull`, `skulltime`, `lastlogout`, `blessings`, `onlinetime`, `deletion`, `balance`, `offlinetraining_time`, `offlinetraining_skill`, `stamina`, `skill_fist`, `skill_fist_tries`, `skill_club`, `skill_club_tries`, `skill_sword`, `skill_sword_tries`, `skill_axe`, `skill_axe_tries`, `skill_dist`, `skill_dist_tries`, `skill_shielding`, `skill_shielding_tries`, `skill_fishing`, `skill_fishing_tries`, `deleted`, `description`, `comment`, `create_ip`, `create_date`, `hide_char`, `cast`) VALUES
(2, 'Rook Sample', 1, 1, 1, 0, 150, 150, 0, 0, 0, 0, 0, 128, 0, 0, 0, 0, 0, 0, 2, 1175, 1172, 7, '', 500, 0, 1407021967, 1793873073, 1, 0, 0, 1407021968, 0, 203, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, '', '', 0, 0, 0, 0),
(3, 'Sorcerer Sample', 1, 1, 8, 1, 185, 185, 4200, 0, 0, 0, 0, 128, 0, 0, 35, 35, 0, 100, 2, 0, 0, 0, '', 500, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, '', '', 0, 0, 0, 0),
(4, 'Druid Sample', 1, 1, 8, 2, 185, 185, 4200, 0, 0, 0, 0, 128, 0, 0, 35, 35, 0, 100, 2, 32097, 32219, 7, 0x010004000002ffffffff0360ea00001a001b00000000fe, 500, 0, 1407021516, 255183537, 1, 0, 0, 1407021548, 0, 32, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, '', '', 0, 0, 0, 0),
(5, 'Paladin Sample', 1, 1, 8, 3, 185, 185, 4200, 0, 0, 0, 0, 128, 0, 0, 35, 35, 0, 100, 2, 0, 0, 0, '', 500, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, '', '', 0, 0, 0, 0),
(6, 'Knight Sample', 1, 1, 8, 4, 185, 185, 4200, 0, 0, 0, 0, 128, 0, 0, 35, 35, 0, 100, 2, 0, 0, 0, '', 500, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, '', '', 0, 0, 0, 0),
(1715, 'Account Manager', 1, 1, 8, 0, 185, 185, 4200, 44, 98, 15, 76, 128, 0, 0, 35, 35, 0, 100, 1, 0, 0, 0, '', 420, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, '', '', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `players_online`
--

CREATE TABLE `players_online` (
  `player_id` int(11) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `players_online`
--

INSERT INTO `players_online` (`player_id`) VALUES
(1809),
(1839);

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_deaths`
--

CREATE TABLE `player_deaths` (
  `player_id` int(11) NOT NULL,
  `time` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '1',
  `killed_by` varchar(255) NOT NULL,
  `is_player` tinyint(1) NOT NULL DEFAULT '1',
  `mostdamage_by` varchar(100) NOT NULL,
  `mostdamage_is_player` tinyint(1) NOT NULL DEFAULT '0',
  `unjustified` tinyint(1) NOT NULL DEFAULT '0',
  `mostdamage_unjustified` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_depotitems`
--

CREATE TABLE `player_depotitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL COMMENT 'any given range eg 0-100 will be reserved for depot lockers and all > 100 will be then normal items inside depots',
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` smallint(6) NOT NULL,
  `count` smallint(5) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_inboxitems`
--

CREATE TABLE `player_inboxitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` smallint(6) NOT NULL,
  `count` smallint(5) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_items`
--

CREATE TABLE `player_items` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `pid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `itemtype` smallint(6) NOT NULL DEFAULT '0',
  `count` smallint(5) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_namelocks`
--

CREATE TABLE `player_namelocks` (
  `player_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `namelocked_at` bigint(20) NOT NULL,
  `namelocked_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_rewards`
--

CREATE TABLE `player_rewards` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` smallint(6) NOT NULL,
  `count` smallint(5) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Estrutura da tabela `player_storage`
--

CREATE TABLE `player_storage` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `key` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `server_config`
--

CREATE TABLE `server_config` (
  `config` varchar(50) NOT NULL,
  `value` varchar(256) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `server_config`
--

INSERT INTO `server_config` (`config`, `value`) VALUES
('db_version', '20'),
('motd_hash', 'ffca569ea249663bf80dc5b340335bd3934c8c38'),
('motd_num', '5'),
('players_record', '19');

-- --------------------------------------------------------

--
-- Estrutura da tabela `store_history`
--

CREATE TABLE `store_history` (
  `account_id` int(11) NOT NULL,
  `mode` smallint(2) NOT NULL DEFAULT '0',
  `description` varchar(3500) NOT NULL,
  `coin_amount` int(12) NOT NULL,
  `time` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tile_store`
--

CREATE TABLE `tile_store` (
  `house_id` int(11) NOT NULL,
  `data` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tile_store`
--

INSERT INTO `tile_store` (`house_id`, `data`) VALUES
(1, 0x9c006a000701000000711800),
(6, 0xba0027000701000000d32300),
(6, 0xb90028000701000000d52300),
(6, 0xbe0029000701000000e40400),
(6, 0xb9002d000701000000d52300),
(6, 0xba0031000701000000e40400),
(42, 0x80003e000701000000f82800),
(42, 0x82003e000701000000711800),
(42, 0x84003e000701000000f82800),
(42, 0x7e0040000701000000f92800),
(42, 0x7e0042000701000000f92800),
(42, 0x800044000701000000fa2800),
(42, 0x840044000701000000fa2800),
(43, 0x81003c0005010000001a2800),
(43, 0x8200420005010000001a2800),
(43, 0x810042000601000000182800),
(43, 0x820042000601000000c50400),
(43, 0x840041000601000000192800),
(56, 0x7b003f000401000000f92800),
(56, 0x7b0043000501000000f92800),
(56, 0x7b0043000601000000f92800),
(56, 0x7b00430007010000006f1800),
(56, 0x750045000501000000f92800),
(56, 0x750044000701000000f92800),
(56, 0x7b0045000401000000f92800),
(56, 0x7b0047000501000000f92800),
(56, 0x7900460006010000006d1800),
(56, 0x7900460007010000006d1800),
(56, 0x7500480008010000006f1800),
(91, 0x8600320005010000006f1800),
(91, 0x800034000501000000711800),
(95, 0xa2002a000801000000e62600),
(95, 0xa3002a000801000000410700),
(95, 0xa3002b000801000000df171703000000ae1c1714000000b42200b42200a809070b005b61726d3a202b3136255d181c005b666c61776c6573735d206d6167696320706c6174652061726d6f721f1300000000b72200d20900b72200321e00321e00663100663100663100663100b52200262c00262c00850f00c92200bd0900570a070b005b61726d3a202b3333255d180f006570696320706c617465206c6567731f0900000000c8220000d3071710000000c72200c42200282c00282c00282c070b005b61726d3a202b3131255d1815005b666c61776c6573735d205a616f616e206c6567731f0800000000ab0900bc0900c62200c52200271d00c82200d62200c52200c72200b12200a1220000d30717000000000000),
(95, 0xa4002a000801000000e62600),
(95, 0xa4002b000802000000400800452800),
(95, 0xa5002a000801000000410700),
(95, 0xa5002b000801000000d206170a000000d30717140000003717003717003717003717003717004008001f17000f1d0f0100921900b01600fb3300fb3300fb33000f17000f1700c00700c20700400800f6570f0200f5570f0200006b08000e58003e09006e0800921900e234007c570f0c0067080f1c009e130f060000),
(95, 0xa6002a000801000000e62600),
(95, 0xa6002b000801000000d206170a00000064190f640064190f640064190f64006b08006e08006b08006e08006b08006b080064190f440000),
(95, 0xa7002a000801000000410700),
(95, 0xa7002b000801000000452800),
(95, 0xa8002a000801000000e62600),
(95, 0xa9002a000801000000410700),
(95, 0xa9002b000801000000474f170000000000),
(95, 0xaa002b000801000000494f1702000000d4071714000000ce07170000000000d007170000000000cf07170000000000a12200a12200a12200a12200a12200a12200a322070b005b61726d3a202b3133255d1816005b666c61776c6573735d20647261676f6e20726f62651f0d00000000a32200a32200a32200a32200b12200b12200b12200b12200b12200b1220000640f17010000005b2c000000),
(95, 0xa2002c000801000000de1717040000002e261714000000e02200e02200e02200e02200e0220094220094220094220094220094220710005b61636375726163793a202b3133255d1817005b61636375726174655d2074686520646576696c65796520ef00942200dc1c00922200922200922200ed1c00201d00e02200da1c002a2c0000d20717040000009222002a2c002a2c0049090717005b6465663a202b3436255d0a5b61746b3a202b3439255d181a006c6567656e646172792074776f2068616e6465642073776f72641c2c0000001d240000000000d3071714000000081d009322009709070b005b61746b3a202b3331255d180d00657069632063726f7373626f771c0000000000932200091d00912200071d006f0900960900932200071d00071d00071d00071d00071d009522008f090095220095220095220000d3071711000000ed1c002a2c002a2c009522009809071c005b61746b3a202b3231255d0a5b61636375726163793a202b3231255d1819005b61636375726174655d5b7368617270656e65645d20626f771c0000000020000095220080470f0100091d00d82200d822008f0900942200932200922200071d00e022009522000000),
(95, 0xa5002c00080100000070080f6400),
(95, 0xa5002d000801000000061d0717005b61746b3a202b3431255d0a5b6465663a202b3239255d1815006570696320647261676f6e626f6e652073746166661c310000001d1700000000),
(95, 0xa5002e000801000000721800),
(95, 0xa6002c00080100000070080f3200),
(120, 0xfd013e000c01000000e10400),
(121, 0xfd013e000b01000000e10400),
(122, 0x02024b000c01000000e10400),
(123, 0x030259000c010000008d1500),
(124, 0x000258000b01000000e50400),
(125, 0xfb014a000b01000000e50400),
(126, 0x030266000c010000008d1500),
(128, 0x000266000b01000000e40400),
(129, 0xbd0021000701000000e40400),
(129, 0xc0001f0007010000008b1500),
(129, 0xc20021000701000000e40400),
(133, 0xc20033000701000000e40400),
(137, 0xc800260007010000002c1900),
(137, 0xca0026000701000000711800),
(137, 0xcb00260007010000002c1900),
(139, 0xc700230006010000002d1900),
(139, 0xd10026000701000000711800),
(139, 0xd200260007010000002c1900),
(139, 0xd400240007010000002d1900),
(140, 0xcf00260006010000002c1900),
(140, 0xd400220006010000002d1900),
(140, 0xd20026000601000000711800),
(140, 0xd400240006010000002d1900),
(141, 0xc800260006010000002c1900),
(141, 0xc90026000601000000711800),
(141, 0xcc00260006010000002c1900),
(209, 0x6600dc020701000000a11400),
(210, 0x6700d40207010000009e1400),
(211, 0x6800e30207010000009e1400),
(212, 0x7600e0020701000000fc1300),
(213, 0x7600d6020701000000fc1300),
(214, 0x7900dd020601000000051400),
(215, 0x7900da020601000000051400),
(216, 0x7500cc020601000000051400),
(216, 0x7700ce020601000000fc1300),
(216, 0x7800cf020701000000fc1300),
(216, 0x7a00ce020701000000051400),
(216, 0x7500d1020701000000051400),
(216, 0x7700d2020701000000fc1300),
(217, 0x8a00cd020601000000051400),
(218, 0x8500d0020701000000fc1300),
(219, 0x8a00d0020701000000fc1300),
(220, 0x8000d9020701000000051400),
(221, 0x7700e6020701000000fc1300),
(222, 0x7300f2020701000000fc1300),
(222, 0x7500f9020701000000fc1300),
(223, 0x7700f5020601000000051400),
(224, 0x9300eb020701000000051400),
(225, 0x9500d5020701000000051400),
(569, 0x7d026b020701000000e00600),
(569, 0x7e026b020701000000e10600),
(569, 0x78026d020601000000741b00),
(569, 0x7b026f020601000000731b00),
(569, 0x7a026f020701000000ee1a00),
(569, 0x7e026f020601000000731b00),
(569, 0x7f026d020601000000f71a00),
(569, 0x7c026d020701000000f71a00),
(569, 0x7d026e020701000000e00600),
(569, 0x7e026e020701000000e10600),
(569, 0x81026b020701000000da0600),
(569, 0x80026e020701000000e00600),
(569, 0x80026f020701000000731b00),
(569, 0x81026c020701000000db0600),
(569, 0x81026e020701000000e10600),
(570, 0x7c0275020701000000e00600),
(570, 0x7d0275020701000000e10600),
(570, 0x7e0277020701000000ee1a00),
(570, 0x7f0275020701000000e00600),
(570, 0x7b0279020701000000f71a00),
(570, 0x7e027b020701000000ee1a00),
(570, 0x7e027e020701000000731b00),
(570, 0x7f027c020701000000e00600),
(570, 0x7f027d020701000000e00600),
(570, 0x800275020701000000e10600),
(570, 0x810276020701000000741b00),
(570, 0x810279020701000000741b00),
(570, 0x80027c020701000000e10600),
(570, 0x80027d020701000000e10600),
(571, 0x890273020601000000e00600),
(571, 0x8a0273020601000000e10600),
(571, 0x870274020601000000ee1a00),
(571, 0x860274020701000000da0600),
(571, 0x860275020701000000db0600),
(571, 0x870274020701000000da0600),
(571, 0x870275020701000000db0600),
(571, 0x8b0277020601000000741b00),
(571, 0x8a0276020701000000ee1a00),
(571, 0x8b0274020701000000741b00),
(571, 0x880279020601000000ee1a00),
(571, 0x8b0279020701000000741b00),
(571, 0x8b027b020701000000f71a00),
(571, 0x87027c020701000000731b00),
(571, 0x8a027c020701000000731b00),
(572, 0x8f0277020601000000741b00),
(572, 0x8f0278020701000000f71a00),
(572, 0x930274020601000000741b00),
(572, 0x930277020601000000741b00),
(572, 0x900274020701000000da0600),
(572, 0x900275020701000000db0600),
(572, 0x910276020701000000ee1a00),
(572, 0x920274020701000000da0600),
(572, 0x920275020701000000db0600),
(572, 0x930274020701000000741b00),
(572, 0x920279020601000000ee1a00),
(572, 0x900279020701000000680600),
(572, 0x930279020701000000741b00),
(572, 0x91027c020701000000ee1a00),
(573, 0x980276020701000000e00600),
(573, 0x990276020701000000e10600),
(573, 0x98027a020701000000e00600),
(573, 0x99027a020701000000e10600),
(573, 0x9a0278020701000000f71a00),
(573, 0x9c027b020701000000ee1a00),
(573, 0x98027f020701000000f71a00),
(573, 0x9f027e020701000000741b00),
(573, 0xa00277020701000000741b00),
(573, 0xa00279020701000000741b00),
(573, 0x9c0280020701000000731b00),
(574, 0x6f0274020601000000e00600),
(574, 0x6f0276020601000000da0600),
(574, 0x6f0277020601000000db0600),
(574, 0x6b027b020601000000e00600),
(574, 0x6c027b020601000000e10600),
(574, 0x6e0278020701000000f71a00),
(574, 0x6a027e020701000000741b00),
(574, 0x6e027c020601000000f71a00),
(574, 0x6c027f020701000000da0600),
(574, 0x6d027f020701000000da0600),
(574, 0x6e027c020701000000f71a00),
(574, 0x700274020601000000e10600),
(574, 0x700276020601000000da0600),
(574, 0x700277020601000000db0600),
(574, 0x730274020601000000e00600),
(574, 0x730275020601000000e00600),
(574, 0x730277020601000000e00600),
(574, 0x700276020701000000ee1a00),
(574, 0x730274020701000000e00600),
(574, 0x730275020701000000e00600),
(574, 0x730277020701000000e00600),
(574, 0x740274020601000000e10600),
(574, 0x740275020601000000e10600),
(574, 0x740277020601000000e10600),
(574, 0x750276020601000000741b00),
(574, 0x740274020701000000e10600),
(574, 0x740275020701000000e10600),
(574, 0x740277020701000000e10600),
(574, 0x71027b020601000000f71a00),
(574, 0x730278020601000000e00600),
(574, 0x730278020701000000e00600),
(574, 0x740278020601000000e10600),
(574, 0x75027b020601000000741b00),
(574, 0x740278020701000000e10600),
(574, 0x70027e020601000000731b00),
(574, 0x72027c020601000000da0600),
(574, 0x72027d020601000000db0600),
(574, 0x73027c020601000000da0600),
(574, 0x73027d020601000000db0600),
(574, 0x70027e020701000000731b00),
(574, 0x71027c020701000000f71a00),
(574, 0x73027c020701000000da0600),
(574, 0x73027d020701000000db0600),
(574, 0x73027e020701000000731b00),
(574, 0x74027c020601000000da0600),
(574, 0x74027d020601000000db0600),
(574, 0x74027c020701000000da0600),
(574, 0x74027d020701000000db0600),
(574, 0x6b0280020601000000e00600),
(574, 0x6c0280020601000000e10600),
(574, 0x6c0280020701000000db0600),
(574, 0x6d0280020701000000db0600),
(575, 0x740286020701000000da0600),
(575, 0x740287020701000000db0600),
(575, 0x750286020701000000da0600),
(575, 0x750287020701000000db0600),
(575, 0x780286020701000000f71a00),
(575, 0x7e0286020701000000f71a00),
(576, 0x690287020701000000f71a00),
(576, 0x6e0289020601000000ee1a00),
(576, 0x6d0288020701000000ee1a00),
(576, 0x6e028b020701000000731b00),
(576, 0x700287020601000000741b00),
(577, 0x5a0276020701000000e00600),
(577, 0x5b0276020701000000e10600),
(577, 0x5b0279020701000000da0600),
(577, 0x5b027a020701000000db0600),
(577, 0x5c027b020601000000731b00),
(577, 0x5f027b020601000000731b00),
(577, 0x5c0278020701000000f71a00),
(577, 0x5f027b020701000000731b00),
(577, 0x610277020601000000741b00),
(577, 0x610279020601000000741b00),
(577, 0x610278020701000000f71a00),
(578, 0x60027f020701000000f71a00),
(578, 0x5f0280020701000000da0600),
(578, 0x5f0281020701000000db0600),
(578, 0x5f0282020701000000731b00),
(578, 0x630282020701000000731b00),
(578, 0x650280020701000000f71a00),
(579, 0x5e0285020601000000e00600),
(579, 0x5f0285020601000000e10600),
(579, 0x5e0289020601000000da0600),
(579, 0x5e028a020601000000db0600),
(579, 0x5f0289020601000000da0600),
(579, 0x5f028a020601000000db0600),
(579, 0x600286020601000000f71a00),
(579, 0x620287020601000000ee1a00),
(579, 0x60028b020601000000731b00),
(579, 0x62028b020601000000731b00),
(579, 0x60028b020701000000731b00),
(579, 0x620288020701000000f71a00),
(579, 0x640288020701000000f71a00),
(579, 0x64028a020701000000741b00),
(580, 0x58028b020701000000f71a00),
(580, 0x56028f020701000000ee1a00),
(580, 0x59028d020701000000da0600),
(580, 0x59028e020701000000db0600),
(580, 0x5b028c020701000000741b00),
(581, 0x540283020701000000f71a00),
(581, 0x570285020701000000f71a00),
(581, 0x580284020701000000e00600),
(581, 0x590284020701000000e10600),
(581, 0x5a0285020701000000741b00),
(584, 0x480278020601000000da0600),
(584, 0x480279020601000000db0600),
(584, 0x48027b020601000000e00600),
(584, 0x490278020601000000da0600),
(584, 0x490279020601000000db0600),
(584, 0x49027b020601000000e10600),
(584, 0x4d0278020601000000f71a00),
(584, 0x4a027d020601000000731b00),
(584, 0x4d027c020601000000f71a00),
(584, 0x4f027d020601000000ee1a00),
(584, 0x52027a020601000000f71a00),
(585, 0x3c027b020701000000da0600),
(585, 0x3e027b020701000000da0600),
(585, 0x3c027c020701000000db0600),
(585, 0x3d027d020701000000ee1a00),
(585, 0x3e027c020701000000db0600),
(585, 0x3f027f020701000000f71a00),
(585, 0x3d0281020701000000731b00),
(585, 0x420281020701000000731b00),
(585, 0x440280020701000000f71a00),
(586, 0x370286020601000000741b00),
(586, 0x380287020601000000da0600),
(586, 0x390287020601000000da0600),
(586, 0x3c0284020601000000e00600),
(586, 0x3d0284020601000000e10600),
(586, 0x3e0286020601000000741b00),
(586, 0x3e0287020601000000f71a00),
(586, 0x3e0287020701000000f71a00),
(586, 0x380288020601000000db0600),
(586, 0x390288020601000000db0600),
(586, 0x3b0289020601000000731b00),
(586, 0x3a0289020701000000731b00),
(586, 0x410286020701000000f71a00),
(587, 0x3c028d020701000000da0600),
(587, 0x3c028e020701000000db0600),
(587, 0x3e028e020701000000f71a00),
(587, 0x44028e020701000000f71a00),
(587, 0x410291020701000000ee1a00),
(587, 0x430292020701000000da0600),
(587, 0x430293020701000000db0600),
(587, 0x410294020701000000731b00),
(588, 0x5c029a020701000000ee1a00),
(588, 0x5d0298020701000000e00600),
(588, 0x5d0299020701000000e00600),
(588, 0x5e0298020701000000e10600),
(588, 0x5e0299020701000000e10600),
(588, 0x5f029e020701000000f71a00),
(588, 0x61029b020701000000ee1a00),
(588, 0x63029a020701000000ee1a00),
(588, 0x64029b020701000000e00600),
(588, 0x65029b020701000000e10600),
(588, 0x660299020701000000741b00),
(588, 0x64029c020701000000731b00),
(588, 0x5c02a1020701000000ee1a00),
(588, 0x5e02a2020701000000da0600),
(588, 0x5e02a3020701000000db0600),
(588, 0x5d02a4020701000000731b00),
(588, 0x6102a0020701000000ee1a00),
(588, 0x6302a1020701000000ee1a00),
(588, 0x6402a0020701000000e00600),
(588, 0x6502a0020701000000e10600),
(588, 0x6602a2020701000000741b00),
(588, 0x6402a4020701000000731b00),
(589, 0x6e0295020701000000e00600),
(589, 0x6e0296020701000000e00600),
(589, 0x6f0295020701000000e10600),
(589, 0x6f0296020701000000e10600),
(589, 0x6e029a020701000000ee1a00),
(589, 0x6f029e020701000000ee1a00),
(589, 0x710297020701000000e00600),
(589, 0x720297020701000000e10600),
(589, 0x72029a020701000000ee1a00),
(589, 0x730299020701000000741b00),
(589, 0x72029e020701000000731b00),
(589, 0x73029d020701000000741b00),
(590, 0x780297020701000000731b00),
(590, 0x760298020601000000da0600),
(590, 0x760299020601000000db0600),
(590, 0x760298020701000000da0600),
(590, 0x760299020701000000db0600),
(590, 0x78029a020601000000ee1a00),
(590, 0x790298020601000000da0600),
(590, 0x790299020601000000db0600),
(590, 0x78029a020701000000ee1a00),
(590, 0x790298020701000000da0600),
(590, 0x790299020701000000db0600),
(590, 0x75029d020601000000741b00),
(590, 0x77029f020701000000ee1a00),
(590, 0x78029f020601000000731b00),
(590, 0x79029f020701000000731b00),
(590, 0x7b029d020701000000f71a00),
(590, 0x7c029f020601000000731b00),
(590, 0x7d029d020601000000f71a00),
(590, 0x7f029f020701000000731b00),
(590, 0x81029d020701000000741b00),
(591, 0x3c028d020601000000da0600),
(591, 0x3c028e020601000000db0600),
(591, 0x3e028e020601000000f71a00),
(591, 0x44028f020601000000741b00),
(591, 0x440292020601000000741b00),
(591, 0x410294020601000000731b00),
(591, 0x430294020601000000ee1a00),
(592, 0x390292020601000000e00600),
(592, 0x3a0292020601000000e10600),
(592, 0x3b0293020601000000741b00),
(592, 0x3a0296020601000000ee1a00),
(592, 0x3b0295020601000000741b00),
(592, 0x370299020601000000731b00),
(592, 0x3b0298020601000000f71a00),
(593, 0x840297020701000000da0600),
(593, 0x860297020701000000da0600),
(593, 0x840298020701000000db0600),
(593, 0x85029b020701000000ee1a00),
(593, 0x860298020701000000db0600),
(593, 0x860299020701000000da0600),
(593, 0x86029a020701000000db0600),
(593, 0x89029b020701000000ee1a00),
(593, 0x8b029a020701000000741b00),
(593, 0x85029e020701000000731b00),
(593, 0x87029e020701000000ee1a00),
(593, 0x8a029e020701000000731b00),
(594, 0x900296020701000000f71a00),
(594, 0x930295020701000000e00600),
(594, 0x930297020701000000e00600),
(594, 0x940295020701000000e10600),
(594, 0x940297020701000000e10600),
(594, 0x950297020701000000741b00),
(595, 0x90029a020701000000f71a00),
(595, 0x930299020701000000e00600),
(595, 0x940299020701000000e10600),
(595, 0x95029b020701000000741b00),
(596, 0x90029e020701000000f71a00),
(596, 0x93029f020701000000e00600),
(596, 0x94029f020701000000e10600),
(596, 0x95029f020701000000741b00),
(597, 0x9002a2020701000000f71a00),
(597, 0x9102a1020701000000e00600),
(597, 0x9202a1020701000000e10600),
(597, 0x9302a1020701000000e00600),
(597, 0x9402a1020701000000e10600),
(597, 0x9502a3020701000000741b00),
(598, 0x9002a6020701000000f71a00),
(598, 0x9302a5020701000000e00600),
(598, 0x9302a7020701000000e00600),
(598, 0x9402a5020701000000e10600),
(598, 0x9402a7020701000000e10600),
(598, 0x9502a7020701000000741b00),
(599, 0x910296020601000000f71a00),
(599, 0x920295020601000000e00600),
(599, 0x930295020601000000e10600),
(599, 0x950297020601000000741b00),
(600, 0x91029a020601000000f71a00),
(600, 0x930299020601000000e00600),
(600, 0x940299020601000000e10600),
(600, 0x95029b020601000000741b00),
(601, 0x91029e020601000000f71a00),
(601, 0x93029d020601000000e00600),
(601, 0x93029f020601000000e00600),
(601, 0x94029d020601000000e10600),
(601, 0x94029f020601000000e10600),
(601, 0x95029f020601000000741b00),
(602, 0x9102a2020601000000f71a00),
(602, 0x9302a1020601000000e00600),
(602, 0x9402a1020601000000e10600),
(602, 0x9502a3020601000000741b00),
(603, 0x9102a6020601000000f71a00),
(603, 0x9302a7020601000000e00600),
(603, 0x9402a7020601000000e10600),
(603, 0x9502a7020601000000741b00),
(604, 0x7302a6020601000000f71a00),
(604, 0x7302a5020701000000f71a00),
(604, 0x7702a6020601000000741b00),
(604, 0x7502a7020701000000e00600),
(604, 0x7602a7020701000000e10600),
(604, 0x7702a5020701000000741b00),
(604, 0x7202a9020601000000731b00),
(604, 0x7002a8020701000000f71a00),
(604, 0x7302a8020701000000f71a00),
(604, 0x7602a9020601000000731b00),
(604, 0x7502a8020701000000e00600),
(604, 0x7502a9020701000000731b00),
(604, 0x7602a8020701000000e10600),
(605, 0x7b02a4020701000000ee1a00),
(605, 0x7b02ab020701000000731b00),
(605, 0x7c02a9020701000000f71a00),
(605, 0x7e02a9020701000000e00600),
(605, 0x7e02aa020701000000e00600),
(605, 0x7e02ab020701000000731b00),
(605, 0x7f02a9020701000000e10600),
(605, 0x7f02aa020701000000e10600),
(605, 0x8002a6020701000000741b00),
(606, 0x8a02aa020701000000ee1a00),
(606, 0x8502af020601000000da0600),
(606, 0x8602af020601000000da0600),
(606, 0x8602ae020701000000ee1a00),
(606, 0x8902ac020601000000741b00),
(606, 0x8902ae020601000000f71a00),
(606, 0x8c02ac020701000000741b00),
(606, 0x8502b0020601000000db0600),
(606, 0x8602b0020601000000db0600),
(606, 0x8402b0020701000000f71a00),
(606, 0x8902b0020601000000741b00),
(606, 0x8c02b0020701000000741b00),
(607, 0x7d02ae020701000000e00600),
(607, 0x7e02ae020701000000e10600),
(607, 0x7c02b0020701000000f71a00),
(607, 0x7f02b0020701000000741b00),
(608, 0x7702b3020701000000f71a00),
(608, 0x7d02b2020701000000e00600),
(608, 0x7e02b2020701000000e10600),
(608, 0x7a02b6020701000000731b00),
(608, 0x7c02b5020701000000f71a00),
(608, 0x7e02b6020701000000731b00),
(609, 0x7a02bb020701000000da0600),
(609, 0x7d02bb020701000000da0600),
(609, 0x7902bf020701000000f71a00),
(609, 0x7a02bc020701000000db0600),
(609, 0x7c02bd020701000000ee1a00),
(609, 0x7d02bc020701000000db0600),
(609, 0x7e02bf020701000000741b00),
(609, 0x7c02c0020701000000731b00),
(609, 0x7d02c0020701000000731b00),
(610, 0x6802bb020701000000e00600),
(610, 0x6902bb020701000000e10600),
(610, 0x6802be020701000000da0600),
(610, 0x6802bf020701000000db0600),
(610, 0x6e02bc020701000000f71a00),
(610, 0x6e02bf020701000000f71a00),
(610, 0x7002bd020701000000f71a00),
(610, 0x7002bf020701000000741b00),
(610, 0x6a02c0020701000000731b00),
(611, 0x6302a7020701000000731b00),
(611, 0x6202ab020701000000e00600),
(611, 0x6302ab020701000000e10600),
(611, 0x6502a9020701000000f71a00),
(611, 0x6902a8020601000000620600),
(611, 0x6802aa020701000000ee1a00),
(611, 0x6902ab020701000000da0600),
(611, 0x6d02ab020601000000741b00),
(611, 0x6d02aa020701000000741b00),
(611, 0x6302ad020701000000e00600),
(611, 0x6402ad020701000000e10600),
(611, 0x6602ac020701000000f71a00),
(611, 0x6802ad020701000000731b00),
(611, 0x6902ac020701000000db0600),
(611, 0x6902af020701000000f71a00),
(611, 0x6d02af020701000000741b00),
(611, 0x6302b3020601000000ee1a00),
(611, 0x6702b3020601000000ee1a00),
(611, 0x6b02b3020601000000ee1a00),
(611, 0x6d02b1020601000000741b00),
(611, 0x6302b5020601000000da0600),
(611, 0x6302b6020601000000db0600),
(611, 0x6302b7020601000000731b00),
(611, 0x6302b4020701000000ee1a00),
(611, 0x6302b7020701000000731b00),
(611, 0x6402b5020601000000da0600),
(611, 0x6402b6020601000000db0600),
(611, 0x6702b5020601000000da0600),
(611, 0x6702b6020601000000db0600),
(611, 0x6702b7020601000000731b00),
(611, 0x6402b5020701000000da0600),
(611, 0x6402b6020701000000db0600),
(611, 0x6602b5020701000000da0600),
(611, 0x6602b6020701000000db0600),
(611, 0x6702b4020701000000ee1a00),
(611, 0x6702b7020701000000731b00),
(611, 0x6802b5020601000000da0600),
(611, 0x6802b6020601000000db0600),
(611, 0x6b02b5020601000000da0600),
(611, 0x6b02b6020601000000db0600),
(611, 0x6b02b7020601000000731b00),
(611, 0x6802b5020701000000da0600),
(611, 0x6802b6020701000000db0600),
(611, 0x6a02b5020701000000da0600),
(611, 0x6a02b6020701000000db0600),
(611, 0x6c02b5020601000000da0600),
(611, 0x6c02b6020601000000db0600),
(611, 0x6c02b4020701000000ee1a00),
(611, 0x6d02b5020701000000741b00),
(612, 0xa4027e020701000000a41400),
(612, 0xa5027c0207010000007c1500),
(612, 0xa6027c0207010000007d1500),
(612, 0xa6027f020701000000461900),
(612, 0xa9027f020701000000461900),
(612, 0xaa027c0207010000007e1500),
(612, 0xaa027d0207010000007f1500),
(612, 0xab027e020701000000471900),
(613, 0xa50277020701000000a41400),
(613, 0xa902750207010000007c1500),
(613, 0xa902760207010000007c1500),
(613, 0xaa02750207010000007d1500),
(613, 0xaa02760207010000007d1500),
(613, 0xab0277020701000000471900),
(614, 0xad026f0207010000007c1500),
(614, 0xae026f0207010000007d1500),
(614, 0xac0271020701000000a41400),
(614, 0xad02730207010000007c1500),
(614, 0xae02730207010000007d1500),
(614, 0xaf0274020701000000461900),
(614, 0xb00270020701000000471900),
(615, 0xab026b020701000000a41400),
(615, 0xaf026a0207010000007e1500),
(615, 0xaf026b0207010000007f1500),
(615, 0xad026c020701000000461900),
(616, 0xb4026a0207010000007e1500),
(616, 0xb4026b0207010000007f1500),
(616, 0xb8026b020701000000471900),
(616, 0xb6026d020701000000461900),
(616, 0xb7026d020701000000a61400),
(617, 0xac0265020701000000a41400),
(617, 0xad02640207010000007c1500),
(617, 0xae02640207010000007d1500),
(617, 0xae0267020701000000461900),
(617, 0xb102650207010000007e1500),
(617, 0xb102660207010000007f1500),
(617, 0xb10267020701000000461900),
(619, 0xc00050000802000000ec1300d30400),
(623, 0x790080000701000000711800),
(626, 0x9f007c000601000000632100),
(626, 0xa30074000701000000612100),
(626, 0xa40076000601000000632100),
(626, 0xa20078000601000000652100),
(626, 0xa00079000701000000632100),
(626, 0xa60078000701000000632100),
(626, 0xa0007d000701000000632100),
(626, 0xa3007e000701000000652100),
(626, 0xa6007c000601000000632100),
(626, 0xa6007d000701000000632100),
(1374, 0x1f01a70206010000001b2800),
(1374, 0x2301a60207010000001b2800),
(1374, 0x2101a9020701000000c50400),
(1376, 0x3501a3020701000000c50400),
(1377, 0x3a01a10206010000001b2800),
(1377, 0x3c01a40206010000001a2800),
(1377, 0x3c01a4020701000000c50400),
(1378, 0x3f019d020701000000c30400),
(1379, 0x440197020701000000c30400),
(1380, 0x4e01a10205010000001b2800),
(1380, 0x4c01a30206010000001a2800),
(1380, 0x4a01a40207010000001a2800),
(1381, 0x54019b020701000000c30400),
(1382, 0x4e01aa020701000000c30400),
(1382, 0x4c01ad0207010000001a2800),
(1383, 0x3701ae0207010000006c1800),
(1384, 0x2d01b30207010000002d1900),
(1384, 0x2a01b6020701000000c50400),
(1385, 0x2901bf020701000000c50400),
(1385, 0x2601c30206010000002f1900),
(1385, 0x2b01c10207010000001b2800),
(1386, 0x4301c8020701000000c30400),
(1387, 0x1901bd0205010000006d1800),
(1387, 0x1a01c0020601000000c30400),
(1388, 0x1b01ba020501000000ba0400),
(1389, 0x570190020401000000c50400),
(1389, 0x5701920204010000006c1800),
(1389, 0x5501960203010000001a2800),
(1391, 0x4c0277020701000000e00600),
(1391, 0x4d0277020701000000e10600),
(1391, 0x4f0277020701000000da0600),
(1391, 0x4b027a020701000000f71a00),
(1391, 0x4d027b020701000000da0600),
(1391, 0x4f0278020701000000db0600),
(1391, 0x49027d020701000000ee1a00),
(1391, 0x4c027d020701000000731b00),
(1391, 0x4d027c020701000000db0600),
(1391, 0x510277020701000000da0600),
(1391, 0x510278020701000000db0600),
(1391, 0x510279020701000000ee1a00),
(1391, 0x540279020701000000ee1a00),
(1391, 0x56027a020701000000741b00),
(1391, 0x52027d020701000000ee1a00),
(1391, 0x54027d020701000000731b00),
(1392, 0x7200b3000701000000db0d00),
(1393, 0x7200b9000701000000db0d00),
(1394, 0x7e00be000701000000db0d00),
(1395, 0x6b00c0000701000000db0d00),
(1396, 0x6b00c6000701000000db0d00),
(1397, 0x7100ca000701000000d20d00),
(1398, 0x7900ca000701000000d20d00),
(1399, 0x9600c9000701000000db0d00),
(1400, 0x9600cf000701000000db0d00),
(1403, 0x9800ba000701000000db0d00),
(1403, 0x9c00ba000701000000db0d00),
(1404, 0xbe004a000701000000e20400),
(1405, 0xb100220007010000008b1500),
(1406, 0xad001d0007010000008b1500),
(1407, 0xa600200007010000002d1900),
(1407, 0xa200240007010000002c1900),
(1407, 0xa30024000701000000711800),
(1408, 0x9a001e0007010000002d1900),
(1408, 0x9d0024000701000000711800),
(1408, 0x9e00240007010000002c1900),
(1666, 0x6f043b0406010000008b1500),
(1666, 0x7204360406010000008e1500),
(1666, 0x72043c0406010000008d1500),
(1674, 0x78041f0406010000008d1500),
(1699, 0xac002a000701000000251900),
(1699, 0xad002b000701000000421900),
(1699, 0xb30027000701000000241900),
(1699, 0xb1002d000701000000c50400),
(1700, 0xb7002b000601000000251900),
(1700, 0xb2002f000701000000c30400),
(1700, 0xb70032000601000000251900),
(1700, 0xb70030000701000000251900),
(1701, 0xad0032000701000000421900),
(1701, 0xad0036000601000000241900),
(1701, 0xad0036000701000000241900),
(1701, 0xb10030000701000000c50400),
(1701, 0xb50036000701000000421900),
(1711, 0x90003d00070100000062080f6400),
(1711, 0x90003e00070100000062080f6400),
(1711, 0x90003f00070100000062080f6400),
(1711, 0x91003c000701000000421900),
(1711, 0x91003d000704000000fa160f6400fa160f6400fa160f6400fa160f5e00),
(1711, 0x91003e000701000000c209070b005b61726d3a202b3136255d1817005b666c61776c6573735d20726f79616c2068656c6d65741f0a00000000),
(1711, 0x91003f000701000000580900),
(1711, 0x92003d0007020000003c170f64003c170f5900),
(1711, 0x92003e000701000000580900),
(1711, 0x92003f000701000000580900),
(1711, 0x93003d000701000000e80900),
(1711, 0x93003e0007010000005809071d005b6578747261206465663a202b3230255d0a5b6465663a202b3238255d180f006570696320666972652073776f72641d190000001e0100000000),
(1711, 0x93003f000701000000580900),
(1711, 0x94003c000701000000421900),
(1711, 0x94003d000703000000580900580900580900),
(1711, 0x94003e00070200000058090064190f0200),
(1711, 0x94003f000701000000580900),
(1711, 0x95003d000701000000550a00),
(1711, 0x95003e000701000000c20900),
(1711, 0x95003f000702000000580900f609070b005b6465663a202b3430255d180b0065706963207363797468651d0400000000),
(1711, 0x96003d0007020000009909070b005b61726d3a202b3236255d1811006570696320737465656c2068656c6d65741f07000000007808070c005b74696d653a202b3339255d10a07319001812005b756e697175655d206c6966652072696e6700),
(1711, 0x96003e000701000000580900),
(1711, 0x96003f000701000000580900),
(1711, 0x97003c000701000000421900),
(1711, 0x97003d000701000000600a070b005b61726d3a202b3137255d1814005b666c61776c6573735d20626c756520726f62651f0c00000000),
(1711, 0x97003e0007010000007d0816010000),
(1711, 0x97003f000701000000580900),
(1711, 0x98003f000701000000081400),
(1711, 0x90004000070100000062080f5700),
(1711, 0x91004000070200000058090070080f6400),
(1711, 0x92004000070200000058090070080f6400),
(1711, 0x93004000070200000058090711005b6578747261206465663a202b3238255d180f006570696320666972652073776f72641e010000000070080f6400),
(1711, 0x940040000701000000580900),
(1711, 0x950040000701000000580900),
(1711, 0x960040000701000000580900),
(1711, 0x970040000704000000580900580900580900c209070b005b61726d3a202b3135255d1817005b666c61776c6573735d20726f79616c2068656c6d65741f0a00000000),
(1712, 0x8f0043000701000000431900),
(1712, 0x8f0046000701000000431900),
(1712, 0x960044000701000000431900),
(1712, 0x960045000701000000081400),
(1712, 0x960046000701000000431900),
(1713, 0x9c003f000701000000081400),
(1713, 0x9d003c000701000000e62600),
(1713, 0x9d003d0007010000003d6000),
(1713, 0x9d003e000701000000682c00),
(1713, 0x9e003c000701000000421900),
(1713, 0x9e003d000701000000912200),
(1713, 0x9f003d000701000000bd0900),
(1713, 0xa0003c000701000000421900),
(1713, 0xa0003d000701000000321e00),
(1713, 0xa1003d000701000000141700),
(1713, 0xa2003d000701000000292c00),
(1713, 0xa3003c000701000000421900),
(1713, 0xa3003d0007010000002d2c00),
(1713, 0xa4003d000701000000ff5b16020000),
(1714, 0x9e0045000701000000081400),
(1714, 0x9e0046000701000000431900),
(1714, 0xa50042000701000000431900),
(1714, 0xa10047000701000000ff1300),
(1714, 0xa50046000701000000431900),
(1715, 0x87001a000602000000241900241900),
(1715, 0x83001e000602000000251900251900),
(1715, 0x89001f000601000000c30400),
(1715, 0x870020000601000000241900),
(1715, 0x93003e000601000000081400),
(1715, 0x95003c000502000000421900421900),
(1715, 0x970041000601000000ff1300),
(1716, 0x89001b000501000000251900),
(1716, 0x83001d000501000000251900),
(1716, 0x89001d000501000000c30400),
(1716, 0x860020000501000000241900),
(1716, 0x960042000601000000081400),
(1716, 0x910047000501000000421900),
(1716, 0x920047000501000000421900),
(1716, 0x940047000501000000421900),
(1716, 0x960044000501000000431900),
(1716, 0x960045000601000000431900),
(1717, 0xa5003f000501000000431900),
(1717, 0xa5003d000601000000431900),
(1717, 0xa5003e000601000000081400),
(1717, 0xa5003f000601000000081400),
(1718, 0x9e0045000601000000081400),
(1718, 0xa50043000601000000431900),
(1718, 0xa10047000501000000421900),
(1718, 0xa50044000501000000431900),
(1718, 0xa50044000601000000081400),
(1718, 0xa50045000601000000081400),
(1719, 0x9c00220006010000002c1900),
(1719, 0x9d0022000601000000711800),
(1720, 0xa200220006010000002c1900),
(1720, 0xa40022000601000000711800),
(1721, 0xb1001c0006010000008b1500),
(1722, 0xb1001d0005010000008b1500),
(1722, 0xb4001d000601000000d32300),
(1723, 0xb3001f0006010000008d1500),
(1724, 0xae003b0006010000002c1900),
(1724, 0xac003d0006010000002d1900),
(1724, 0xb0003c0006010000006f1800),
(1724, 0xb0003d0006010000006f1800),
(1724, 0xac00420006010000002d1900),
(1725, 0xaf0036000501000000241900),
(1725, 0xb10036000501000000c50400),
(1725, 0xb40036000501000000241900),
(1726, 0x93002e000601000000ff1300),
(1726, 0x920033000601000000ff1300),
(1727, 0x79002f000601000000f82800),
(1728, 0x7c003b000601000000711800),
(1729, 0x750033000402000000f92800f92800),
(1729, 0x7e00350003010000006f1800),
(1729, 0x7c00350004010000006f1800),
(1729, 0x750038000402000000f92800f92800),
(1730, 0xee0213040601000000c30400),
(1731, 0xeb020b040601000000c30400),
(1732, 0xcb021e040601000000c50400),
(1732, 0xcb021e040701000000c50400),
(1732, 0xcf021e040601000000c50400),
(1732, 0xcf021e040701000000c50400),
(1732, 0xd1021a040701000000bd0400),
(1732, 0xd2021e040601000000c60400),
(1732, 0xd4021e040701000000c50400),
(1732, 0xcb0221040601000000c50400),
(1732, 0xcb0221040701000000c50400),
(1732, 0xcf0221040601000000c50400),
(1732, 0xcf0221040701000000c60400),
(1732, 0xd20221040601000000c60400),
(1732, 0xd40221040701000000c60400),
(1733, 0xc8022f0407010000006c1800),
(1733, 0xcd022e0406010000006c1800),
(1733, 0xcf022e0407010000002d1900),
(1733, 0xc902320407010000002c1900),
(1733, 0xcb0232040701000000711800),
(1733, 0xcf02300406010000002d1900),
(1733, 0xcd02320407010000002c1900),
(1733, 0xcf02300407010000002d1900),
(1734, 0xc3022e0406010000006c1800),
(1734, 0xc30232040701000000711800),
(1735, 0xc30237040601000000691800),
(1735, 0xc30235040701000000711800),
(1735, 0xc302390407010000002c1900),
(1735, 0xc402390406010000002c1900),
(1735, 0xc402390407010000002c1900),
(1736, 0xcb0235040701000000711800),
(1736, 0xc902380406010000006c1800),
(1736, 0xca02390407010000006c1800),
(1736, 0xc9023d0406010000002c1900),
(1736, 0xc9023d0407010000002c1900),
(1736, 0xd0023a0407010000002d1900),
(1737, 0xdf02420407010000006f1800),
(1737, 0xd702450407010000006c1800),
(1737, 0xdf02460406010000002d1900),
(1737, 0xdc02440407010000006c1800),
(1737, 0xdf02460407010000002d1900),
(1737, 0xdc02480406010000002c1900),
(1737, 0xdd02480406010000002c1900),
(1737, 0xdc02480407010000002c1900),
(1737, 0xdd02480407010000002c1900),
(1738, 0xf80243040701000000271900),
(1738, 0xf10244040701000000271900),
(1738, 0xf10245040701000000271900),
(1738, 0xf80245040701000000ba0400),
(1738, 0xf80247040701000000271900),
(1738, 0xf40248040701000000261900),
(1738, 0xf60248040701000000261900),
(1739, 0x03032e040701000000ba0400),
(1740, 0x70002f000601000000fa2800),
(1740, 0x74002f000601000000fa2800),
(1740, 0x6d0032000601000000fb2800),
(1740, 0x6d0038000601000000fb2800),
(1740, 0x730035000601000000711800),
(1740, 0x72003a000601000000711800),
(1741, 0x6f00b9000601000000d20d00),
(1742, 0xb4003f0006010000002c1900),
(1742, 0xaf00460006010000002d1900),
(1742, 0xaf0046000701000000f92800),
(1742, 0xb30047000601000000711800),
(1742, 0xb00044000701000000711800),
(1743, 0x910020000701000000d52300),
(1743, 0x910024000701000000d52300),
(1744, 0x89001b000701000000431900),
(1744, 0x850020000701000000421900),
(1744, 0x860020000701000000ff1300),
(1745, 0x95001e000601000000d32300),
(1745, 0x910020000601000000d52300),
(1746, 0x92001e000501000000d32300),
(1747, 0x75003f000501000000f92800),
(1747, 0x7b003d000501000000f92800),
(1747, 0x7b003e0006010000006f1800),
(1747, 0x78003e0007010000002c1900),
(1747, 0x750040000601000000f92800),
(1747, 0x7b0040000501000000fb2800);

-- --------------------------------------------------------

--
-- Estrutura da tabela `videos`
--

CREATE TABLE `videos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` text NOT NULL,
  `categoria` int(11) NOT NULL,
  `link` varchar(11) NOT NULL,
  `ativo` int(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `videos_categorias`
--

CREATE TABLE `videos_categorias` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `videos_comentarios`
--

CREATE TABLE `videos_comentarios` (
  `id` int(11) NOT NULL,
  `mensagem` text NOT NULL,
  `character` varchar(255) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `topico` int(11) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ativo` int(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_forum`
--

CREATE TABLE `z_forum` (
  `id` int(11) NOT NULL,
  `first_post` int(11) NOT NULL DEFAULT '0',
  `last_post` int(11) NOT NULL DEFAULT '0',
  `section` int(3) NOT NULL DEFAULT '0',
  `replies` int(20) NOT NULL DEFAULT '0',
  `views` int(20) NOT NULL DEFAULT '0',
  `author_aid` int(20) NOT NULL DEFAULT '0',
  `author_guid` int(20) NOT NULL DEFAULT '0',
  `post_text` text NOT NULL,
  `post_topic` varchar(255) NOT NULL,
  `post_smile` tinyint(1) NOT NULL DEFAULT '0',
  `post_date` int(20) NOT NULL DEFAULT '0',
  `last_edit_aid` int(20) NOT NULL DEFAULT '0',
  `edit_date` int(20) NOT NULL DEFAULT '0',
  `post_ip` varchar(15) NOT NULL DEFAULT '0.0.0.0',
  `icon_id` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `z_forum`
--

INSERT INTO `z_forum` (`id`, `first_post`, `last_post`, `section`, `replies`, `views`, `author_aid`, `author_guid`, `post_text`, `post_topic`, `post_smile`, `post_date`, `last_edit_aid`, `edit_date`, `post_ip`, `icon_id`) VALUES
(5, 5, 1419039799, 1, 0, 102, 115, 7, '&nbsp;&nbsp;<b>~IntroduÃ§Ã£o & Sobre~</b>\r\n&nbsp;&nbsp;Thornia e um servidor real map absolutamente novo nunca foi visto online, com uma exceÃ§Ã£o da fase &nbsp;&nbsp;beta. O Objetivo do Thornia e funcionar como um servidor de Tibia alternativo para aqueles jogadores &nbsp;&nbsp;que &nbsp;&nbsp;estao a procura de um jogo mais casual independente do tempo de jogo.\r\n\r\n&nbsp;&nbsp;As rates do Thornia foram bem ajustadas para que os jogadores tenha uma experiencia em nivel &nbsp;&nbsp;superior &nbsp;&nbsp;a qualquer outro servidor, com elementos desafiadores para alcanÃ§ar novos niveis e &nbsp;&nbsp;completarem quest &nbsp;&nbsp;dificeis que foram mantidas. Esperamos ser capazes de criar um novo servidor de &nbsp;&nbsp;Open Tibia que sera &nbsp;&nbsp;capaz de competir com os servidores mais populares e por um longo tempo..\r\n\r\n&nbsp;&nbsp;<b>~InformaÃ§Ã£es Gerais~</b>\r\n&nbsp;&nbsp;<b>IP - </b> thornia.net\r\n&nbsp;&nbsp;<b>Client - </b> 10.51 <i>to</i> 10.53\r\n&nbsp;&nbsp;<b>Port - </b> 7171\r\n&nbsp;&nbsp;<b>Location - </b> Canada\r\n&nbsp;&nbsp;<b>Uptime - </b> 24/7 <i>(Com uma exceÃ§Ã£o para o server save e atualizaÃ§oes)</i>\r\n\r\n&nbsp;&nbsp;<b>~Caracteristicas & Destaques~</b>\r\n&nbsp;&nbsp;* Roshamuul & Oramond (Dark Trail e Oramond Quest)\r\n&nbsp;&nbsp;* Equipe Ativa <a href="http://www.thornia.net/index.php?subtopic=team">Support</a>\r\n&nbsp;&nbsp;* Loot com base em estatisticas do Tibia Wiki\r\n&nbsp;&nbsp;* Sistema <a href="http://www.thornia.net/index.php?subtopic=castsystem">Cast System</a>\r\n&nbsp;&nbsp;* Questlogs em 95% das quests\r\n&nbsp;&nbsp;* Eventos frequentes feitos pela equipe\r\n&nbsp;&nbsp;* Nenhum tratamento VIP/<a href="http://www.thornia.net/index.php?subtopic=shopsystem"> Shop Offer</a>\r\n&nbsp;&nbsp;* Vocations balanceadas\r\n\r\n<center><b>~Images~</b>\r\n[img]https://fbcdn-sphotos-e-a.akamaihd.net/hphotos-ak-xaf1/v/t1.0-9/1509679_346924715493643_2836808379596535975_n.png?oh=cd80413547cc3bd4b889b2bc6d5c8d99&oe=5535F78D&__gda__=1430150387_3ba8033bba2247013fc256dc5b3cbf71[/img]\r\n\r\n[img]https://fbcdn-sphotos-g-a.akamaihd.net/hphotos-ak-xap1/v/t1.0-9/10372742_346924728826975_6346638715449966546_n.png?oh=b9d56235a30ea8261a6d5c4d781173ca&oe=54FCEF03&__gda__=1426854623_61e4e3085d99cade4753d5e2e65ef88c[/img]\r\n\r\n[img]https://scontent-a-fra.xx.fbcdn.net/hphotos-xap1/v/t1.0-9/1959924_346924708826977_4434424939266771231_n.png?oh=86140a3fdab3956e2d4099ea4af1bccc&oe=54FD9594[/img]</center>\r\n\r\n&nbsp;&nbsp;Estamos ansiosos para conhecer os jogadores que vÃ£o jogar no Thoria - se voce quiser entrar em &nbsp;&nbsp;contato conosco fora do servidor, voce pode faze-lo atraves do <a href="http://www.thornia.net/index.php?subtopic=forum">Forum</a> ou do <a href="https://www.facebook.com/thorniaOT">Facebook</a>.\r\n\r\n&nbsp;&nbsp;Bem vindos ao Thornia!\r\n&nbsp;&nbsp;Team Thornia.net', 'Welcome to Thornia RPG!', 1, 1419031244, 2, 1419099695, '217.210.109.207', 0),
(9, 9, 1505521049, 1, 0, 10, 1440, 1716, 'Estamos trabalhando para montar um servidor Ãºnico e divertido para vocÃªs. \r\n<br>\r\nNo intuito de trazer algo divertido e inovador, trabalhamos com diversos sistemas e eventos. Duca, PointSystem, Novas Spells, Zumbi Event, BattleField, entre outros.\r\n<br>\r\nDiversas quests unicas, Umbral, Yalahar, DSL, com bosses prÃ³prios, que vocÃªs nunca [u]never[/u] viram por ai, um mapa elaborado e com obetivos, nÃ£o um quadrado cheio de bixo e um baÃº no final. \r\n<br>\r\nNosso servidor terÃ¡ updates constantes pois ainda nÃ£o terminamos, e nem temos previsÃ£o de terminar, serÃ¡ um projeto de constante mudanÃ§as e aventuras.  \r\n\r\n- Adicionado !autoloot\r\nex:!autoloot add,2152\r\n\r\n- Adicionado Umbral Quest, The Calamity Quest.\r\n- Adicionado Recovery Stamina nos tiles em Trainer.\r\n- Adicionado Hunts de: Demon, Asuras, Glooth Bandits, Hellfire Fighter, Dragon Lord.\r\n- Fixed portas sem level, buracos, teleports etc.\r\n- Reformulado Items VIP.\r\n- Fixed loot das Asures\r\n- Adicionado npc Alice, Heal, Bless e guide!\r\n- Adicionado Rusty Remover e outros tools ao npc.\r\n- Fixed Yalahar Quest.\r\n- Fixed outros bugs.\r\n\r\n\r\n[img]http://i.imgur.com/6FQ8QWa.png[/img]\r\n[img]http://i.imgur.com/xhzWylh.png[/img]\r\n[img]http://i.imgur.com/3CBGmHp.png[/img]\r\n[img]http://i.imgur.com/B8JO9Pk.png[/img]\r\n[img]http://i.imgur.com/nGiI2Ol.png[/img]\r\n[img]http://i.imgur.com/GBrHL4U.png[/img]\r\n[img]http://i.imgur.com/UA6r2pj.png[/img]\r\n[img]http://i.imgur.com/TICQj5x.jpg[/img]\r\n[img]http://i.imgur.com/HanpguB.jpg[/img]\r\n[img]http://i.imgur.com/k37W6uk.jpg[/img]\r\n[img]http://i.imgur.com/CHO4Nm2.jpg[/img]\r\n\r\n[b]Kind regards,\r\nThe Pausa Team.[/b]', 'Servidor Inaugurado', 0, 1505521049, 0, 0, '189.122.98.168', 0),
(10, 10, 1506011930, 1, 3, 20, 1440, 1716, 'Colocamos um sistema de [b]Stats[/b], alguns de vocÃªs jÃ¡ devem ter percebido quando dropa um loot [u][b]"*rare*"[/b][/u] e sobe um efeito, Ã© que vocÃª dropou algum loot com [b]stats[/b].\r\n\r\nPode cair atÃ© trÃªs tipos de itens.\r\n\r\n[b]- Rare\r\n- Epic\r\n- Legendary[/b]\r\n\r\nCom atributos de [b]atk, def, extra def, armor, accuracy, range, charges, time[/b] etc.\r\n\r\nUm exemplo:\r\n\r\nSe cair um time ring de uma giant spider, e cair raro com atributo em time um time ring de 10 minutos vai pra 18, se fosse um legendary ia pra 1h\r\n\r\n[b]You see a legendary magic plate armor (Arm:20). It can only be wielded properly by knights and paladins. [arm: +43%][/b]\r\n\r\nUm item desse poderia se igualar a um item VIP, a unica diferenÃ§a Ã© que o item VIP dÃ¡ skills, e defende atributos.', '- Sistema de Stats', 0, 1505577750, 0, 0, '189.122.98.168', 1),
(11, 10, 0, 1, 0, 0, 1545, 1834, 'Bom dia!\r\n\r\nComo nÃ£o dÃ¡ pra postar no forum correto (bug report), estou postando aqui;\r\nEncontrado bug na obsidian knife>nÃ£o estÃ¡ tirando nenhum skin.\r\n\r\nVou continuar a caÃ§a, cya', 'Bug - Obs Knife', 0, 1505819586, 0, 0, '191.248.145.213', 0),
(12, 10, 0, 1, 0, 0, 1545, 1834, 'https://postimg.org/image/vzeexv29h/', 'Bug - Respawn DL', 0, 1505821431, 0, 0, '191.248.145.213', 0),
(13, 10, 0, 1, 0, 0, 1550, 1839, 'tomei um hs sem sentido dentro do templo kk', 'morri dentro do templo', 0, 1506011930, 0, 0, '189.34.254.189', 0),
(14, 14, 1576465093, 1, 0, 5, 1, 2, '<div>\r\n<h2>O que &eacute; Lorem Ipsum?</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;&eacute; simplesmente uma simula&ccedil;&atilde;o de texto da ind&uacute;stria tipogr&aacute;fica e de impressos, e vem sendo utilizado desde o s&eacute;culo XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos. Lorem Ipsum sobreviveu n&atilde;o s&oacute; a cinco s&eacute;culos, como tamb&eacute;m ao salto para a editora&ccedil;&atilde;o eletr&ocirc;nica, permanecendo essencialmente inalterado. Se popularizou na d&eacute;cada de 60, quando a Letraset lan&ccedil;ou decalques contendo passagens de Lorem Ipsum, e mais recentemente quando passou a ser integrado a softwares de editora&ccedil;&atilde;o eletr&ocirc;nica como Aldus PageMaker.</p>\r\n</div>\r\n<div>\r\n<h2>Porque n&oacute;s o usamos?</h2>\r\n<p>&Eacute; um fato conhecido de todos que um leitor se distrair&aacute; com o conte&uacute;do de texto leg&iacute;vel de uma p&aacute;gina quando estiver examinando sua diagrama&ccedil;&atilde;o. A vantagem de usar Lorem Ipsum &eacute; que ele tem uma distribui&ccedil;&atilde;o normal de letras, ao contr&aacute;rio de "Conte&uacute;do aqui, conte&uacute;do aqui", fazendo com que ele tenha uma apar&ecirc;ncia similar a de um texto leg&iacute;vel. Muitos softwares de publica&ccedil;&atilde;o e editores de p&aacute;ginas na internet agora usam Lorem Ipsum como texto-modelo padr&atilde;o, e uma r&aacute;pida busca por \'lorem ipsum\' mostra v&aacute;rios websites ainda em sua fase de constru&ccedil;&atilde;o. V&aacute;rias vers&otilde;es novas surgiram ao longo dos anos, eventualmente por acidente, e &agrave;s vezes de prop&oacute;sito (injetando humor, e coisas do g&ecirc;nero).</p>\r\n</div>\r\n<p>&nbsp;</p>\r\n<div>\r\n<h2>De onde ele vem?</h2>\r\n<p>Ao contr&aacute;rio do que se acredita, Lorem Ipsum n&atilde;o &eacute; simplesmente um texto rand&ocirc;mico. Com mais de 2000 anos, suas ra&iacute;zes podem ser encontradas em uma obra de literatura latina cl&aacute;ssica datada de 45 AC. Richard McClintock, um professor de latim do Hampden-Sydney College na Virginia, pesquisou uma das mais obscuras palavras em latim, consectetur, oriunda de uma passagem de Lorem Ipsum, e, procurando por entre cita&ccedil;&otilde;es da palavra na literatura cl&aacute;ssica, descobriu a sua indubit&aacute;vel origem. Lorem Ipsum vem das se&ccedil;&otilde;es 1.10.32 e 1.10.33 do "de Finibus Bonorum et Malorum" (Os Extremos do Bem e do Mal), de C&iacute;cero, escrito em 45 AC. Este livro &eacute; um tratado de teoria da &eacute;tica muito popular na &eacute;poca da Renascen&ccedil;a. A primeira linha de Lorem Ipsum, "Lorem Ipsum dolor sit amet..." vem de uma linha na se&ccedil;&atilde;o 1.10.32.</p>\r\n<p>O trecho padr&atilde;o original de Lorem Ipsum, usado desde o s&eacute;culo XVI, est&aacute; reproduzido abaixo para os interessados. Se&ccedil;&otilde;es 1.10.32 e 1.10.33 de "de Finibus Bonorum et Malorum" de Cicero tamb&eacute;m foram reproduzidas abaixo em sua forma exata original, acompanhada das vers&otilde;es para o ingl&ecirc;s da tradu&ccedil;&atilde;o feita por H. Rackham em 1914.</p>\r\n</div>\r\n<div>\r\n<h2>Onde posso consegu&iacute;-lo?</h2>\r\n<p>Existem muitas varia&ccedil;&otilde;es dispon&iacute;veis de passagens de Lorem Ipsum, mas a maioria sofreu algum tipo de altera&ccedil;&atilde;o, seja por inser&ccedil;&atilde;o de passagens com humor, ou palavras aleat&oacute;rias que n&atilde;o parecem nem um pouco convincentes. Se voc&ecirc; pretende usar uma passagem de Lorem Ipsum, precisa ter certeza de que n&atilde;o h&aacute; algo embara&ccedil;oso escrito escondido no meio do texto. Todos os geradores de Lorem Ipsum na internet tendem a repetir peda&ccedil;os predefinidos conforme necess&aacute;rio, fazendo deste o primeiro gerador de Lorem Ipsum aut&ecirc;ntico da internet. Ele usa um dicion&aacute;rio com mais de 200 palavras em Latim combinado com um punhado de modelos de estrutura de frases para gerar um Lorem Ipsum com apar&ecirc;ncia razo&aacute;vel, livre de repeti&ccedil;&otilde;es, inser&ccedil;&otilde;es de humor, palavras n&atilde;o caracter&iacute;sticas, etc</p>\r\n</div>', 'Teste', 1, 1576465093, 1, 1576467199, '179.187.116.169', 0),
(15, 15, 1576466589, 1, 0, 2, 1, 2, '2222222', 'Teste2', 1, 1576466589, 0, 0, '179.187.116.169', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_network_box`
--

CREATE TABLE `z_network_box` (
  `id` int(11) NOT NULL,
  `network_name` varchar(10) NOT NULL,
  `network_link` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `z_network_box`
--

INSERT INTO `z_network_box` (`id`, `network_name`, `network_link`) VALUES
(1, 'facebook', 'pages/Globalzhao/351502481668782'),
(2, 'twitter', 'tibia');

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_news_tickers`
--

CREATE TABLE `z_news_tickers` (
  `date` int(11) NOT NULL DEFAULT '1',
  `author` int(11) NOT NULL,
  `image_id` int(3) NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  `hide_ticker` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `z_news_tickers`
--

INSERT INTO `z_news_tickers` (`date`, `author`, `image_id`, `text`, `hide_ticker`) VALUES
(1375926579, 1, 1, 'WELCOME!', 1),
(1375931666, 1, 4, 'The account recovery interface has been updated to use e-mail addresses. This means that recovery keys are no longer used, and that you no longer have to contact us by e-mail to recover your account.', 1),
(1345694666, 489196, 0, 'Curtam-Nos no Facebook!!', 1),
(1347408963, 6347351, 4, '<b>Update:</b> Bom Pessoal Fizemos vários updates no sistema do servidor para maior estabilidade, e diversas novidades, quem quiser saber das novidades Link do <a href="http://www.tbot-global.com/forum/index.php?/topic/16-update-11082012/">Forum</a>. Abaixem nosso novo <a href="?subtopic=downloads">Cliente Próprio 9.6</a>', 1),
(1346126764, 489196, 1, 'Pessoal, Estamos efetuando uma atualização critica nas magias, aguardem.', 1),
(1346141345, 489196, 1, '<b>Update:</b> Danos das magias atualizados pessoal, bom jogo.', 1),
(1346638813, 489196, 0, '<b>Inauguração:</b> Dia 02/09 as 18:00 Horas, Não Perca Tempo. <a href="?subtopic=downloads">Cliente Próprio 9.6</a>.', 1),
(1346812461, 489196, 4, '<b>Evento:</b> Evento LOOT 4x, Fim do Evento dia 05/09 16:00', 1),
(1346966546, 489196, 0, '<b>Update:</b> Pessoal, por muitos pedidos deixamos as runas infinitas, e as munições também. bom game a todos.', 1),
(1347133399, 6347351, 4, '<b>Forum:</b> Não deixem de acessar o forum, e fique antenado nas novidades, forum exclusivo do TBOT. Apenas Crie sua ACC.', 1),
(1347381059, 6347351, 3, '<b>Update:</b> Bom Pessoal Fizemos vários updates no sistema do servidor para maior estabilidade, estou terminando mais uma surpresa para todos, em breve faço mais um update. Abaixem nosso novo <a href="?subtopic=downloads">Cliente Próprio 9.6</a>.', 1),
(1375486170, 1, 1, 'Bem vindo ao Gesior 0.3.8 Edited by Natan Beckman!', 1),
(1432861989, 1, 0, '<b> Servidor Inaugurado!</b>', 1),
(1505403561, 1440, 1, '<b>[Servidor manutenÃ§Ã£o apÃ³s queda de domÃ­nio]</b>', 1),
(1505520832, 1440, 1, '<b>Servidor Online!</b>', 0),
(1505577373, 1440, 1, 'Novo sistema de <b>Stats</b> implementado no servidor.', 0),
(1505610149, 1440, 1, '<b>Adicionado</b> sistema de <b>Raids</b> no servidor, a room fica no <b>3Âº</b> piso dos teleports! Algumas raids aparecem na tela, outras vocÃª tem que fazer o check!<b> The Horned Fox, Necropharus</b> nÃ£o sÃ£o anunciadas!', 0);

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
  `delete_it` int(2) NOT NULL DEFAULT '1'
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
  `delete_it` int(2) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
  `to_account` int(11) NOT NULL DEFAULT '0',
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `offer_id` int(11) NOT NULL DEFAULT '0',
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT '0',
  `trans_real` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shopguild_history_pacc`
--

CREATE TABLE `z_shopguild_history_pacc` (
  `id` int(11) NOT NULL,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT '0',
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `pacc_days` int(11) NOT NULL DEFAULT '0',
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT '0',
  `trans_real` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shopguild_offer`
--

CREATE TABLE `z_shopguild_offer` (
  `id` int(11) NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  `itemid1` int(11) NOT NULL DEFAULT '0',
  `count1` int(11) NOT NULL DEFAULT '0',
  `itemid2` int(11) NOT NULL DEFAULT '0',
  `count2` int(11) NOT NULL DEFAULT '0',
  `offer_type` varchar(255) DEFAULT NULL,
  `offer_description` text NOT NULL,
  `offer_name` varchar(255) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `z_shopguild_offer`
--

INSERT INTO `z_shopguild_offer` (`id`, `points`, `itemid1`, `count1`, `itemid2`, `count2`, `offer_type`, `offer_description`, `offer_name`, `pid`) VALUES
(1, 1, 2160, 10, 0, 0, 'item', '10 crystal coin para seu char.', 'Crystal Coin', 0),
(2, 10, 2640, 1, 0, 0, 'item', 'Soft Boots regenerate 10 health per 2 seconds and 15 mana per 2 seconds.', 'Pair of Soft Boots', 0),
(3, 2, 2195, 1, 0, 0, 'item', 'boots of haste (speed +20).', 'Boots of Haste', 0),
(4, 5, 18409, 1, 0, 0, 'item', 'Fire ataque max 85 e magic +1.', 'Wand of Everblazing', 0),
(5, 5, 18411, 1, 0, 0, 'item', 'Earth ataque max 85 e magic +1.', 'Muck Rod', 0),
(6, 5, 2400, 1, 0, 0, 'item', 'Atributos (Atk:48, Def:35 +3).', 'Magic Sword', 0),
(7, 7, 2431, 1, 0, 0, 'item', 'Atributos (Atk:50, Def:30 +3).', 'Stonecutter Axe', 0),
(8, 6, 8928, 1, 0, 0, 'item', 'Atributos (Atk:50, Def:30 +2).', 'Obsidian Truncheon', 0),
(9, 5, 18453, 1, 0, 0, 'item', 'Atributos (Range:6, Atk+4, Hit%+3).', 'Crystal Crossbow', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shop_history_item`
--

CREATE TABLE `z_shop_history_item` (
  `id` int(11) NOT NULL,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT '0',
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `offer_id` varchar(255) NOT NULL DEFAULT '',
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT '0',
  `trans_real` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shop_offer`
--

CREATE TABLE `z_shop_offer` (
  `id` int(11) NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  `itemid1` int(11) NOT NULL DEFAULT '0',
  `count1` int(11) NOT NULL DEFAULT '0',
  `itemid2` int(11) NOT NULL DEFAULT '0',
  `count2` int(11) NOT NULL DEFAULT '0',
  `offer_type` varchar(255) DEFAULT NULL,
  `offer_description` text NOT NULL,
  `offer_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `z_shop_offer`
--

INSERT INTO `z_shop_offer` (`id`, `points`, `itemid1`, `count1`, `itemid2`, `count2`, `offer_type`, `offer_description`, `offer_name`) VALUES
(13, 2, 2160, 50, 0, 0, 'item', '500k direto para seu personagem', '50 crystal coins'),
(14, 8, 25410, 1, 0, 0, 'item', '(Arm:29, club fighting +4, sword fighting +4, axe fighting +4, distance fighting +4, protection physical +5%, energy +5%, earth +5%, fire +5%, ice +5%, holy +5%, death +5%).', 'Donate Master Helmet'),
(15, 10, 25185, 1, 0, 0, 'item', '(Arm:29, club fighting +4, sword fighting +4, axe fighting +4, distance fighting +4, protection physical +5%, energy +5%, earth +5%, fire +5%, ice +5%, holy +5%, death +5%).', 'Donate Master Armor'),
(16, 10, 25183, 1, 0, 0, 'item', '(Arm:29, club fighting +4, sword fighting +4, axe fighting +4, distance fighting +4, protection physical +5%, energy +5%, earth +5%, fire +5%, ice +5%, holy +5%, death +5%).', 'Donate Master Legs'),
(17, 8, 21708, 1, 0, 0, 'item', '(Arm:5, speed +25, regen mais rapido 2x o dobro da soft boots).', 'Donate Master Boots'),
(19, 8, 21707, 1, 0, 0, 'item', '(Def:100, protection physical +4%, holy +4%, death +4%).', 'Donate Master Shield'),
(20, 10, 25910, 1, 0, 0, 'item', '(Atk:120 physical + 50 ice, Def:35, sword fighting +2).', 'Donate Master Slayer'),
(21, 10, 25912, 1, 0, 0, 'item', '(Atk:120 physical + 50 ice, Def:35, axe fighting +2).', 'Donate Master Axe'),
(22, 10, 25914, 1, 0, 0, 'item', '(Atk:120 physical + 50 ice, Def:35, club fighting +2).', 'Donate Master Hammer'),
(23, 10, 25916, 1, 0, 0, 'item', '(Range:5, Atk+120, Hit%+8, distance fighting +12).', 'Donate Master Crossbow'),
(24, 8, 13947, 1, 0, 0, 'item', '(Arm:20, magic level 6, protection physical +12%)', 'Donate Master Hat'),
(25, 10, 25188, 1, 0, 0, 'item', '(Arm:20, magic level +6, protection physical +5%, energy +5%, earth +5%, fire +5%, ice +5%, holy +5%, death +5%).', 'Donate Master Robe'),
(26, 8, 25180, 1, 0, 0, 'item', '(Arm:20, magic level +6, protection physical +5%, energy +5%, earth +5%, fire +5%, ice +5%, holy +5%, death +5%).', 'Donate Master Kilt'),
(27, 10, 13880, 1, 0, 0, 'item', 'Staff (Hit 450-600) em monstro.\r\n7x Elementos.\r\nHoly, Fire, Energy, Earth, Death, Ice, Poison.\r\n', 'Donate Master Staff'),
(28, 10, 18401, 1, 0, 0, 'item', '(Def:50, magic level +6, protection physical +13%).', 'Donate Master Book'),
(37, 10, 2798, 100, 0, 0, 'decoracao', 'You see 100 blood herbs.\r\nThey weigh 120.00 oz.', '100 Blood Herb'),
(38, 6, 2798, 50, 0, 0, 'decoracao', 'You see 50 blood herbs.\r\nThey weigh 120.00 oz.', '50 Blood Herb'),
(76, 15, 11101, 1, 0, 0, 'addon', 'Voce recebera o addon male e female full no jogo.', 'Barbarian Addon'),
(77, 15, 11101, 1, 0, 0, 'addon', 'Voce recebera o addon male e female full no jogo.', 'Warrior Addon'),
(78, 15, 11101, 1, 0, 0, 'addon', 'Voce recebera o addon male e female full no jogo.', 'Assassin Addon'),
(79, 15, 11101, 1, 0, 0, 'addon', 'Voce recebera o addon male e female full no jogo.', 'Insectoid Addon'),
(80, 5, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Draptor'),
(81, 3, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Dromedary'),
(82, 5, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Iron Blight'),
(83, 5, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Magma Crawler'),
(84, 10, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Lady Bug'),
(85, 10, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Scorpion King'),
(87, 20, 11101, 1, 0, 0, 'addon', 'Voce recebera o addon male e female full no jogo.', 'Summoner Addon'),
(88, 20, 11101, 1, 0, 0, 'addon', 'Voce recebera o addon male e female full no jogo.', 'Red Baron Addon'),
(90, 30, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Shadow Draptor'),
(91, 20, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Red Manta'),
(92, 30, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Golden Lion'),
(93, 25, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Armoured War Horse'),
(94, 20, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Blazebringer'),
(95, 25, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Armoured Dragonling'),
(96, 20, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Steelbeak'),
(97, 25, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Armoured Scorpion'),
(98, 25, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Armoured Cavebear'),
(99, 30, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Lion'),
(100, 30, 11101, 1, 0, 0, 'addon', 'Voce recebera o addon male e female full no jogo.', 'Mage Addon'),
(116, 30, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Walker'),
(117, 30, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Azudocus'),
(118, 30, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Carpacosaurus'),
(119, 30, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Death Crawler'),
(120, 30, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Flamesteed'),
(121, 30, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Jade Lion'),
(122, 30, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Jade Pincer'),
(123, 30, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Nethersteed'),
(124, 30, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Tempest'),
(125, 30, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Winter King'),
(126, 20, 11101, 1, 0, 0, 'addon', 'Voce recebera o addon male e female full no jogo.', 'Glooth Engineer Addon'),
(127, 40, 11101, 1, 0, 0, 'addon', 'Voce recebera o addon male e female full no jogo.', 'Champion Addon'),
(128, 50, 11101, 1, 0, 0, 'addon', 'Voce recebera o addon male e female full no jogo.', 'Conjurer Addon'),
(129, 40, 11101, 1, 0, 0, 'addon', 'Voce recebera o addon male e female full no jogo.', 'Beastmaster Addon');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `name_2` (`name`),
  ADD UNIQUE KEY `name_3` (`name`);

--
-- Indexes for table `account_bans`
--
ALTER TABLE `account_bans`
  ADD PRIMARY KEY (`account_id`),
  ADD KEY `banned_by` (`banned_by`);

--
-- Indexes for table `account_ban_history`
--
ALTER TABLE `account_ban_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `banned_by` (`banned_by`),
  ADD KEY `account_id_2` (`account_id`),
  ADD KEY `account_id_3` (`account_id`),
  ADD KEY `account_id_4` (`account_id`);

--
-- Indexes for table `account_viplist`
--
ALTER TABLE `account_viplist`
  ADD UNIQUE KEY `account_player_index` (`account_id`,`player_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `global_storage`
--
ALTER TABLE `global_storage`
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `guilds`
--
ALTER TABLE `guilds`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `ownerid` (`ownerid`);

--
-- Indexes for table `guildwar_kills`
--
ALTER TABLE `guildwar_kills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warid` (`warid`);

--
-- Indexes for table `guild_invites`
--
ALTER TABLE `guild_invites`
  ADD PRIMARY KEY (`player_id`,`guild_id`),
  ADD KEY `guild_id` (`guild_id`);

--
-- Indexes for table `guild_membership`
--
ALTER TABLE `guild_membership`
  ADD PRIMARY KEY (`player_id`),
  ADD KEY `guild_id` (`guild_id`),
  ADD KEY `rank_id` (`rank_id`);

--
-- Indexes for table `guild_ranks`
--
ALTER TABLE `guild_ranks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guild_id` (`guild_id`);

--
-- Indexes for table `guild_wars`
--
ALTER TABLE `guild_wars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guild1` (`guild1`),
  ADD KEY `guild2` (`guild2`);

--
-- Indexes for table `houses`
--
ALTER TABLE `houses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner` (`owner`),
  ADD KEY `town_id` (`town_id`);

--
-- Indexes for table `house_lists`
--
ALTER TABLE `house_lists`
  ADD KEY `house_id` (`house_id`);

--
-- Indexes for table `ip_bans`
--
ALTER TABLE `ip_bans`
  ADD PRIMARY KEY (`ip`),
  ADD KEY `banned_by` (`banned_by`);

--
-- Indexes for table `live_casts`
--
ALTER TABLE `live_casts`
  ADD UNIQUE KEY `player_id_2` (`player_id`);

--
-- Indexes for table `market_history`
--
ALTER TABLE `market_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`,`sale`);

--
-- Indexes for table `market_offers`
--
ALTER TABLE `market_offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale` (`sale`,`itemtype`),
  ADD KEY `created` (`created`),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `vocation` (`vocation`);

--
-- Indexes for table `players_online`
--
ALTER TABLE `players_online`
  ADD PRIMARY KEY (`player_id`);

--
-- Indexes for table `player_deaths`
--
ALTER TABLE `player_deaths`
  ADD KEY `player_id` (`player_id`),
  ADD KEY `killed_by` (`killed_by`),
  ADD KEY `mostdamage_by` (`mostdamage_by`);

--
-- Indexes for table `player_depotitems`
--
ALTER TABLE `player_depotitems`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`sid`);

--
-- Indexes for table `player_inboxitems`
--
ALTER TABLE `player_inboxitems`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`sid`);

--
-- Indexes for table `player_items`
--
ALTER TABLE `player_items`
  ADD KEY `player_id` (`player_id`),
  ADD KEY `sid` (`sid`);

--
-- Indexes for table `player_namelocks`
--
ALTER TABLE `player_namelocks`
  ADD PRIMARY KEY (`player_id`),
  ADD KEY `namelocked_by` (`namelocked_by`);

--
-- Indexes for table `player_rewards`
--
ALTER TABLE `player_rewards`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`sid`);

--
-- Indexes for table `player_spells`
--
ALTER TABLE `player_spells`
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `player_storage`
--
ALTER TABLE `player_storage`
  ADD PRIMARY KEY (`player_id`,`key`);

--
-- Indexes for table `server_config`
--
ALTER TABLE `server_config`
  ADD PRIMARY KEY (`config`);

--
-- Indexes for table `store_history`
--
ALTER TABLE `store_history`
  ADD KEY `account_id` (`account_id`);

--
-- Indexes for table `tile_store`
--
ALTER TABLE `tile_store`
  ADD KEY `house_id` (`house_id`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `videos_categorias`
--
ALTER TABLE `videos_categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `videos_comentarios`
--
ALTER TABLE `videos_comentarios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `z_forum`
--
ALTER TABLE `z_forum`
  ADD PRIMARY KEY (`id`),
  ADD KEY `section` (`section`);

--
-- Indexes for table `z_network_box`
--
ALTER TABLE `z_network_box`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `z_ots_comunication`
--
ALTER TABLE `z_ots_comunication`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `z_ots_guildcomunication`
--
ALTER TABLE `z_ots_guildcomunication`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `z_polls`
--
ALTER TABLE `z_polls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `z_shopguild_history_item`
--
ALTER TABLE `z_shopguild_history_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `z_shopguild_history_pacc`
--
ALTER TABLE `z_shopguild_history_pacc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `z_shopguild_offer`
--
ALTER TABLE `z_shopguild_offer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `z_shop_history_item`
--
ALTER TABLE `z_shop_history_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `z_shop_offer`
--
ALTER TABLE `z_shop_offer`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1558;
--
-- AUTO_INCREMENT for table `account_ban_history`
--
ALTER TABLE `account_ban_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `guilds`
--
ALTER TABLE `guilds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `guildwar_kills`
--
ALTER TABLE `guildwar_kills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `guild_ranks`
--
ALTER TABLE `guild_ranks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `guild_wars`
--
ALTER TABLE `guild_wars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `houses`
--
ALTER TABLE `houses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2475;
--
-- AUTO_INCREMENT for table `market_history`
--
ALTER TABLE `market_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `market_offers`
--
ALTER TABLE `market_offers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1848;
--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `videos_categorias`
--
ALTER TABLE `videos_categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `videos_comentarios`
--
ALTER TABLE `videos_comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `z_forum`
--
ALTER TABLE `z_forum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `z_network_box`
--
ALTER TABLE `z_network_box`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `z_ots_comunication`
--
ALTER TABLE `z_ots_comunication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `z_ots_guildcomunication`
--
ALTER TABLE `z_ots_guildcomunication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13382;
--
-- AUTO_INCREMENT for table `z_polls`
--
ALTER TABLE `z_polls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `z_shopguild_history_item`
--
ALTER TABLE `z_shopguild_history_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `z_shopguild_history_pacc`
--
ALTER TABLE `z_shopguild_history_pacc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `z_shopguild_offer`
--
ALTER TABLE `z_shopguild_offer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `z_shop_history_item`
--
ALTER TABLE `z_shop_history_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `z_shop_offer`
--
ALTER TABLE `z_shop_offer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `account_bans`
--
ALTER TABLE `account_bans`
  ADD CONSTRAINT `account_bans_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `account_bans_ibfk_2` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `account_ban_history`
--
ALTER TABLE `account_ban_history`
  ADD CONSTRAINT `account_ban_history_ibfk_2` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `account_ban_history_ibfk_3` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `account_ban_history_ibfk_4` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `account_ban_history_ibfk_5` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `account_viplist`
--
ALTER TABLE `account_viplist`
  ADD CONSTRAINT `account_viplist_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `account_viplist_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `guilds`
--
ALTER TABLE `guilds`
  ADD CONSTRAINT `guilds_ibfk_1` FOREIGN KEY (`ownerid`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `guildwar_kills`
--
ALTER TABLE `guildwar_kills`
  ADD CONSTRAINT `guildwar_kills_ibfk_1` FOREIGN KEY (`warid`) REFERENCES `guild_wars` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `guild_invites`
--
ALTER TABLE `guild_invites`
  ADD CONSTRAINT `guild_invites_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_invites_ibfk_2` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `guild_membership`
--
ALTER TABLE `guild_membership`
  ADD CONSTRAINT `guild_membership_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `guild_membership_ibfk_2` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `guild_membership_ibfk_3` FOREIGN KEY (`rank_id`) REFERENCES `guild_ranks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `guild_ranks`
--
ALTER TABLE `guild_ranks`
  ADD CONSTRAINT `guild_ranks_ibfk_1` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `house_lists`
--
ALTER TABLE `house_lists`
  ADD CONSTRAINT `house_lists_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `ip_bans`
--
ALTER TABLE `ip_bans`
  ADD CONSTRAINT `ip_bans_ibfk_1` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `live_casts`
--
ALTER TABLE `live_casts`
  ADD CONSTRAINT `live_casts_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

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
-- Limitadores para a tabela `player_inboxitems`
--
ALTER TABLE `player_inboxitems`
  ADD CONSTRAINT `player_inboxitems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_items`
--
ALTER TABLE `player_items`
  ADD CONSTRAINT `player_items_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_namelocks`
--
ALTER TABLE `player_namelocks`
  ADD CONSTRAINT `player_namelocks_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `player_namelocks_ibfk_2` FOREIGN KEY (`namelocked_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `player_rewards`
--
ALTER TABLE `player_rewards`
  ADD CONSTRAINT `player_rewards_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_spells`
--
ALTER TABLE `player_spells`
  ADD CONSTRAINT `player_spells_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_storage`
--
ALTER TABLE `player_storage`
  ADD CONSTRAINT `player_storage_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `store_history`
--
ALTER TABLE `store_history`
  ADD CONSTRAINT `store_history_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `tile_store`
--
ALTER TABLE `tile_store`
  ADD CONSTRAINT `tile_store_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
