/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE DATABASE /*!32312 IF NOT EXISTS*/ `notes` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `notes`;
DROP TABLE IF EXISTS `notes`;
CREATE TABLE `notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `created_time` datetime DEFAULT current_timestamp() COMMENT 'created tiem',
  `updated_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'updated tiem',
  `content` varchar(255) DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `author` (`author`),
  CONSTRAINT `note_ibfk_1` FOREIGN KEY (`author`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
   tag VARCHAR (255) NOT NULL UNIQUE,
   PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `notes_tags`;
CREATE TABLE `notes_tags` (
  `note_id` int(11) NOT NULL ,
  `tag_id` int(11) NOT NULL ,
  PRIMARY KEY (`note_id`, `tag_id`),
  KEY `note_id` (`note_id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `note_tags_ibfk_1` FOREIGN KEY (`note_id`) REFERENCES `notes` (`id`),
  CONSTRAINT `note_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` datetime DEFAULT current_timestamp(),
  `updated_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'updated time',
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

INSERT INTO `notes` (`id`,`created_time`,`updated_time`,`content`,`author`) VALUES (1,'2020-12-29 22:26:23','2020-12-29 22:26:23','La miglior scuola del Trentino',1),(2,'2020-12-29 22:26:48','2020-12-29 22:26:48','Forse esagero un po\'',1),(3,'2020-12-29 22:27:10','2020-12-29 22:27:10','Ricordarsi di portare il certificato!!!',2),(4,'2020-12-29 22:27:27','2020-12-29 22:27:27','Capito?!?!',2);

INSERT INTO `users` (`id`,`created_time`,`updated_time`,`first_name`,`last_name`,`email`) VALUES (1,'2020-12-29 22:24:28','2020-12-29 22:24:28','Guglielmo','Marconi','marconi@marconirovereto.it'),(2,'2020-12-29 22:25:14','2020-12-29 22:25:14','Segreteria','Didattica','didattica@marconirovereto.it');

INSERT INTO `tags` (`id`,`tag`) VALUES (1,'comment'),(2,'remark'),(3,'reminder');

INSERT INTO `notes_tags` (`note_id`,`tag_id`) VALUES (1,1),(1,2),(2,1),(3,3),(3,1);

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
