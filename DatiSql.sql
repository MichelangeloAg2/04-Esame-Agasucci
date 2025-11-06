-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versione server:              10.4.28-MariaDB - Source distribution
-- S.O. server:                  osx10.10
-- HeidiSQL Versione:            12.11.0.7065
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dump della struttura di tabella CodeX.cache
DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dump dei dati della tabella CodeX.cache: ~0 rows (circa)
DELETE FROM `cache`;

-- Dump della struttura di tabella CodeX.cache_locks
DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dump dei dati della tabella CodeX.cache_locks: ~0 rows (circa)
DELETE FROM `cache_locks`;

-- Dump della struttura di tabella CodeX.carte
DROP TABLE IF EXISTS `carte`;
CREATE TABLE IF NOT EXISTS `carte` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `numero` varchar(16) NOT NULL,
  `cvv` varchar(4) NOT NULL,
  `scadenza` date NOT NULL,
  `metodo_pagamento` enum('carta_credito','carta_debito') NOT NULL DEFAULT 'carta_credito',
  `utente_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carte_utente_id_foreign` (`utente_id`),
  CONSTRAINT `carte_utente_id_foreign` FOREIGN KEY (`utente_id`) REFERENCES `utenti` (`idUtente`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dump dei dati della tabella CodeX.carte: ~0 rows (circa)
DELETE FROM `carte`;

-- Dump della struttura di tabella CodeX.categories
DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `descrizione` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dump dei dati della tabella CodeX.categories: ~0 rows (circa)
DELETE FROM `categories`;
INSERT INTO `categories` (`id`, `nome`, `descrizione`, `created_at`, `updated_at`) VALUES
	(1, 'Azione', NULL, '2025-11-06 10:39:06', '2025-11-06 10:39:06'),
	(2, 'Drammatico', NULL, '2025-11-06 10:39:06', '2025-11-06 10:39:06'),
	(3, 'Commedia', NULL, '2025-11-06 10:39:06', '2025-11-06 10:39:06'),
	(4, 'Fantascienza', NULL, '2025-11-06 10:39:06', '2025-11-06 10:39:06'),
	(5, 'Documentario', NULL, '2025-11-06 10:39:06', '2025-11-06 10:39:06'),
	(6, 'Horror', NULL, '2025-11-06 10:39:06', '2025-11-06 10:39:06'),
	(7, 'Animazione', NULL, '2025-11-06 10:39:06', '2025-11-06 10:39:06');

-- Dump della struttura di tabella CodeX.crediti
DROP TABLE IF EXISTS `crediti`;
CREATE TABLE IF NOT EXISTS `crediti` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idUtente` bigint(20) unsigned NOT NULL,
  `saldo` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `crediti_idutente_foreign` (`idUtente`),
  CONSTRAINT `crediti_idutente_foreign` FOREIGN KEY (`idUtente`) REFERENCES `utenti` (`idUtente`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dump dei dati della tabella CodeX.crediti: ~0 rows (circa)
DELETE FROM `crediti`;

-- Dump della struttura di tabella CodeX.episodi
DROP TABLE IF EXISTS `episodi`;
CREATE TABLE IF NOT EXISTS `episodi` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `titolo` varchar(255) NOT NULL,
  `numero_episodio` int(11) NOT NULL,
  `stagione` int(11) NOT NULL,
  `descrizione` text DEFAULT NULL,
  `data_uscita` date DEFAULT NULL,
  `serie_id` bigint(20) unsigned NOT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `video_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `episodi_serie_id_foreign` (`serie_id`),
  CONSTRAINT `episodi_serie_id_foreign` FOREIGN KEY (`serie_id`) REFERENCES `serie` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dump dei dati della tabella CodeX.episodi: ~0 rows (circa)
DELETE FROM `episodi`;
INSERT INTO `episodi` (`id`, `titolo`, `numero_episodio`, `stagione`, `descrizione`, `data_uscita`, `serie_id`, `image_path`, `video_path`, `created_at`, `updated_at`) VALUES
	(1, 'Pilot', 1, 1, 'Walter scopre la sua diagnosi.', '2008-01-20', 1, NULL, NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(2, 'Cat\'s in the Bag...', 2, 1, 'Conseguenze del primo episodio.', '2008-01-27', 1, NULL, NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(3, 'Est quam officia.', 6, 3, 'Harum adipisci earum ipsam nisi quaerat. Quam voluptas tempore deserunt. Non eum quo consequatur ea.', '2025-10-24', 3, NULL, NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(4, 'Similique nobis tempore labore et incidunt.', 10, 2, 'Voluptas quae praesentium sit aut qui sit. Qui repellat et hic aut. Quidem aspernatur incidunt facere ut optio cumque sed. Alias maxime minus repellat labore sint et.', '1995-06-15', 1, NULL, NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(5, 'Quisquam vel quam accusantium ipsum corrupti.', 23, 3, 'Ut recusandae quo esse quis minima eligendi deleniti harum. Magnam dolores aut rem quod. Odit provident veritatis molestias aperiam aspernatur.', '1997-07-09', 2, NULL, NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(6, 'Magnam sint rerum et autem qui.', 18, 1, 'Quis saepe iusto voluptas ea nihil ex fuga. Quaerat sint qui ex enim qui soluta ipsam. Qui quod enim aut aut.', '1990-02-10', 3, NULL, NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(7, 'Quaerat molestiae mollitia earum quos.', 1, 2, 'Rem alias nulla eveniet voluptatem eos. Ut qui dignissimos dolor dolorem. Voluptas illo fuga occaecati. Perferendis repellendus sunt molestias.', '2009-10-07', 3, NULL, NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(8, 'Sit quam ea error.', 21, 4, 'Quaerat iste expedita nihil velit debitis. Deleniti excepturi consequatur quos perferendis. Non sit quaerat iure quia eius voluptas et. Dolore voluptatem illum incidunt.', '1986-01-19', 1, NULL, NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(9, 'Doloribus est magnam ullam ea.', 19, 3, 'Voluptates voluptas voluptates consequatur tempore distinctio id quae. Qui est consequatur aut et id numquam nemo. Est earum id et perspiciatis unde iure velit et.', '1994-03-28', 2, NULL, NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(10, 'Fuga deleniti reiciendis odit.', 2, 1, 'A non rerum aut. Optio officiis voluptates vitae amet sunt.', '1984-07-23', 2, NULL, NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(11, 'Illo hic distinctio consectetur dolor voluptate.', 19, 5, 'Aperiam perferendis molestiae corrupti. Fugit sequi in repellat tempora praesentium expedita voluptate. Aut nostrum eum neque nam exercitationem. Nobis ut doloribus autem ducimus.', '2015-09-12', 1, NULL, NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(12, 'Voluptatem voluptatibus velit rerum blanditiis.', 1, 5, 'Veritatis beatae quibusdam ut voluptate tempore alias. Dolor et doloremque quia rerum in culpa ducimus. Aut qui beatae ab perspiciatis.', '1978-03-29', 1, NULL, NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(13, 'Enim et accusamus.', 5, 3, 'Ipsa quaerat non ducimus et molestiae saepe. Alias reiciendis quisquam veritatis labore. Omnis unde dolorem repudiandae dolorem odit aut in id.', '1996-11-23', 2, NULL, NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(14, 'Eum nesciunt quia sunt necessitatibus.', 11, 2, 'Dolorem perferendis officiis quia aliquid consequatur velit id. Ut repellendus dolorem quibusdam natus recusandae non et quisquam.', '1975-07-31', 3, NULL, NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11');

-- Dump della struttura di tabella CodeX.film
DROP TABLE IF EXISTS `film`;
CREATE TABLE IF NOT EXISTS `film` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `titolo` varchar(255) NOT NULL,
  `descrizione` text DEFAULT NULL,
  `anno_uscita` year(4) DEFAULT NULL,
  `durata` int(11) DEFAULT NULL,
  `regista` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `video_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `film_category_id_foreign` (`category_id`),
  CONSTRAINT `film_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dump dei dati della tabella CodeX.film: ~11 rows (circa)
DELETE FROM `film`;
INSERT INTO `film` (`id`, `titolo`, `descrizione`, `anno_uscita`, `durata`, `regista`, `category_id`, `image_path`, `video_path`, `created_at`, `updated_at`) VALUES
	(1, 'Temporibus quasi cumque.', 'Ut fugiat eos architecto. Quidem quia suscipit dolor incidunt.', '2004', 111, 'Grayson Marks', 4, NULL, NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(2, 'Quia quam id sunt.', 'Quo hic est assumenda. Vero quas quae neque. Architecto totam quasi repellendus repudiandae eius dicta. Voluptatum ut fuga labore qui quia nihil praesentium.', '2006', 87, 'Elisabeth Swift', 2, NULL, NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(3, 'Et iusto est quos.', 'Iure omnis voluptatem consequuntur velit ipsam eos provident. Aspernatur voluptates ut consequuntur consectetur facilis tenetur est. Accusantium aut ut esse nemo nostrum nam quis.', '2004', 151, 'Prof. Urban Lowe', 1, NULL, NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(4, 'Quia consequatur at.', 'Ut aliquam voluptatem temporibus ad officiis fugit eum. Doloribus voluptatem quia ullam. Nisi necessitatibus perspiciatis ut. Et velit voluptas delectus perferendis qui.', '1985', 151, 'Angel Lindgren DDS', 2, NULL, NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(5, 'Ea et hic.', 'Animi libero culpa nobis quidem voluptatum est ea illum. Odio non tempore porro quaerat rem. Sed quam enim pariatur molestias.', '2015', 147, 'Dr. Braulio Huels', 6, NULL, NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(6, 'Magnam non accusamus voluptas.', 'Labore expedita et cupiditate. Aut accusamus illum inventore ex. Expedita natus modi natus debitis sequi et totam et. Repudiandae unde ut hic et optio.', '1997', 119, 'Stephany Ankunding', 2, NULL, NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(7, 'Quos mollitia eum.', 'Voluptas suscipit aliquid nesciunt nihil alias sit. Voluptatem illo fugit cum. Et amet necessitatibus sint veritatis odio sit eveniet.', '2005', 105, 'Delilah Okuneva', 3, NULL, NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(8, 'In sint itaque occaecati.', 'Hic officiis similique aperiam quae minus et sit. Maiores voluptas natus numquam laboriosam velit ut. Rerum consequuntur deleniti ipsa at excepturi.', '2017', 152, 'Haleigh Stamm', 7, NULL, NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(9, 'Inception', 'Un viaggio nei sogni dentro i sogni.', '2010', 148, 'Christopher Nolan', 1, NULL, NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(10, 'Interstellar', 'Odissea nello spazio.', '2014', 169, 'Christopher Nolan', 4, NULL, NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(14, 'Hot&Cold', 'hkfgdhfbjsdfabdsh', '2019', 123, 'Gabibbo', 4, NULL, NULL, '2025-11-06 11:02:03', '2025-11-06 11:02:03');

-- Dump della struttura di tabella CodeX.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dump dei dati della tabella CodeX.migrations: ~16 rows (circa)
DELETE FROM `migrations`;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2025_10_13_000001_create_nazione_table', 1),
	(2, '2025_10_13_000001_create_utenti_table', 1),
	(3, '2025_10_13_000002_create_tipologia_indirizzo_table', 1),
	(4, '2025_10_27_151136_create_cache_table', 1),
	(5, '2025_10_27_213349_create_categories_table', 1),
	(6, '2025_10_27_213350_create_serie_table', 1),
	(7, '2025_10_27_213351_create_episodi_table', 1),
	(8, '2025_10_27_213430_create_film_table', 1),
	(9, '2025_10_28_054508_create_pagamenti_table', 1),
	(10, '2025_10_28_095409_create_preferiti_table', 1),
	(11, '2025_10_29_051828_create_crediti_table', 1),
	(12, '2025_10_29_144931_create_visualizzazioni_table', 1),
	(13, '2025_10_31_040234_aggiunta_media_path_table', 1),
	(14, '2025_10_31_142654_add_preferiti_a_utenti_table', 1),
	(15, '2025_11_03_082806_create_carte_table', 1),
	(16, '2025_11_06_105909_create_sessions_table', 1);

-- Dump della struttura di tabella CodeX.nazioni
DROP TABLE IF EXISTS `nazioni`;
CREATE TABLE IF NOT EXISTS `nazioni` (
  `idNazione` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `iso` varchar(3) DEFAULT NULL,
  `iso3` varchar(3) DEFAULT NULL,
  `prefissoTelefonisco` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idNazione`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dump dei dati della tabella CodeX.nazioni: ~249 rows (circa)
DELETE FROM `nazioni`;
INSERT INTO `nazioni` (`idNazione`, `nome`, `iso`, `iso3`, `prefissoTelefonisco`, `created_at`, `updated_at`) VALUES
	(1, 'Afghanistan', '004', 'AFG', 'AF', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(2, 'Albania', '008', 'ALB', 'AL', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(3, 'Algeria', '012', 'DZA', 'DZ', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(4, 'Andorra', '020', 'AND', 'AD', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(5, 'Angola', '024', 'AGO', 'AO', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(6, 'Anguilla', '660', 'AIA', 'AI', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(7, 'Antartide', '010', 'ATA', 'AQ', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(8, 'Antigua e Barbuda', '028', 'ATG', 'AG', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(9, 'Arabia Saudita', '682', 'SAU', 'SA', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(10, 'Argentina', '032', 'ARG', 'AR', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(11, 'Armenia', '051', 'ARM', 'AM', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(12, 'Aruba', '533', 'ABW', 'AW', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(13, 'Australia', '036', 'AUS', 'AU', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(14, 'Austria', '040', 'AUT', 'AT', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(15, 'Azerbaigian', '031', 'AZE', 'AZ', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(16, 'Bahamas', '044', 'BHS', 'BS', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(17, 'Bahrein', '048', 'BHR', 'BH', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(18, 'Bangladesh', '050', 'BGD', 'BD', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(19, 'Barbados', '052', 'BRB', 'BB', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(20, 'Belgio', '056', 'BEL', 'BE', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(21, 'Belize', '084', 'BLZ', 'BZ', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(22, 'Benin', '204', 'BEN', 'BJ', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(23, 'Bermuda', '060', 'BMU', 'BM', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(24, 'Bhutan', '064', 'BTN', 'BT', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(25, 'Bielorussia', '112', 'BLR', 'BY', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(26, 'Birmania', '104', 'MMR', 'MM', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(27, 'Bolivia', '068', 'BOL', 'BO', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(28, 'Bosnia ed Erzegovina', '070', 'BIH', 'BA', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(29, 'Botswana', '072', 'BWA', 'BW', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(30, 'Brasile', '076', 'BRA', 'BR', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(31, 'Brunei', '096', 'BRN', 'BN', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(32, 'Bulgaria', '100', 'BGR', 'BG', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(33, 'Burkina Faso', '854', 'BFA', 'BF', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(34, 'Burundi', '108', 'BDI', 'BI', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(35, 'Cambogia', '116', 'KHM', 'KH', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(36, 'Camerun', '120', 'CMR', 'CM', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(37, 'Canada', '124', 'CAN', 'CA', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(38, 'Capo Verde', '132', 'CPV', 'CV', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(39, 'Ciad', '148', 'TCD', 'TD', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(40, 'Cile', '152', 'CHL', 'CL', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(41, 'Cina', '156', 'CHN', 'CN', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(42, 'Cipro', '196', 'CYP', 'CY', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(43, 'Citt', '336', 'VAT', 'VA', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(44, 'Colombia', '170', 'COL', 'CO', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(45, 'Comore', '174', 'COM', 'KM', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(46, 'Corea del Nord', '408', 'PRK', 'KP', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(47, 'Corea del Sud', '410', 'KOR', 'KR', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(48, 'Costa d\'Avorio', '384', 'CIV', 'CI', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(49, 'Costa Rica', '188', 'CRI', 'CR', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(50, 'Croazia', '191', 'HRV', 'HR', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(51, 'Cuba', '192', 'CUB', 'CU', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(52, 'Cura', '531', 'CUW', 'CW', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(53, 'Danimarca', '208', 'DNK', 'DK', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(54, 'Dominica', '212', 'DMA', 'DM', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(55, 'Ecuador', '218', 'ECU', 'EC', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(56, 'Egitto', '818', 'EGY', 'EG', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(57, 'El Salvador', '222', 'SLV', 'SV', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(58, 'Emirati Arabi Uniti', '784', 'ARE', 'AE', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(59, 'Eritrea', '232', 'ERI', 'ER', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(60, 'Estonia', '233', 'EST', 'EE', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(61, 'Etiopia', '231', 'ETH', 'ET', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(62, 'Figi', '242', 'FJI', 'FJ', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(63, 'Filippine', '608', 'PHL', 'PH', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(64, 'Finlandia', '246', 'FIN', 'FI', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(65, 'Francia', '250', 'FRA', 'FR', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(66, 'Gabon', '266', 'GAB', 'GA', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(67, 'Gambia', '270', 'GMB', 'GM', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(68, 'Georgia', '268', 'GEO', 'GE', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(69, 'Georgia del Sud e isole Sandwich meridionali', '239', 'SGS', 'GS', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(70, 'Germania', '276', 'DEU', 'DE', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(71, 'Ghana', '288', 'GHA', 'GH', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(72, 'Giamaica', '388', 'JAM', 'JM', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(73, 'Giappone', '392', 'JPN', 'JP', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(74, 'Gibilterra', '292', 'GIB', 'GI', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(75, 'Gibuti', '262', 'DJI', 'DJ', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(76, 'Giordania', '400', 'JOR', 'JO', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(77, 'Grecia', '300', 'GRC', 'GR', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(78, 'Grenada', '308', 'GRD', 'GD', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(79, 'Groenlandia', '304', 'GRL', 'GL', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(80, 'Guadalupa', '312', 'GLP', 'GP', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(81, 'Guam', '316', 'GUM', 'GU', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(82, 'Guatemala', '320', 'GTM', 'GT', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(83, 'Guernsey', '831', 'GGY', 'GG', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(84, 'Guinea', '324', 'GIN', 'GN', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(85, 'Guinea-Bissau', '624', 'GNB', 'GW', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(86, 'Guinea Equatoriale', '226', 'GNQ', 'GQ', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(87, 'Guyana', '328', 'GUY', 'GY', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(88, 'Guyana francese', '254', 'GUF', 'GF', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(89, 'Haiti', '332', 'HTI', 'HT', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(90, 'Honduras', '340', 'HND', 'HN', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(91, 'Hong Kong', '344', 'HKG', 'HK', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(92, 'India', '356', 'IND', 'IN', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(93, 'Indonesia', '360', 'IDN', 'ID', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(94, 'Iran', '364', 'IRN', 'IR', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(95, 'Iraq', '368', 'IRQ', 'IQ', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(96, 'Irlanda', '372', 'IRL', 'IE', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(97, 'Islanda', '352', 'ISL', 'IS', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(98, 'Isola Bouvet', '074', 'BVT', 'BV', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(99, 'Isola di Man', '833', 'IMN', 'IM', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(100, 'Isola di Natale', '162', 'CXR', 'CX', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(101, 'Isola Norfolk', '574', 'NFK', 'NF', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(102, 'Isole ', '248', 'ALA', 'AX', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(103, 'Isole BES', '535', 'BES', 'BQ', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(104, 'Isole Cayman', '136', 'CYM', 'KY', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(105, 'Isole Cocos (Keeling)', '166', 'CCK', 'CC', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(106, 'Isole Cook', '184', 'COK', 'CK', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(107, 'F', '234', 'FRO', 'FO', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(108, 'Isole Falkland', '238', 'FLK', 'FK', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(109, 'Isole Heard e McDonald', '334', 'HMD', 'HM', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(110, 'Isole Marianne Settentrionali', '580', 'MNP', 'MP', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(111, 'Isole Marshall', '584', 'MHL', 'MH', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(112, 'Isole minori esterne degli Stati Uniti', '581', 'UMI', 'UM', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(113, 'Isole Pitcairn', '612', 'PCN', 'PN', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(114, 'Isole Salomone', '090', 'SLB', 'SB', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(115, 'Isole Vergini britanniche', '092', 'VGB', 'VG', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(116, 'Isole Vergini americane', '850', 'VIR', 'VI', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(117, 'Israele', '376', 'ISR', 'IL', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(118, 'Italia', '380', 'ITA', 'IT', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(119, 'Jersey', '832', 'JEY', 'JE', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(120, 'Kazakistan', '398', 'KAZ', 'KZ', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(121, 'Kenya', '404', 'KEN', 'KE', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(122, 'Kirghizistan', '417', 'KGZ', 'KG', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(123, 'Kiribati', '296', 'KIR', 'KI', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(124, 'Kuwait', '414', 'KWT', 'KW', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(125, 'Laos', '418', 'LAO', 'LA', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(126, 'Lesotho', '426', 'LSO', 'LS', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(127, 'Lettonia', '428', 'LVA', 'LV', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(128, 'Libano', '422', 'LBN', 'LB', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(129, 'Liberia', '430', 'LBR', 'LR', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(130, 'Libia', '434', 'LBY', 'LY', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(131, 'Liechtenstein', '438', 'LIE', 'LI', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(132, 'Lituania', '440', 'LTU', 'LT', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(133, 'Lussemburgo', '442', 'LUX', 'LU', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(134, 'Macao', '446', 'MAC', 'MO', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(135, 'Macedonia', '807', 'MKD', 'MK', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(136, 'Madagascar', '450', 'MDG', 'MG', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(137, 'Malawi', '454', 'MWI', 'MW', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(138, 'Malesia', '458', 'MYS', 'MY', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(139, 'Maldive', '462', 'MDV', 'MV', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(140, 'Mali', '466', 'MLI', 'ML', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(141, 'Malta', '470', 'MLT', 'MT', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(142, 'Marocco', '504', 'MAR', 'MA', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(143, 'Martinica', '474', 'MTQ', 'MQ', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(144, 'Mauritania', '478', 'MRT', 'MR', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(145, 'Mauritius', '480', 'MUS', 'MU', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(146, 'Mayotte', '175', 'MYT', 'YT', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(147, 'Messico', '484', 'MEX', 'MX', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(148, 'Micronesia', '583', 'FSM', 'FM', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(149, 'Moldavia', '498', 'MDA', 'MD', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(150, 'Mongolia', '496', 'MNG', 'MN', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(151, 'Montenegro', '499', 'MNE', 'ME', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(152, 'Montserrat', '500', 'MSR', 'MS', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(153, 'Mozambico', '508', 'MOZ', 'MZ', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(154, 'Namibia', '516', 'NAM', 'NA', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(155, 'Nauru', '520', 'NRU', 'NR', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(156, 'Nepal', '524', 'NPL', 'NP', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(157, 'Nicaragua', '558', 'NIC', 'NI', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(158, 'Niger', '562', 'NER', 'NE', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(159, 'Nigeria', '566', 'NGA', 'NG', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(160, 'Niue', '570', 'NIU', 'NU', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(161, 'Norvegia', '578', 'NOR', 'NO', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(162, 'Nuova Caledonia', '540', 'NCL', 'NC', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(163, 'Nuova Zelanda', '554', 'NZL', 'NZ', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(164, 'Oman', '512', 'OMN', 'OM', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(165, 'Paesi Bassi', '528', 'NLD', 'NL', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(166, 'Pakistan', '586', 'PAK', 'PK', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(167, 'Palau', '585', 'PLW', 'PW', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(168, 'Palestina', '275', 'PSE', 'PS', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(169, 'Panam', '591', 'PAN', 'PA', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(170, 'Papua Nuova Guinea', '598', 'PNG', 'PG', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(171, 'Paraguay', '600', 'PRY', 'PY', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(172, 'Per', '604', 'PER', 'PE', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(173, 'Polinesia Francese', '258', 'PYF', 'PF', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(174, 'Polonia', '616', 'POL', 'PL', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(175, 'Porto Rico', '630', 'PRI', 'PR', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(176, 'Portogallo', '620', 'PRT', 'PT', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(177, 'Monaco', '492', 'MCO', 'MC', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(178, 'Qatar', '634', 'QAT', 'QA', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(179, 'Regno Unito', '826', 'GBR', 'GB', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(180, 'RD del Congo', '180', 'COD', 'CD', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(181, 'Rep. Ceca', '203', 'CZE', 'CZ', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(182, 'Rep. Centrafricana', '140', 'CAF', 'CF', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(183, 'Rep. del Congo', '178', 'COG', 'CG', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(184, 'Rep. Dominicana', '214', 'DOM', 'DO', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(185, 'Riunione', '638', 'REU', 'RE', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(186, 'Romania', '642', 'ROU', 'RO', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(187, 'Ruanda', '646', 'RWA', 'RW', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(188, 'Russia', '643', 'RUS', 'RU', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(189, 'Sahara Occidentale', '732', 'ESH', 'EH', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(190, 'Saint Kitts e Nevis', '659', 'KNA', 'KN', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(191, 'Santa Lucia', '662', 'LCA', 'LC', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(192, 'Sant\'Elena, Ascensione e Tristan da Cunha', '654', 'SHN', 'SH', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(193, 'Saint Vincent e Grenadine', '670', 'VCT', 'VC', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(194, 'Saint-Barth', '652', 'BLM', 'BL', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(195, 'Saint-Martin', '663', 'MAF', 'MF', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(196, 'Saint-Pierre e Miquelon', '666', 'SPM', 'PM', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(197, 'Samoa', '882', 'WSM', 'WS', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(198, 'Samoa Americane', '016', 'ASM', 'AS', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(199, 'San Marino', '674', 'SMR', 'SM', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(200, 'S', '678', 'STP', 'ST', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(201, 'Senegal', '686', 'SEN', 'SN', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(202, 'Serbia', '688', 'SRB', 'RS', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(203, 'Seychelles', '690', 'SYC', 'SC', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(204, 'Sierra Leone', '694', 'SLE', 'SL', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(205, 'Singapore', '702', 'SGP', 'SG', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(206, 'Sint Maarten', '534', 'SXM', 'SX', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(207, 'Siria', '760', 'SYR', 'SY', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(208, 'Slovacchia', '703', 'SVK', 'SK', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(209, 'Slovenia', '705', 'SVN', 'SI', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(210, 'Somalia', '706', 'SOM', 'SO', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(211, 'Spagna', '724', 'ESP', 'ES', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(212, 'Sri Lanka', '144', 'LKA', 'LK', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(213, 'Stati Uniti', '840', 'USA', 'US', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(214, 'Sudafrica', '710', 'ZAF', 'ZA', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(215, 'Sudan', '729', 'SDN', 'SD', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(216, 'Sudan del Sud', '728', 'SSD', 'SS', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(217, 'Suriname', '740', 'SUR', 'SR', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(218, 'Svalbard e Jan Mayen', '744', 'SJM', 'SJ', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(219, 'Svezia', '752', 'SWE', 'SE', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(220, 'Svizzera', '756', 'CHE', 'CH', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(221, 'Swaziland', '748', 'SWZ', 'SZ', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(222, 'Taiwan', '158', 'TWN', 'TW', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(223, 'Tagikistan', '762', 'TJK', 'TJ', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(224, 'Tanzania', '834', 'TZA', 'TZ', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(225, 'Terre australi e antartiche francesi', '260', 'ATF', 'TF', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(226, 'Territorio britannico dell\'oceano Indiano', '086', 'IOT', 'IO', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(227, 'Thailandia', '764', 'THA', 'TH', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(228, 'Timor Est', '626', 'TLS', 'TL', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(229, 'Togo', '768', 'TGO', 'TG', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(230, 'Tokelau', '772', 'TKL', 'TK', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(231, 'Tonga', '776', 'TON', 'TO', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(232, 'Trinidad e Tobago', '780', 'TTO', 'TT', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(233, 'Tunisia', '788', 'TUN', 'TN', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(234, 'Turchia', '792', 'TUR', 'TR', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(235, 'Turkmenistan', '795', 'TKM', 'TM', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(236, 'Turks e Caicos', '796', 'TCA', 'TC', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(237, 'Tuvalu', '798', 'TUV', 'TV', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(238, 'Ucraina', '804', 'UKR', 'UA', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(239, 'Uganda', '800', 'UGA', 'UG', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(240, 'Ungheria', '348', 'HUN', 'HU', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(241, 'Uruguay', '858', 'URY', 'UY', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(242, 'Uzbekistan', '860', 'UZB', 'UZ', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(243, 'Vanuatu', '548', 'VUT', 'VU', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(244, 'Venezuela', '862', 'VEN', 'VE', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(245, 'Vietnam', '704', 'VNM', 'VN', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(246, 'Wallis e Futuna', '876', 'WLF', 'WF', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(247, 'Yemen', '887', 'YEM', 'YE', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(248, 'Zambia', '894', 'ZMB', 'ZM', '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(249, 'Zimbabwe', '716', 'ZWE', 'ZW', '2025-11-06 10:39:11', '2025-11-06 10:39:11');

-- Dump della struttura di tabella CodeX.pagamenti
DROP TABLE IF EXISTS `pagamenti`;
CREATE TABLE IF NOT EXISTS `pagamenti` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idUtente` bigint(20) unsigned NOT NULL,
  `metodo_pagamento` varchar(100) NOT NULL,
  `numero_carta` varchar(20) DEFAULT NULL,
  `scadenza` date DEFAULT NULL,
  `cvv` varchar(5) DEFAULT NULL,
  `predefinita` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pagamenti_idutente_foreign` (`idUtente`),
  CONSTRAINT `pagamenti_idutente_foreign` FOREIGN KEY (`idUtente`) REFERENCES `utenti` (`idUtente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dump dei dati della tabella CodeX.pagamenti: ~0 rows (circa)
DELETE FROM `pagamenti`;

-- Dump della struttura di tabella CodeX.preferiti
DROP TABLE IF EXISTS `preferiti`;
CREATE TABLE IF NOT EXISTS `preferiti` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idUtente` bigint(20) unsigned NOT NULL,
  `film_id` bigint(20) unsigned DEFAULT NULL,
  `serie_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `preferiti_idutente_foreign` (`idUtente`),
  CONSTRAINT `preferiti_idutente_foreign` FOREIGN KEY (`idUtente`) REFERENCES `utenti` (`idUtente`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dump dei dati della tabella CodeX.preferiti: ~0 rows (circa)
DELETE FROM `preferiti`;

-- Dump della struttura di tabella CodeX.serie
DROP TABLE IF EXISTS `serie`;
CREATE TABLE IF NOT EXISTS `serie` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `titolo` varchar(255) NOT NULL,
  `descrizione` text DEFAULT NULL,
  `anno_inizio` year(4) DEFAULT NULL,
  `anno_fine` year(4) DEFAULT NULL,
  `stagioni` int(11) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `video_path` varchar(255) DEFAULT NULL,
  `regista` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `serie_category_id_foreign` (`category_id`),
  CONSTRAINT `serie_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dump dei dati della tabella CodeX.serie: ~0 rows (circa)
DELETE FROM `serie`;
INSERT INTO `serie` (`id`, `titolo`, `descrizione`, `anno_inizio`, `anno_fine`, `stagioni`, `image_path`, `video_path`, `regista`, `category_id`, `created_at`, `updated_at`) VALUES
	(1, 'Breaking Bad', 'La trasformazione di Walter White.', '2008', '2013', 5, NULL, NULL, 'Vince Gilligan', 1, '2008-01-19 23:00:00', '2025-11-06 10:39:11'),
	(2, 'Exercitationem sequi aut', 'Autem voluptates voluptatem dolorem aliquam debitis est sunt. Repudiandae qui expedita expedita eveniet aliquid pariatur alias.', '1998', NULL, 3, NULL, NULL, 'Dr. Abraham Kutch', 1, '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(3, 'Beatae sed accusamus', 'Soluta quia excepturi ab aut non soluta omnis. Ipsum ea ut est culpa quasi. Earum ducimus sed ullam at facilis iusto distinctio ab. Dolor error itaque illum atque.', '1999', NULL, 3, NULL, NULL, 'Giovanna Mohr', 1, '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(4, 'Rerum modi nisi', 'Non nam ut ut quae tempora. Fugit doloremque soluta et qui. Qui molestiae assumenda sapiente et et est.', '1970', '1971', 8, NULL, NULL, 'Lane Lockman', 1, '2025-11-06 10:39:11', '2025-11-06 10:39:11');

-- Dump della struttura di tabella CodeX.sessions
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dump dei dati della tabella CodeX.sessions: ~0 rows (circa)
DELETE FROM `sessions`;

-- Dump della struttura di tabella CodeX.tipologiaIndirizzi
DROP TABLE IF EXISTS `tipologiaIndirizzi`;
CREATE TABLE IF NOT EXISTS `tipologiaIndirizzi` (
  `idTipologiaIndirizzo` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idTipologiaIndirizzo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dump dei dati della tabella CodeX.tipologiaIndirizzi: ~0 rows (circa)
DELETE FROM `tipologiaIndirizzi`;
INSERT INTO `tipologiaIndirizzi` (`idTipologiaIndirizzo`, `nome`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'Residenza', NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(2, 'Domicilio', NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(3, 'Indirizzo di Spedizione', NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(4, 'Ufficio', NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(5, 'Sede Legale', NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11'),
	(6, 'Sede Operativa', NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11');

-- Dump della struttura di tabella CodeX.utenti
DROP TABLE IF EXISTS `utenti`;
CREATE TABLE IF NOT EXISTS `utenti` (
  `idUtente` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) DEFAULT NULL,
  `cognome` varchar(40) DEFAULT NULL,
  `sesso` tinyint(3) unsigned DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `ruolo` enum('admin','user','guest') NOT NULL DEFAULT 'guest',
  `crediti` decimal(10,2) NOT NULL DEFAULT 0.00,
  `abbonamento_attivo` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `film_preferiti` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`film_preferiti`)),
  `serie_preferiti` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`serie_preferiti`)),
  PRIMARY KEY (`idUtente`),
  UNIQUE KEY `utenti_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dump dei dati della tabella CodeX.utenti: ~23 rows (circa)
DELETE FROM `utenti`;
INSERT INTO `utenti` (`idUtente`, `nome`, `cognome`, `sesso`, `email`, `password`, `ruolo`, `crediti`, `abbonamento_attivo`, `remember_token`, `deleted_at`, `created_at`, `updated_at`, `film_preferiti`, `serie_preferiti`) VALUES
	(1, 'Admin', 'Root', NULL, 'admin@codex.local', '$2y$12$8e20Tjmk0Fm8fVSBTnJon.1XEGJ9m9hHV/hCBW8SIVR8v1VkV8m5y', 'admin', 1000.00, 1, NULL, NULL, '2025-11-06 10:39:07', '2025-11-06 10:39:07', '"[]"', '"[]"'),
	(2, 'Mario', 'Rossi', NULL, 'mario@codex.local', '$2y$12$9hDkDHzSOrPzgec0fs51XOiYwulAMhKaL9hmJfYd04xjeMQHqME.a', 'user', 50.00, 1, NULL, NULL, '2025-11-06 10:39:07', '2025-11-06 10:39:07', '"[]"', '"[]"'),
	(3, 'Ospite', 'Generico', NULL, 'guest@codex.local', '$2y$12$tyufLTTymp9rjd2Kr.VIu.AqfON81KOUMroAmpf0mNFUpesbfB5iO', 'guest', 0.00, 0, NULL, NULL, '2025-11-06 10:39:07', '2025-11-06 10:39:07', '"[]"', '"[]"'),
	(4, 'Pearline', 'Moen', NULL, 'sidney.mann@example.net', '$2y$12$JzlVSdXL85EXrRomZnri/eyd7TUsX14QjxCPQxpOM9jTGk9f8TM9O', 'user', 9.00, 0, NULL, NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11', '[]', '[]'),
	(5, 'Lenora', 'Lebsack', NULL, 'lucious52@example.org', '$2y$12$rOAztBvdf7jMTqgh1Rget.vU/eitbOqG0E90FSX8N2.u9jYrZcThq', 'user', 175.00, 0, NULL, NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11', '[]', '[]'),
	(6, 'Rosario', 'Bernhard', NULL, 'dchristiansen@example.net', '$2y$12$lOgKl5Z8rI5gxXGZdpn8TOtVPEUs13W5aZdJC./LyS6p5haOQs6Z2', 'user', 16.00, 1, NULL, NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11', '[]', '[]'),
	(7, 'Aracely', 'Ankunding', NULL, 'durgan.shanna@example.com', '$2y$12$G0gtRxEj19N5MrjBiN5Qo.eL7O3wX0YsGdbZ.B/qjv7Ku1GzZmb4m', 'user', 108.00, 0, NULL, NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11', '[]', '[]'),
	(8, 'Graham', 'Dicki', NULL, 'isac.mayer@example.org', '$2y$12$5cm6Tmn5a1QGc4zc4u8fwuq8bETUGCIngiOsXzVgb2YFQVB9AuGT2', 'user', 184.00, 0, NULL, NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11', '[]', '[]'),
	(9, 'Russ', 'Hills', NULL, 'mae02@example.org', '$2y$12$h4V4dWR5q4a2c.HalVWCauVo//OwncEHdBiQumObhMB7aC9jzWSYO', 'user', 175.00, 1, NULL, NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11', '[]', '[]'),
	(10, 'Nia', 'Gislason', NULL, 'kub.loy@example.org', '$2y$12$U2/E2AOQoADcPAJNDypTpe4uShffiRExjYRtFm/ZauXP0P33rtUrG', 'user', 164.00, 1, NULL, NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11', '[]', '[]'),
	(11, 'Ruby', 'Kohler', NULL, 'winfield33@example.net', '$2y$12$qGQ0EyYt9xLgGa.vHWW//OMlJMLTjyo.BSl0HlDk1lcpvoGRbOGh.', 'user', 87.00, 0, NULL, NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11', '[]', '[]'),
	(12, 'Logan', 'Satterfield', NULL, 'bpaucek@example.org', '$2y$12$UjPyud1xajJgMSnCJnZ0jeaoA4pk8llRLjPYB6AtA7U.Ir5NBHIxm', 'user', 160.00, 0, NULL, NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11', '[]', '[]'),
	(13, 'Americo', 'Wilderman', NULL, 'arianna.strosin@example.org', '$2y$12$Q7hFnxeM3vQCIdNzIZvcyOwKIv1WMaxOtw7S9ON03vKFxzxy9KKOy', 'user', 62.00, 0, NULL, NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11', '[]', '[]'),
	(14, 'Emilio', 'Kertzmann', NULL, 'jeanne.barton@example.com', '$2y$12$vkZGZCTZDsS3eQCBrtcO/Oqb3nLaoH4w4LVjxBK7AGWZgZ1ouz9dy', 'user', 14.00, 0, NULL, NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11', '[]', '[]'),
	(15, 'Ike', 'Botsford', NULL, 'mitchell.vernice@example.net', '$2y$12$EYya2svf3XX9AUQTp9dZi.ejSQ.3pwKZTUoLO29LLXk9/3981M67i', 'user', 125.00, 0, NULL, NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11', '[]', '[]'),
	(16, 'Desmond', 'Nikolaus', NULL, 'xwest@example.com', '$2y$12$r1d7St3iGbPJmtvUK09LiOKtSEYpHCkDj5cM4HEb4oCzEMI3/Lok2', 'user', 197.00, 0, NULL, NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11', '[]', '[]'),
	(17, 'Fannie', 'Morar', NULL, 'domenick.osinski@example.com', '$2y$12$B78L0rl0ATt0yJ3H8K/sx.7OhqVL.beRV6o8SN7ccK5EUBlF0mwIS', 'user', 41.00, 1, NULL, NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11', '[]', '[]'),
	(18, 'Kenna', 'Stamm', NULL, 'layne.sanford@example.com', '$2y$12$ZSPnXvwgrd7niE5KmoybQemm/SWWgVeyfc7UzKNmn7Mx6fY/Y6tca', 'user', 31.00, 1, NULL, NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11', '[]', '[]'),
	(19, 'Grayson', 'Deckow', NULL, 'kathryne.roob@example.com', '$2y$12$3uU68ZhVRzWt5t.m0uLPjumhujsqaSkCvJ.MXEG/cAO.PX8GXrf5W', 'user', 141.00, 1, NULL, NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11', '[]', '[]'),
	(20, 'Gerda', 'Welch', NULL, 'xsteuber@example.org', '$2y$12$AcsHwi9yHnCUVbkdihrq3eJxLqPLraFaV0gIcKtUrxLU29CWA8m4e', 'user', 143.00, 0, NULL, NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11', '[]', '[]'),
	(21, 'Dedrick', 'Kovacek', NULL, 'wilbert.koss@example.com', '$2y$12$eEizXtBzXLJu47yUjQBfS.Dt.4bwWqkgZyLmxQeu3rfTWVQI3cMRC', 'user', 58.00, 1, NULL, NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11', '[]', '[]'),
	(22, 'Paige', 'Padberg', NULL, 'reece68@example.net', '$2y$12$Z22PswDTl2f.7KBsU.zSXuhMC51Xv9D.sXGqUTv/hkJWDefu45M3W', 'user', 58.00, 1, NULL, NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11', '[]', '[]'),
	(23, 'Breanne', 'Kilback', NULL, 'enrique.zboncak@example.com', '$2y$12$t4kslZ1eeemHVfyrxnSsU.oh8wity.pDvrwZ84BF1czxTijsWonq.', 'user', 103.00, 1, NULL, NULL, '2025-11-06 10:39:11', '2025-11-06 10:39:11', '[]', '[]');

-- Dump della struttura di tabella CodeX.visualizzazioni
DROP TABLE IF EXISTS `visualizzazioni`;
CREATE TABLE IF NOT EXISTS `visualizzazioni` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `utente_id` bigint(20) unsigned NOT NULL,
  `film_id` bigint(20) unsigned DEFAULT NULL,
  `episodio_id` bigint(20) unsigned DEFAULT NULL,
  `secondi_guardati` int(11) NOT NULL DEFAULT 0,
  `data_ultima_visione` timestamp NOT NULL DEFAULT current_timestamp(),
  `completato` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `visualizzazioni_utente_id_foreign` (`utente_id`),
  KEY `visualizzazioni_film_id_foreign` (`film_id`),
  KEY `visualizzazioni_episodio_id_foreign` (`episodio_id`),
  CONSTRAINT `visualizzazioni_episodio_id_foreign` FOREIGN KEY (`episodio_id`) REFERENCES `episodi` (`id`) ON DELETE CASCADE,
  CONSTRAINT `visualizzazioni_film_id_foreign` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`) ON DELETE CASCADE,
  CONSTRAINT `visualizzazioni_utente_id_foreign` FOREIGN KEY (`utente_id`) REFERENCES `utenti` (`idUtente`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dump dei dati della tabella CodeX.visualizzazioni: ~0 rows (circa)
DELETE FROM `visualizzazioni`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
